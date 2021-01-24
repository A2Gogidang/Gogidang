package com.spring.mapper;

import com.spring.gogidang.domain.PayVO;

public interface PayMapper {
	public int deletePay(PayVO payVO);
	public PayVO selectPay(PayVO payVO);
	public int insertPay(PayVO payVO);
}
