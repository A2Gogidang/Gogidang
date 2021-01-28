package com.spring.mapper;

import java.util.ArrayList;

import com.spring.gogidang.domain.ReviewReplyVO;
import com.spring.gogidang.domain.SRReviewVO;

public interface StoreReviewMapper {

	public ArrayList<SRReviewVO> srReviewSelect(SRReviewVO srReviewVO); 
	public ArrayList<SRReviewVO> srReviewSelect_m(SRReviewVO srReviewVO);
	public SRReviewVO srReviewList(SRReviewVO srReviewVO);
	public int replyReviewInsert(ReviewReplyVO reviewReplyVO);
	public int replyReviewDelete(ReviewReplyVO reviewReplyVO);
	
	
}
