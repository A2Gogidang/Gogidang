package com.spring.gogidang.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.gogidang.domain.EventVO;
import com.spring.gogidang.service.EventService;

/*
 * eventPage.ev
 * eventInfo.ev
 */

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
  
    @RequestMapping("/eventDetail.ev") 
    public String eventDetail(EventVO eventVO, Model model) throws Exception { 

      return "event/eventDetail";



    }
	
	@RequestMapping("/eventRegister.ev")
	public String eventRegister(EventVO eventVO) {
		eventService.register(eventVO);
		
		return "redirect:eventList.ev";
	}
	
	@RequestMapping("/qna.ev") 
	public String qna(EventVO eventVO, Model model) throws Exception { 
		
		return "event/qna";
		
	}
	
	@RequestMapping("/qnainsert.ev") 
	public String qnainsert(EventVO eventVO, Model model) throws Exception { 
		
		return "event/qnainsert";
		
	}
	
	@RequestMapping("/notice.ev") 
	public String notice(EventVO eventVO, Model model) throws Exception { 
		
		return "event/notice";
	}
}
