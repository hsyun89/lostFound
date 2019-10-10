package my.spring.mine.handler;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import vo.UserVO;

public class EchoHandler extends TextWebSocketHandler {
	//SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	private static Logger logger = LoggerFactory.getLogger(EchoHandler.class);
	private List<WebSocketSession> sessions = new ArrayList<WebSocketSession>();
	Map<String, WebSocketSession> userSessions = new HashMap<String, WebSocketSession>();
	
	// 웹소켓 서버에 클라이언트가 접속하면 호출되는 메소드
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		sessions.add(session);
		String senderId=getId(session);
		userSessions.put(senderId, session);
		logger.info("{} 연결됨", session.getId());
	}
	
    // 웹소켓 서버측에 텍스트 메시지가 접수되면 호출되는 메소드
    @Override
    public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {
		logger.info("{}로 부터 {} 받음", session.getId(), message.getPayload());
		String senderId = getId(session);
		String payloadMessage = (String) message.getPayload();
		System.out.println("서버에 도착한 메시지:"+payloadMessage);
		for (WebSocketSession sess : sessions) {
			sess.sendMessage(new TextMessage("{\"name\":\""+senderId+"\", \"date\":\""+LocalDateTime.now()+"\",\"price\":\""+payloadMessage+"\"}"));
		}
        //session.sendMessage(new TextMessage("이름\t"+dateFormat.format(date)+"\t입찰가 : "+payloadMessage));
    }
    private String getId(WebSocketSession session) {
    	Map<String, Object>httpSession = session.getAttributes();
    	//System.out.println(session.toString());
    	//System.out.println(httpSession.toString());
    	UserVO loginUser = (UserVO)httpSession.get("status");
    	if(null==loginUser) {
    		return session.getId();
    	}else {
    		return loginUser.getEmail();
    	}
	}
    
    // 클라이언트가 접속을 종료하면 호출되는 메소드
    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		sessions.remove(session);
		logger.info("{} 연결 끊김", session.getId());
        System.out.println("클라이언트 접속해제");
    }
 
    // 메시지 전송시나 접속해제시 오류가 발생할 때 호출되는 메소드
    @Override
    public void handleTransportError(WebSocketSession session,
            Throwable exception) throws Exception {
        super.handleTransportError(session, exception);
        System.out.println("전송오류 발생");
    }
}