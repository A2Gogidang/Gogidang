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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.gogidang.domain.Criteria;
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
	 * 전체 가게 리스트
	 */
	/*
	 * @RequestMapping(value = "/storeList.st") public String getStoreList(Model
	 * model) { ArrayList<StoreVO> storeList = storeService.getStoreList();
	 * model.addAttribute("storeList", storeList);
	 * 
	 * return "store/store_list"; }
	 */

	/*
	 * 승인대기중인 가게 리스트 보기
	 */
	@RequestMapping(value = "/storeWait.st")
	public String getStoreWait(Model model) {
		ArrayList<StoreVO> storeList = storeService.getStoreList();
		model.addAttribute("storeList", storeList);
		
		return "store/store_wait";
	}

	/*
	 * 가게 상세 정보 보기
	 */
	@RequestMapping(value = "/storeInfo.st")
	public String shopInfo(Criteria cri, StoreVO storeVO, Model model) {
		StoreVO vo = storeService.storeInfo(storeVO);
		ArrayList<MenuVO> menuList = menuService.getMenuList();
		List<ReviewVO> reviewList = reviewService.getList(cri);

		model.addAttribute("storeVO", vo);
		model.addAttribute("menuList",menuList);
		model.addAttribute("reviewList",reviewList);


		return "store/store_info";
	}

	/*
	 * 승인대기중인 가게 승인
	 */
	@RequestMapping(value = "/confirmStore.st")
	public String confirmStore(StoreVO storeVO) {
		storeService.confirmStore(storeVO);

		return "redirect:storeList.st";
	}

	/*
	 * 승인대기중인 가게 거절
	 */
	@RequestMapping(value = "/refuseStore.st")
	public String refuseStore(StoreVO storeVO) {
		storeService.refuseStore(storeVO);

		return "redirect:storeList.st";
	}

	//soobin start
	// 가게 등록 + 수정
	@RequestMapping(value = "/storeInsert.st", method = RequestMethod.POST)
	public String storeInsert(StoreVO store , HttpSession session, HttpServletResponse response)throws Exception {
		
		System.out.println(store.getS_hour());
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

	

	/*@RequestMapping(value = "/fileUpload.me", method = RequestMethod.POST)
	public String fileUpload(StoreVO storeVO, MultipartFile file) throws Exception {
		String imgUploadPath = uploadPath + File.separator + "imgUpload";
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		String fileName = null;

		if(file != null) {
			fileName =  UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath); 
		} else {
			fileName = uploadPath + File.separator + "images" + File.separator + "none.png";
		}

		storeVO.setThumbnail(File.separator + "imgUpload" + ymdPath + File.separator + fileName);

		storeService.update_store_img(storeVO);

		return "redirect:/redirect할 url 혹은 .jsp파일명";
	}*/

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

/*
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
*/
	
	// dohyeong start
	@RequestMapping(value = "/storeList.st")
	public String getStoreList(Model model) {
		ArrayList<StoreVO> storeList = storeService.getStoreList();
		model.addAttribute("storeList", storeList);
		
		return "store/store_list";
	}
	
	@RequestMapping(value="/storelist_ajax.li", produces="application/json; charset=utf-8")
	@ResponseBody 
	 public List<StoreVO> getStoreListAjax( @RequestBody Map<String, String[]> map) { 
		String[] s_addr = map.get("s_addr");
		  for(String no : s_addr) {
			  System.out.println("컨트롤러" + no);
		  }
		  String[] meat = map.get("meat");
		  for(String no : meat) {
			  System.out.println("컨트롤러 " + no);
		  }
		  Map<String, String[]> mapp = new HashMap<String, String[]>();
			mapp.put("s_addr",s_addr);
			mapp.put("meat", meat);
		  /*List<StoreVO> list = storeService.getStoreListAjax(s_addr, meat);
		  System.out.println("list" + list);
		 */
		  List<StoreVO> list = storeService.getStoreListAjax(mapp);
		  return list; 
	  }
	// dogyeong end
}
