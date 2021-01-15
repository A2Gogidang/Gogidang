package com.spring.gogidang.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class StoreNoticeVO {
	
	private int qs_num;
	private String u_id;
	private int s_num;
	private String title;
	private String content;
	private String qna_date;
}
