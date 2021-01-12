package com.spring.gogidang.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.gogidang.domain.Criteria;
import com.spring.gogidang.domain.ReviewVO;
import com.spring.mapper.ReviewMapper;

@Service
public class ReviewServiceImpl implements ReviewService {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<ReviewVO> getList(Criteria cri) {
		ReviewMapper reviewMapper = sqlSession.getMapper(ReviewMapper.class);
		return reviewMapper.getListWithPaging(cri);
	}

	@Override
	public void reviewReg(ReviewVO review) {
		ReviewMapper reviewMapper = sqlSession.getMapper(ReviewMapper.class);
		reviewMapper.reviewReg(review);
	}

	@Override
	public boolean reviewModify(ReviewVO review) {
		ReviewMapper reviewMapper = sqlSession.getMapper(ReviewMapper.class);
		return reviewMapper.update(review) == 1;
	}

	@Override
	public boolean reviewRemove(int review_num) {
		ReviewMapper reviewMapper = sqlSession.getMapper(ReviewMapper.class);
		return reviewMapper.delete(review_num) == 1;
	}

	@Override
	public ReviewVO getReview(int review_num) {
		ReviewMapper reviewMapper = sqlSession.getMapper(ReviewMapper.class);
		return reviewMapper.read(review_num);
	}
	
	@Override
	public int getTotal(Criteria cri) {
		ReviewMapper reviewMapper = sqlSession.getMapper(ReviewMapper.class);
		
		return reviewMapper.getTotalCount(cri);
	}
} 
