package com.spring.gogidang.service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.gogidang.domain.SRReviewVO;
import com.spring.mapper.StoreReviewMapper;



@Service("storeReviewService")
public class StoreReviewServiceImpl implements StoreReviewService{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public ArrayList<SRReviewVO> srReviewSelect(SRReviewVO srReviewVO) {
		
		StoreReviewMapper storeNoticeMapper = sqlSession.getMapper(StoreReviewMapper.class);
		ArrayList<SRReviewVO> srReviewList = new ArrayList<SRReviewVO>();
		srReviewList = storeNoticeMapper.srReviewSelect(srReviewVO);
		
		return srReviewList;
	}
	
	
	
	
}
