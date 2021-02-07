package com.spring.gogidang.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.gogidang.domain.EventVO;
import com.spring.mapper.EventMapper;
import com.spring.mapper.MemberMapper;

@Service
public class EventServiceImpl implements EventService {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public ArrayList<EventVO> eventList() {
		EventMapper eventMapper = sqlSession.getMapper(EventMapper.class);

		return eventMapper.list();
	}

	@Override
	public EventVO getByNum(int event_num) {
		EventMapper eventMapper = sqlSession.getMapper(EventMapper.class);
		
		return eventMapper.getByNum(event_num);
	}

	@Override
	public void modifyByNum(int event_num) {
		EventMapper eventMapper = sqlSession.getMapper(EventMapper.class);
		eventMapper.modifyByNum(event_num);
	}

	@Override
	public int deleteByNum(int event_num) {
		EventMapper eventMapper = sqlSession.getMapper(EventMapper.class);
		
		return eventMapper.deleteByNum(event_num);
	}

	@Override
	public int register(EventVO eventVO) {
		EventMapper eventMapper = sqlSession.getMapper(EventMapper.class);
		
		return eventMapper.register(eventVO);
	}

	@Override
	public List<EventVO> getList() {
		EventMapper eventMapper = sqlSession.getMapper(EventMapper.class);
		
		return eventMapper.getList();
	}

}
