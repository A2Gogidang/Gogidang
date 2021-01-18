package com.spring.mapper;

import java.util.List;

import com.spring.gogidang.domain.ReviewAttachVO;

public interface ReviewAttachMapper {
	
	public void insert(ReviewAttachVO vo);
	public void update(ReviewAttachVO vo);
	public void delete(String uuid);
	public ReviewAttachVO findByNum(int review_num);
}
