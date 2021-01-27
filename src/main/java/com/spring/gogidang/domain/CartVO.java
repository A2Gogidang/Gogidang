package com.spring.gogidang.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class CartVO {

	private int cart_num;
	private String u_id;
	private int menu_num;
	private String menu_name;
	private int cartStock;
	private Date addDate;
	
}
