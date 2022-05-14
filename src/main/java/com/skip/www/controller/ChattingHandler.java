package com.skip.www.controller;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

@RequestMapping("/chat")
public class ChattingHandler extends TextWebSocketHandler{

	private static final Logger logger = LoggerFactory.getLogger(ChattingHandler.class);

	// 세션 리스트
	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	
	
	// 클라이언트가 연결 되었을 때 실행
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		//채팅을 위해 해당 페이지에 들어오면(/chat) 클라이언트가 연결된 후 해당 클라이언트의 세션을 sessionList에 add한다.
		logger.info("#ChattingHandler, afterConnectionEstablished");
		sessionList.add(session);
		
//		logger.info(session.getPrincipal().getName() + "님이 입장하셨습니다.");
		logger.info("{} 연결됨", session.getId());
	}
	
	// 클라이언트가 웹소켓 서버로 메시지를 전송했을 때 실행
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		//웹 소켓 서버로 메세지를 전송했을 때 이 메서드가 호출된다.
		//현재 웹 소켓 서버에 접속한 Session모두에게 메세지를 전달해야 하므로 loop를 돌며 메세지를 전송한다.
		
		logger.info("#ChattingHandler, handleMessage");
		logger.info("{}로 부터 {} 받음", session.getId(), message.getPayload());
		
		// 모든 유저에게 메시지 출력
		for(WebSocketSession s : sessionList) {
			s.sendMessage(new TextMessage(session.getId() + ":" + message.getPayload()));
		}
	}
	
	// 클라이언트 연결을 끊었을 때 실행
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		//클라이언트와 연결이 끊어진 경우(채팅방을 나간 경우) remove로 해당 세션을 제거한다.
		
		logger.info("#ChattingHandler, afterConnectionClosed");

		sessionList.remove(session);
		
		logger.info("{} 연결 끊김.", session.getId());
		logger.info(session.getId() + "님이 퇴장하셨습니다.");
	}
}