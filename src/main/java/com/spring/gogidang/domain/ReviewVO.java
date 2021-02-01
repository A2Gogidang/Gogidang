package com.spring.gogidang.domain;



import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReviewVO {
	
	private int review_num;
	private String u_id;
	private int s_num;
	private String title;
	private String nickname;
	private String content;
	private int star;
	private Date review_date;
	private String s_name;
	
	private String review_img1;
	private String review_img2;
	private String review_img3;
	
	/* menu column*/
	private int menu_num; 
	private int meat;
	private String menu_name;
	private String price;
	private String img;
	private int grade;

}
