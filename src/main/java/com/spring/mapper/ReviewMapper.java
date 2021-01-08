package com.spring.mapper;

import java.util.ArrayList;

import com.spring.gogidang.domain.ReviewVO;

public interface ReviewMapper {
	public int reviewWrite(ReviewVO reviewVO);
	public ArrayList<ReviewVO> reviewListUid(ReviewVO reviewVO);
	public ArrayList<ReviewVO> reviewListSnum(ReviewVO reviewVO);
	public ArrayList<ReviewVO> getReviewList();
	public ReviewVO reviewInfo(ReviewVO reviewVO);
	public int reviewModify(ReviewVO reviewVO);
	
	//seungwoo code start
	public ArrayList<ReviewVO>getReviews(String id);
	
}
