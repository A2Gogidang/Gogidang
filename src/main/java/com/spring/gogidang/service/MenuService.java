package com.spring.gogidang.service;

import java.util.ArrayList;

import com.spring.gogidang.domain.MenuVO;

public interface MenuService {

	public ArrayList<MenuVO> getMenuList();
	//soobin start
	public ArrayList<MenuVO> selectMenu(MenuVO menuVO);
	public int insertMenu(MenuVO menuVO);
	//soobin end
}
