package com.spring.gogidang.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MenuVO {
	
	private int menu_num;
	private int meat;
	private String menu_name;
	private String price;
	private String img;
	private String grade;
	private String gram;
	private String u_id;
	private int s_num;
}
