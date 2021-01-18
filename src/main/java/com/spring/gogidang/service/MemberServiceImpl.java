package com.spring.gogidang.service;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.gogidang.domain.*;
import com.spring.mapper.MemberMapper;

@Service("memberService")
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public MemberVO selectMember(MemberVO memberVO) {
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		MemberVO member = memberMapper.selectMember(memberVO);
      
		return member;
   }
	
	@Override
	public int insertMember(MemberVO memberVO) {
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		int res = memberMapper.insertMember(memberVO);
		
		return res;
	}
	
	@Override
	public int updateMember(MemberVO memberVO) {
		      
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		      
		int res = memberMapper.updateMember(memberVO);
		return res;
	}
	
	@Override
	public int checkid(String u_id) {
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		
		int res = memberMapper.checkid(u_id);
		
		return res;
	}
}
