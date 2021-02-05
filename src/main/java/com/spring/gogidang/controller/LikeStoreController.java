package com.spring.gogidang.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.gogidang.domain.*;
import com.spring.gogidang.service.LikeStoreService;
import com.spring.gogidang.service.StoreService;

/*
 * likeStroeList.li
 */

@Controller
public class LikeStoreController {
   
   @Autowired
   public LikeStoreService likeStoreService;
   
   @Autowired
   public StoreService storeService;
   
//   @RequestMapping("/addLikeStore.li")
//   public String addLikeStore(@RequestParam("s_num") int s_num, HttpSession session) {
//	   
//	   LikeStoreVO vo = new LikeStoreVO();
//	   vo.setS_num(s_num);
//	   vo.setU_id(((MemberVO) session.getAttribute("memberVO")).getU_id());
//	   
//	   likeStoreService.addLikeStore(vo);
//	   
//	   return "redirect:main.me";
//   }
   
   @RequestMapping("/addLikeStore.re")
   @ResponseBody
   public Map<String, Object> addLikeStore(@RequestParam("s_num") int s_num, HttpSession session) {
	   Map<String, Object> retVal = new HashMap<String, Object>();
	   
	   
	   try {
		   MemberVO mvo = (MemberVO) session.getAttribute("memberVO");
		   String u_id = mvo.getU_id();
		   LikeStoreVO likeStoreVO = new LikeStoreVO();
		   likeStoreVO.setU_id(u_id);
		   likeStoreVO.setS_num(s_num);
		   
		   System.out.println(likeStoreVO.getU_id());
		   System.out.println(likeStoreVO.getS_num());
		   
		   likeStoreService.addLikeStore(likeStoreVO);
		   retVal.put("res", "OK");
		} catch (Exception e) {
			retVal.put("res", "FAIL");
			retVal.put("message", "Failure");
		}
	   
	   return retVal;
   }
   
   @RequestMapping("/getListByUid")
   public String getListByUid(HttpSession session, Model model) {
	   
	   List<LikeStoreVO> vo = 
			   likeStoreService.getListByUid(((MemberVO) session.getAttribute("memberVO")).getU_id());
	   
	   model.addAttribute("likeStoreList", vo);
	   
	   return "mypage/member_likestore";
   }
   
   @RequestMapping("/likeStoreList.li")
   public String likeStoreList(@RequestParam("u_id") String u_id, Model model) {
	   ArrayList<LikeStoreVO> likeStoreList = new ArrayList<LikeStoreVO>();
	   likeStoreList = (ArrayList<LikeStoreVO>) likeStoreService.getListByUid(u_id);
	   
	   for (int i=0; i<likeStoreList.size(); i++) {
		   LikeStoreVO lsvo = likeStoreList.get(i);
		   int s_num = lsvo.getS_num();
		   StoreVO svo = storeService.storeInfo(s_num);
	   }
	   
	   model.addAttribute("likeStoreList", likeStoreList);
	   
	   return "mypage/member_likestore";
   }
   
}