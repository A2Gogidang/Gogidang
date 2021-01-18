package com.spring.gogidang.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.converter.json.GsonFactoryBean;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.gogidang.domain.Criteria;
import com.spring.gogidang.domain.EventVO;
import com.spring.gogidang.domain.MemberVO;
import com.spring.gogidang.domain.ReviewVO;
import com.spring.gogidang.domain.StoreVO;
import com.spring.gogidang.service.EventService;
import com.spring.gogidang.service.MemberService;
import com.spring.gogidang.service.ReviewService;
import com.spring.gogidang.service.StoreService;

/*
 * main.me
 * 
 * loginForm.me
 * joinForm.me
 * updateForm.me
 * memberInfo.me
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
	public String mainPage(Criteria cri, Model model, HttpSession seesion) throws Exception { 
		ArrayList<EventVO> event_list = eventService.getEventList();
		ArrayList<StoreVO> store_list = storeService.getStoreList();
		List<ReviewVO> review_list = reviewService.getList(cri);
		model.addAttribute("event_list", event_list);
		model.addAttribute("store_list", store_list);
		model.addAttribute("review_list", review_list);
		
		return "main";
	}
	
	@RequestMapping("/loginForm.me") 
	public String loginForm() throws Exception {
		
		return "member/loginForm";
	}

	@RequestMapping("/joinForm.me") 
	public String joinForm() throws Exception { 
		
		return "member/joinForm";
	}
	
	
	@RequestMapping("/login.me") 
	public String userCheck(MemberVO memberVO, HttpSession session, HttpServletResponse response) throws Exception { 
		
		MemberVO vo = memberService.selectMember(memberVO);
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		
		if ( vo != null && vo.getU_id() != null ) {
			session.setAttribute("MemberVO",vo);
			writer.write("<script>alert('濡쒓렇�씤 �꽦怨�!');location.href='./main.me';</script>");
		}else {
			writer.write("<script>alert('濡쒓렇�씤 �떎�뙣!');location.href='./loginForm.me';</script>");
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

			writer.write("<script>alert('회원가입되었습니다!!'); location.href='./loginForm.me';</script>");
		}
		else {
			writer.write("<script>alert('회원가입에 실패하였습니다!!'); location.href='./joinForm.me';</script>");
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
			writer.write("<script>alert('로그인되었습니다!!!');" +"location.href = './main.me';</script>");
     
		}else {

			writer.write("<script>alert('로그인에 실패하였습니다.!!!');" +"location.href = './main.me';</script>");
		}
		return null;
   }
	
	//soobin start
	@RequestMapping("/updateForm.me")
	public String updateForm(MemberVO memberVO) throws Exception{
		
		return "member/updateForm";
	}
	//soobin end
	
	@RequestMapping(value = "/checkid.bo", method = RequestMethod.POST)
	@ResponseBody
	public  String idcheck(@RequestParam("u_id") String u_id) throws Exception{
		System.out.println("u_id=" + u_id);
		String str = "";
		int idcheck = memberService.checkid(u_id);
		if(idcheck==1){ //이미 존재하는 계정
			str = "NO";	
		}else{	//사용 가능한 계정
			str = "YES";	
		}
		System.out.println(str);
		return str;
	}

}



