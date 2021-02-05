package com.spring.mapper;

import com.spring.gogidang.domain.ReviewSubVO;

public interface ReviewSubMapper {
	
	public int reviewsubReg (ReviewSubVO reviewSub);
	public int getReviewSub (int review_num);
}
