package com.spring.gogidang.service;

import java.util.ArrayList;

import com.spring.gogidang.domain.EventVO;


public interface EventService {
	
	public ArrayList<EventVO> getEventList();
	public EventVO selectEvent(EventVO eventVO);
}
