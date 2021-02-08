package com.spring.gogidang.service;

import java.util.ArrayList;
import java.util.List;

import com.spring.gogidang.domain.MenuVO;

public interface MenuService {

	public List<MenuVO> menuList(int s_num);
	public void menuModify(int menu_num);
	public int menuDelete(int menu_num);
	public int menuRegister(MenuVO menuVO);
}
