package com.spring.mapper;

import java.util.ArrayList;

import com.spring.gogidang.domain.PayVO;

public interface PayMapper {
	public int deletePay(PayVO payVO);
	public PayVO selectPay(PayVO payVO);
	public int insertPay(PayVO payVO);
	public ArrayList<PayVO> purchaseList(PayVO payVO);
	public String storeName(PayVO payVO);
}
