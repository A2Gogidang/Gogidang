package com.spring.gogidang.service;

import java.util.ArrayList;

import com.spring.gogidang.domain.PayVO;

public interface PayService {
	
	public int insertPay(PayVO payVO);
	public PayVO selectPay(PayVO payVO);
	public int deletePay(PayVO payVO);
	public ArrayList<PayVO> purchaseList(PayVO payVO);
	public String storeName(PayVO payVO);
	public void cartEmpty(PayVO payVO);

}
