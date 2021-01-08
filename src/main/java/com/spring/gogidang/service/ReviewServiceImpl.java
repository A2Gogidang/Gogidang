package com.spring.gogidang.service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.gogidang.domain.ReviewVO;
import com.spring.mapper.ReviewMapper;

@Service
public class ReviewServiceImpl implements ReviewService {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int reviewWrite(ReviewVO reviewVO) {
		ReviewMapper reviewMapper = sqlSession.getMapper(ReviewMapper.class);
		int res = reviewMapper.reviewWrite(reviewVO);
		
		return res;
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
	      ReviewMapper reviewmapper =sqlSession.getMapper(ReviewMapper.class);
	      ReviewVO review = reviewmapper.reviewInfo(reviewVO);
	      
	      return review;
	   }
	   
	   @Override
	   public int reviewModify(ReviewVO reviewVO) {
	      ReviewMapper reviewmapper = sqlSession.getMapper(ReviewMapper.class);
	      int res = reviewmapper.reviewModify(reviewVO);
	      
	      return res;
	   }
	//seungwoo code start
	   @Override
		public ArrayList<ReviewVO>getReview(String id){
			ReviewMapper reviewmapper = sqlSession.getMapper(ReviewMapper.class);
			ArrayList<ReviewVO>reviewList = new ArrayList<ReviewVO>();
			reviewList = reviewmapper.getReviews(id);
			
			return reviewList;
		}
}
