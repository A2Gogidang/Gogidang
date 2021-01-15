package com.spring.gogidang.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class QnaVO {
	
	private int qna_num;
	private String u_id;
	private String title;
	private String content;
	private Date re_date;
	private String qna_password;
	private int re_ref;
	private int re_lev;
	private int re_seq;
}
