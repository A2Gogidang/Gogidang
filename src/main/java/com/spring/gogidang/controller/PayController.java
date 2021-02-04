package com.spring.gogidang.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.gogidang.domain.MemberVO;
import com.spring.gogidang.domain.PayVO;
import com.spring.gogidang.service.PayService;

@Controller
public class PayController {
	
	@Autowired
	private PayService payService;
	
	/*
	 * @RequestMapping(value="/cancel.py",method=RequestMethod.POST)
	 * 
	 * @ResponseBody public String cancel(@RequestParam(value="rv_num")String
	 * rv_num) {
	 * 
	 * PaymentCheck obj= new PaymentCheck(); String token = obj.getImportToken();
	 * int res = obj.cancelPayment(token, rv_num); if(res==1) { return "Success";
	 * }else { return "Failure"; } }
	 */
	
	/*
	 * @RequestMapping("/pay.py") 
	 * public String PayForm(PayVO payVO, Model model)throws Exception{
	 * 
	 * System.out.println(payVO.getTotal_price()); 
	 * model.addAttribute("PayVO",payVO);
	 * 
	 * return "payTest"; }
	 */
	
	
	@RequestMapping(value="/insertpay.py",produces="appliction/json;charset=UTF-8")
	@ResponseBody
	public Map<String, String> insertPay(PayVO payVO) throws Exception{ 
		
		String s_name = payService.storeName(payVO);		
		payVO.setS_name(s_name);		
		Map<String, String> map = new HashMap<String, String>();
		
		int res = payService.insertPay(payVO);
		
		if(res == 1){
			 map.put("res", "success");
			 //결제후 장바구니 비우기
			 payService.cartEmpty(payVO); 			
			 return map;
		} else {
			 map.put("res", "fail");
			 return map;
		}
		 
	}
	
	   @RequestMapping("/purchase_list.py")
	   public String purchaseList(PayVO payVO,Model model, HttpServletResponse response ,HttpSession session)throws Exception{
		   
		   response.setCharacterEncoding("utf-8");
		   response.setContentType("text/html; charset=utf-8");
		   PrintWriter writer = response.getWriter();
		   
		   payVO.setU_id(((MemberVO)session.getAttribute("memberVO")).getU_id());

		   ArrayList<PayVO> purchase_list = payService.purchaseList(payVO);
		   
		   System.out.println(purchase_list.get(0).toString());
		   
		   if(purchase_list.isEmpty() || purchase_list.get(0).getPay_code() == null) {
		        
		         writer.write("<script>alert('구매내역이 없습니다.'); location.href='./storeList.st';</script>");
		         
		   }else{
		         
			   model.addAttribute("purchase_list",purchase_list);
			   return "mypage/purchase_list";
		        
		   }

		   return null;
	   }
	
	/*
	 * @RequestMapping("/selectpay.py") public String deletePay(PayVO payVO) throws
	 * Exception{ String rv_num=payVO.getRv_num(); payservice.deletePay(payVO);
	 * 
	 * return "redirect:/booking.bo"; }
	 */
	
}



