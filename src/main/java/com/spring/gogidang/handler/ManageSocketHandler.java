package com.spring.gogidang.handler;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;
import com.spring.gogidang.domain.MemberVO;
import com.spring.gogidang.service.MemberService;

public class ManageSocketHandler extends TextWebSocketHandler {

	@Autowired
	MemberService memberService;
	
	private Set<WebSocketSession> sessionSet = new HashSet<WebSocketSession>();
	
	// 현재 접속해 있는 Socket의 세션을 List로 보관
	List<WebSocketSession> sessions = new ArrayList<>();
	
	// 유저의 아이디를 담을 맵을 생성한다.
	Map<String, WebSocketSession> userSessions = new HashMap<>();
	
	public ManageSocketHandler() {
		super();
	}
	
	// connection이 연결되었을 때, 
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception{
		super.afterConnectionEstablished(session);
		System.out.println("afterConnectionEstablished : " + session);
		
		sessionSet.add(session);
		
		String senderId= getId(session);
		System.out.println("senderId = " + senderId);
		userSessions.put(senderId, session);
	}
	
	// 어떤 메시지를 보냈을 때,
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		// protocol : cmd,댓글작성자, 게시글작성자, bno (ex: reply, user2, user1, 123)
		String msg = message.getPayload();
		if (!(StringUtils.isEmpty(msg))) {
			String[] strs = message.getPayload().split(",");
			if(strs != null && strs.length == 4 ) {
				String cmd = strs[0];
				String replyWriter = strs[1];
				String boardWriter = strs[2];
				String bno = strs[3];
				System.out.println(cmd + "," + replyWriter + "," + boardWriter + "," + bno);
				
				WebSocketSession boardWriterSession = userSessions.get(boardWriter);
				System.out.println("boardWriterSession = " + boardWriterSession);
				if ("confirm".equals(cmd) && boardWriterSession != null) {
					TextMessage tmpMsg = new TextMessage(replyWriter + "님의" +
											"<a href='/storeInfo.st?s_num='" + bno + "'>" + bno + "</a> 가게가 승인되었습니다.");
					System.out.println("tmpMsg = " + tmpMsg);
					boardWriterSession.sendMessage(tmpMsg);
				} else if ("refuse".equals(cmd) && boardWriterSession != null) {
					TextMessage tmpMsg = new TextMessage(boardWriter + "님의" + bno +"가게가 거절되었습니다.");
					System.out.println("tmpMsg = " + tmpMsg);
					boardWriterSession.sendMessage(tmpMsg);
				} else if ("reQna".equals(cmd) && boardWriterSession != null) {
					TextMessage tmpMsg = new TextMessage(replyWriter + "님의" +
							"<a href='./qnadetail.qn?qna_num=" + bno + "'>" + bno + "</a> 문의 답변완료.");
					System.out.println("tmpMsg = " + tmpMsg);
					boardWriterSession.sendMessage(tmpMsg);
				} else if ("review".equals(cmd) && boardWriterSession != null) {
					TextMessage tmpMsg = new TextMessage(replyWriter + "님이 주문번호 " + bno + "의 리뷰를 남기셨습니다." + 
							"<a href='./storereviewList.re'>확인하러가기</a>");
					System.out.println("tmpMsg = " + tmpMsg);
					boardWriterSession.sendMessage(tmpMsg);
				} else if ("reviewsub".equals(cmd) && boardWriterSession != null) {
					TextMessage tmpMsg = new TextMessage(replyWriter + "님의" +
							"<a href='./qnadetail.qn?qna_num=" + bno + "'>" + bno + "</a> 리뷰 답변완료.");
					System.out.println("tmpMsg = " + tmpMsg);
					boardWriterSession.sendMessage(tmpMsg);
				} else if ("storeQna".equals(cmd) && boardWriterSession != null) {
					TextMessage tmpMsg = new TextMessage(replyWriter + "님의" +
							"<a href='./qnadetail.qn?qna_num=" + bno + "'>" + bno + "</a> 문의를 작성하였습니다.");
					System.out.println("tmpMsg = " + tmpMsg);
					boardWriterSession.sendMessage(tmpMsg);
				} else if ("reStoreQna".equals(cmd) && boardWriterSession != null) {
					TextMessage tmpMsg = new TextMessage(replyWriter + "님의" +
							"<a href='./qnadetail.qn?qna_num=" + bno + "'>" + bno + "</a> 문의 답변완료.");
					System.out.println("tmpMsg = " + tmpMsg);
					boardWriterSession.sendMessage(tmpMsg);
				}
			}
		}
				
	}
	
	// connection이 close되었을 때,
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		super.afterConnectionClosed(session, status);
		System.out.println("afterConnectionClosed : " + session + " : " + status);
		
		sessionSet.remove(session);
	}
	
	private String getId(WebSocketSession session) {
		System.out.println("getId start----");
		
		// http session에 있는 값을 전부 map으로 저장한다.
		Map<String, Object> httpSession = session.getAttributes();
		
		MemberVO mvo = (MemberVO) httpSession.get("memberVO");
		String userId = mvo.getU_id();
		System.out.println(userId);
		
		MemberVO loginUser = memberService.getId(userId);
		
		if(loginUser == null) {
			return session.getId();
		} else
			return loginUser.getU_id();
	}
}
