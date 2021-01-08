package com.spring.gogidang.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.gogidang.domain.*;
import com.spring.gogidang.service.LikeStoreService;

/*
 * likeStroeList.li
 */

@Controller
public class LikeStoreController {
   
   @Autowired
   public LikeStoreService likeStoreService;
   
   @RequestMapping("/likeStoreList.li")
   public String getLikeStore(MemberVO memberVO,Model model)throws Exception{
      String id = memberVO.getU_id();
      ArrayList<LikeStoreVO>likestore_list = likeStoreService.getLikeStore(id);
      model.addAttribute("likestore_list",likestore_list);
      
      return "mypage/member_likestore";
   }
}