package com.spring.gogidang.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
public class ReviewController {
	
	@Autowired
	private ReviewService reviewService;
	
	@Autowired
	private StoreService storeService;
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping("/reviewList.re")
	public String reviewList(Model model) {
		
		model.addAttribute("reviewList", reviewService.getList());
		
		//return "review/review_list_grid";
		return "review/review_list_test";
	}
	
	@RequestMapping("/reviewListWithPaging.re")
	public String reviewListWithPaging(Criteria cri, Model model) {
		
		model.addAttribute("reviewList", reviewService.getListWithPaging(cri));
		
		int total = reviewService.getTotal(cri);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		
		return "review/review_list_grid";
	}
	
	@RequestMapping("/reviewListByIdWithPaging.re")
	public String reviewListByIdWithPaging(@RequestParam("u_id") String u_id, Criteria cri, Model model , HttpSession session) {
			
		ArrayList<ReviewVO> reviewList = (ArrayList<ReviewVO>) reviewService.getListByIdWithPaing(cri, u_id);
		
		model.addAttribute("reviewList", reviewList);

		return "mypage/member_review";
	}
	
	@RequestMapping("/reviewListBySnWithPaging.re")
	public String reviewListBySnWithPaging(@RequestParam("s_num") int s_num, Criteria cri, Model model) {
		
		model.addAttribute("reviewList", reviewService.getListBySnWithPaing(cri, s_num));
		
		int total = reviewService.getTotal(cri);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		
		return "review/review_list";
	}
	
	@RequestMapping("/reviewInfo.re")
	public String reviewInfo(@RequestParam("review_num") int review_num, Model model) {
		model.addAttribute("review", reviewService.getReview(review_num));
		
		return "review/review_info";
	}
	
	// file upload
	private String getFolder() {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		Date date = new Date();
		
		String str = sdf.format(date);
		
		return str.replace("-", File.separator);
	}
	
	private boolean checkImageType(File file) {

		try {
			String contentType = Files.probeContentType(file.toPath());

			return contentType.startsWith("image");

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return false;
	}

	@RequestMapping("/regReview.re")
	public String regReview(ReviewVO review, MultipartHttpServletRequest request) {
		
		List<MultipartFile> fileList = request.getFiles("file");
		System.out.println(fileList.size());
		
//		String uploadPath = "/Users/taehyun/Documents/Spring_Source/Gogidang/src/main/webapp/resources/img/up/";
		String uploadPath = request.getServletContext().getRealPath("/resources/img/review/");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("review/review_list");
		
		ArrayList<String> orgfile_list = new ArrayList<String>();
		ArrayList<String> storedfile_list = new ArrayList<String>();
		ArrayList<Long> filesize_list = new ArrayList<Long>();
		
		review.setReview_img1("null");
		review.setReview_img2("null");
		review.setReview_img3("null");
		
		for(MultipartFile mf : fileList) {
			if(mf.getSize() >= 1) {
				String originFileName = mf.getOriginalFilename(); //원본 파일 명
				long fileSize = mf.getSize(); //파일 사이즈
				
				System.out.println("originFileName : "+originFileName);
				System.out.println("fileSize : "+fileSize);
				String storedFileName = System.currentTimeMillis() + originFileName;
				System.out.println("storedFileName="+storedFileName);
				String safeFile = uploadPath + storedFileName;
				
				if(review.getReview_img1().toString().equals("null")) {
					review.setReview_img1(storedFileName);
					System.out.println("plus1");
				} else if (review.getReview_img2().toString().equals("null")) {
					review.setReview_img2(storedFileName);
					System.out.println("plus2");
				} else {
					review.setReview_img3(storedFileName);
					System.out.println("end");
				}
				
				System.out.println(safeFile);
				try {
					if(mf.getSize() != 0) {
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
		
		reviewService.regReview(review);
		
		return "redirect:main.me";
	}
	
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
	
	@RequestMapping("/storereviewList.re")
	public String storereviewList() {
		
		return "sellerpage/store_review";
	}
	
	@RequestMapping(value = "/storeReviewListAjax.re", produces="application/json; charset=UTF-8")
	@ResponseBody
	public List<ReviewVO> storeReviewListAjax(@RequestParam String u_id) throws Exception {
		System.out.println("u_id = " + u_id);
		int s_num = memberService.getSnumByUid(u_id);
		System.out.println("s_num = " + s_num);
		ReviewVO reviewVO = new ReviewVO();
		reviewVO.setS_num(s_num);
		List<ReviewVO> reviewList = reviewService.getListSn(s_num);
		System.out.println(reviewList.size());
		
		return reviewList;
	}

}
