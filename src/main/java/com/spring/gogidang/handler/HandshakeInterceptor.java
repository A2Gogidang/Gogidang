package com.spring.gogidang.handler;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor;

public class HandshakeInterceptor extends HttpSessionHandshakeInterceptor {
	public boolean beforeHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wshandler, Map<String, Object> map) throws Exception {
		System.out.println("Before Handshake");
		
		ServletServerHttpRequest ssreq = (ServletServerHttpRequest) request;
		System.out.println("URI : " + request.getURI());
		
		HttpServletRequest req = ssreq.getServletRequest();
		
//		String name = (String) req.getSession().getAttribute("name");
//		map.put("userName", name);
//		System.out.println("HttpSession에 저장된 name : " + name);
		
		String id = (String)req.getSession().getAttribute("id");
		map.put("userId", id);
		System.out.println("HttpSession에 저장된 id : " + id);
		
		return super.beforeHandshake(request, response, wshandler, map);
	}
	
	public void afterHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wshandler, Exception ex) {
		System.out.println("After Handshake");
		
		super.afterHandshake(request, response, wshandler, ex);
	}
}
