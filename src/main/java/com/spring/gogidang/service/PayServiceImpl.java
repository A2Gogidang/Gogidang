package com.spring.gogidang.service;

import java.util.ArrayList;
import java.util.List;

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
	public ArrayList<PayVO> purchaseList(String u_id) {
		PayMapper paymapper = sqlSession.getMapper(PayMapper.class);
		ArrayList<PayVO> purchase_list = paymapper.purchaseList(u_id);
		
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

	@Override
	public List<PayVO> getList(String u_id) {
		PayMapper paymapper = sqlSession.getMapper(PayMapper.class);
		
		return paymapper.getList(u_id);
	}

	@Override
	public PayVO getInfo(int pay_num) {
		PayMapper paymapper = sqlSession.getMapper(PayMapper.class);
		
		return paymapper.getInfo(pay_num);
	}


}
