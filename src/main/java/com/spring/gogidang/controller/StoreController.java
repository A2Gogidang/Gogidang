package com.spring.gogidang.controller;

import java.io.File;
import java.io.IOException;
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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import com.spring.gogidang.domain.*;
import com.spring.gogidang.service.*;


@Controller
public class StoreController {

	@Autowired
	private StoreService storeService;

	@Autowired
	private MenuService menuService;

	@Autowired
	private ReviewService reviewService;
	
	@Autowired
	private StoreReviewService storeReviewService;

	@Autowired
	private QnaStoreService qnastoreService;

	/*
	 * 승인대기중인 가게 리스트 보기
	 */
	@RequestMapping(value = "/storeWait.st")
	public String getStoreWait(Model model) {
		ArrayList<StoreVO> storeList = storeService.getWaitList();
		System.out.println("list size : " + storeList.size());
		model.addAttribute("storeList", storeList);

		return "mypage/new_mypage";
	}

	@GetMapping("/storeWaitListWithPaging.st")
	public String reviewList(Criteria cri, Model model) {
		System.out.println("con" + storeService.getWaitListWithPage(cri).size());
		model.addAttribute("list", storeService.getWaitListWithPage(cri));

		int total = storeService.getTotal(cri);
		model.addAttribute("pageMaker", new PageDTO(cri, total));

		return "store/store_wait";
	}


	/*
	 * @GetMapping(value = "/get/{s_num}.st", produces = {
	 * MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE })
	 */

	
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

	/*
	 * 가게 상세 정보 보기
	 */
	@RequestMapping(value = "/storeInfo.st")
	public String storeInfo(@RequestParam("s_num") int s_num, Criteria cri, Model model, HttpSession session,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page) {
		StoreVO vo = storeService.storeInfo(s_num);
		SRReviewVO srReviewVO = new SRReviewVO();
		srReviewVO.setS_num(s_num);

		ArrayList<MenuVO> menuList = menuService.menuList(s_num);
		List<ReviewVO> reviewList = reviewService.getListBySnWithPaing(cri, s_num);
		ArrayList<SRReviewVO> srReviewList = storeReviewService.srReviewSelect(srReviewVO);

		int total = reviewService.getTotal(cri);
		model.addAttribute("pageMaker", new PageDTO(cri, total));

		model.addAttribute("storeVO", vo);
		model.addAttribute("menuList", menuList);
		// model.addAttribute("reviewList", reviewList);
		model.addAttribute("srReviewList", srReviewList);

		int limit = 10;

		int listcount = qnastoreService.getListCounts();

		int startrow = (page - 1) * 10 + 1;
		int endrow = startrow + limit - 1;
		HashMap<String, Integer> hashmap = new HashMap<String, Integer>();
		hashmap.put("startrow", startrow);
		hashmap.put("endrow", endrow);

		List<QnaStoreVO> qnalist = qnastoreService.getQnaList(hashmap);

		// 총 페이지 수
		int maxpage = (int) ((double) listcount / limit + 0.95); // 0.95을 더해서 올림 처리
		// 현재 페이지에 보여줄 시작 페이지 수 (1, 11, 21 ...)
		int startpage = (((int) ((double) page / 10 + 0.9)) - 1) * 10 + 1;
		// 현재 페이지에 보여줄 마지막 페이지 수 (10, 20, 30 ...)
		int endpage = maxpage;

		if (endpage > startpage + 10 - 1)
			endpage = startpage + 10 - 1;

		model.addAttribute("page", page);
		model.addAttribute("listcount", listcount);
		model.addAttribute("qnalist", qnalist);
		model.addAttribute("maxpage", maxpage);
		model.addAttribute("startpage", startpage);
		model.addAttribute("endpage", endpage);

		// return "store/store_info";
		return "store/shop-details";
	}

	/*
	 * 승인대기중인 가게 승인
	 */
//	@RequestMapping(value = "/confirmStore.st")
//	@ResponseBody
//	public String confirmStore(@RequestParam("s_num") int s_num) {
//		storeService.confirmStore(s_num);
//
//		return "redirect:storeWait.st";
//	}
	
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

	/*
	 * 승인대기중인 가게 거절
	 */
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

