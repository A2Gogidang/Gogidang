package com.spring.gogidang.controller;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.gogidang.domain.EventVO;
import com.spring.gogidang.domain.MemberVO;
import com.spring.gogidang.domain.ReviewReplyVO;
import com.spring.gogidang.domain.SRReviewVO;
import com.spring.gogidang.domain.StoreVO;
import com.spring.gogidang.service.StoreReviewService;
import com.spring.gogidang.service.StoreService;

@Controller
public class StoreReviewController {
	

	@Autowired
	private StoreReviewService storeReviewService;
	
	@RequestMapping(value = "/storereviewList.bo")
	public String storeNoticeList(Model model , HttpSession session)throws Exception {
		 
		SRReviewVO srReviewVO = new SRReviewVO();		
		srReviewVO.setS_num(((StoreVO)session.getAttribute("StoreVO")).getS_num());		
		ArrayList<SRReviewVO> srReviewList = storeReviewService.srReviewSelect(srReviewVO);	
		
		model.addAttribute("srReviewList", srReviewList);

		return "sellerpage/store_review";
	}
	
	@RequestMapping(value = "/replyReviewInputForm.bo")
	public String replyReviewInputForm(Model model, SRReviewVO srReviewVO , HttpSession session, HttpServletResponse response)throws Exception {
			
		srReviewVO.setS_num(((StoreVO)session.getAttribute("StoreVO")).getS_num());		
		SRReviewVO srReviewvo = storeReviewService.srReviewList(srReviewVO);
		
		model.addAttribute("srReviewvo", srReviewvo);
		
		return "sellerpage/store_reply_review";
	}
	
	@RequestMapping(value = "/replyReviewInsert.bo")
	public String replyReviewInsert(ReviewReplyVO reviewReplyVO , HttpSession session, HttpServletResponse response)throws Exception {

		reviewReplyVO.setU_id(((MemberVO)session.getAttribute("MemberVO")).getU_id());	
		
		int res = storeReviewService.replyReviewInsert(reviewReplyVO);
				
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();

		if (res != 0){

			writer.write("<script>alert('답변등록 성공!');"
					+ "location.href='./storereviewList.bo';</script>");
		}else{
			writer.write("<script>alert('답변등록 실패!');"
					+ "location.href='./storereviewList.bo';</script>");
		}
		return null;
	}
	
	@RequestMapping(value = "/replyReviewDelete.bo")
	public String replyReviewDelete(ReviewReplyVO reviewReplyVO , HttpSession session, HttpServletResponse response)throws Exception {

		int res = storeReviewService.replyReviewDelete(reviewReplyVO);
				
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();

		if (res != 0){

			writer.write("<script>alert('삭제 성공!');"
					+ "location.href='./storereviewList.bo';</script>");
		}else{
			writer.write("<script>alert('삭제 실패!');"
					+ "location.href='./storereviewList.bo';</script>");
		}
		return null;
	}
	
}
