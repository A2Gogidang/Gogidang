package com.spring.gogidang.service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.gogidang.domain.CartVO;
import com.spring.mapper.CartMapper;


@Service("cartService")
public class CartServiceImpl implements CartService{

	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int addCart(CartVO cartVO)throws Exception{
		CartMapper cartMapper = sqlSession.getMapper(CartMapper.class);
		
		int res = cartMapper.addCart(cartVO);
		
		return res;
	}

	@Override
	public ArrayList<CartVO> cartList(CartVO cartVO)throws Exception{
		CartMapper cartMapper = sqlSession.getMapper(CartMapper.class);
		
		ArrayList<CartVO> cart_list = cartMapper.cartList(cartVO);
		
		return cart_list;
	}
	
	@Override
	public int cartDelete(CartVO cartVO)throws Exception{
		CartMapper cartMapper = sqlSession.getMapper(CartMapper.class);
		
		int res = cartMapper.cartDelete(cartVO);
		
		return res;
	}
	
	
}
