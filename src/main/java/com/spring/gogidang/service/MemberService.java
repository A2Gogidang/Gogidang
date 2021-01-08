package com.spring.gogidang.service;

import com.spring.gogidang.domain.MemberVO;

public interface MemberService {
	
	public MemberVO selectMember(MemberVO memberVO);
	public int insertMember(MemberVO memberVO);
	public int updateMember(MemberVO memberVO);
}
