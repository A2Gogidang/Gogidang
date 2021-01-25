package com.spring.mapper;

import java.util.ArrayList;

import com.spring.gogidang.domain.MenuVO;

public interface MenuMapper {
	
	public ArrayList<MenuVO> listByNum(int s_num);
	public void modifyByNum(int menu_num);
	public void deleteByNum(int menu_num);
	public int register(MenuVO menuVO);
}
