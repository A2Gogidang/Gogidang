package com.spring.gogidang.service;

import java.util.ArrayList;
import java.util.List;

import com.spring.gogidang.domain.PayVO;

public interface PayService {
	
	public int insertPay(PayVO payVO);
	public PayVO selectPay(PayVO payVO);
	public int deletePay(PayVO payVO);
	public ArrayList<PayVO> purchaseList(String u_id);
	public String storeName(PayVO payVO);
	public void cartEmpty(PayVO payVO);
	
	public List<PayVO> getList(String u_id);
	public PayVO getInfo(int pay_num);

}
