package com.spring.mapper;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.spring.gogidang.domain.Criteria;
import com.spring.gogidang.domain.StoreVO;

public interface StoreMapper {
	
	// taehyun
	public ArrayList<StoreVO> getList();
	public ArrayList<StoreVO> getWaitList();
	public int confirmStore(StoreVO storeVO);
	public int refuseStore(StoreVO storeVO);
	public StoreVO storeInfo(int s_num);
	public int checkStore(StoreVO storeVO);
	
	public ArrayList<StoreVO> getWaitListWithPage(Criteria cri);
	public int getTotalCount(Criteria cri);
	
	// soobin
	public int insertStore(StoreVO storeVO);
	public StoreVO selectStore(StoreVO storeVO);
	public int updateStore(StoreVO storeVO);
	
	//카드 부분


	// dohyeong
	public ArrayList<StoreVO> getStoreList();
	public List<StoreVO> getStoreListAjax(Map<String, String[]> mapp);
}