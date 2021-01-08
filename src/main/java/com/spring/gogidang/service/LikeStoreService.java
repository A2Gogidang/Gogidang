package com.spring.gogidang.service;

import java.util.ArrayList;

import com.spring.gogidang.domain.LikeStoreVO;

public interface LikeStoreService {
   
   public ArrayList<LikeStoreVO> getLikeStore(String id);

}