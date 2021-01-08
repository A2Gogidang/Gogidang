package com.spring.mapper;

import java.util.HashMap;
import java.util.List;

import com.spring.gogidang.domain.*;


public interface NoticeMapper {
	public int getListCount(); 
	public List<NoticeVO> getNoticeList(HashMap<String, Integer> hashmap);
	public int noticeInsert(NoticeVO notice);
	public NoticeVO getDetail(int notice_num);
	public int noticeModify(NoticeVO notice);
	public int noticeDelete(int notice_num);
	public int isBoardWriter(HashMap<String, String> hashmap);
}
