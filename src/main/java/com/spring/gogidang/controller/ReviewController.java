package com.spring.gogidang.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.gogidang.domain.*;
import com.spring.gogidang.service.*;

import lombok.extern.slf4j.Slf4j;


@Controller
public class ReviewController {
	
	@Autowired
	private ReviewService reviewService;
	
	@Autowired
	private StoreService storeService;
	
	@GetMapping("/reviewList.re")
	public String reviewList(Criteria cri, Model model) {
		
		model.addAttribute("list", reviewService.getList(cri));
		
		int total = reviewService.getTotal(cri);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		
		return "review/review_list";
	}
	
	@RequestMapping("/reviewUidList.re")
	public String reveiwUidList(ReviewVO review,  Criteria cri, HttpSession session, Model model) {
		
		model.addAttribute("reviewUidList", reviewService.getUidList(cri, review.getU_id()));
		
		int total = reviewService.getTotal(cri);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		
		return "mypage/member_review";
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

	@RequestMapping("/reviewReg.re")
	public String reviewReg(ReviewVO review, MultipartHttpServletRequest request) {
		
		List<MultipartFile> fileList = request.getFiles("file");
		System.out.println(fileList.size());
		
		String uploadPath = "/Users/taehyun/Documents/Spring_Source/Gogidang/src/main/webapp/resources/img/up/";
		
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
		
		reviewService.reviewReg(review);
		
		return "redirect:main.me";
	}
	
	@RequestMapping("/review_reg.re")
	public String review_reg(StoreVO store, Model model, HttpSession session) {
		
		StoreVO svo = storeService.storeInfo(store);
		
		model.addAttribute("svo", svo);
//		return "review/review_reg_ajax";
		return "review/review_reg";
	}
	
	@RequestMapping("/reviewModify.re")
	public String reviewModify(ReviewVO review, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		
		if (reviewService.reviewModify(review)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		
		return "redirect:/review/review_list";
	}
	
	@RequestMapping("/reviewRemove.re")
	public String reviewRemove(@RequestParam("review_num") int review_num, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		
		if (reviewService.reviewRemove(review_num)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		
		return "redirect:/review/review_list";
	}
	
	@RequestMapping("/reviewInfo.re")
	public String reviewInfo(@RequestParam("review_num") int review_num, Model model) {
		model.addAttribute("review", reviewService.getReview(review_num));
		
		return "/review/review_info";
	}
}
