package com.spring.gogidang.service;

import java.util.ArrayList;
import java.util.List;

import com.spring.gogidang.domain.Criteria;
import com.spring.gogidang.domain.ReviewVO;

public interface ReviewService {
	public int reviewWrite(ReviewVO reviewVO); // review 湲��옉�꽦
	public ArrayList<ReviewVO> reviewListUid(ReviewVO reviewVO); // review list - u_id
	public ArrayList<ReviewVO> reviewListSnum(ReviewVO reviewVO); // review list - s_num
	public ArrayList<ReviewVO> getReviewList(); // review list - all
	public ArrayList<ReviewVO> getReviewList(Criteria cri);
	public ReviewVO reviewInfo(ReviewVO reviewVO); // review �긽�꽭蹂닿린
//	public int reviewModify(ReviewVO reviewVO); // review �닔�젙
	public ReviewVO reviewModifyForm(ReviewVO reviewVO); // review �닔�젙�뤌
	
	//seungwoo code start
	public ArrayList<ReviewVO>getReview(String id);
	
	//restart
	public List<ReviewVO> getList(Criteria cri);
	public ReviewVO reviewReg(ReviewVO review);
	public boolean reviewModify(ReviewVO review);
	public boolean reviewRemove(int review_num);
	public ReviewVO getReview(int review_num);
	public int getTotal(Criteria cri);
}
