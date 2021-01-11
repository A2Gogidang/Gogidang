package com.spring.gogidang.service;

import java.util.ArrayList;
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
	public int reviewWrite(ReviewVO reviewVO) {
		ReviewMapper reviewMapper = sqlSession.getMapper(ReviewMapper.class);
//		int res = reviewMapper.reviewWrite(reviewVO);
		
		return 0;
	}

	@Override
	public ArrayList<ReviewVO> reviewListUid(ReviewVO reviewVO) {
		ReviewMapper reviewMapper = sqlSession.getMapper(ReviewMapper.class);
		ArrayList<ReviewVO> reviewList = new ArrayList<ReviewVO>();
		reviewList = reviewMapper.reviewListUid(reviewVO);
		
		return reviewList;
	}
	
	@Override
	public ArrayList<ReviewVO> reviewListSnum(ReviewVO reviewVO) {
		ReviewMapper reviewMapper = sqlSession.getMapper(ReviewMapper.class);
		ArrayList<ReviewVO> reviewList = new ArrayList<ReviewVO>();
		reviewList = reviewMapper.reviewListSnum(reviewVO);
		
		return reviewList;
	}
	
	@Override
	public ArrayList<ReviewVO> getReviewList() {
		ReviewMapper reviewMapper = sqlSession.getMapper(ReviewMapper.class);
		ArrayList<ReviewVO> reviewList = new ArrayList<ReviewVO>();
		reviewList = reviewMapper.getReviewList();
		
		return reviewList;
	}

	@Override
	public ReviewVO reviewInfo(ReviewVO reviewVO) {
		ReviewMapper reviewMapper = sqlSession.getMapper(ReviewMapper.class);
		ReviewVO vo = reviewMapper.reviewInfo(reviewVO);
		
		return vo;
	}
	
	@Override
	   public ReviewVO reviewModifyForm(ReviewVO reviewVO) {
	      ReviewMapper reviewMapper =sqlSession.getMapper(ReviewMapper.class);
	      ReviewVO review = reviewMapper.reviewInfo(reviewVO);
	      
	      return review;
	   }
	   
//	   @Override
//	   public int reviewModify(ReviewVO reviewVO) {
//	      ReviewMapper reviewMapper = sqlSession.getMapper(ReviewMapper.class);
//	      int res = reviewMapper.reviewModify(reviewVO);
//	      
//	      return res;
//	   }
	//seungwoo code start
	   @Override
		public ArrayList<ReviewVO>getReview(String id){
			ReviewMapper reviewMapper = sqlSession.getMapper(ReviewMapper.class);
			ArrayList<ReviewVO>reviewList = new ArrayList<ReviewVO>();
			reviewList = reviewMapper.getReviews(id);
			
			return reviewList;
		}

	@Override
	public ArrayList<ReviewVO> getReviewList(Criteria cri) {
		ReviewMapper reviewMapper = sqlSession.getMapper(ReviewMapper.class);
		ArrayList<ReviewVO> reviewList = new ArrayList<ReviewVO>();
//		reviewList = reviewMapper.getListWithPaging(cri);
		
		return reviewList;
	}

	//restart
	
	@Override
	public ArrayList<ReviewVO> getList(Criteria cri) {
		ReviewMapper reviewMapper = sqlSession.getMapper(ReviewMapper.class);
		return reviewMapper.getListWithPaging(cri);
	}

	@Override
	public ReviewVO reviewReg(ReviewVO review) {
		ReviewMapper reviewMapper = sqlSession.getMapper(ReviewMapper.class);
		return reviewMapper.reviewReg(review);
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
