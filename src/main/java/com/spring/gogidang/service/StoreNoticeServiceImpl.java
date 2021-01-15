package com.spring.gogidang.service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.gogidang.domain.*;


import com.spring.mapper.StoreNoticeMapper;


@Service("storeNoiceService")
public class StoreNoticeServiceImpl implements StoreNoticeService {

	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public ArrayList<SRNoticeVO> srNoticeSelect(SRNoticeVO srNoticeVO) {
		
		StoreNoticeMapper storeNoticeMapper = sqlSession.getMapper(StoreNoticeMapper.class);
		ArrayList<SRNoticeVO> srNoticeList = new ArrayList<SRNoticeVO>();
		srNoticeList = storeNoticeMapper.srNoticeSelect(srNoticeVO);
		
		return srNoticeList;
	}
	
	@Override
	public SRNoticeVO srNoticeList(SRNoticeVO srNoticeVO) {
		
		StoreNoticeMapper storeNoticeMapper = sqlSession.getMapper(StoreNoticeMapper.class);
		
		SRNoticeVO vo = storeNoticeMapper.srNoticeList(srNoticeVO);
		
		return vo;
	}
	
	@Override
	public int replyNoticeInsert(ReplyNoticeVO replyNoticeVO) {
		
		StoreNoticeMapper storeNoticeMapper = sqlSession.getMapper(StoreNoticeMapper.class);
		
		int res = storeNoticeMapper.replyNoticeInsert(replyNoticeVO);
		
		return res;
	}
	
	@Override
	public int replyNoticeDelete(ReplyNoticeVO replyNoticeVO) {
		
		StoreNoticeMapper storeNoticeMapper = sqlSession.getMapper(StoreNoticeMapper.class);
		
		int res = storeNoticeMapper.replyNoticeDelete(replyNoticeVO);
		
		return res;
	}
	
	
}
