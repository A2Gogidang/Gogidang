package com.spring.gogidang.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReviewSubVO {
	
	public int review_sub_num;
	public int review_num;
	public String review_sub_content;
	public Date review_date;
}
