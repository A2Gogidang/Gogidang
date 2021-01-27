package com.spring.gogidang.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.spring.gogidang.domain.Criteria;
import com.spring.gogidang.domain.StoreVO;

public interface StoreService {
	
	// taehyun
	public ArrayList<StoreVO> getList();
	public ArrayList<StoreVO> getWaitList();
	public int confirmStore(StoreVO storeVO);
	public int refuseStore(StoreVO storeVO);
	public StoreVO storeInfo(int s_num);
	public int checkStore(StoreVO storeVO);
	
	public ArrayList<StoreVO> getWaitListWithPage(Criteria cri);
	public int getTotal(Criteria cri);
	
	public Double getAvgStar(int s_num);
	
	// soobin
	public int insertStore(StoreVO storeVO); 
	public StoreVO selectStore(StoreVO storeVO);
	public int updateStore(StoreVO storeVO);

	
	// dohyeong
	public ArrayList<StoreVO> getStoreList();
	public List<StoreVO> getStoreListAjax(Map<String, String[]> mapp);
}
