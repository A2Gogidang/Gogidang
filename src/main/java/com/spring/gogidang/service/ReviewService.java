package com.spring.gogidang.service;

import java.util.ArrayList;

import com.spring.gogidang.domain.ReviewVO;

public interface ReviewService {
	public int reviewWrite(ReviewVO reviewVO); // review 湲��옉�꽦
	public ArrayList<ReviewVO> reviewListUid(ReviewVO reviewVO); // review list - u_id
	public ArrayList<ReviewVO> reviewListSnum(ReviewVO reviewVO); // review list - s_num
	public ArrayList<ReviewVO> getReviewList(); // review list - all
	public ReviewVO reviewInfo(ReviewVO reviewVO); // review �긽�꽭蹂닿린
	public int reviewModify(ReviewVO reviewVO); // review �닔�젙
	public ReviewVO reviewModifyForm(ReviewVO reviewVO); // review �닔�젙�뤌
	
	//seungwoo code start
	public ArrayList<ReviewVO>getReview(String id);
}
