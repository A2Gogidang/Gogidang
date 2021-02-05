package com.spring.mapper;

import java.util.ArrayList;
import java.util.List;

import com.spring.gogidang.domain.PayVO;

public interface PayMapper {
	public int deletePay(PayVO payVO);
	public PayVO selectPay(PayVO payVO);
	public int insertPay(PayVO payVO);
	public ArrayList<PayVO> purchaseList(String u_id);
	public String storeName(PayVO payVO);
	public void cartEmpty(PayVO payVO);
	
	public List<PayVO> getList(String u_id);
	public PayVO getInfo(int pay_num);
}
