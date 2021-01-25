package com.spring.mapper;

import java.util.ArrayList;
import java.util.List;

import com.spring.gogidang.domain.LikeStoreVO;

public interface LikeStoreMapper {
	
	public void addLikeStore(LikeStoreVO likeStoreVO);
	public int getCountBySn(int s_num);
	public List<LikeStoreVO> getListByUid(String u_id);
	
	public ArrayList<LikeStoreVO> getLikeStores(String id);

}