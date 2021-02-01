package com.spring.gogidang.service;

import com.spring.gogidang.domain.PayVO;

public interface PayService {
	
	public int insertPay(PayVO payVO);
	public PayVO selectPay(PayVO payVO);
	public int deletePay(PayVO payVO);

}
