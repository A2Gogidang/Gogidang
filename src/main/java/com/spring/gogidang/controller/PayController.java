package com.spring.gogidang.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.gogidang.domain.PayVO;
import com.spring.gogidang.domain.PaymentCheck;
import com.spring.gogidang.service.PayService;

@Controller
public class PayController {
	
	@Autowired
	private PayService payService;
	
	@RequestMapping(value="/cancel.py",method=RequestMethod.POST)
	@ResponseBody
	public String cancel(@RequestParam(value="rv_num")String rv_num) {
		
		PaymentCheck obj= new PaymentCheck();
		String token = obj.getImportToken();
		int res = obj.cancelPayment(token, rv_num);
		if(res==1) {
			return "Success";
		}else {
			return "Failure";
		}
	}
	
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
	public Map<String, String>  insertPay(PayVO payVO) throws Exception{ 
		
		Map<String, String> map = new HashMap<String, String>();
		int res = payService.insertPay(payVO);
		
		if(res == 1){
			 map.put("res", "success");
			 return map;
		} else {
			 map.put("res", "fail");
			 return map;
		}
		 
	}
	
	/*
	 * @RequestMapping("/selectpay.py") public String deletePay(PayVO payVO) throws
	 * Exception{ String rv_num=payVO.getRv_num(); payservice.deletePay(payVO);
	 * 
	 * return "redirect:/booking.bo"; }
	 */
	
}



