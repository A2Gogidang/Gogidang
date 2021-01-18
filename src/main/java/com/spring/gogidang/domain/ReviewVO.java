package com.spring.gogidang.domain;

import java.util.Date;
import java.util.List;

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
	
	private String review_img;

	private List<ReviewAttachVO> attachList;

}
