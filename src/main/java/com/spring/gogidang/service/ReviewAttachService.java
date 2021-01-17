package com.spring.gogidang.service;

import org.springframework.stereotype.Service;

import com.spring.gogidang.domain.ReviewAttachVO;

public interface ReviewAttachService {
	
	public void insert(ReviewAttachVO vo);
	public void update(ReviewAttachVO vo);
	public ReviewAttachVO getImg(int review_num);
}
