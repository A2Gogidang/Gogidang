package com.spring.gogidang.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.gogidang.domain.ReviewAttachVO;
import com.spring.mapper.ReviewAttachMapper;
import com.spring.mapper.ReviewMapper;

@Service
public class ReviewAttachServiceImpl implements ReviewAttachService {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insert(ReviewAttachVO vo) {
		ReviewAttachMapper reviewAttachMapper = sqlSession.getMapper(ReviewAttachMapper.class);
		
		reviewAttachMapper.insert(vo);
	}

	@Override
	public void update(ReviewAttachVO vo) {
		ReviewAttachMapper reviewAttachMapper = sqlSession.getMapper(ReviewAttachMapper.class);
		
		reviewAttachMapper.update(vo);
	}

	@Override
	public ReviewAttachVO getImg(int review_num) {
		ReviewAttachMapper reviewAttachMapper = sqlSession.getMapper(ReviewAttachMapper.class);
		
		return reviewAttachMapper.findByNum(review_num);
	}
	
	
	
}
