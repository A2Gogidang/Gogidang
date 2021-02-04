package com.spring.gogidang.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class QnaStoreVO {

	private int qnastore_num;
	private String u_id;
	private int s_num;
	private String title;
	private String content;
	private Date re_date;
	private String re_content;

}