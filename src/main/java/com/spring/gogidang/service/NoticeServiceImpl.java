package com.spring.gogidang.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.gogidang.domain.NoticeVO;
import com.spring.mapper.NoticeMapper;
import com.spring.mapper.QnaMapper;



@Service("noticeService")
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int getListCount() {
		NoticeMapper noticeMapper = sqlSession.getMapper(NoticeMapper.class);
		int res= noticeMapper.getListCount();
		return res;
	}

	@Override
	public List<NoticeVO> getNoticeList(HashMap<String, Integer> hashmap) {
		NoticeMapper noticeMapper = sqlSession.getMapper(NoticeMapper.class);
		List<NoticeVO> noticelist = noticeMapper.getNoticeList(hashmap);
		return noticelist;
	}
	
	@Override
	public int noticeInsert(NoticeVO notice) {
		NoticeMapper noticeMapper = sqlSession.getMapper(NoticeMapper.class);
		int res= noticeMapper.noticeInsert(notice);
		return res;
	}
	
	@Override
	public NoticeVO getDetail(int notice_num) {
		NoticeMapper noticeMapper = sqlSession.getMapper(NoticeMapper.class);
		NoticeVO notice = noticeMapper.getDetail(notice_num);
		return notice;
	}
	
	@Override
	public NoticeVO noticeModifyForm(int notice_num) {
		NoticeMapper noticeMapper = sqlSession.getMapper(NoticeMapper.class);
		NoticeVO notice = noticeMapper.getDetail(notice_num);
		return notice;
	}
	
	@Override
	public int noticeModify(NoticeVO notice) {
		NoticeMapper noticeMapper = sqlSession.getMapper(NoticeMapper.class);
		int res = noticeMapper.noticeModify(notice);
		return res;
	}
	
	  @Override
	   public int noticeDelete(HashMap<String, String> hashmap) {
		  NoticeMapper noticeMapper = sqlSession.getMapper(NoticeMapper.class);
	      int res= noticeMapper.isBoardWriter(hashmap);
	      int notice_num= Integer.parseInt(hashmap.get("notice_num"));
	      if(res==1) {
	         res=noticeMapper.noticeDelete(notice_num);
	      }
	      return res;
	   }
	  
	 
	
}

