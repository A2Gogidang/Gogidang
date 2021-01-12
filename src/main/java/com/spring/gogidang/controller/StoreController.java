package com.spring.gogidang.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
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

import com.spring.gogidang.domain.MemberVO;
import com.spring.gogidang.domain.MenuVO;
import com.spring.gogidang.domain.ReviewVO;
import com.spring.gogidang.domain.StoreVO;
import com.spring.gogidang.service.MenuService;
import com.spring.gogidang.service.ReviewService;
import com.spring.gogidang.service.StoreService;



@Controller
public class StoreController {
	
	@Autowired
	private StoreService storeService;
	
	@Autowired
	private MenuService menuService;
	
	@Autowired
	private ReviewService reviewService;
	
	/*
	 * �쟾泥� 媛�寃� 由ъ뒪�듃
	 */
	@RequestMapping(value = "/storeList.st")
	public String getShopList(Model model) {
		ArrayList<StoreVO> storeList = storeService.getStoreList();
		model.addAttribute("storeList", storeList);
		
		System.out.println("스토어 리스트 in");
		return "store/store_list";
	}
	
	/*
	 * �듅�씤��湲곗쨷�씤 媛�寃� 由ъ뒪�듃 蹂닿린
	 */
	@RequestMapping(value = "/storeWait.st")
	public String getStoreWait(Model model) {
		ArrayList<StoreVO> storeList = storeService.getStoreList();
		model.addAttribute("storeList", storeList);
		
		return "store/store_wait";
	}
	
	/*
	 * 媛�寃� �긽�꽭 �젙蹂� 蹂닿린
	 */
	@RequestMapping(value = "/storeInfo.st")
	public String shopInfo(StoreVO storeVO, Model model) {
		StoreVO vo = storeService.storeInfo(storeVO);
		ArrayList<MenuVO> menuList = menuService.getMenuList();
		ArrayList<ReviewVO> reviewList = reviewService.getReviewList();
		
		model.addAttribute("storeVO", vo);
		model.addAttribute("menuList",menuList);
		model.addAttribute("reviewList",reviewList);
		
		
		return "store/store_info";
	}
	
	/*
	 * �듅�씤��湲곗쨷�씤 媛�寃� �듅�씤
	 */
	@RequestMapping(value = "/confirmStore.st")
	public String confirmStore(StoreVO storeVO) {
		storeService.confirmStore(storeVO);
		
		return "redirect:storeList.st";
	}
	
	/*
	 * �듅�씤��湲곗쨷�씤 媛�寃� 嫄곗젅
	 */
	@RequestMapping(value = "/refuseStore.st")
	public String refuseStore(StoreVO storeVO) {
		storeService.refuseStore(storeVO);
		
		return "redirect:storeList.st";
	}
	
	// 媛�寃� �벑濡� + �닔�젙
	@RequestMapping("/storeProcess.st")
	public String storeProcess(StoreVO store , HttpSession session, HttpServletResponse response)throws Exception {
		//異붽��븷�궡�슜 insert�뿉�꽌 �꽭�뀡�쓣 �떎琉꾩빞�븿 湲곗뼲�빐�몢湲� 
		//insert �븷�븣 媛�寃� �벑濡� ���옣�릺湲곗쟾 媛�寃뚯듅�씤 而щ읆�뿉 0(誘몄듅�씤)�쓣 �뿬湲곗꽌 以섏빞�븿
		
		StoreVO vo1 = storeService.selectStore(store);
		
		// 媛�寃뚮벑濡앹씠 �븞�릺�뼱�엳�쓣寃쎌슦
		if ( vo1 == null || vo1.getS_num() == null || vo1.getS_num() == "") {
			
			store.setU_id(((MemberVO)session.getAttribute("MemberVO")).getU_id());
			store.setConfirm(0); //泥섏쓬 �벑濡앺븷�븣 誘몄듅�씤 �긽�깭濡� �쓣�썙�빞�븯湲곕븣臾몄뿉 insert�쟾 �뜲�씠�꽣 �꽔�뼱以�
			int res = storeService.insertStore(store);
			
			response.setCharacterEncoding("utf-8");
			response.setContentType("text/html; charset=utf-8");
			PrintWriter writer = response.getWriter();
			
			if (res==1) {
				
				session.setAttribute("StoreVO",store);
				writer.write("<script>alert('媛�寃뚮벑濡� �꽦怨�!!'); location.href='./storeRegForm.st';</script>");
			}
			else {
				writer.write("<script>alert('媛�寃뚮벑濡� �떎�뙣!!'); location.href='./storeRegForm.st';</script>");
			}
			
		}else { // 媛�寃뚮벑濡앹씠 �릺�뼱�엳�쓣 寃쎌슦
			
			store.setU_id(((MemberVO)session.getAttribute("MemberVO")).getU_id());
			
			int res = storeService.updateStore(store);
			
			response.setCharacterEncoding("utf-8");
			response.setContentType("text/html; charset=utf-8");
			PrintWriter writer = response.getWriter();
			
			if(res != 0) {
				//�뾽�뜲�씠�듃 �썑 �닔�젙�맂 �젙蹂대�� �떎�떆 媛�吏�怨좎��꽌 �꽭�뀡 ���옣�빐二쇰뒗寃�
				StoreVO vo2 = storeService.selectStore(store);
				session.setAttribute("StoreVO",vo2);
				writer.write("<script>alert('�닔�젙 �꽦怨�!!!');" +"location.href = './storeRegForm.st';</script>");
				
			}else {

				writer.write("<script>alert('�닔�젙 �떎�뙣!!!');" +"location.href = './storeRegForm.st';</script>");
			}
			
		}
		
		return null;
		
	}
	//soobin start
	
