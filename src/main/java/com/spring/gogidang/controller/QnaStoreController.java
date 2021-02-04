package com.spring.gogidang.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.gogidang.domain.*;
import com.spring.gogidang.service.*;

@Controller
public class QnaStoreController {
	
	@Autowired 
	private QnaStoreService qnastoreService;
	
	@Autowired
	private MemberService memberService;

	@RequestMapping(value = "/qnastoreListAjax.re", produces="application/json; charset=UTF-8")
	@ResponseBody
	public List<QnaStoreVO> qnastoreListAjax(@RequestParam("s_num") int s_num) {
		List<QnaStoreVO> qnastoreList = qnastoreService.getList(s_num);
		System.out.println("list size = " + qnastoreList.size());
		
		return qnastoreList;
	}
	
	@RequestMapping(value = "/qnastoreListAjaxuid.re", produces="application/json; charset=UTF-8")
	@ResponseBody
	public List<QnaStoreVO> qnastoreListAjaxuid(@RequestParam("u_id") String u_id) {
		int get_s_num = memberService.getSnumByUid(u_id);
		List<QnaStoreVO> qnastoreList = qnastoreService.getList(get_s_num);
		System.out.println("list size = " + qnastoreList.size());
		
		return qnastoreList;
	}
	
	@RequestMapping(value="/qnaStoreInsert.qs")
	@ResponseBody
	public String qnaStoreInsert(QnaStoreVO qnastore) {
		int res = qnastoreService.qnaInsert(qnastore);
		System.out.println(res);
		String result = "";
		if(res == 1) {
			result = "ok";
		}
		return result;
	}
	
	@RequestMapping(value = "/qnastoreInfoAjax.re", method =RequestMethod.POST, produces="application/json; charset=UTF-8")
	@ResponseBody
	public Map<String, Object> qnastoreInfoAjax(@RequestParam("qnastore_num") int qnastore_num) {
		Map<String, Object> retVal = new HashMap<String, Object>();
		
		try {
			QnaStoreVO qsvo = qnastoreService.getDetail(qnastore_num);
			retVal.put("qnastore_num", qsvo.getQnastore_num());
			System.out.println(qsvo.getQnastore_num());
			retVal.put("u_id", qsvo.getU_id());
			retVal.put("title", qsvo.getTitle());
			retVal.put("content", qsvo.getContent());
			retVal.put("re_content", qsvo.getRe_content());
			retVal.put("res", "OK");
		} catch (Exception e) {
			retVal.put("res", "FAIL");
			retVal.put("message", "Failure");
		}
	
		return retVal;
	}
	
	@RequestMapping(value="/reQnaStoreInsert.qs")
	@ResponseBody
	public String reQnaStoreInsert(QnaStoreVO qnastore) {
		int res = qnastoreService.qnaModify(qnastore);
		String result = "";
		if(res == 1) {
			result = "ok";
		}
		return result;
	}

}
