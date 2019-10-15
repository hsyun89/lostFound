package my.spring.mine.handler;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
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
import vo.ListVO;
import vo.UserVO;

public class EchoHandler extends TextWebSocketHandler {
	@Autowired
	AuctionDAO dao;
	private static Logger logger = LoggerFactory.getLogger(EchoHandler.class);
	private Map<String, Object> bidRooms = new HashMap<String, Object>();// 멀티룸
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
		}
		userSessions.put(senderId, session); // 입력
		bidRooms.put(productId, userSessions); // 입력
		//
		logger.info("{} 연결됨", session.getId());
	}

	// 웹소켓 서버측에 텍스트 메시지가 접수되면 호출되는 메소드
	@SuppressWarnings("null")
	@Override
	public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {
		logger.info("{}로 부터 {} 받음", session.getId(), message.getPayload());
		String senderId = getId(session);
		String price = (String) message.getPayload();
		String pricePlusWon = price + "원";
		/* 멀티룸 */
		String productId = getProductId(session);
		Map<String, WebSocketSession> tmp = (Map<String, WebSocketSession>) bidRooms.get(productId);
		System.out.println(bidRooms);
		String serverTime = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
		
		//DB저장
		AuctionLogVO vo = new AuctionLogVO();
		System.out.println("1");
		vo.setBid_date(serverTime);
		System.out.println("2");
		vo.setPrice(price);
		System.out.println("3");
		vo.setUnique_id(productId);
		System.out.println("4");
		vo.setUser_id(senderId);
		System.out.println("5");
		boolean result = dao.insertBiddingLog(vo);
		System.out.println("6");
		System.out.println(result);

//		String st = ("{\"name\":\"" + senderId + "\", \"date\":\"" + serverTime + "\",\"price\":\"" + price + "\"}");
//		q.offer(st);
//		System.out.println(q);
		
		
		//브로드캐스트
		for (WebSocketSession sess : tmp.values()) {
			sess.sendMessage(new TextMessage("{\"name\":\"" + senderId + "\", \"date\":\"" + serverTime + "\",\"price\":\"" + pricePlusWon + "\"}"));
		}
		//

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

	// 클라이언트가 접속을 종료하면 호출되는 메소드
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		/* 멀티룸 */
		Map<String, Object> httpSession = session.getAttributes();
		ListVO list = (ListVO) httpSession.get("list");
		bidRooms.remove(list.getUnique_id());
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