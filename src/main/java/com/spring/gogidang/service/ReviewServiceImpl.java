package com.spring.gogidang.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.gogidang.domain.Criteria;
import com.spring.gogidang.domain.ReviewVO;
import com.spring.gogidang.domain.StoreVO;
import com.spring.mapper.ReviewMapper;
import com.spring.mapper.StoreMapper;

@Service
public class ReviewServiceImpl implements ReviewService {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<ReviewVO> getList() {
		
		ReviewMapper reviewMapper = sqlSession.getMapper(ReviewMapper.class);
		
		return reviewMapper.getList();
	}
	
	@Override
	public ReviewVO getReviewInfo(int review_num) {
		
		ReviewMapper reviewMapper = sqlSession.getMapper(ReviewMapper.class);
		
		return reviewMapper.reviewInfo(review_num);
	}

	@Override
	public List<ReviewVO> getListWithPaging(Criteria cri) {

		ReviewMapper reviewMapper = sqlSession.getMapper(ReviewMapper.class);
		
		return reviewMapper.getListWithPaging(cri);
	}

	@Override
	public List<ReviewVO> getListByIdWithPaing(Criteria cri, String u_id) {
		
		ReviewMapper reviewMapper = sqlSession.getMapper(ReviewMapper.class);
		
		return reviewMapper.getListByIdWithPaging(cri.getPageNum(), cri.getAmount(), u_id);
	}

	@Override
	public List<ReviewVO> getListBySnWithPaing(Criteria cri, int s_num) {
		
		ReviewMapper reviewMapper = sqlSession.getMapper(ReviewMapper.class);
		
		return reviewMapper.getListBySnWithPaging(cri.getPageNum(), cri.getAmount(), s_num);
	}
	
	@Override
	public ReviewVO getReview(int review_num) {
		
		ReviewMapper reviewMapper = sqlSession.getMapper(ReviewMapper.class);
		
		return reviewMapper.getReview(review_num);
	}
	
	@Override
	public void regReview(ReviewVO review) {
		ReviewMapper reviewMapper = sqlSession.getMapper(ReviewMapper.class);
		reviewMapper.regReview(review);
	}

	@Override
	public int getTotal(Criteria cri) {
		ReviewMapper reviewMapper = sqlSession.getMapper(ReviewMapper.class);
		
		return reviewMapper.getTotal(cri);
	}

	@Override
	public List<ReviewVO> getReviewListAjax(Map<String, String[]> mapp) {
		ReviewMapper reviewMapper = sqlSession.getMapper(ReviewMapper.class);
		
		List<ReviewVO> reviewListAjax = reviewMapper.getReviewListAjax(mapp); 
		
		
		return reviewListAjax;
	}

	@Override
	public List<ReviewVO> getListSn(int s_num) {
		ReviewMapper reviewMapper = sqlSession.getMapper(ReviewMapper.class);
		
		return reviewMapper.getListSn(s_num);
	}

	
} 


//	@Override
//	public boolean reviewModify(ReviewVO review) {
//		ReviewMapper reviewMapper = sqlSession.getMapper(ReviewMapper.class);
//		return reviewMapper.update(review) == 1;
//	}
//	
//	@Override
//	public boolean reviewRemove(int review_num) {
//		ReviewMapper reviewMapper = sqlSession.getMapper(ReviewMapper.class);
//		return reviewMapper.delete(review_num) == 1;
//	}
