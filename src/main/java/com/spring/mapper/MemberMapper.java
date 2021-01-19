package com.spring.mapper;

import java.util.Map;

import com.spring.gogidang.domain.MemberVO;

public interface MemberMapper {
  
	MemberVO selectMember(MemberVO member);
	int insertMember(MemberVO member);
	int updateMember(MemberVO member);
	int checkid(String u_id);

}
