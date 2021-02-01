package com.spring.gogidang.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.gogidang.domain.QnaStoreVO;
import com.spring.gogidang.domain.ReviewReplyVO;
import com.spring.mapper.QnaStoreMapper;
import com.spring.mapper.ReviewReplyMapper;

@Service
public class ReviewReplyServiceImpl implements ReviewReplyService {

	@Autowired
	private ReviewReplyMapper mapper;
	
	@Override
	public int register(ReviewReplyVO vo) {
		// TODO Auto-generated method stub
		return mapper.insert(vo);
	}

}
