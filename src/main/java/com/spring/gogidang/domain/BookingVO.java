package com.spring.gogidang.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BookingVO {
	private String booking_num;
	private String u_id;
	private int s_num;
	private String time;
	private int head_count;
	private int table_charge;
	private int pay_price;
	private String pay_code;
	private int booking_state;
	private Date b_date;
	private String s_name;
	
}
