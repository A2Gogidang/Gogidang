package com.spring.gogidang.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReviewReplyVO {

	private int comment_num;
	private int review_num;
	private String u_id;
	private String re_content;
	private Date re_date;
}
