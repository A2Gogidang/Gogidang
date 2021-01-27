package com.spring.gogidang.service;

import java.util.List;
import java.util.Map;

import com.spring.gogidang.domain.Criteria;
import com.spring.gogidang.domain.ReviewVO;

public interface ReviewService {
	
	public List<ReviewVO> getList();
	public List<ReviewVO> getListWithPaging(Criteria cri);
	public List<ReviewVO> getListByIdWithPaing(Criteria cri, String u_id);
	public List<ReviewVO> getListBySnWithPaing(Criteria cri, int s_num);
	
	public ReviewVO getReview(int review_num);
	public void regReview(ReviewVO review);
	
	public int getTotal(Criteria cri);
	
	public List<ReviewVO> getReviewListAjax(Map<String, String[]> mapp);

}

//public boolean reviewModify(ReviewVO review);
//public boolean reviewRemove(int review_num);