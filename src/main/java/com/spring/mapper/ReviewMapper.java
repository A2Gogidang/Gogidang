package com.spring.mapper;

import java.util.ArrayList;
import java.util.List;

import com.spring.gogidang.domain.Criteria;
import com.spring.gogidang.domain.ReviewVO;

public interface ReviewMapper {

	public ArrayList<ReviewVO> reviewListUid(ReviewVO reviewVO);
	public ArrayList<ReviewVO> reviewListSnum(ReviewVO reviewVO);
	public ArrayList<ReviewVO> getReviewList();
	public ReviewVO reviewInfo(ReviewVO reviewVO);
	public int reviewModify(ReviewVO reviewVO);
	
	
	//seungwoo code start
	public ArrayList<ReviewVO>getReviews(String id);
	
	
	// restart
	public ArrayList<ReviewVO> getListWithPaging(Criteria cri);
	public ReviewVO reviewReg(ReviewVO review);
	public int update(ReviewVO review);
	public int delete(int review_num);
	public ReviewVO read(int review_num);
	public int getTotalCount(Criteria cri);
	
}
