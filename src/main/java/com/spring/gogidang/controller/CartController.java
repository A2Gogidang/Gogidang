package com.spring.gogidang.controller;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.gogidang.domain.CartVO;
import com.spring.gogidang.domain.MemberVO;
import com.spring.gogidang.service.CartService;

@Controller
public class CartController {


   @Autowired
   private CartService cartService;

   @RequestMapping("/addCart.ct")
   public String addCart(CartVO cartVO, HttpSession session, HttpServletResponse response) throws Exception {
      
      int res = 0;
      response.setCharacterEncoding("utf-8");
      response.setContentType("text/html; charset=utf-8");
      PrintWriter writer = response.getWriter();
      
      
      //소비자인지 판매자인지도 구별해야됨
      if(((MemberVO)session.getAttribute("memberVO")) != null) {
    	 
    	 cartVO.setU_id((((MemberVO)session.getAttribute("memberVO")).getU_id()));
         res = cartService.addCart(cartVO);

      }else {
         writer.write("<script>alert('로그인을 해주세요!!'); location.href='./loginForm.me';</script>");
      }

      if (res == 1) {
         
         //session.setAttribute("CartVO", cartVO); session에 조회 기능 만들어서 담아 놓고 가지고 다니기
         writer.write("<script>alert('장바구니 추가 성공!!'); location.href='./cartList.ct';</script>");
			/* return "store/shop-details"; */
      }
      else {
         writer.write("<script>alert('장바구니 추가 실패!!'); location.href='./storeInfo.st';</script>");
      }
      return null;

   }
   
   @RequestMapping("/cartList.ct")
   public String cartList(CartVO cartVO,HttpSession session, HttpServletResponse response) throws Exception {
      
      response.setCharacterEncoding("utf-8");
      response.setContentType("text/html; charset=utf-8");
      PrintWriter writer = response.getWriter();
     
      
      if(((MemberVO)session.getAttribute("memberVO")) == null) {
    	  
    	  writer.write("<script>alert('로그인을 해주세요.'); location.href='./loginForm.me';</script>");
    	  
      }else {
    	  
    	  cartVO.setU_id((((MemberVO)session.getAttribute("memberVO")).getU_id()));   
    	  
    	  ArrayList<CartVO> cart_list = null;
    	  
    	  cart_list = cartService.cartList(cartVO);
    	  
    	  if(cart_list.isEmpty() || cart_list.get(0).getMenu_name() == null) {
    		  //이전페이지로 되돌아가는 메소드 찾아서 넣기 
    		  writer.write("<script>alert('장바구니가 비어있습니다.'); location.href='./storeList.st';</script>");
    		  
    	  }else {
    		  
    		  session.setAttribute("cart_list", cart_list);
    		  return "mypage/cartList";
    		  
    	  }
      }

      return null;      
   }
   
	/*
	 * //장바구니 테스트용 페이지, 추후 삭제해야합니다
	 * 
	 * @RequestMapping("/cartTest.ct") public String cartForm() throws Exception {
	 * 
	 * return "mypage/cart"; } //장바구니 테스트용 페이지, 끝
	 */   
   
   @RequestMapping("/cartdelete.ct")
   public String cartDelete(CartVO cartVO, HttpServletResponse response) throws Exception {
      
      response.setCharacterEncoding("utf-8");
      response.setContentType("text/html; charset=utf-8");
      PrintWriter writer = response.getWriter();
      
      int res = cartService.cartDelete(cartVO);
      
      if( res == 1 ) {
         
         writer.write("<script>alert('삭제 성공!!'); location.href='./cartList.ct';</script>");

      }else {
         
         writer.write("<script>alert('삭제 실패!!'); location.href='./cartList.ct';</script>");
      
      }
      return null;
      
   }
   

}