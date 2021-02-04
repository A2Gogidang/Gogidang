package com.spring.gogidang.service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.gogidang.domain.PayVO;
import com.spring.mapper.PayMapper;

@Service("payService")
public class PayServiceImpl implements PayService{
	
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public int insertPay(PayVO payVO) {
		
		PayMapper paymapper = sqlSession.getMapper(PayMapper.class);

		int res= paymapper.insertPay(payVO);
	
		return res;
	}
	
	@Override
	public String storeName(PayVO payVO) {
		
		PayMapper paymapper = sqlSession.getMapper(PayMapper.class);

		String s_name = paymapper.storeName(payVO);
	
		return s_name;
	}
	
	@Override 
	public void cartEmpty(PayVO payVO) { 
		
		PayMapper paymapper = sqlSession.getMapper(PayMapper.class); 
		
		paymapper.cartEmpty(payVO);
		
	}
	
	
	@Override
	public ArrayList<PayVO> purchaseList(PayVO payVO) {
		PayMapper paymapper = sqlSession.getMapper(PayMapper.class);
		ArrayList<PayVO> purchase_list = paymapper.purchaseList(payVO);
		
		return purchase_list;
	}
	
	//////////////////////////아직 사용안함//////////////
	@Override 
	public PayVO selectPay(PayVO payVO) { 
		
		PayMapper paymapper = sqlSession.getMapper(PayMapper.class); 
		PayVO pay = paymapper.selectPay(payVO);
		return pay; 
	}

	@Override 
	public int deletePay(PayVO payVO) { 
		
		PayMapper paymapper = sqlSession.getMapper(PayMapper.class); 
		int res = paymapper.deletePay(payVO);
		return res; 
	}


}
