package com.spring.gogidang.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.gogidang.domain.SRReviewVO;
import com.spring.gogidang.domain.StoreVO;
import com.spring.gogidang.service.StoreReviewService;

@Controller
public class StoreReviewController {

	@Autowired
	private StoreReviewService storeReviewService;
	
	@RequestMapping(value = "/storereviewList.no")
	public String storeNoticeList(Model model , HttpSession session)throws Exception {
		 
		SRReviewVO srReviewVO = new SRReviewVO();		
		srReviewVO.setS_num(((StoreVO)session.getAttribute("StoreVO")).getS_num());		
		ArrayList<SRReviewVO> srReviewList = storeReviewService.srReviewSelect(srReviewVO);	

		model.addAttribute("srReviewList", srReviewList);

		return "sellerpage/store_review";
	}
	
	
	
	
	
	
}
