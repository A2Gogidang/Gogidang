package com.spring.gogidang.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReplyNoticeVO {
	
	private int s_comment_num;
	private int qs_num;
	private String u_id;
	private String re_content;
	private String re_date;
	private int s_num;
}
