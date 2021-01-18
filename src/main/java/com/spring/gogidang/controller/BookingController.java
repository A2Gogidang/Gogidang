package com.spring.gogidang.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.gogidang.domain.BookingVO;
import com.spring.gogidang.domain.MemberVO;
import com.spring.gogidang.service.BookingService;

/*
 *	bookingForm.bo
 *	booking.bo
 *	bookingList.bo
 *	bookingCancle.bo
 */

@Controller
public class BookingController {
   
   @Autowired
   public BookingService bookingService;
   
   @RequestMapping("/bookingForm.bo")
   public String bookingForm() throws Exception{
      
      return "mypage/member_booking_form";
   }
   
   @RequestMapping("/bookingList.bo")
   public String getBookinglist(MemberVO memberVO, Model model, HttpSession session)throws Exception{
	   String u_id = memberVO.getU_id();
	   ArrayList<BookingVO> booking_list = bookingService.getBookingList(u_id);
	   model.addAttribute("booking_list",booking_list);
	   
////		프로젝트 기능중 예약하기나 글작성 같이 로그인해야지만 할수 있는 기능은 session 에 로그인 정보가 있는지 판별하여 없으면 로그인 폼으로 return 시킴
//		MemberVO vo = (MemberVO) session.getAttribute("MemberVO");
//		
//		if( vo == null ) {
//			System.out.println("들어옴!!!!!");
//			return "member/loginForm";
//		}
				
      
	   return "mypage/member_booking";
   }
   
   @RequestMapping("/booking.bo")
   public String insertBooking(BookingVO bookingVO, HttpServletResponse response) throws Exception{
      int res = bookingService.insertBooking(bookingVO);
      
      response.setCharacterEncoding("utf-8");
      response.setContentType("text/html; charset=utf-8");
      PrintWriter writer = response.getWriter();
      
      if(res != 0)
      {
            writer.write("<script>alert('�삁�빟�씠�셿猷뚮릺�뿀�뒿�땲�떎');"
         +"location.href='./shoplist.sh';</script>");
      }
      else
      {
            writer.write("<script>alert('�삁�빟�뿉 �떎�뙣�븯���뒿�땲�떎.');"
         +"location.href='./shoplist.sh';</script>");
      }
      return null;
   }

   @RequestMapping("/bookingCancel.bo")
   public String cancelBooking(@RequestParam(value="booking_num", required=true)int num,HttpSession session,HttpServletResponse response)throws Exception{
      String id = (String)session.getAttribute("id");
      
      HashMap<String,String> hashmap = new HashMap<String,String>();
      hashmap.put("booking_num", Integer.toString(num));
      hashmap.put("u_id", id);
      int res= bookingService.cancelBooking(hashmap);
      response.setCharacterEncoding("utf-8");
      response.setContentType("text/html; charset=utf-8");
      PrintWriter writer = response.getWriter();
      if(res==1)
      {
         writer.write("<script>alert('�삁�빟�씠 痍⑥냼�릺�뿀�뒿�땲�떎.');"
               +"location.href='./main.me';</script>");
      }
      else
      {
         writer.write("<script>alert('�떎�뙣�븯�뀲�뒿�땲�떎.');"
               +"location.href='./bookingList.bo';</script>");
      }
      return null;
   }
}   

