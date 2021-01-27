package com.spring.mapper;

import java.util.List;
import java.util.Map;

import com.spring.gogidang.domain.CartVO;

public interface CartMapper {
	
	public void insertCart(CartVO vo);
	
	public List<CartVO> listcart(String u_id);
	
	public void deleteCart(int cart_num);
	
	public void modifyCart(CartVO vo);
	
	public int sumMoney(String u_id);
	
	public Map<String, Object> countCart(int menu_num,String u_id);
	
	public void updateCart(CartVO vo);
}
