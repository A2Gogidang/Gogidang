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
	
<<<<<<< HEAD
	public String getBooking_num() {
		return booking_num;
	}
	public void setBooking_num(String booking_num) {
		this.booking_num = booking_num;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public int getS_num() {
		return s_num;
	}
	public void setS_num(int s_num) {
		this.s_num = s_num;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public int getHead_count() {
		return head_count;
	}
	public void setHead_count(int head_count) {
		this.head_count = head_count;
	}
	public int getTable_charge() {
		return table_charge;
	}
	public void setTable_charge(int table_charge) {
		this.table_charge = table_charge;
	}
	public int getPay_price() {
		return pay_price;
	}
	public void setPay_price(int pay_price) {
		this.pay_price = pay_price;
	}
	public String getPay_code() {
		return pay_code;
	}
	public void setPay_code(String pay_code) {
		this.pay_code = pay_code;
	}
	public int getBooking_state() {
		return booking_state;
	}
	public void setBooking_state(int booking_state) {
		this.booking_state = booking_state;
	}
	public String getS_name() {
		return s_name;
	}
	public void setS_name(String s_name) {
		this.s_name = s_name;
	}
	public Date getB_date() {
		return b_date;
	}
	public void setB_date(Date b_date) {
		this.b_date = b_date;
	}
	
	
=======
>>>>>>> e2f76e0d6d11d780b99ca425c362b062a150b092
}
