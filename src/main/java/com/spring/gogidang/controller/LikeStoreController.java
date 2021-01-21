package com.spring.gogidang.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.gogidang.domain.*;
import com.spring.gogidang.service.LikeStoreService;

/*
 * likeStroeList.li
 */

@Controller
public class LikeStoreController {
   
   @Autowired
   public LikeStoreService likeStoreService;
   
   @RequestMapping("/addLikeStore.li")
   public String addLikeStore(@RequestParam("s_num") int s_num, HttpSession session) {
	   
	   LikeStoreVO vo = new LikeStoreVO();
	   vo.setS_num(s_num);
	   vo.setU_id(((MemberVO) session.getAttribute("memberVO")).getU_id());
	   
	   likeStoreService.addLikeStore(vo);
	   
	   return "redirect:main.me";
   }
   
   @RequestMapping("/getListByUid")
   public String getListByUid(HttpSession session, Model model) {
	   
	   List<LikeStoreVO> vo = 
			   likeStoreService.getListByUid(((MemberVO) session.getAttribute("memberVO")).getU_id());
	   
	   model.addAttribute("likeStoreList", vo);
	   
	   return "mypage/member_likestore";
   }

   
}