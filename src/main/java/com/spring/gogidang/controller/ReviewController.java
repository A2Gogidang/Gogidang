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
		return "review/review_write_form";
	}
	
	@RequestMapping(value = "/reviewListForm.re")
	public String reviewListForm() {
		
		return "review/review_list";
	}
	
	@RequestMapping(value = "/reviewWrite.re")
	public String reviewWrite(ReviewVO reviewVO) {
		int res = reviewService.reviewWrite(reviewVO);
		
		return "redirect:/getReviewList.re";
	}
	
	@RequestMapping(value = "/reviewListUid.re")
	public String reviewListUid(ReviewVO reviewVO, Model model) {
		ArrayList<ReviewVO> reviewList = new ArrayList<ReviewVO>();
		reviewList = reviewService.reviewListUid(reviewVO);
		model.addAttribute("reviewList", reviewList);
		
		return "mypage/member_review";
	}

	@RequestMapping(value = "/reviewListSnum.re")
	public String reviewListSnum(ReviewVO reviewVO, Model model) {
		ArrayList<ReviewVO> reviewList = new ArrayList<ReviewVO>();
		reviewList = reviewService.reviewListSnum(reviewVO);
		model.addAttribute("reviewList", reviewList);
		
		return "review/review_list";
	}

	@RequestMapping(value = "/getReviewList.re")
	public String getReviewList(Model model) {
		ArrayList<ReviewVO> reviewList = new ArrayList<ReviewVO>();
		reviewList = reviewService.getReviewList();
		model.addAttribute("reviewList", reviewList);
		
		return "review/review_list";
	}
	
	@RequestMapping(value = "/reviewInfo.re")
	public String reviewInfo(ReviewVO reviewVO, Model model) {
		ReviewVO vo = reviewService.reviewInfo(reviewVO);
		model.addAttribute("reviewVO", vo);
		
		return "review/review_info";
	}
	
	@RequestMapping("/reviewList.re")
	public String getReview(MemberVO memberVO,Model model) throws Exception{
		String id = memberVO.getU_id();
		ArrayList<ReviewVO>review_list = reviewService.getReview(id);
		model.addAttribute("review_list",review_list);
		
		return "mypage/member_review";
	}
	
}
