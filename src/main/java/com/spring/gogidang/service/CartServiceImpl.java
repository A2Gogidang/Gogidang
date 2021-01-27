package com.spring.gogidang.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.gogidang.domain.CartVO;
import com.spring.mapper.CartMapper;

@Service
public class CartServiceImpl implements CartService {

	@Inject
	private CartDAO dao;
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void addCart(CartVO cart) throws Exception {
		dao.addCart(cart);
	}
	
	

}
