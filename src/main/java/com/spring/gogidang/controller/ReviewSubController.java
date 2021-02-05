package com.spring.gogidang.controller;

import java.util.HashMap;
import java.util.Map;

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
	public Map<String, Object> reReviewStoreInsert(ReviewSubVO reviewSub) {
		Map<String, Object> retVal = new HashMap<String, Object>();
		
		try {
			reviewsubService.reviewsubReg(reviewSub);
			retVal.put("res", "reviewsub");
		} catch (Exception e) {
			retVal.put("res", "FAIL");
			retVal.put("message", "Failure");
		} 
		
		return retVal;
	}

}
