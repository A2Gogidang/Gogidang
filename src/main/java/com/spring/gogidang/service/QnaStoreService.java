package com.spring.gogidang.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.gogidang.domain.QnaStoreVO;

public interface QnaStoreService {
	
	public int register(QnaStoreVO vo);
	
	public QnaStoreVO get(int qs_num);
	
	public int remove(int qs_num);
	
	public int modify(QnaStoreVO qna);
	
	public List<QnaStoreVO> getList(int s_num);
	

}
