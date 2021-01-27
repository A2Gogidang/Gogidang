package com.spring.mapper;

import java.util.ArrayList;

import com.spring.gogidang.domain.EventVO;



public interface EventMapper {
	
	public ArrayList<EventVO> list();
	public EventVO getByNum(int event_num);
	public void modifyByNum(int event_num);
	public void deleteByNum(int event_num);
	public void register(EventVO eventVO);
}
