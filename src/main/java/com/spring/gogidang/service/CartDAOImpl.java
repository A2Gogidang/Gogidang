package com.spring.gogidang.service;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.gogidang.domain.CartVO;

@Repository
public class CartDAOImpl implements CartDAO {
	
	@Inject
	private SqlSession sql;
	
	// 매퍼 
	private static String namespace = "com.spring.mapper.CartMapper";
	
	@Override
	public void addCart(CartVO cart) throws Exception {
		// TODO Auto-generated method stub
		sql.insert(namespace + ".addCart",cart);
	}

}
