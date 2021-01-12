package com.spring.mapper;

import java.util.ArrayList;

import com.spring.gogidang.domain.*;

public interface StoreNoticeMapper {
	
	public ArrayList<SRNoticeVO> srNoticeSelect(SRNoticeVO srNoticeVO);
	public int replyNoticeDelete(ReplyNoticeVO replyNoticeVO);
	public int replyNoticeInsert(ReplyNoticeVO replyNoticeVO);
	public SRNoticeVO srNoticeList(SRNoticeVO srNoticeVO);
}

