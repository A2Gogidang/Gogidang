package com.spring.gogidang.controller;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.gogidang.domain.*;
import com.spring.gogidang.service.*;


@Controller
public class NoticeController {
	
	@Autowired
	private NoticeService noticeService;
	
	@RequestMapping("/noticelist.no")
	public String getnoticelist(Model model, @RequestParam(value="page", required=false, defaultValue="1") int page) { 
		int limit=10;
		int listcount = noticeService.getListCount();
		
		int startrow = (page-1)*10+1;
		int endrow = startrow+limit-1;
		HashMap<String, Integer> hashmap = new HashMap<String, Integer>();
		hashmap.put("startrow", startrow);
		hashmap.put("endrow", endrow);
		List<NoticeVO> noticelist = noticeService.getNoticeList(hashmap);
		
		
		// 총 페이지 수
   		int maxpage=(int)((double)listcount/limit+0.95); // 0.95을 더해서 올림 처리
   		// 현재 페이지에 보여줄 시작 페이지 수 (1, 11, 21 ...)
   		int startpage = (((int) ((double)page / 10 + 0.9)) - 1) * 10 + 1;
   		// 현재 페이지에 보여줄 마지막 페이지 수 (10, 20, 30 ...)
   		int endpage = maxpage;
   		
   		if (endpage>startpage+10-1) endpage=startpage+10-1;
   		
		model.addAttribute("page", page);
		model.addAttribute("listcount", listcount);
		model.addAttribute("noticelist", noticelist);
		model.addAttribute("maxpage", maxpage);
		model.addAttribute("startpage", startpage);
		model.addAttribute("endpage", endpage);
		
		return "notice/notice_board_list";
	}
	
	@RequestMapping("/noticedetail.no") 
	public String getDetail(@RequestParam(value="notice_num", required=true) int notice_num, Model model) {
		NoticeVO notice = noticeService.getDetail(notice_num); 
		
		model.addAttribute("notice", notice);
		
		return "notice/notice_board_view";
	}

	@RequestMapping("/noticeAdmin.no")
	public String noticeAdmin() {
		
		return "admin/admin_notice";
	}
	
	// notice ajax list - admin (list)
	@RequestMapping(value = "/noticeListAjax.re", produces="application/json; charset=UTF-8")
	@ResponseBody
	public List<NoticeVO> noticeListAjax() {
		List<NoticeVO> noticeList = noticeService.getList();
		System.out.println("list size = " + noticeList.size());
		
		return noticeList;
	}
	
	// notice ajax insert - admin (reg)
	@RequestMapping("/noticewriteAjax.re")
	@ResponseBody
	public String noticeInsert(NoticeVO notice, HttpSession session) throws Exception {
		MemberVO mvo = (MemberVO) session.getAttribute("memberVO");
		notice.setU_id(mvo.getU_id());
		System.out.println("u_id = " + notice.getU_id());
		System.out.println("title = " + notice.getTitle());
		System.out.println("content = " + notice.getContent());
		
		int res = noticeService.noticeInsert(notice);
		
		if (res == 1) {
			return "OK";
		} else {
			return "NO";
		}
	}
	
	// notice ajax info - admin (get)
	@RequestMapping(value = "/noticeInfoAjax.re", produces="application/json; charset=UTF-8")
	@ResponseBody
	public Map<String, Object> noticeInfoAjax(@RequestParam("notice_num") int notice_num) {
		Map<String, Object> retVal = new HashMap<String, Object>();
		
		try {
			NoticeVO nvo = noticeService.getDetail(notice_num);
			System.out.println("controller = " + nvo.getNotice_num());
			retVal.put("notice_num", nvo.getNotice_num());
			retVal.put("u_id", nvo.getU_id());
			retVal.put("title", nvo.getTitle());
			retVal.put("content", nvo.getContent());
			retVal.put("res", "OK");
		} catch (Exception e) {
			retVal.put("res", "FAIL");
			retVal.put("message", "Failure");
		}
		
		return retVal;
	}

	@RequestMapping("/storeNoticeList.no")
	public String storeNoticeList() {
		
		return "sellerpage/store_notice";
	}
	
	@RequestMapping("/noticeDelete.re")
	@ResponseBody
	public String noticeDelete(@RequestParam("notice_num") int notice_num) {
		
		int res = noticeService.noticeDelete(notice_num);

		if (res == 1) {
			return "OK";
		} else {
			return "NO";
		}		
	}
	
}
