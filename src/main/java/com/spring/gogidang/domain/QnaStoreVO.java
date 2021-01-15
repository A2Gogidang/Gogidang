package com.spring.gogidang.domain;

import java.util.Date;

public class QnaStoreVO {
	private int qs_num;
	private String u_id;
	private int s_num;
	private String title;
	private String content;
	private Date qna_date;
	private Date qna_updatedate;
	
	
	
	public Date getQna_updatedate() {
		return qna_updatedate;
	}
	public void setQna_updatedate(Date qna_updatedate) {
		this.qna_updatedate = qna_updatedate;
	}
	public int getQs_num() {
		return qs_num;
	}
	public void setQs_num(int qs_num) {
		this.qs_num = qs_num;
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
	public Date getQna_date() {
		return qna_date;
	}
	public void setQna_date(Date qna_date) {
		this.qna_date = qna_date;
	}
	
	

}
