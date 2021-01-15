package com.spring.gogidang.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MemberVO {
	
	private String u_id;
	private String u_pw;
	private String u_name;
	private String u_nick;
	private String u_birth;
	private String u_addr;
	private String u_email;
	private String u_phone;
	private int seller_key;
}