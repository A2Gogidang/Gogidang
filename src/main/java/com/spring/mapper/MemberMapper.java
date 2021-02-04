package com.spring.mapper;

import java.util.Map;

import com.spring.gogidang.domain.MemberVO;

public interface MemberMapper {
  
	public MemberVO selectMember(MemberVO memberVO);
	public int insertMember(MemberVO memberVO);
	public int updateMember(MemberVO memberVO);
	public int checkid(String u_id);
	public MemberVO getId(String u_id);
	public int getSnumByUid(String u_id);
}