	// soobin start
	// 가게 등록 + 수정
	@RequestMapping(value = "/storeInsert.st", method = RequestMethod.POST)
	public String storeInsert(StoreVO store, HttpSession session, HttpServletResponse response,
			MultipartHttpServletRequest request) throws Exception {

		List<MultipartFile> fileList = request.getFiles("file");

//		String uploadPath = "/Users/taehyun/Documents/Spring_Source/Gogidang/src/main/webapp/resources/img/store/";
		String uploadPath = request.getServletContext().getRealPath("/resources/img/store/");

		ModelAndView mav = new ModelAndView();
		mav.setViewName("main");

		ArrayList<String> orgfile_list = new ArrayList<String>();
		ArrayList<String> storedfile_list = new ArrayList<String>();
		ArrayList<Long> filesize_list = new ArrayList<Long>();

		store.setThumbnail("null");
		store.setS_img("null");

		for (MultipartFile mf : fileList) {
			if (mf.getSize() >= 1) {
				String originFileName = mf.getOriginalFilename(); // 원본 파일 명
				long fileSize = mf.getSize(); // 파일 사이즈

				System.out.println("originFileName : " + originFileName);
				System.out.println("fileSize : " + fileSize);
				String storedFileName = System.currentTimeMillis() + originFileName;
				System.out.println("storedFileName=" + storedFileName);
				String safeFile = uploadPath + storedFileName;

				if (store.getThumbnail().toString().equals("null")) {
					store.setThumbnail(storedFileName);
					System.out.println("plus1");
				} else if (store.getS_img().toString().equals("null")) {
					store.setS_img(storedFileName);
					System.out.println("plus2");
				}

				System.out.println(safeFile);
				try {
					if (mf.getSize() != 0) {
						mf.transferTo(new File(safeFile));
					}
				} catch (IOException e) {
					System.out.println("업로드 에러!!");
				}
				orgfile_list.add(originFileName);
				storedfile_list.add(storedFileName);
				filesize_list.add(fileSize);
			}
		}

		System.out.println(store.getS_hour());
		store.setConfirm(0); // 처음 등록할때 미승인 상태로 띄워야하기때문에 insert전 데이터 넣어줌
		int res = storeService.insertStore(store);

		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();

		if (res == 1) {

			session.setAttribute("StoreVO", store);
			writer.write("<script>alert('가게등록 성공!!'); location.href='./storeRegForm.st';</script>");
		} else {
			writer.write("<script>alert('가게등록 실패!!'); location.href='./storeRegForm.st';</script>");
		}

		return null;

	}

	/*
	 * @RequestMapping(value = "/fileUpload.me", method = RequestMethod.POST) public
	 * String fileUpload(StoreVO storeVO, MultipartFile file) throws Exception {
	 * String imgUploadPath = uploadPath + File.separator + "imgUpload"; String
	 * ymdPath = UploadFileUtils.calcPath(imgUploadPath); String fileName = null;
	 * 
	 * if(file != null) { fileName = UploadFileUtils.fileUpload(imgUploadPath,
	 * file.getOriginalFilename(), file.getBytes(), ymdPath); } else { fileName =
	 * uploadPath + File.separator + "images" + File.separator + "none.png"; }
	 * 
	 * storeVO.setThumbnail(File.separator + "imgUpload" + ymdPath + File.separator
	 * + fileName);
	 * 
	 * storeService.update_store_img(storeVO);
	 * 
	 * return "redirect:/redirect할 url 혹은 .jsp파일명"; }
	 */

	@RequestMapping("/storeUpdate.st")
	public String storeUpdate(StoreVO store, HttpSession session, HttpServletResponse response) throws Exception {

		store.setU_id(((MemberVO) session.getAttribute("memberVO")).getU_id());

		int res = storeService.updateStore(store);

		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();

		if (res != 0) {
			// 업데이트 후 수정된 정보를 다시 가지고와서 세션 저장해주는것
			StoreVO vo2 = storeService.selectStore(store);
			session.setAttribute("StoreVO", vo2);
			writer.write("<script>alert('수정 성공!!!');" + "location.href = './storeRegForm.st';</script>");

		} else {

			writer.write("<script>alert('수정 실패!!!');" + "location.href = './storeRegForm.st';</script>");
		}
		return null;
	}

	@RequestMapping("/storeUpdateForm.st")
	public String storeUpdateForm(StoreVO storeVO, HttpSession session) throws Exception {

		storeVO.setU_id(((MemberVO) session.getAttribute("memberVO")).getU_id());
		StoreVO vo = storeService.selectStore(storeVO);

		session.setAttribute("StoreVO", vo);
		return "sellerpage/store_updateForm";
	}

	// 판매자 가게정보
	@RequestMapping("/storeRegForm.st")
	public String registrationForm(StoreVO storeVO, HttpSession session) throws Exception {

		// 원래코드
		storeVO.setU_id(((MemberVO) session.getAttribute("memberVO")).getU_id());
		StoreVO vo = storeService.selectStore(storeVO);

		session.setAttribute("StoreVO", vo);
		return "sellerpage/store_reg_form";
	}
	// soobin end

	/*
	 * //dohyeong start
	 * 
	 * @RequestMapping("/storelist_ajax.li")
	 * 
	 * @ResponseBody public List<StoreVO>
	 * getStoreListAjax( @RequestParam(value="s_addr[]", required =false) String[]
	 * s_addr) {
	 * 
	 * for(String no : s_addr) { System.out.println("컨트롤러");
	 * System.out.println("s_addr" + no);
	 * 
	 * }
	 * 
	 * 
	 * Map<String, String[]> map = new HashMap<String, String[]>();
	 * map.put("s_addr", s_addr);
	 * 
	 * List<StoreVO> list = storeService.getStoreListAjax(s_addr);
	 * System.out.println("list" + list);
	 * 
	 * return list;
	 * 
	 * } //dogyeong end
	 */

