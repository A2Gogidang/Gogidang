package com.spring.mapper;

import java.util.ArrayList;

import com.spring.gogidang.domain.CartVO;

public interface CartMapper {

   
   public int addCart(CartVO cartVO)throws Exception;
   public ArrayList<CartVO> cartList(CartVO cartVO)throws Exception;
   public int cartDelete(CartVO cartVO)throws Exception;
   
}