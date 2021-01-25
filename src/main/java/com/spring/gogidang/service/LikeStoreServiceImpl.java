package com.spring.gogidang.service;

import java.util.ArrayList;
import java.util.List;

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
   public void addLikeStore(LikeStoreVO likeStoreVO) {
	   
	   LikeStoreMapper likeStoreMapper = sqlSession.getMapper(LikeStoreMapper.class);
	   
	   likeStoreMapper.addLikeStore(likeStoreVO);
   	
   }
   
   @Override
   public int getCountBySn(int s_num) {
	   
	   LikeStoreMapper likeStoreMapper = sqlSession.getMapper(LikeStoreMapper.class);
	   
	   return likeStoreMapper.getCountBySn(s_num);
   }
   
   @Override
   public List<LikeStoreVO> getListByUid(String u_id) {
	   
	   LikeStoreMapper likeStoreMapper = sqlSession.getMapper(LikeStoreMapper.class);
	   
	   return likeStoreMapper.getListByUid(u_id);
   }
   
}