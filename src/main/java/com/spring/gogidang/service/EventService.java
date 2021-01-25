package com.spring.gogidang.service;

import java.util.ArrayList;

import com.spring.gogidang.domain.EventVO;


public interface EventService {
	
	public ArrayList<EventVO> eventList();
	public EventVO getByNum(int event_num);
	public void modifyByNum(int event_num);
	public void deleteByNum(int event_num);
	public void register(EventVO eventVO);
}
