package com.spring.gogidang.controller;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.gogidang.domain.CartVO;
import com.spring.gogidang.domain.MemberVO;
import com.spring.gogidang.service.CartService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
@RequestMapping("/cart/*")
public class CartController {
	
	@Autowired
	CartService service;
	
	@ResponseBody
	@RequestMapping(value ="/addCart.ct", method = RequestMethod.POST)
	public void addCart(CartVO cart, HttpSession session) throws Exception {
		MemberVO member = (MemberVO)session.getAttribute("member");
		cart.setU_id(member.getU_id());
		System.out.println("member"+member);
		service.addCart(cart);
		
	}
	
}
