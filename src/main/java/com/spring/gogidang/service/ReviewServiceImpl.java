package com.spring.gogidang.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
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
	public List<ReviewVO> getUidList(Criteria cri, String u_id) {
		ReviewMapper reviewMapper = sqlSession.getMapper(ReviewMapper.class);
		
		int pageNum = cri.getPageNum();
		int amount = cri.getAmount();
		
		return reviewMapper.getUidListWithPaging(pageNum, amount, u_id);
	}
	
	@Override
	public List<ReviewVO> getSnumList(Criteria cri, int s_num) {
		ReviewMapper reviewMapper = sqlSession.getMapper(ReviewMapper.class);
		
		int pageNum = cri.getPageNum();
		int amount = cri.getAmount();
		
		return reviewMapper.getSnumListWithPaging(pageNum, amount, s_num);
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
