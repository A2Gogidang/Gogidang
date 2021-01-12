package com.spring.gogidang.controller;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.gogidang.domain.*;
import com.spring.gogidang.service.StoreNoticeService;

@Controller
public class StoreNoticeController {

	
	@Autowired
	private StoreNoticeService storeNoiceService; 


	@RequestMapping(value = "/storeNoticeList.no")
	public String storeNoticeList(Model model , HttpSession session)throws Exception {
		//storeVO session말고 sql로 조회해서 가지고오기 다른곳도 전부 확인하기 
		SRNoticeVO srNoticeVO = new SRNoticeVO();		
		srNoticeVO.setS_num(((StoreVO)session.getAttribute("StoreVO")).getS_num());		
		ArrayList<SRNoticeVO> srNoticeList = storeNoiceService.srNoticeSelect(srNoticeVO);	

		model.addAttribute("srNoticeList", srNoticeList);

		return "sellerpage/store_notice";
	}

	@RequestMapping(value = "/replyNoticeInputForm.no")
	public String replyNoticeInputForm(Model model, SRNoticeVO srNoticeVO , HttpSession session, HttpServletResponse response)throws Exception {
			
		srNoticeVO.setS_num(((StoreVO)session.getAttribute("StoreVO")).getS_num());		
		SRNoticeVO srNoticevo = storeNoiceService.srNoticeList(srNoticeVO);
		
		model.addAttribute("srNoticevo", srNoticevo);
		
		return "sellerpage/store_reply_notice";
	}

	@RequestMapping(value = "/replyNoticeInsert.no")
	public String replyNoticeInsert(ReplyNoticeVO replyNoticeVO , HttpSession session, HttpServletResponse response)throws Exception {

		replyNoticeVO.setU_id(((MemberVO)session.getAttribute("MemberVO")).getU_id());	
		
		int res = storeNoiceService.replyNoticeInsert(replyNoticeVO);
				
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();

		if (res != 0){

			writer.write("<script>alert('답변등록 성공!');"
					+ "location.href='./storeNoticeList.no';</script>");
		}else{
			writer.write("<script>alert('답변등록 실패!');"
					+ "location.href='./storeNoticeList.no';</script>");
		}
		return null;
	}


	//답글 말고 원글 삭제하는 경우 답글도 삭제 되게 해야됨 
	@RequestMapping(value = "/replyNoticeDelete.no")
	public String replyNoticeDelete(ReplyNoticeVO replyNoticeVO , HttpSession session, HttpServletResponse response)throws Exception {

		int res = storeNoiceService.replyNoticeDelete(replyNoticeVO);

		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();

		if (res != 0){

			writer.write("<script>alert('삭제 성공!');"
					+ "location.href='./storeNoticeList.no';</script>");
		}else{
			writer.write("<script>alert('삭제 실패!');"
					+ "location.href='./storeNoticeList.no';</script>");
		}
		return null;
	}
	
	
}
