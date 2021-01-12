package com.spring.mapper;

import java.util.ArrayList;

import com.spring.gogidang.domain.MenuVO;

public interface MenuMapper {
	
	public ArrayList<MenuVO> getMenues();
	public ArrayList<MenuVO> selectMenu(MenuVO menuVO);
	public int insertMenu(MenuVO menuVO);

}
