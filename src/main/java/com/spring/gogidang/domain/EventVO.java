package com.spring.gogidang.domain;

public class EventVO {
	private String event_num;
	private String photo;
	private String thumbnail;
	private String content;
	private String re_date;
	
	public String getEvent_num() {
		return event_num;
	}
	public void setEvent_num(String event_num) {
		this.event_num = event_num;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public String getThumbnail() {
		return thumbnail;
	}
	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRe_date() {
		return re_date;
	}
	public void setRe_date(String re_date) {
		this.re_date = re_date;
	}
}
