package com.spring.gogidang.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.gogidang.domain.Criteria;
import com.spring.gogidang.domain.StoreVO;
import com.spring.mapper.StoreMapper;

@Service("storeService") // ("storeService")soobin code
public class StoreServiceImpl implements StoreService {
	
	@Autowired
	private SqlSession sqlSession;
	
	
	// taehyun start
	@Override
	public ArrayList<StoreVO> getList() {
		StoreMapper storeMapper = sqlSession.getMapper(StoreMapper.class);
		ArrayList<StoreVO> storeList = new ArrayList<StoreVO>();
		storeList = storeMapper.getList();
		
		return storeList; 
	}
	
	@Override
	public ArrayList<StoreVO> getWaitList() {
		StoreMapper storeMapper = sqlSession.getMapper(StoreMapper.class);
		ArrayList<StoreVO> storeList = new ArrayList<StoreVO>();
		storeList = storeMapper.getWaitList();
		
		return storeList;
	}
	 
	@Override
	public int confirmStore(StoreVO storeVO) {
		StoreMapper storeMapper = sqlSession.getMapper(StoreMapper.class);
		int res = storeMapper.confirmStore(storeVO);
		
		return res;
	}

	@Override
	public int refuseStore(StoreVO storeVO) {
		StoreMapper storeMapper = sqlSession.getMapper(StoreMapper.class);
		int res = storeMapper.refuseStore(storeVO);
		
		return res;
	}

	@Override
	public StoreVO storeInfo(int s_num) {
		StoreMapper storeMapper = sqlSession.getMapper(StoreMapper.class);
		StoreVO vo = storeMapper.storeInfo(s_num);
		
		return vo;
	}


	@Override
	public int checkStore(StoreVO storeVO) {
		StoreMapper storeMapper = sqlSession.getMapper(StoreMapper.class);
		int res = storeMapper.checkStore(storeVO);
		
		return res;
	}
	
	@Override
	public ArrayList<StoreVO> getWaitListWithPage(Criteria cri) {
		StoreMapper storeMapper = sqlSession.getMapper(StoreMapper.class);
		
		return storeMapper.getWaitListWithPage(cri);
	}

	@Override
	public int getTotal(Criteria cri) {
		StoreMapper storeMapper = sqlSession.getMapper(StoreMapper.class);
		System.out.println("impl" + storeMapper.getTotalCount(cri));
		return storeMapper.getTotalCount(cri);
	}

	// taehyun end
	
	// soobin start
	@Override
	   public int insertStore(StoreVO storeVO) {
	      
		StoreMapper storeMapper = sqlSession.getMapper(StoreMapper.class);
	      
	      int res = storeMapper.insertStore(storeVO);
	      System.out.println("res="+res);
	      return res;
	   }
	
	@Override
	   public StoreVO selectStore(StoreVO storeVO) {
		StoreMapper storeMapper = sqlSession.getMapper(StoreMapper.class);
		StoreVO store = storeMapper.selectStore(storeVO);
	      
	      return store;
	   }
	
	@Override
	   public int updateStore(StoreVO storeVO) {
	      
		StoreMapper storeMapper = sqlSession.getMapper(StoreMapper.class);
	      
	      int res = storeMapper.updateStore(storeVO);
	      System.out.println("res="+res);
	      return res;
	   }

	// soobin end

	//dohyeong start
	@Override
	public ArrayList<StoreVO> getStoreList() {
		StoreMapper storeMapper = sqlSession.getMapper(StoreMapper.class);
		ArrayList<StoreVO> storeList = new ArrayList<StoreVO>();
		storeList = storeMapper.getStoreList();
		
		return storeList;
	}
	
	@Override
	public List<StoreVO> getStoreListAjax(Map<String, String[]> mapp) {

		
		StoreMapper storeMapper = sqlSession.getMapper(StoreMapper.class);
		
		List<StoreVO> storelistAjax = storeMapper.getStoreListAjax(mapp); 
		
		
		return storelistAjax;
	}
	//dohyeong end

	@Override
	public List<StoreVO> getStoreListAjaxByMeat(Map<String, String[]> mapp) {
		StoreMapper storeMapper = sqlSession.getMapper(StoreMapper.class);
		
		List<StoreVO> storelistAjax = storeMapper.getStoreListAjaxByMeat(mapp); 
		
		
		return storelistAjax;
	}

	@Override
	public List<StoreVO> getStoreListAjaxByAddr(Map<String, String[]> mapp) {
		StoreMapper storeMapper = sqlSession.getMapper(StoreMapper.class);
		
		List<StoreVO> storelistAjax = storeMapper.getStoreListAjaxByAddr(mapp); 
		
		
		return storelistAjax;
	}


}
