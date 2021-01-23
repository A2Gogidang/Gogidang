package com.spring.gogidang.service;

import java.util.ArrayList;
import java.util.List;

import com.spring.gogidang.domain.LikeStoreVO;

public interface LikeStoreService {
	
	public void addLikeStore(LikeStoreVO likeStoreVO);
	public int getCountBySn(int s_num);
	public List<LikeStoreVO> getListByUid(String u_id);

}