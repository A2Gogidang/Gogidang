package com.spring.gogidang.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class SRReviewVO {

	private int review_num;
	private int comment_num;
	private String u_id;
	private int s_num;
	private String title;
	private String content;
	private int star;
	private String photo1;
	private Date review_date;
	private String re_content;
	private Date re_date;
}
