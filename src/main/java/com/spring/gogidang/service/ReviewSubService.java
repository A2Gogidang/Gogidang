package com.spring.gogidang.service;

import com.spring.gogidang.domain.ReviewSubVO;

public interface ReviewSubService {
	
	public int reviewsubReg(ReviewSubVO reviewSub);
	public int getReviewSub(int review_num);
}
