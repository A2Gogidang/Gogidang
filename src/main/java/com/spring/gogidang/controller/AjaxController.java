package com.spring.gogidang.controller;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.gogidang.domain.*;
import com.spring.gogidang.service.*;

@Controller
public class AjaxController {
	
	@Autowired
	private ReviewService reviewService;
	
	@Autowired
	private StoreService storeService;
	
	@Autowired
	private QnaService qnaService;
	
	@Autowired
	private NoticeService noticeService;
	
	@Autowired
	private EventService eventService;
	
	// review ajax part start
	// reveiw ajax list - seller part
	@RequestMapping(value = "/reviewListAjax.re", produces="application/json; charset=UTF-8")
	@ResponseBody
	public List<ReviewVO> reviewListAjax() {
		
		List<ReviewVO> reviewList = reviewService.getList();
		return reviewList;
	}
	
	// review info ajax - modal
	@RequestMapping(value = "/reviewInfoAjax.re", method =RequestMethod.POST, produces="application/json; charset=UTF-8")
	@ResponseBody
	public Map<String, Object> reviewInfoAjax(@RequestParam("review_num") int review_num) {
		Map<String, Object> retVal = new HashMap<String, Object>();
		
		try {
			ReviewVO rvo = reviewService.getReview(review_num);
			retVal.put("review_num", rvo.getReview_num());
			retVal.put("u_id", rvo.getU_id());
			retVal.put("nickname", rvo.getNickname());
			retVal.put("title", rvo.getTitle());
			retVal.put("content", rvo.getContent());
			retVal.put("star", rvo.getStar());
			retVal.put("res", "OK");
		} catch (Exception e) {
			retVal.put("res", "FAIL");
			retVal.put("message", "Failure");
		}
	
		return retVal;
	}
	
	// review list ajax - all list
	@RequestMapping(value="/reviewlist_ajax.re", produces="application/json; charset=utf-8")
	@ResponseBody 
	public List<ReviewVO> getReviewListAjax( @RequestBody Map<String, String[]> map) {
		
		String[] s_addr = map.get("s_addr");
		for(String no : s_addr) {
			System.out.println("review 컨트롤러 addr : " + no);
		}
		  
		String[] meat = map.get("meat");
		for(String no : meat) {
			System.out.println("review 컨트롤러 meat : " + no);
		}
		
		String[] star = map.get("star");
		System.out.println(star[0]);
		int starInt = Integer.parseInt(star[0]);
		
		Map<String, String[]> mapp = new HashMap<String, String[]>();
		
		if(s_addr.length > 0 && meat.length > 0) {
			mapp.put("s_addr",s_addr);
			mapp.put("meat", meat);
			
			List<ReviewVO> list = reviewService.getReviewListAjax(mapp);
			
			System.out.println("리스트 size : " + list.size());
			
			for (int i=0; i<list.size(); i++) {
				ReviewVO rvo = list.get(i);
				int getStar = rvo.getStar();
				System.out.println(getStar);
				
				if (getStar < starInt) {
					list.remove(i);
				}
			}
			
			return list;
			
		} else if(s_addr.length == 0 && meat.length>0) {
			mapp.put("meat", meat);		
			List<ReviewVO> list = reviewService.getReviewListAjax(mapp);
			
			for (int i=0; i<list.size(); i++) {
				ReviewVO rvo = list.get(i);
				int getStar = rvo.getStar();
				System.out.println(getStar);
				
				if (getStar < starInt) {
					list.remove(i);
				}
			}
			
			return list;
		} else if (s_addr.length > 0 && meat.length==0) {
			mapp.put("s_addr",s_addr);
			List<ReviewVO> list = reviewService.getReviewListAjax(mapp);
			
			for (int i=0; i<list.size(); i++) {
				ReviewVO rvo = list.get(i);
				int getStar = rvo.getStar();
				System.out.println(getStar);
				
				if (getStar < starInt) {
					list.remove(i);
				}
			}
			
			return list;
		} else {
			
			return null;
		}
	  }
	// review ajax part end

