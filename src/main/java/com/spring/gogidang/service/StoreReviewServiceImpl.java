package com.spring.gogidang.service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.gogidang.domain.ReviewReplyVO;
import com.spring.gogidang.domain.SRNoticeVO;
import com.spring.gogidang.domain.SRReviewVO;
import com.spring.mapper.StoreNoticeMapper;
import com.spring.mapper.StoreReviewMapper;



@Service("storeReviewService")
public class StoreReviewServiceImpl implements StoreReviewService{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public ArrayList<SRReviewVO> srReviewSelect(SRReviewVO srReviewVO) {
		
		StoreReviewMapper storeReviewMapper = sqlSession.getMapper(StoreReviewMapper.class);
		ArrayList<SRReviewVO> srReviewList = new ArrayList<SRReviewVO>();
		srReviewList = storeReviewMapper.srReviewSelect(srReviewVO);
		
		return srReviewList;
	}
	
	@Override
	public ArrayList<SRReviewVO> srReviewSelect_m(SRReviewVO srReviewVO) {
		
		StoreReviewMapper storeReviewMapper = sqlSession.getMapper(StoreReviewMapper.class);
		ArrayList<SRReviewVO> srReviewList = new ArrayList<SRReviewVO>();
		srReviewList = storeReviewMapper.srReviewSelect_m(srReviewVO);
		
		return srReviewList;
	}
	
	@Override
	public SRReviewVO srReviewList(SRReviewVO srReviewVO) {
		
		StoreReviewMapper storeReviewMapper = sqlSession.getMapper(StoreReviewMapper.class);
		
		SRReviewVO vo = storeReviewMapper.srReviewList(srReviewVO);
		
		return vo;
	}
	
	@Override
	public int replyReviewInsert(ReviewReplyVO reviewReplyVO) {
		
		StoreReviewMapper storeReviewMapper = sqlSession.getMapper(StoreReviewMapper.class);
		
		int res = storeReviewMapper.replyReviewInsert(reviewReplyVO);
		
		return res;
	}
	
	@Override
	public int replyReviewDelete(ReviewReplyVO reviewReplyVO) {
		
		StoreReviewMapper storeReviewMapper = sqlSession.getMapper(StoreReviewMapper.class);
		
		int res = storeReviewMapper.replyReviewDelete(reviewReplyVO);
		
		return res;
	}
}
