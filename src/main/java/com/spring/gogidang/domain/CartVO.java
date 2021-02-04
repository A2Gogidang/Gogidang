package com.spring.gogidang.domain;


import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CartVO {

	private int cartNum;
	private String u_id;
	private int menu_num;
	private String menu_name;
	private int cartStock;
	private Date addDate;
	private int price;
	private String img;
	private int s_num;
	
	
	
}
