package com.spring.gogidang.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.gogidang.domain.*;
import com.spring.gogidang.service.*;

import lombok.extern.slf4j.Slf4j;


@Controller
public class ReviewController {
	
	@Autowired
	private ReviewService reviewService;
	
	@Autowired
	private StoreService storeService;
	
	@GetMapping("/reviewList.re")
	public String reviewList(Criteria cri, Model model) {
		
		model.addAttribute("list", reviewService.getList(cri));
		
		int total = reviewService.getTotal(cri);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		
		return "review/review_list";
	}
	
	@RequestMapping("/reviewUidList.re")
	public String reveiwUidList(ReviewVO review,  Criteria cri, HttpSession session, Model model) {
		
		model.addAttribute("reviewUidList", reviewService.getUidList(cri, review.getU_id()));
		
		int total = reviewService.getTotal(cri);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		
		return "mypage/member_review";
	}

	@RequestMapping("/reviewReg.re")
	public String reviewReg(ReviewVO review) {
		
		reviewService.reviewReg(review);
		return "redirect:/reviewList.re";
	}
	
	@RequestMapping("/review_reg.re")
	public String review_reg(StoreVO store, Model model, HttpSession session) {
		
		StoreVO svo = storeService.storeInfo(store);
		
		model.addAttribute("svo", svo);
		return "review/review_reg";
	}
	
	@RequestMapping("/reviewModify.re")
	public String reviewModify(ReviewVO review, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		
		if (reviewService.reviewModify(review)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		
		return "redirect:/review/review_list";
	}
	
	@RequestMapping("/reviewRemove.re")
	public String reviewRemove(@RequestParam("review_num") int review_num, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		
		if (reviewService.reviewRemove(review_num)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		
		return "redirect:/review/review_list";
	}
	
	@RequestMapping("/reviewInfo.re")
	public String reviewInfo(@RequestParam("review_num") int review_num, Model model) {
		model.addAttribute("review", reviewService.getReview(review_num));
		
		return "/review/review_info";
	}
}
