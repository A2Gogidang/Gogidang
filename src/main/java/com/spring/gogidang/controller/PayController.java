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

import com.spring.gogidang.domain.*;
import com.spring.gogidang.service.*;

@Controller
public class PayController {
	
	@Autowired
	private PayService payService;
	
	@Autowired
	private ReviewService reviewService;
	
	@Autowired
	private StoreService storeService;
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
	   public String purchaseList(@RequestParam("u_id") String u_id, PayVO payVO,Model model, HttpServletResponse response ,HttpSession session)throws Exception{
		   
		   response.setCharacterEncoding("utf-8");
		   response.setContentType("text/html; charset=utf-8");
		   PrintWriter writer = response.getWriter();
		   
		   payVO.setU_id(u_id);
		   
		   ArrayList<PayVO> purchase_list = payService.purchaseList(u_id);
		   
		   System.out.println(purchase_list.get(0).toString());
		   
		   if(purchase_list.isEmpty() || purchase_list.get(0).getPay_code() == null) {
		        
		         writer.write("<script>alert('구매내역이 없습니다.'); location.href='./storeList.st';</script>");
		         
		   }else{
			   model.addAttribute("purchase_list",purchase_list);
			   return "mypage/purchase_list";
		        
		   }

		   return null;
	   }
	   
	   @RequestMapping(value="payListAjax.re", produces="application/json; charset=UTF-8")
	   @ResponseBody
	   public List<PayVO> payListAjax(@RequestParam("u_id") String u_id) {
		   System.out.println("paylist u_id" + u_id);
		   List<PayVO> payList = payService.getList(u_id);
		   
		   return payList;
	   }
	   
//	   @RequestMapping(value="payInfoAjax.re", produces="application/json; charset=UTF-8")
//	   @ResponseBody
//	   public Map<String, Object> payListAjax(@RequestParam("pay_num") int pay_num) {
//		   Map<String, Object> retVal = new HashMap<String, Object>();
//		   System.out.println("paylist u_id = " + pay_num);
//		   
//		   try {
//			    PayVO pvo = payService.getInfo(pay_num);
//			    int s_num = pvo.getS_num();
//			    String fu_id = storeService.getStoreId(s_num);
//				retVal.put("pay_num", pvo.getPay_num());
//				retVal.put("s_num", s_num);
//				retVal.put("s_name", pvo.getS_name());
//				retVal.put("fu_id", fu_id);
//				retVal.put("res", "OK");
//			} catch (Exception e) {
//				retVal.put("res", "FAIL");
//				retVal.put("message", "Failure");
//			}
//		   
//		   return retVal;
//	   }
	   
	   @RequestMapping(value="payInfoAjax.re", produces="application/json; charset=UTF-8")
	   public String payListAjax(@RequestParam("pay_num") int pay_num, Model model) {
		   
		   System.out.println("paylist u_id = " + pay_num);
		   
		   PayVO pvo = payService.getInfo(pay_num);
		   
		   model.addAttribute("pvo", pvo);
		   
		   return "review/review_write";
	   }
	   
	
	/*
	 * @RequestMapping("/selectpay.py") public String deletePay(PayVO payVO) throws
	 * Exception{ String rv_num=payVO.getRv_num(); payservice.deletePay(payVO);
	 * 
	 * return "redirect:/booking.bo"; }
	 */
	
}



