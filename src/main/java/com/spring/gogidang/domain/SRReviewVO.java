package com.spring.gogidang.domain;

import java.sql.Date;

public class SRReviewVO {

	private int review_num;
	private int comment_num;
	private String u_id;
	private String s_num;
	private String title;
	private String content;
	private int star;
	private String photo1;
	private Date review_date;
	private String re_content;
	private Date re_date;
	
	public int getReview_num() {
		return review_num;
	}
	public void setReview_num(int review_num) {
		this.review_num = review_num;
	}
	public int getComment_num() {
		return comment_num;
	}
	public void setComment_num(int comment_num) {
		this.comment_num = comment_num;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public String getS_num() {
		return s_num;
	}
	public void setS_num(String s_num) {
		this.s_num = s_num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getStar() {
		return star;
	}
	public void setStar(int star) {
		this.star = star;
	}
	public String getPhoto1() {
		return photo1;
	}
	public void setPhoto1(String photo1) {
		this.photo1 = photo1;
	}
	public Date getReview_date() {
		return review_date;
	}
	public void setReview_date(Date review_date) {
		this.review_date = review_date;
	}
	public String getRe_content() {
		return re_content;
	}
	public void setRe_content(String re_content) {
		this.re_content = re_content;
	}
	public Date getRe_date() {
		return re_date;
	}
	public void setRe_date(Date re_date) {
		this.re_date = re_date;
	}
	
	
	
	
	
	
	
}
