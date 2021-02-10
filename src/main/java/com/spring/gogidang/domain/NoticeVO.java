package com.spring.gogidang.domain;

import java.sql.Date;

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
	private String re_date;
	private int re_ref;
}
