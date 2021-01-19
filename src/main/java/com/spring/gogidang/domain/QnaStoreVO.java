package com.spring.gogidang.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class QnaStoreVO {
	private Integer qs_num;
	private String u_id;
	private int s_num;
	private String content;
	private Date qna_date;
	private Date qna_updatedate;
	
	
}
