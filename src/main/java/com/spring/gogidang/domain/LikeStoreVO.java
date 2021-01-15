package com.spring.gogidang.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class LikeStoreVO {
	private int like_num;
	private int s_num;
	
	private String u_id;
	public String s_name;
	public String thumbnail;
	public String s_addr;
	public String s_phone;
	public String s_hour;
	
}
