package com.spring.gogidang.service;

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
