package com.spring.gogidang.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.gogidang.domain.Criteria;
import com.spring.gogidang.domain.EventVO;
import com.spring.gogidang.domain.MemberVO;
import com.spring.gogidang.domain.PageDTO;
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
   public String mainPage(Model model, HttpSession seesion) throws Exception { 

      model.addAttribute("eventList", eventService.eventList());
      model.addAttribute("storeList", storeService.getList());
      model.addAttribute("reviewList", reviewService.getList());
      
      //return "main";
      return "index";
   }
   
   @RequestMapping("/logout.me")
   public String logout(HttpSession session) {
       session.invalidate();
       
       return "redirect:/main.me";
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
         
         session.setAttribute("memberVO",vo);
         
         if(vo.getSeller_key() == 1 ) {
            
            StoreVO storevo = new StoreVO();
            storevo.setU_id(vo.getU_id());
            StoreVO vo1 = storeService.selectStore(storevo);
            session.setAttribute("StoreVO", vo1);
         }
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

         writer.write("<script>alert('회원가입되었습니다!!'); location.href='./loginForm.me';</script>");
      }
      else {
         writer.write("<script>alert('회원가입에 실패하였습니다!!'); location.href='./joinForm.me';</script>");
      }
      return null;
   }
   
   @RequestMapping("/updateProcess.me")
   public String memberUpdate(MemberVO memberVO, HttpSession session , HttpServletResponse response) throws Exception {
      
      memberVO.setU_id(((MemberVO)session.getAttribute("memberVO")).getU_id());
  
      int res = memberService.updateMember(memberVO);
  
      response.setCharacterEncoding("utf-8");
      response.setContentType("text/html; charset=utf-8");
      PrintWriter writer = response.getWriter();
  

		if(res != 0) {
			MemberVO vo = memberService.selectMember(memberVO);
			session.setAttribute("MemberVO",vo);
			writer.write("<script>alert('수정완료!!');" +"location.href = './updateList.me';</script>");

     
      }else {


			writer.write("<script>alert('수정실패!!');" +"location.href = './updateList.me';</script>");
		}
		return null;
   }

   
   //soobin start
  
   @RequestMapping("/updateForm.me")
   public String updateForm(MemberVO memberVO) throws Exception{
      
      return "member/updateForm";
   }
   
   @RequestMapping("/updateList.me")
   public String updateList(HttpServletRequest request) throws Exception{
      HttpSession session = request.getSession();
      System.out.println(session.getAttribute("StoreVO"));
      return "member/updateList";
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
      }else{   //사용 가능한 계정
         str = "YES";   
      }
      System.out.println(str);
      return str;
   }
   
   // 인증메일 전송 및 인증키 session 저장
   @RequestMapping(value="/checkemail.li", produces="application/text; charset=utf8")
   @ResponseBody
   public String SendMail(String u_email, HttpSession session){
      
      // 결과값 메세지
      String res = "메일 발송에 실패하였습니다";
      
      Random random = new Random();
      String authkey = "";
      
      for( int i=0; i < 3; i++ ) {
         int index = random.nextInt(25)+65;
         
         authkey +=(char)index;
      }
      
      int numIndex = random.nextInt(8999)+1000;
      authkey += numIndex;
      
      // 세션에 key 값 저장
      System.out.println(authkey);
      session.setAttribute("authkey", authkey);
      
      // 메서드 안에 try catch 로 묶여있긴 하지만
      // method return 타입이 void 여서 성공 여부를 위해
      // try catch 로 한번더 묶고
      // Exception 발생 안할시에 res 결과메세지 성공으로 바꿈
      try {
         
         // 인증메일 발송
         sendAuthMail(u_email, authkey);
         
         // 결과값 메세지 성공으로 변경
         res = "인증 메일 발송에 성공하였습니다";
         
      } catch (Exception e) {
         // 메일 전송 도중 오류 방생했을때 진입
         System.err.println("메일 전송 오류");
      }
      
      // 결과 메세지 return
      return res;
   }
   
   // 메일 인증 확인 method
   @RequestMapping(value="/checkAuthKey.li", produces="application/text; charset=utf8")
   @ResponseBody
   public String checkAuthKey( String key, HttpSession session ) {
      
      // 00 = 실패 코드
      String res = "00";
      
      // 세션에 저장된 인증키 값 가져오기
      String authKey = (String) session.getAttribute("authkey");
      
      // 사용자가 입력한 키값과 session 에 저장된 인증키값이 일치하는지 비교
      if( authKey.equals(key) ) {
         // 01 = 성공 코드
         res = "01";
         System.out.println("메일 인증 성공");
      } else {
         System.err.println("메일 인증 실패");
      }
      
      // 코드값 return
      return res;
   }
   
   // 메일 전송 method
   public static void sendAuthMail( String email, String key ) {
      
      Properties prop = new Properties();

      prop.put("mail.smtp.host", "smtp.daum.net");
      prop.put("mail.smtp.port", "465");
      prop.put("mail.smtp.auth", "true");
      prop.put("mail.smtp.ssl.enable", "true");
      prop.put("mail.smtp.ssl.trust", "smtp.daum.net");

      Session session = Session.getDefaultInstance(prop, new javax.mail.Authenticator() {
         protected PasswordAuthentication getPasswordAuthentication() {
            return new PasswordAuthentication("kalgusals@daum.net", "tmd369!!!");
         }
      });
      
      try {
         
         MimeMessage message = new MimeMessage(session);
           
           message.setFrom(new InternetAddress("kalgusals@daum.net"));
           message.setSubject("고기당 회원 가입 이메일 인증번호");
           message.setContent(key, "text/html;charset=UTF-8");
           
           message.setRecipient(Message.RecipientType.TO, new InternetAddress(email));
           
           Transport.send(message);
           
      } catch (Exception e) {
         System.err.println("error : 이메일 발송 오류");
      }
      
   }
	@RequestMapping("/adminmypage.me")
	public String adminmypage(Model model) {
		return "admin/admin_mypage"; 
	}
	
	@RequestMapping("/admin_notice_insert.me")
	public String admin_notice_insert(Model model) {
		return "admin/admin_notice_insert"; 
		
	}
	
	/*
	//soobin start
	@RequestMapping(value="/kakaologin.me", produces="application/text; charset=utf8")
	@ResponseBody
	public void kakaologin(String kakaoinfo, HttpSession session){
	
		System.out.println(kakaoinfo);
	}
	//soobin end
	*/
	

	// 인증메일 전송 및 인증키 session 저장
