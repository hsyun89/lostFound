package my.spring.mine.handler;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import vo.ListVO;
import vo.UserVO;

public class EchoHandler extends TextWebSocketHandler {
	private static Logger logger = LoggerFactory.getLogger(EchoHandler.class);
	private Map<String, Object> bidRooms = new HashMap<String, Object>();// 멀티룸

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
	@Override
	public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {
		logger.info("{}로 부터 {} 받음", session.getId(), message.getPayload());
		String senderId = getId(session);
		String msg = (String) message.getPayload();
		/* 멀티룸 */
		String productId = getProductId(session);
		Map<String, WebSocketSession> tmp = (Map<String, WebSocketSession>) bidRooms.get(productId);
		System.out.println(bidRooms);
		for (WebSocketSession sess : tmp.values()) {
			sess.sendMessage(new TextMessage("{\"name\":\"" + senderId + "\", \"date\":\"" + LocalDateTime.now()
					+ "\",\"price\":\"" + msg + "\"}"));
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