	@RequestMapping("/storeRegForm.st")
	public String registrationForm(StoreVO storeVO, HttpSession session) throws Exception {
		
		storeVO.setU_id(((MemberVO)session.getAttribute("MemberVO")).getU_id());
		StoreVO vo = storeService.selectStore(storeVO);

		session.setAttribute("StoreVO",vo);
		return "sellerpage/store_reg_form";
	}
	
	@RequestMapping("/menuRegForm.st")
	public String menuRegForm(MenuVO menuVO, HttpSession session, HttpServletResponse response ,Model model) throws Exception {

		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		
		StoreVO storeVO = new StoreVO();
		storeVO.setU_id(((MemberVO)session.getAttribute("MemberVO")).getU_id());
		
		StoreVO vo = storeService.selectStore(storeVO);
		
		//�궗�뾽�옄 踰덊샇 ���떊 媛��엯�듅�씤 而щ읆 媛�吏�怨� 鍮꾧탳�빐�빞�맖 �굹以묒뿉 �닔�젙�븯湲�
		if( vo == null || vo.getS_num() == "" || vo.getConfirm() == 0) {
						
			writer.write("<script>alert('媛�寃뚯젙蹂� �벑濡� 癒쇱� �븯�꽭�슂!!!!');" +"location.href = './storeRegForm.st';</script>");
			
		}else {

			menuVO.setS_num(vo.getS_num());			
			ArrayList<MenuVO> menuSelectList = menuService.selectMenu(menuVO);
			
			model.addAttribute("menuSelectList",menuSelectList);
			model.addAttribute("StoreVO",vo);
			
			return "sellerpage/menu_reg_form";
		}
		 return null;
	}
	
	@RequestMapping("/menuProcess.st")
	public String menuProcess(MenuVO menuVO, HttpSession session , HttpServletResponse response) throws Exception {
		
		int i = 0;
		System.out.println(menuVO.getS_num());	
		menuVO.setMenu_num(i++);
		
		int res = menuService.insertMenu(menuVO);
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		
		if (res==1) {
			
			writer.write("<script>alert('硫붾돱�벑濡� �꽦怨�!!'); location.href='./menuRegForm.st';</script>");
		}
		else {
			writer.write("<script>alert('媛�寃뚮벑濡� �떎�뙣!!'); location.href='./menuRegForm.st';</script>");
		}
	
		return null;
	}
	//soobin end
	
	
	//dohyeong start
	@RequestMapping("/storelist_ajax.li")
	  
	  @ResponseBody 
	  public List<StoreVO> getStoreListAjax( @RequestParam(value="s_addr[]", required =false) String[] s_addr) { 
	  
		  for(String no : s_addr) {
			  System.out.println("컨트롤러"); 
			  System.out.println("s_addr" + no);  
			  
		  }
	 
	  
	  Map<String, String[]> map = new HashMap<String, String[]>();
	  map.put("s_addr", s_addr);
	  
	  List<StoreVO> list = storeService.getStoreListAjax(s_addr);
	  System.out.println("list" + list);
	  
	  return list; 
	  
	  }
	//dogyeong end
}
