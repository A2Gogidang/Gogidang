package com.spring.mapper;

import java.util.ArrayList;

import com.spring.gogidang.domain.LikeStoreVO;

public interface LikeStoreMapper {
   public ArrayList<LikeStoreVO> getLikeStores(String id);

}