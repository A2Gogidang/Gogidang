package com.spring.gogidang.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.gogidang.domain.*;
import com.spring.gogidang.service.*;


@Controller
public class ReviewController {
	
	@Autowired
	private ReviewService reviewService;
	
	@Autowired
	private StoreService storeService;
	
	@RequestMapping(value = "/reviewWriteForm.re")
	public String reviewWriteForm(StoreVO storeVO, Model model) {
		StoreVO vo = storeService.storeInfo(storeVO);
		model.addAttribute("storeVO", vo);
		return "review/reviewWrite";
	}
	
	/*
	 * 由щ럭 �옉�꽦 �럹�씠吏�濡� �씠�룞
	 */
	@RequestMapping(value = "/reviewListForm.re")
	public String reviewListForm() {
		return "review/reviewList";
	}
	
	/*
	 * 由щ럭 �옉�꽦
	 */
	@RequestMapping(value = "/reviewWrite.re")
	public String reviewwrite(ReviewVO reviewVO) {
		int res = reviewService.reviewWrite(reviewVO);
		
		return "review/reviewList";
	}
	
	/*
	 * u_id瑜� �씠�슂�븳 由щ럭由ъ뒪�듃
	 * 媛�寃뚯젏二쇨� 濡쒓렇�씤�뻽�쓣�븣 �빐�떦 媛�寃뚯쓽 紐⑤뱺由щ럭瑜� 蹂쇱닔媛� �엳�쓬
	 */
	@RequestMapping(value = "/reviewListUid.re")
	public String reviewListUid(ReviewVO reviewVO, Model model) {
		ArrayList<ReviewVO> reviewList = new ArrayList<ReviewVO>();
		reviewList = reviewService.reviewListUid(reviewVO);
		model.addAttribute("reviewList", reviewList);
		
		return "review/reviewList";
	}
	
	/*
	 * s_num�쓣 �씠�슜�븳 由щ럭由ъ뒪�듃
	 * �븳 媛�寃뚯쓽 紐⑤뱺 由щ럭 媛��졇�삤�뒗 �뿭�븷
	 */
	@RequestMapping(value = "/reviewListSnum.re")
	public String reviewListSnum(ReviewVO reviewVO, Model model) {
		ArrayList<ReviewVO> reviewList = new ArrayList<ReviewVO>();
		reviewList = reviewService.reviewListSnum(reviewVO);
		model.addAttribute("reviewList", reviewList);
		
		return "review/reviewList";
	}
	
	/*
	 * 紐⑤뱺 由щ럭 由ъ뒪�듃
	 */
	@RequestMapping(value = "/getReviewList.re")
	public String getReviewList(Model model) {
		ArrayList<ReviewVO> reviewList = new ArrayList<ReviewVO>();
		reviewList = reviewService.getReviewList();
		model.addAttribute("reviewList", reviewList);
		
		return "review/reviewList";
	}
	
	/*
	 * 由щ럭 �긽�꽭 蹂닿린
	 */
	@RequestMapping(value = "/reviewInfo.re")
	public String reviewInfo(ReviewVO reviewVO, Model model) {
		ReviewVO vo = reviewService.reviewInfo(reviewVO);
		model.addAttribute("reviewVO", vo);
		
		return "review/reviewInfo";
	}
	
	@RequestMapping("/reviewModifyForm.re")
	public String getModifyForm(ReviewVO reviewVO,Model model) {
		ReviewVO review =reviewService.reviewInfo(reviewVO);
		model.addAttribute("review",review);
	  
		return "reviewModify";
	}
	   
	@RequestMapping("/reviewModify.re")
	public String reviewModify(ReviewVO reviewVO) throws Exception{
		int res = reviewService.reviewModify(reviewVO);
	      
		return "redirect:/reviewInfo.re?review_num="+reviewVO.getReview_num();
	}
	
	//seungwoo code start
	@RequestMapping("/myreviewlist.re")
	public String getReview(MemberVO memberVO,Model model) throws Exception{
		String id = memberVO.getU_id();
		ArrayList<ReviewVO>review_list = reviewService.getReview(id);
		model.addAttribute("review_list",review_list);
		
		return "mypage/myreview_list";
	}
	
}
