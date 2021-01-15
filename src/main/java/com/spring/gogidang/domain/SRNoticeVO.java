package com.spring.gogidang.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class SRNoticeVO {
	
	private int s_comment_num;
	private int qs_num;
	private String u_id;
	private String content;
	private String qna_date;
	private int s_num;
	private String title;
	private String re_content;
	private String re_date;
	
}