//	@RequestMapping(value="/checkemail.bo", produces="application/text; charset=utf8")
//	@ResponseBody
//	public String SendMail(String u_email, HttpSession session){
//		
//		// 결과값 메세지
//		String res = "메일 발송에 실패하였습니다";
//		
//		Random random = new Random();
//		String authkey = "";
//		
//		for( int i=0; i < 3; i++ ) {
//			int index = random.nextInt(25)+65;
//			
//			authkey +=(char)index;
//		}
//		
//		int numIndex = random.nextInt(8999)+1000;
//		authkey += numIndex;
//		
//		// 세션에 key 값 저장
//		session.setAttribute("authkey", authkey);
//  }

	@RequestMapping("/admin_event_insert.me")
	public String admin_event_insert(Model model) {
		return "admin/admin_event_insert"; 
		
	}
	
	@RequestMapping("/admin_confirm_list.me")
	public String admin_confirm_list(Criteria cri, Model model) {
		model.addAttribute("list", storeService.getWaitList());
		
		int total = storeService.getTotal(cri);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		
		return "admin/admin_confirm_list"; 
		
	}
	
	@RequestMapping("/admin_confirm_ch.me")
	public String admin_confirm_ch(@RequestParam("s_num") int s_num, Model model) {
		model.addAttribute("storeVO", storeService.storeInfo(s_num));
		
		return "admin/admin_confirm_ch"; 
	}
	
	@RequestMapping("/new_mypage.me")
	public String new_mypage() {
		
		return "mypage/new_mypage"; 
	}
   
}
