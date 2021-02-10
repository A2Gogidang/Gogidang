package com.spring.mapper;

import java.util.ArrayList;
import java.util.List;

import com.spring.gogidang.domain.MenuVO;

public interface MenuMapper {
	
	public List<MenuVO> listByNum(int s_num);
	public void modifyByNum(int menu_num);
	public int deleteByNum(int menu_num);
	public int register(MenuVO menuVO);
}
