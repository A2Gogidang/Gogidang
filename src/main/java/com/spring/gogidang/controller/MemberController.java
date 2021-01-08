package com.spring.gogidang.controller;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.gogidang.domain.*;
import com.spring.gogidang.service.*;

/*
 * main.me
 * 
 * loginForm.me
 * joinForm.me
 * updateForm.me
 * 
 * login.me
 * joinProcess.me
 * updateProcess.me
 */

@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private EventService eventService;
	
	@Autowired
	private StoreService storeService;
	
	@Autowired
	private ReviewService reviewService;

	@RequestMapping("/main.me") 
	public String mainPage(Model model) throws Exception { 
		ArrayList<EventVO> event_list = eventService.getEventList();
		ArrayList<StoreVO> store_list = storeService.getStoreList();
		ArrayList<ReviewVO> review_list = reviewService.getReviewList();
		model.addAttribute("event_list", event_list);
		model.addAttribute("store_list", store_list);
		model.addAttribute("review_list", review_list);
		
		return "member/main";
	}
	
	@RequestMapping("/loginForm.me") 
	public String loginForm() throws Exception {
		
		return "member/loginForm";
	}

	@RequestMapping("/joinForm.me") 
	public String joinForm() throws Exception { 
		
		return "member/joinForm";
	}
	
	@RequestMapping("/updateForm.me")
	public ModelAndView updateForm(MemberVO memberVO) throws Exception{
		MemberVO result = memberService.selectMember(memberVO);
	
		ModelAndView mov= new ModelAndView();
		mov.addObject("result", result);
		mov.setViewName("mypage/updateForm");
		
		return mov;
	}
	
	@RequestMapping("/login.me") 
	public String userCheck(MemberVO memberVO, HttpSession session, HttpServletResponse response) throws Exception { 
		
		MemberVO vo = memberService.selectMember(memberVO);
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		
		if ( vo != null && vo.getU_id() != null ) {
			
			session.setAttribute("MemberVO",vo);
			writer.write("<script>alert('로그인 성공!');location.href='./main.me';</script>");
		}else {
			writer.write("<script>alert('로그인 실패!');location.href='./loginForm.me';</script>");
		}
		return null;
	}
	
	@RequestMapping("/joinProcess.me") 
	public String insertMember(MemberVO memberVO, HttpServletResponse response) throws Exception { 
		int res = memberService.insertMember(memberVO);
    
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
    
		if (res==1) {

			writer.write("<script>alert('회원가입 성공!!'); location.href='./loginForm.me';</script>");
		}
		else {
			writer.write("<script>alert('회원가입 실패!!'); location.href='./joinForm.me';</script>");
		}
		return null;
	}
	
	@RequestMapping("/updateProcess.me")
	public String memberUpdate(MemberVO memberVO, HttpSession session , HttpServletResponse response) throws Exception {
      
		memberVO.setU_id(((MemberVO)session.getAttribute("MemberVO")).getU_id());
  
		int res = memberService.updateMember(memberVO);
  
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
  
		if(res != 0) {
			MemberVO vo = memberService.selectMember(memberVO);
			session.setAttribute("MemberVO",vo);
			writer.write("<script>alert('수정 성공!!!');" +"location.href = './main.me';</script>");
     
		}else {

			writer.write("<script>alert('수정 실패!!!');" +"location.href = './main.me';</script>");
		}
		return null;
   }
}