	// store ajax part start
	// store info ajax - modal
	@RequestMapping(value = "/storeWaitInfo.re", method=RequestMethod.POST, produces="application/json; charset=UTF-8")
	@ResponseBody
	public Map<String, Object> storeWaitInfo(@RequestParam("s_num") int s_num) {
		Map<String, Object> retVal = new HashMap<String, Object>();
		
		try {
			StoreVO svo = storeService.storeInfo(s_num);
			retVal.put("svo", svo);
			retVal.put("s_num", svo.getS_num());
			retVal.put("u_id", svo.getU_id());
			retVal.put("thumbnail", svo.getThumbnail());
			retVal.put("s_name", svo.getS_name());
			retVal.put("s_addr", svo.getS_addr());
			retVal.put("s_phone", svo.getS_phone());
			retVal.put("s_img", svo.getS_img());
			retVal.put("s_hour", svo.getS_hour());
			retVal.put("res", "OK");
		} catch (Exception e) {
			retVal.put("res", "FAIL");
			retVal.put("message", "Failure");
		}
		
		return retVal;
	}
	
	// store ajax confirm - modal
	@RequestMapping(value = "/confirmStore.re", method=RequestMethod.POST, produces="application/json; charset=UTF-8")
	@ResponseBody
	public Map<String, Object> confirmStore(@RequestParam("s_num") int s_num) {
		Map<String, Object> retVal = new HashMap<String, Object>();
		System.out.println("s_num = " + s_num);
		try {
			storeService.confirmStore(s_num);
			retVal.put("res", "confirm");
		} catch (Exception e) {
			retVal.put("res", "FAIL");
			retVal.put("message", "Failure");
		} 
		
		return retVal;
	}
	
	// store ajax refuse - modal
	@RequestMapping(value = "/refuseStore.re", method=RequestMethod.POST, produces="application/json; charset=UTF-8")
	@ResponseBody
	public Map<String, Object> refuseStore(@RequestParam("s_num") int s_num) {
		Map<String, Object> retVal = new HashMap<String, Object>();
		try {
			storeService.refuseStore(s_num);
			retVal.put("res", "refuse");
		} catch (Exception e) {
			retVal.put("res", "FAIL");
			retVal.put("message", "Failure");
		} 

		return retVal;
	}
	
	// store list ajax - all
	@RequestMapping(value = "/storelist_ajax.li", produces = "application/json; charset=utf-8")
	@ResponseBody
	public List<StoreVO> getStoreListAjax(@RequestBody Map<String, String[]> map) {

		int min = 0;

		String[] s_addr = map.get("s_addr");
		for (String no : s_addr) {
			System.out.println("컨트롤러 addr : " + no);
		}

		String[] meat = map.get("meat");
		for (String no : meat) {
			System.out.println("컨트롤러 meat : " + no);
		}

		String[] star = map.get("star");
		System.out.println(star[0]);
		int starInt = Integer.parseInt(star[0]);

		Map<String, String[]> mapp = new HashMap<String, String[]>();

		if (s_addr.length > 0 && meat.length > 0) {
			mapp.put("s_addr", s_addr);
			mapp.put("meat", meat);
			List<StoreVO> list = storeService.getStoreListAjax(mapp);
			System.out.println("리스트 size : " + list.size());

			for (int i = 0; i < list.size(); i++) {
				StoreVO svo = list.get(i);
				int s_num = svo.getS_num();
				Double avgStar = storeService.getAvgStar(s_num);
				System.out.println("avgStar : " + avgStar);

				if ((avgStar + 0.1) < starInt) {
					list.remove(i);
					i = -1;
				} else {
					svo.setAvgStar(avgStar);
				}
			}

			return list;

		} else if (s_addr.length == 0 && meat.length > 0) {
			mapp.put("meat", meat);
			List<StoreVO> list = storeService.getStoreListAjax(mapp);

			for (int i = 0; i < list.size(); i++) {
				StoreVO svo = list.get(i);
				int s_num = svo.getS_num();
				Double avgStar = storeService.getAvgStar(s_num);
				System.out.println("avgStar : " + avgStar);

				if (avgStar < starInt) {
					list.remove(i);
				} else {
					svo.setAvgStar(avgStar);
				}
			}

			return list;
		} else if (s_addr.length > 0 && meat.length == 0) {
			mapp.put("s_addr", s_addr);
			List<StoreVO> list = storeService.getStoreListAjax(mapp);

			for (int i = 0; i < list.size(); i++) {
				StoreVO svo = list.get(i);
				int s_num = svo.getS_num();
				Double avgStar = storeService.getAvgStar(s_num);
				System.out.println("avgStar : " + avgStar);

				if (avgStar < starInt) {
					list.remove(i);
				} else {
					svo.setAvgStar(avgStar);
				}
			}

			return list;
		} else {

			return null;
		}
	}
	// store ajax part end
	
