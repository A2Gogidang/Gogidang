package com.spring.mapper;

import java.util.List;

import com.spring.gogidang.domain.ReviewAttachVO;

public interface ReviewAttachMapper {
	
	public void inert(ReviewAttachVO vo);
	public void delete(String uuid);
	public List<ReviewAttachVO> findByNum(int review_num);
}
