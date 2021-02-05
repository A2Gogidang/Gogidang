package com.spring.gogidang.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.gogidang.domain.ReviewSubVO;
import com.spring.mapper.ReviewMapper;
import com.spring.mapper.ReviewSubMapper;

@Service
public class ReviewSubServiceImpl implements ReviewSubService{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int reviewsubReg(ReviewSubVO reviewSub) {
		ReviewSubMapper reviewSubMapper = sqlSession.getMapper(ReviewSubMapper.class);
		
		return reviewSubMapper.reviewsubReg(reviewSub);
	}

	@Override
	public int getReviewSub(int review_num) {
		ReviewSubMapper reviewSubMapper = sqlSession.getMapper(ReviewSubMapper.class);
		
		return reviewSubMapper.getReviewSub(review_num);
	}

}
