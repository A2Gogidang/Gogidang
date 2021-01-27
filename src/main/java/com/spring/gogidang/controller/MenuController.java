package com.spring.gogidang.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.spring.gogidang.domain.MemberVO;
import com.spring.gogidang.domain.MenuVO;
import com.spring.gogidang.domain.StoreVO;
import com.spring.gogidang.service.MenuService;
import com.spring.gogidang.service.StoreService;

@Controller
public class MenuController {
	
	@Autowired
	private StoreService storeService;
	
	@Autowired
	private MenuService menuService;
	
	@RequestMapping("/menuRegForm.mn")
	public String menuRegForm(MenuVO menuVO, HttpSession session, HttpServletResponse response ,Model model) throws Exception {

		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();

		StoreVO storeVO = new StoreVO();
		storeVO.setU_id(((MemberVO)session.getAttribute("memberVO")).getU_id());

		StoreVO vo = storeService.selectStore(storeVO);

		//사업자 번호 대신 가입승인 컬럼 가지고 비교해야됨 나중에 수정하기
		if( vo == null || vo.getS_num() == 0 || vo.getConfirm() == 0) {

			writer.write("<script>alert('가게정보 등록 먼저 하세요!!!!');" +"location.href = './storeRegForm.st';</script>");

		}else {
			
			int s_num = vo.getS_num();
			ArrayList<MenuVO> menuList  = new ArrayList<MenuVO>();
			
			
			menuList = menuService.menuList(s_num);

			model.addAttribute("menuList",menuList);
			model.addAttribute("StoreVO",vo);

			return "sellerpage/menu_reg_form";
		}
		return null;
	}

	@RequestMapping("/menuProcess.mn")
	public String menuProcess(MenuVO menuVO, MultipartHttpServletRequest request, HttpSession session, HttpServletResponse response) throws Exception {
		
		List<MultipartFile> fileList = request.getFiles("file");
		
//		String uploadPath = "/Users/taehyun/Documents/Spring_Source/Gogidang/src/main/webapp/resources/img/menu/";
		String uploadPath = request.getServletContext().getRealPath("/resources/img/menu/");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("main");
		
		ArrayList<String> orgfile_list = new ArrayList<String>();
		ArrayList<String> storedfile_list = new ArrayList<String>();
		ArrayList<Long> filesize_list = new ArrayList<Long>();
		
		menuVO.setImg("null");
		
		for(MultipartFile mf : fileList) {
			if(mf.getSize() >= 1) {
				String originFileName = mf.getOriginalFilename(); //원본 파일 명
				long fileSize = mf.getSize(); //파일 사이즈
				
				System.out.println("originFileName : "+originFileName);
				System.out.println("fileSize : "+fileSize);
				String storedFileName = System.currentTimeMillis() + originFileName;
				System.out.println("storedFileName="+storedFileName);
				String safeFile = uploadPath + storedFileName;
				
				if(menuVO.getImg().toString().equals("null")) {
					menuVO.setImg(storedFileName);
					System.out.println("plus1");
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
		
		int i = 0;
		System.out.println(menuVO.getS_num());	
		menuVO.setMenu_num(i++);

		int res = menuService.menuRegister(menuVO);

		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();

		if (res==1) {

			writer.write("<script>alert('메뉴등록 성공!!'); location.href='./menuRegForm.mn';</script>");
		}
		else {
			writer.write("<script>alert('가게등록 실패!!'); location.href='./menuRegForm.mn';</script>");
		}

		return null;
	}
}
