package com.spring.gogidang.service;

import java.util.ArrayList;

import com.spring.gogidang.domain.*;

public interface CartService {
	
	public int addCart(CartVO cartVO)throws Exception;
	public ArrayList<CartVO> cartList(CartVO cartVO)throws Exception;
	public int cartDelete(CartVO cartVO)throws Exception;
	
	
}
