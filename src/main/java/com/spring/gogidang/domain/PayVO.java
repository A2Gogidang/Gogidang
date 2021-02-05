package com.spring.gogidang.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PayVO {
	
	public int pay_num;
	public String u_id;
	public int s_num;
	public String pay_code;
	public int totalPrice;
	public Date paydate;
	public String imp_uid;
	public String s_name;
	
	public int review_num;
	public String content;
	
}
