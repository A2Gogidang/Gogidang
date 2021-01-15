package com.spring.gogidang.domain;

public class StoreVO {
	private int s_num;
	private String u_id;
	private String thumbnail;
	private String s_name;
	private String s_addr;
	private String s_phone;
	private String s_img;
	private String s_hour;
	private int delibery;
	private int confirm;
	
	/* menu column*
	 * private int menu_num; 
	private int meat;
	private String menu_name;
	private String price;
	private String img;
	private int grade;
	private int gram;
	*/
	
	public int getS_num() {
		return s_num;
	}
	public void setS_num(int s_num) {
		this.s_num = s_num;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public String getThumbnail() {
		return thumbnail;
	}
	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}
	public String getS_name() {
		return s_name;
	}
	public void setS_name(String s_name) {
		this.s_name = s_name;
	}
	public String getS_addr() {
		return s_addr;
	}
	public void setS_addr(String s_addr) {
		this.s_addr = s_addr;
	}
	public String getS_phone() {
		return s_phone;
	}
	public void setS_phone(String s_phone) {
		this.s_phone = s_phone;
	}
	public String getS_img() {
		return s_img;
	}
	public void setS_img(String s_img) {
		this.s_img = s_img;
	}
	public String getS_hour() {
		return s_hour;
	}
	public void setS_hour(String s_hour) {
		this.s_hour = s_hour;
	}
	public int getDelibery() {
		return delibery;
	}
	public void setDelibery(int delibery) {
		this.delibery = delibery;
	}
	public int getConfirm() {
		return confirm;
	}
	public void setConfirm(int confirm) {
		this.confirm = confirm;
	}
}
