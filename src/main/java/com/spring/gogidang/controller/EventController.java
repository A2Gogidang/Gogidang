package com.spring.gogidang.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
	
	@RequestMapping("/eventPage.ev") 
	public String eventPage(Model model) throws Exception { 
		ArrayList<EventVO> event_list = eventService.getEventList();
		model.addAttribute("event_list", event_list);
		return "event/eventpage";
	}
	
	@RequestMapping("/eventInfo.ev") 
	public String selectEvent(EventVO eventVO, Model model) throws Exception { 
		EventVO vo = eventService.selectEvent(eventVO);
		model.addAttribute("eventVO",vo);
		return "event/eventpage_info";
	}
	
	@RequestMapping("/event.ev") 
	public String event(EventVO eventVO, Model model) throws Exception { 
		
		return "event/event";
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
