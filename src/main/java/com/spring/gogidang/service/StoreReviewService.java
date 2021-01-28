package com.spring.gogidang.service;

import java.util.ArrayList;

import com.spring.gogidang.domain.*;

public interface StoreReviewService {

	
	public ArrayList<SRReviewVO> srReviewSelect(SRReviewVO srReviewVO);
	public ArrayList<SRReviewVO> srReviewSelect_m(SRReviewVO srReviewVO);
	public SRReviewVO srReviewList(SRReviewVO srReviewVO);
	public int replyReviewInsert(ReviewReplyVO reviewReplyVO);
	public int replyReviewDelete(ReviewReplyVO reviewReplyVO);
	
}
