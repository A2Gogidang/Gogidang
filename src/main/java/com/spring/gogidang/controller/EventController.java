package com.spring.gogidang.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.gogidang.domain.*;
import com.spring.gogidang.service.*;

@Controller
public class EventController {
	
	@Autowired
	private EventService eventService;
	
	@RequestMapping("/eventList.ev")
	public String eventList(Model model) {
		ArrayList<EventVO> event_list = eventService.eventList();
		model.addAttribute("event_list", event_list);
		
		return "event/event";
	}
	
	@RequestMapping("/eventGet.ev")
	public String eventGet(@RequestParam("event_num") int event_num, Model model) {
		model.addAttribute("eventVO", eventService.getByNum(event_num));
		
		return "event/eventpage_info";
	}
	
	@RequestMapping("/eventModify.ev")
	public String eventModify(@RequestParam("event_num") int event_num) {
		eventService.modifyByNum(event_num);
		
		return "redirect:eventList.ev";
	}
	
	@RequestMapping("/eventDelete.ev")
	public String eventDelete(@RequestParam("event_num") int event_num) {
		eventService.deleteByNum(event_num);
		
		return "redirect:eventList.ev";
	}
  
	@RequestMapping("/eventAdmin.ev")
	public String eventAdmin() {
		
		return "admin/admin_event";
	}
	
	@RequestMapping("/eventwriteAjax.re")
	public int eventInsert(EventVO eventVO) throws Exception {
		System.out.println("content = " + eventVO.getContent());
		
		int res = eventService.register(eventVO);
		System.out.println(res);
		return res;
	}
	
	@RequestMapping(value = "/eventListAjax.re", produces="application/json; charset=UTF-8")
	@ResponseBody
	public List<EventVO> eventListAjax() {
		List<EventVO> eventList = eventService.getList();
		System.out.println("list size = " + eventList.size());
		
		return eventList;
	}
	
}
