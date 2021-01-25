package com.spring.gogidang.service;

import java.util.ArrayList;

import com.spring.gogidang.domain.MenuVO;

public interface MenuService {

	public ArrayList<MenuVO> menuList(int s_num);
	public void menuModify(int menu_num);
	public void menuDelete(int menu_num);
	public int menuRegister(MenuVO menuVO);
}
