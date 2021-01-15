package com.spring.gogidang.service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.gogidang.domain.MenuVO;
import com.spring.mapper.MenuMapper;
import com.spring.mapper.StoreMapper;

@Service("menuService") 
public class MenuServiceImpl implements MenuService {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public ArrayList<MenuVO> getMenuList() {
		MenuMapper menuMapper = sqlSession.getMapper(MenuMapper.class);
		ArrayList<MenuVO> menuList = new ArrayList<MenuVO>();
		menuList = menuMapper.getMenues();
		return menuList;
	}
	//soobin start	
	@Override
	public ArrayList<MenuVO> selectMenu(MenuVO menuVO) {
		MenuMapper menuMapper = sqlSession.getMapper(MenuMapper.class);
		ArrayList<MenuVO> menuSelectList = new ArrayList<MenuVO>();
		menuSelectList = menuMapper.selectMenu(menuVO);
		return menuSelectList;
	}
	
	@Override
	public int insertMenu(MenuVO menuVO) {
		MenuMapper menuMapper = sqlSession.getMapper(MenuMapper.class);
		int res = menuMapper.insertMenu(menuVO);
		return res;
	}
	//soobin end

}
