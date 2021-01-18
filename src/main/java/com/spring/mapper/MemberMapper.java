package com.spring.mapper;

import com.spring.gogidang.domain.*;

public interface MemberMapper {
  
	MemberVO selectMember(MemberVO member);
	int insertMember(MemberVO member);
	int updateMember(MemberVO member);
	int checkid(String u_id);
}
