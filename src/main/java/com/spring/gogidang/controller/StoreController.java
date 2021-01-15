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

import com.spring.gogidang.domain.Criteria;
import com.spring.gogidang.domain.MemberVO;
import com.spring.gogidang.domain.MenuVO;
import com.spring.gogidang.domain.PageDTO;
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

	// taehyun
	// all store list
	@RequestMapping(value="/getList.st")
	public String getList(Model model) {
		ArrayList<StoreVO> storeList = storeService.getList();
		model.addAttribute("storeList", storeList);

		return "store/store_list";
	}

	// wait store list
	@RequestMapping(value = "/storeWait.st")
	public String getStoreWait(Model model) {
		ArrayList<StoreVO> storeList = storeService.getWaitList();
		model.addAttribute("storeList", storeList);
		
		return "store/store_wait";
	}

	// store info
	@RequestMapping(value = "/storeInfo.st")
	public String storeInfo(Criteria cri, StoreVO storeVO, Model model) {
				
		int total = reviewService.getTotal(cri);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		
		model.addAttribute("storeVO", storeService.storeInfo(storeVO));
		model.addAttribute("menuList", menuService.getMenuList());
		model.addAttribute("reviewList", reviewService.getSnumList(cri, storeVO.getS_num()));
		
		
		return "store/store_info";
	}
	
	// confirm store (0 -> 1)
	@RequestMapping(value = "/confirmStore.st")
	public String confirmStore(StoreVO storeVO) {
		storeService.confirmStore(storeVO);

		return "redirect:storeList.st";
	}

	// refuse store (delete)
	@RequestMapping(value = "/refuseStore.st")
	public String refuseStore(StoreVO storeVO) {
		storeService.refuseStore(storeVO);

		return "redirect:storeList.st";
	}
	// taehyun end
	
	//soobin start
	// 가게 등록 + 수정
	@RequestMapping("/storeInsert.st")
	public String storeInsert(StoreVO store , HttpSession session, HttpServletResponse response)throws Exception {
		//추가할내용 insert에서 세션을 다뤄야함 기억해두기 
		//insert 할때 가게 등록 저장되기전 가게승인 컬럼에 0(미승인)을 여기서 줘야함

		StoreVO vo1 = storeService.selectStore(store);

		System.out.println(store.toString());
		store.setConfirm(0); //처음 등록할때 미승인 상태로 띄워야하기때문에 insert전 데이터 넣어줌
		int res = storeService.insertStore(store);

		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();

		if (res==1) {

			session.setAttribute("StoreVO",store);
			writer.write("<script>alert('가게등록 성공!!'); location.href='./storeRegForm.st';</script>");
		}
		else {
			writer.write("<script>alert('가게등록 실패!!'); location.href='./storeRegForm.st';</script>");
		}		

		return null;

	}

	@RequestMapping("/storeUpdate.st")
	public String storeUpdate(StoreVO store , HttpSession session, HttpServletResponse response)throws Exception {
		
		store.setU_id(((MemberVO)session.getAttribute("MemberVO")).getU_id());

		int res = storeService.updateStore(store);

		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();

		if(res != 0) {
			//업데이트 후 수정된 정보를 다시 가지고와서 세션 저장해주는것
			StoreVO vo2 = storeService.selectStore(store);
			session.setAttribute("StoreVO",vo2);
			writer.write("<script>alert('수정 성공!!!');" +"location.href = './storeRegForm.st';</script>");

		}else {

			writer.write("<script>alert('수정 실패!!!');" +"location.href = './storeRegForm.st';</script>");
		}
		return null;
	}
	
	@RequestMapping("/storeUpdateForm.st")
	public String storeUpdateForm(StoreVO storeVO, HttpSession session) throws Exception {

		storeVO.setU_id(((MemberVO)session.getAttribute("MemberVO")).getU_id());
		StoreVO vo = storeService.selectStore(storeVO);

		session.setAttribute("StoreVO",vo);
		return "sellerpage/store_updateForm";
	}
	
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

		//사업자 번호 대신 가입승인 컬럼 가지고 비교해야됨 나중에 수정하기
		if( vo == null || vo.getS_num() == 0 || vo.getConfirm() == 0) {

			writer.write("<script>alert('가게정보 등록 먼저 하세요!!!!');" +"location.href = './storeRegForm.st';</script>");

		}else {
			
			menuVO.setS_num(vo.getS_num());			
			ArrayList<MenuVO> menuSelectList  = new ArrayList<MenuVO>();
			menuSelectList = menuService.selectMenu(menuVO);

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

			writer.write("<script>alert('메뉴등록 성공!!'); location.href='./menuRegForm.st';</script>");
		}
		else {
			writer.write("<script>alert('가게등록 실패!!'); location.href='./menuRegForm.st';</script>");
		}

		return null;
	}
	//soobin end

	
	// dohyeong start
	@RequestMapping(value = "/storeList.st")
	public String getStoreList(Model model) {
		ArrayList<StoreVO> storeList = storeService.getStoreList();
		model.addAttribute("storeList", storeList);
		
		return "store/store_list";
	}
	
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
	// dogyeong end
}