	// dohyeong start
	@RequestMapping(value = "/storeList.st")
	public String getStoreList(Model model) {
		ArrayList<StoreVO> storeList = storeService.getList();
//		ArrayList<StoreVO> storeList = storeService.getStoreList();

		for (int i = 0; i < storeList.size(); i++) {
			StoreVO svo = storeList.get(i);
			int s_num = svo.getS_num();
			Double avgStar = storeService.getAvgStar(s_num);
			svo.setAvgStar(avgStar);
			String addr = svo.getS_addr().substring(0, 2);
			svo.setS_addr(addr);
		}

		model.addAttribute("storeList", storeList);

//		return "store/store_list";
		return "store/shopgrid";
	}
	
	@RequestMapping(value = "/storeListAjax.st")
	public List<StoreVO> getStoreListAjax() {
		ArrayList<StoreVO> storeList = storeService.getList();
		
		for (int i = 0; i < storeList.size(); i++) {
			StoreVO svo = storeList.get(i);
			int s_num = svo.getS_num();
			Double avgStar = storeService.getAvgStar(s_num);
			svo.setAvgStar(avgStar);
			String addr = svo.getS_addr().substring(0, 2);
			svo.setS_addr(addr);
		}
		
		return storeList;
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
	// dogyeong end

	@RequestMapping(value = "/store_info_Design.st")
	public String design1(Model model) {
		return "store/store_info_Design";

	}

	@RequestMapping(value = "/store_info_scroll.st")
	public String store_info_scroll(Model model) {
		return "store/store_info_scroll";

	}

	@RequestMapping(value = "/store_info_Design2.st")
	public String design2(Model model) {
		return "store/store_info_design/store_info_Design2";
	}

	@RequestMapping(value = "/shopgrid.st")
	public String shopgrid(Model model) {
		return "store/shopgrid";

	}
	

	@RequestMapping("qnawriteform.st")
	public String qnaInsertForm() {
		return "store/qna_store_write";
	}

	@RequestMapping("/qnawrite.st")
	public String qnaInsert(QnaStoreVO qna, HttpSession session, HttpServletResponse response) throws Exception {
		int res = qnastoreService.qnaInsert(qna);

		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();

		if (res == 1) {
			writer.write("<script>alert('작성 완료!!');location.href='./storeInfo.st';</script>");
		} else {
			writer.write("<script>alert('작성 실패!!');location.href='./qnawriteform.st';</script>");
		}

		return null;
	}

	@RequestMapping("/qnadetail.st")
	public String getDetail(@RequestParam(value = "qnastore_num", required = true) int qnastore_num, Model model) {
		QnaStoreVO qna = qnastoreService.getDetail(qnastore_num);

		model.addAttribute("qna", qna);

		return "store/qna_store_view";
	}

	@RequestMapping("/qnamodifyform.st")
	public String getModifyForm(@RequestParam(value = "qnastore_num", required = true) int qnastore_num, Model model) {
		QnaStoreVO qna = qnastoreService.getDetail(qnastore_num);

		model.addAttribute("qna", qna);

		return "store/qna_store_modify";
	}

	@RequestMapping("/qnamodify.st")
	public String qnaModify(QnaStoreVO qna) throws Exception {
		int res = qnastoreService.qnaModify(qna);
		return "redirect:/qnadetail.st?qnastore_num=" + qna.getQnastore_num();
	}

	@RequestMapping("/qnadelete.st")
	public String noticeDelete(@RequestParam(value = "qnastore_num", required = true) int qnastore_num,
			HttpSession session, HttpServletResponse response) throws Exception {
		String u_id = (String) session.getAttribute("u_id");

		HashMap<String, String> hashmap = new HashMap<String, String>();
		hashmap.put("qnastore_num", Integer.toString(qnastore_num));
		hashmap.put("u_id", u_id);
		int res = qnastoreService.qnaDelete(hashmap);
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		if (res == 1) {
			writer.write("<script>alert('삭제 성공!!');" + "location.href='./storeInfo.st';</script>");
		} else {
			writer.write("<script>alert('삭제 실패!!');" + "location.href='./storeInfo.st';</script>");
		}
		return null;
	}

	@RequestMapping("/qnareplyform.st")
	public String qnaReplyForm(@RequestParam(value = "qnastore_num", required = true) int qnastore_num, Model model) {
		QnaStoreVO qna = qnastoreService.getDetail(qnastore_num);

		model.addAttribute("qna", qna);

		return "store/qna_store_reply";
	}

	@RequestMapping("/qnareply.st")
	public String qnaReply(QnaStoreVO qna, HttpServletResponse response) throws Exception {
		int res = qnastoreService.qnaReply(qna);
		PrintWriter writer = response.getWriter();
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		if (res == 1) {
			writer.write("<script>alert('답글 성공!!');" + "location.href='./storeInfo.st';</script>");
		} else {
			writer.write("<script>alert('답글 실패!!');" + "location.href='./qnareplyform.st';</script>");
		}
		return null;

	}

}
