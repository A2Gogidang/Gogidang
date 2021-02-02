package com.spring.gogidang.controller;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.gogidang.domain.NoticeVO;
import com.spring.gogidang.service.NoticeService;

/*
 * 
 */

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
	
	@RequestMapping("noticewriteform.no")
	public String noticeInsertForm()  {
		return "notice/notice_board_write";
	}
	
	@RequestMapping("/noticewrite.no")
	public String noticeInsert(NoticeVO notice, HttpSession session, HttpServletResponse response) throws Exception {
		notice.setU_id((String) session.getAttribute("memberVO"));
		int res = noticeService.noticeInsert(notice);
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		
		if(res == 1)
		{
			writer.write("<script>alert('작성 완료!!');location.href='./noticelist.no';</script>");
		}
		else
		{
			writer.write("<script>alert('작성 실패!!');location.href='./noticewriteform.no';</script>");
		}
		
		return null;
	}
	
	@RequestMapping("/noticedetail.no") 
	public String getDetail(@RequestParam(value="notice_num", required=true) int notice_num, Model model) {
		NoticeVO notice = noticeService.getDetail(notice_num); 
		
		model.addAttribute("notice", notice);
		
		return "notice/notice_board_view";
	}
	
	@RequestMapping("/noticemodifyform.no") 
	public String getModifyForm(@RequestParam(value="notice_num", required=true) int notice_num, Model model) {
		NoticeVO notice = noticeService.getDetail(notice_num);
		
		model.addAttribute("notice", notice);
		
		return "notice/notice_board_modify";
	}

	@RequestMapping("/noticemodify.no") 
	public String noticeModify(NoticeVO notice) throws Exception {
		int res = noticeService.noticeModify(notice);
		return "redirect:/noticedetail.no?notice_num=" + notice.getNotice_num();
	}
	
	@RequestMapping("/noticedelete.no") 
	public String noticeDelete(@RequestParam(value="notice_num", required=true) int notice_num, HttpSession session, HttpServletResponse response) throws Exception {
		String u_id = (String)session.getAttribute("u_id");
		
		HashMap<String, String> hashmap = new HashMap<String, String>();
		hashmap.put("notice_num", Integer.toString(notice_num));
		hashmap.put("u_id", u_id);
		int res =noticeService.noticeDelete(hashmap);
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		if (res == 1)
		{
			writer.write("<script>alert('삭제 성공!!');"
					+ "location.href='./noticelist.no';</script>");
		}
		else
		{
			writer.write("<script>alert('삭제 실패!!');"
					+ "location.href='./noticelist.no';</script>");
		}
		return null;
	}
	
	@RequestMapping("/noticereplyform.no") 
	public String noticeReplyForm(@RequestParam(value="notice_num", required=true) int notice_num, Model model) {
		NoticeVO notice = noticeService.getDetail(notice_num);
		
		model.addAttribute("notice", notice);
		
		return "notice/notice_board_reply";
	}
	
	@RequestMapping("/noticeAdmin.no")
	public String noticeAdmin() {
		
		return "admin/admin_notice";
	}
	

	
	
}
