package com.spring.gogidang.domain;

import java.util.Date;

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
	private String photo1;
	private String photo2;
	private String photo3;
	private Date review_date;
	private String s_name;
			
}
