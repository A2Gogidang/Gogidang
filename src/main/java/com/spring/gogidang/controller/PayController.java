package com.spring.gogidang.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

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
	
	PayService payservice;
	
	@RequestMapping(value="/cancel.bo",method=RequestMethod.POST)
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
	
	@RequestMapping("/insertpay.bo")
	public String insertPay(PayVO payVO,HttpServletResponse response) throws Exception{ 
		int res = payservice.insertPay(payVO);
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charcet=urf-8");
		PrintWriter writer = response.getWriter();
		
		if(res==1) {
			writer.write("<script>alert('결제 가완료되었습니다'); location.href='./main.me';</script");
		}else {
			writer.write("<script>alert('결제에 실패하였습니다'); location.href='./bookinglist.bo';</script>");
		}
		return null;
	}
	
	@RequestMapping("/selectpay.bo")
	public String deletePay(PayVO payVO) throws Exception{
		String rv_num=payVO.getRv_num();
		payservice.deletePay(payVO);
		
		return "redirect:/booking.bo";
	}
}



