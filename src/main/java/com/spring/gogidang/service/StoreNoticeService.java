package com.spring.gogidang.service;

import java.util.ArrayList;

import com.spring.gogidang.domain.*;

public interface StoreNoticeService {

	
	public ArrayList<SRNoticeVO> srNoticeSelect(SRNoticeVO srNoticeVO);
	public int replyNoticeDelete(ReplyNoticeVO replyNoticeVO);
	public int replyNoticeInsert(ReplyNoticeVO replyNoticeVO);
	public SRNoticeVO srNoticeList(SRNoticeVO srNoticeVO);
	
	
}
