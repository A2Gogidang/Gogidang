package com.spring.gogidang.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class EventVO {
	
	private String event_num;
	private String photo;
	private String thumbnail;
	private String content;
	private Date re_date;
}
