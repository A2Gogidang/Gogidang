package com.spring.mapper;

import java.util.List;

import com.spring.gogidang.domain.Criteria;
import com.spring.gogidang.domain.ReviewVO;

public interface ReviewMapper {

	public List<ReviewVO> getListWithPaging(Criteria cri);
	public void reviewReg(ReviewVO review);
	public int update(ReviewVO review);
	public int delete(int review_num);
	public ReviewVO read(int review_num);
	public int getTotalCount(Criteria cri);
}
