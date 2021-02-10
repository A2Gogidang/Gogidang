package com.spring.gogidang.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
			List<ReviewVO> nlist = new ArrayList<ReviewVO>();
			System.out.println("리스트 size : " + list.size());
			
			for (int i=0; i<list.size(); i++) {
				ReviewVO rvo = list.get(i);
				int getStar = rvo.getStar();
				String img = rvo.getReview_img1();
				System.out.println("getstar=" + getStar);
				System.out.println("getReview_img1=" + img);
				
				if (getStar >= starInt) {
					int j = 0;
					nlist.add(j, rvo);
					j++;
				}
				
			}
			System.out.println("리스트 size : " + nlist.size());
			return nlist;
			
		} else if(s_addr.length == 0 && meat.length>0) {
			mapp.put("meat", meat);		
			List<ReviewVO> list = reviewService.getReviewListAjax(mapp);
			List<ReviewVO> nlist = new ArrayList<ReviewVO>();
			
			for (int i=0; i<list.size(); i++) {
				ReviewVO rvo = list.get(i);
				int getStar = rvo.getStar();
				System.out.println(getStar);
				
				if (getStar >= starInt) {
					int j = 0;
					nlist.add(j, rvo);
					j++;
				}
			}
			
			return nlist;
			
		} else if (s_addr.length > 0 && meat.length==0) {
			mapp.put("s_addr",s_addr);
			List<ReviewVO> list = reviewService.getReviewListAjax(mapp);
			List<ReviewVO> nlist = new ArrayList<ReviewVO>();
			
			for (int i=0; i<list.size(); i++) {
				ReviewVO rvo = list.get(i);
				int getStar = rvo.getStar();
				System.out.println(getStar);
				
				if (getStar >= starInt) {
					int j = 0;
					nlist.add(j, rvo);
					j++;
				}
			}
			
			return nlist;
		} else {
			
			return null;
		}
	  }
	
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
	
}
