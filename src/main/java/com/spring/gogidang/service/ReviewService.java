package com.spring.gogidang.service;

import java.util.List;

import com.spring.gogidang.domain.Criteria;
import com.spring.gogidang.domain.ReviewVO;

public interface ReviewService {
	
	public List<ReviewVO> getList(Criteria cri);
	public List<ReviewVO> getUidList(Criteria cri, String u_id);
	public List<ReviewVO> getSnumList(Criteria cri, int s_num);
	public void reviewReg(ReviewVO review);
	public boolean reviewModify(ReviewVO review);
	public boolean reviewRemove(int review_num);
	public ReviewVO getReview(int review_num);
	public int getTotal(Criteria cri);
}
