package com.spring.mapper;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.spring.gogidang.domain.StoreVO;

public interface StoreMapper {
	
	// taehyun
	public ArrayList<StoreVO> getList();
	public ArrayList<StoreVO> getWaitList();
	public int confirmStore(StoreVO storeVO);
	public int refuseStore(StoreVO storeVO);
	public StoreVO storeInfo(StoreVO storeVO);
	public int checkStore(StoreVO storeVO);
	
	// soobin
	public int insertStore(StoreVO storeVO);
	public StoreVO selectStore(StoreVO storeVO);
	public int updateStore(StoreVO storeVO);


	// dohyeong
	public ArrayList<StoreVO> getStoreList();
	public List<StoreVO> getStoreListAjax(Map<String, String[]> mapp);
}