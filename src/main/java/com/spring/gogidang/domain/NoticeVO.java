package com.spring.gogidang.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class NoticeVO {
	
	private int notice_num;
	private String u_id;
	private String title;
	private String content;
	private String notice_password;
	private String re_date;
	private int re_ref;
}
