package com.spring.gogidang.domain;



import java.sql.Date;

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
	private String re_content;
	
	
}
