package com.spring.gogidang.service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.gogidang.domain.LikeStoreVO;
import com.spring.mapper.LikeStoreMapper;

@Service
public class LikeStoreServiceImpl implements LikeStoreService{
   
   @Autowired
   SqlSession sqlSession;
   
   @Override
   public ArrayList<LikeStoreVO> getLikeStore(String id){
      LikeStoreMapper likestoremapper = sqlSession.getMapper(LikeStoreMapper.class);
      ArrayList<LikeStoreVO>likeList = new ArrayList<LikeStoreVO>();
      likeList = likestoremapper.getLikeStores(id);
      
      return likeList;
   }

}