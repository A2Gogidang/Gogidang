package com.spring.gogidang.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.spring.gogidang.domain.Criteria;
import com.spring.gogidang.domain.PageDTO;
import com.spring.gogidang.domain.ReviewVO;
import com.spring.gogidang.domain.StoreVO;
import com.spring.gogidang.service.ReviewService;
import com.spring.gogidang.service.StoreService;

import lombok.extern.slf4j.Slf4j;


@Controller
@Slf4j
public class ReviewController {
	
	@Autowired
	private ReviewService reviewService;
	
	@Autowired
	private StoreService storeService;
	
	@RequestMapping("/reviewList.re")
	public String reviewList(Model model) {
		
		model.addAttribute("reviewList", reviewService.getList());
		
		return "review/review_list_grid";
//		return "review/review_list";
	}
	
	@RequestMapping("/reviewListWithPaging.re")
	public String reviewListWithPaging(Criteria cri, Model model) {
		
		model.addAttribute("reviewList", reviewService.getListWithPaging(cri));
		
		int total = reviewService.getTotal(cri);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		
		return "review/review_list_grid";
//		return "review/review_list";
	}
	
	@RequestMapping("/reviewListByIdWithPaging.re")
	public String reviewListByIdWithPaging(@RequestParam("u_id") String u_id, Criteria cri, Model model) {
		
		model.addAttribute("reviewList", reviewService.getListByIdWithPaing(cri, u_id));
		
		int total = reviewService.getTotal(cri);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		
		return "review/review_list";
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
	
	@RequestMapping(value="/reviewlist_ajax.re", produces="application/json; charset=utf-8")
	@ResponseBody 
	public List<ReviewVO> getStoreListAjax( @RequestBody Map<String, String[]> map) {
		
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
	 
	
	
}


//	@RequestMapping("/review_reg.re")
//	public String review_reg(StoreVO store, Model model, HttpSession session) {
//		
//		StoreVO svo = storeService.storeInfo(store);
//		
//		model.addAttribute("svo", svo);
//		return "review/review_reg";
//	}
//
//	@RequestMapping("/reviewModify.re")
//	public String reviewModify(ReviewVO review, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
//		
//		if (reviewService.reviewModify(review)) {
//			rttr.addFlashAttribute("result", "success");
//		}
//		
//		rttr.addAttribute("pageNum", cri.getPageNum());
//		rttr.addAttribute("amount", cri.getAmount());
//		
//		return "redirect:/review/review_list";
//	}
//	
//	@RequestMapping("/reviewRemove.re")
//	public String reviewRemove(@RequestParam("review_num") int review_num, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
//		
//		if (reviewService.reviewRemove(review_num)) {
//			rttr.addFlashAttribute("result", "success");
//		}
//		
//		rttr.addAttribute("pageNum", cri.getPageNum());
//		rttr.addAttribute("amount", cri.getAmount());
//		
//		return "redirect:/review/review_list";
//	}
