package my.spring.mine.handler;

import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import dao.AuctionDAO;
import vo.AuctionLogVO;
import vo.AuctionVO;
import vo.ListVO;
import vo.UserVO;

public class EchoHandler extends TextWebSocketHandler {
	@Autowired
	AuctionDAO dao;
	
	private static Logger logger = LoggerFactory.getLogger(EchoHandler.class);
	static Map<String, Object> bidRooms = new HashMap<String, Object>();// 멀티룸
//	private Queue<String> q = new LinkedList<String>();

	// 웹소켓 서버에 클라이언트가 접속하면 호출되는 메소드
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		String senderId = getId(session);
		/* 멀티룸 */
		String productId = getProductId(session);
		Map<String, WebSocketSession> userSessions = new HashMap<String, WebSocketSession>();
		if (bidRooms.get(productId) != null) { // null이 아니라면 해당 채팅방 세션들 가져옴
			Map<String, WebSocketSession> tmp = (Map<String, WebSocketSession>) bidRooms.get(productId);
			userSessions = tmp;
			System.out.println(userSessions);
		}
//		if(userSessions.containsKey(senderId)) { //이미 로그인되어 있는데 페이지 새로고침하면 세션 처리
//			userSessions.replace(senderId, session);
//		}else {
			userSessions.put(senderId, session); // 입력
//		}
		
//		if(bidRooms.containsKey(productId)) {
//			bidRooms.replace(productId, userSessions);
//		}else {
			bidRooms.put(productId, userSessions); // 입력
//		}
		//
		logger.info("{} 연결됨", session.getId());
	}

	// 웹소켓 서버측에 텍스트 메시지가 접수되면 호출되는 메소드
	@SuppressWarnings("null")
	@Override
	public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {
		try {
		logger.info("{}로 부터 {} 받음", session.getId(), message.getPayload());
		String senderId = getId(session);
		String price = (String) message.getPayload();
		String pricePlusWon = price + "원";
		/* 멀티룸 */
		String productId = getProductId(session);
		Map<String, WebSocketSession> tmp = (Map<String, WebSocketSession>) bidRooms.get(productId);
		System.out.println(bidRooms);
		//날짜변환
		String endTime = getEndDate(productId);
//		endTimeOrigin = endTimeOrigin.replace("AM", "오전");
//		endTimeOrigin = endTimeOrigin.replace("PM", "오후");
		String serverTime = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//		System.out.println("endTime"+endTime);
//		System.out.println("serverTime"+serverTime);		
		//아직 마감 전이라면 1, 마감 후에는 -1
		int flag = endTime.compareTo(serverTime);
		System.out.println("flag : "+flag);
		if(flag>0) {
			//30초 이전 입찰 시 연장 처리
				//System.out.println(endTime);
				//System.out.println(serverTime);
				//System.out.println(format1.parse(endTime).getTime()-format1.parse(serverTime).getTime());
			long distance = format1.parse(endTime).getTime()-format1.parse(serverTime).getTime();
			//String endTime =null;
			if(distance<30000) { //30초 전에 입찰하면 시간 추가
				AuctionVO vo = new AuctionVO();
				long temp = format1.parse(endTime).getTime();
				temp= temp+10000;
				endTime = format1.format(temp);
				vo.setEnd_date(endTime);
				vo.setUnique_id(productId);
				dao.plusEndTime(vo);
			}
			//DB저장
			AuctionLogVO vo = new AuctionLogVO();
			vo.setBid_date(serverTime);
			vo.setPrice(price);
			vo.setUnique_id(productId);
			vo.setUser_id(senderId);
			dao.insertBiddingLog(vo);
			//System.out.println(result);
			//브로드캐스트
			for (WebSocketSession sess : tmp.values()) {
				sess.sendMessage(new TextMessage("{\"name\":\"" + senderId + "\", \"date\":\"" + serverTime + "\", \"end_date\":\"" + endTime +"\",\"price\":\"" + pricePlusWon + "\"}"));
			}
			//
		}else { //아니라면 session.sendM~  입찰이 마감되었습니다!!
			session.sendMessage(new TextMessage("endBid"));
		}
		}catch(Exception e){
			e.printStackTrace();
		}

	}
	//로그인 되어있으면 로그인 아이디, 그렇지 않으면 웹소켓세션 아이디를 불러온다.
	private String getId(WebSocketSession session) {
		Map<String, Object> httpSession = session.getAttributes();
		UserVO loginUser = (UserVO) httpSession.get("status");
		if (null == loginUser) {
			return session.getId();
		} else {
			return loginUser.getUser_id();
		}
	}
	//옥션컨트롤러에서 선언된 세션값(Unique_id)을 불러온다.
	private String getProductId(WebSocketSession session) {
		Map<String, Object> httpSession = session.getAttributes();
		ListVO list = (ListVO) httpSession.get("list");
		return list.getUnique_id();
	}
	//옥션컨트롤러에서 선언된 세션값(End_date)을 불러온다.
	private String getEndDate(String productId) {
		ListVO listVO =  dao.auctionOne(productId);
//		Map<String, Object> httpSession = session.getAttributes();
//		ListVO list = (ListVO) httpSession.get("list");
//		return list.getEnd_date();
		return listVO.getEnd_date();
	}


	// 클라이언트가 접속을 종료하면 호출되는 메소드
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		/* 멀티룸 */
		Map<String, Object> httpSession = session.getAttributes();
		ListVO list = (ListVO) httpSession.get("list");
		//bidRooms.remove(list.getUnique_id());
		
		//종료되면 해당 세션 삭제
		String productId = getProductId(session);
		String senderId = getId(session);
		Map<String, WebSocketSession> tmp = (Map<String, WebSocketSession>)bidRooms.get(productId);
		tmp.remove(senderId);
		bidRooms.put(productId, tmp);
		
		logger.info("{} 연결 끊김", session.getId());
		System.out.println("클라이언트 접속해제");
	}

	// 메시지 전송시나 접속해제시 오류가 발생할 때 호출되는 메소드
	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		super.handleTransportError(session, exception);
		System.out.println("전송오류 발생");
	}
}