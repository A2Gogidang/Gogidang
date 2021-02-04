package com.spring.gogidang.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.gogidang.domain.*;
import com.spring.gogidang.service.*;

@Controller
public class ReviewSubController {
	
	@Autowired
	private ReviewSubService reviewsubService;
	
	
	@RequestMapping(value="/reReviewStoreInsert.re")
	@ResponseBody
	public String reReviewStoreInsert(ReviewSubVO reviewSub) {
		int res = reviewsubService.reviewsubReg(reviewSub);
		String result = "";
		if(res == 1) {
			result = "ok";
		}
		return result;
	}
}
