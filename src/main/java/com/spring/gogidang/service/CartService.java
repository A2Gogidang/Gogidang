package com.spring.gogidang.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.spring.gogidang.domain.CartVO;


public interface CartService {
	
	//카트 담기
	public void addCart(CartVO cart) throws Exception;
	
	
}