	// qna ajax part start
	// qna ajax list - admin
	@RequestMapping(value = "/qnaListAjax.re", produces="application/json; charset=UTF-8")
	@ResponseBody
	public List<QnaVO> qnaListAjax() {
		List<QnaVO> qnaList = qnaService.getList();
		
		return qnaList;
	}
	
	@RequestMapping(value = "/qnaInfoAjax.re", produces="application/json; charset=UTF-8")
	@ResponseBody
	public Map<String, Object> qnaInfoAjax(@RequestParam("qna_num") int qna_num) {
		Map<String, Object> retVal = new HashMap<String, Object>();
		
		try {
			QnaVO qvo = qnaService.getDetail(qna_num);
			retVal.put("qna_num", qvo.getQna_num());
			retVal.put("u_id", qvo.getU_id());
			retVal.put("title", qvo.getTitle());
			retVal.put("content", qvo.getContent());
			retVal.put("res", "OK");
		} catch (Exception e) {
			retVal.put("res", "FAIL");
			retVal.put("message", "Failure");
		}
		
		return retVal;
	}
	// qna ajax part end
	
	// notice ajax part start
	// notice ajax list - admin
	@RequestMapping(value = "/noticeListAjax.re", produces="application/json; charset=UTF-8")
	@ResponseBody
	public List<NoticeVO> noticeListAjax() {
		List<NoticeVO> noticeList = noticeService.getList();
		System.out.println("list size = " + noticeList.size());
		
		return noticeList;
	}
	
	// notice ajax insert - admin
	@RequestMapping("/noticewriteAjax.re")
	public int noticeInsert(NoticeVO notice, HttpSession session) throws Exception {
		MemberVO mvo = (MemberVO) session.getAttribute("memberVO");
		notice.setU_id(mvo.getU_id());
		System.out.println("u_id = " + notice.getU_id());
		System.out.println("title = " + notice.getTitle());
		System.out.println("content = " + notice.getContent());
		
		int res = noticeService.noticeInsert(notice);
		System.out.println(res);
		return res;
	}
	
	// notice ajax info - admin
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
	// notice ajax part end
	
	// event ajax part start
	// event ajax list - admin
	@RequestMapping(value = "/eventListAjax.re", produces="application/json; charset=UTF-8")
	@ResponseBody
	public List<EventVO> eventListAjax() {
		List<EventVO> eventList = eventService.getList();
		System.out.println("list size = " + eventList.size());
		
		return eventList;
	}
	
	// event ajax insert - admin
	@RequestMapping("/eventwriteAjax.re")
	public int eventInsert(EventVO eventVO, HttpSession session) throws Exception {
		System.out.println("content = " + eventVO.getContent());
		
		int res = eventService.register(eventVO);
		System.out.println(res);
		return res;
	}
	// event ajax part end
}
