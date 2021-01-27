<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.spring.gogidang.domain.*" %>
<%@ page import = "com.spring.gogidang.domain.*" %>
<%
	MemberVO mvo = (MemberVO)request.getAttribute("MemberVO");
	PayVO pvo =(PayVO)request.getAttribute("payVO");
	BookingVO bvo = (BookingVO)request.getAttribute("bookingVO");
	StoreVO svo=(StoreVO)request.getAttribute("storeVO");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	<script>
	function pay() {
		   var IMP = window.IMP;
		   var code = "imp28300137"; //가맹점 식별코드
		   IMP.init(code);
		   
		   //결제요청
		   IMP.request_pay({
		      //name과 amount만 있어도 결제 진행 가능
		      pg : 'kakao', //pg 사 선택(kakao,kakaopay 둘다 가능)
		      pay_method : 'card',
		      //metchant_uid : 'merchant_' + new Date().getTime(),
		      merchant_uid : <%=pvo.getRv_num()%>,//주문번호
		      name : <%=svo.getS_name()%>, //상품명
		      amount : <%=bvo.getPay_price()%>,
		      buyer_email : <%=mvo.getU_email()%>,
		      buyer_name : <%=mvo.getU_name()%>,
		      buyer_tel : <%=mvo.getU_phone()%>,
		      buyer_addr : <%=mvo.getU_addr()%>,
		      //결제 완료후 이동할 페이지. kakao나 kakaopay는 생략함
		      //m_redirect_url : 'https://localhost:8080/payments/complete' /
		   }, function(rsp) {
		      if(rsp.success) { //결제 성공시
		         jQuery.ajax({
		        	 url : "insertpay.bo",
		         	type : 'post',
		         	dataType: 'json',
		         	data: {
		         		imp_uid : rsp.imp_uid
		         	}
		         }).done(function(data){
		        	 if(insertbooking){
		        		 var msg = '결제가 완료되었습니다.';
		        	       msg += '\n고유ID : ' + rsp.imp_uid;
		        	       msg += '\n상점 거래ID : ' + rsp.merchant_uid;
		        	       msg += '\결제 금액 : ' + rsp.paid_amount;
		        	       msg += '카드 승인번호 : ' + rsp.apply_num;
		        	       msg += '결제상태 : ' + rsp.status;
		        	       alert(msg);
		        	 }else{
		        		 
		        	 }
		         });

		      }else { //결제 실패시
		         var msg = '결제에 실패하였습니다. 에러내용 : ' +rsp.error_msg
		         alert(msg);
			      location.href='./bookinglist.bo';
		      }
		    
		   });
		}

		function cancelPay(){
		   jQuery.ajax({
		      url: "cancel.do",
		      type: "POST",
		      //datatype: "json",
		      contentType : 'application/x-www-form-urlencoded; charset=utf-8',
		      data: {
		         "merchant_uid": <%=pvo.getRv_num()%>, //주문번호
		         "cancel_request_amount":<%=bvo.getPay_price()%>
		         //"reason": "테스트 결제 환불", //환불 사유
		         //"refund_holder": "홍길동", //[가상계좌 환불시 필수입력] 환불 가상계좌 예금주
		         //"refund_bank": "88", // [가상계좌 환불시 필수입력] 환불 가상계좌 은행코드(ex. KG이니시스의 경우 신한은행은 88번)
		         //"refund_account": "56211105948400" // [가상계좌 환불시 필수입력] 환불 가상계좌 번호
		      }
		   }).done(function(result) { //환불 성공시 로직
		      
		      alert("환불 되엇습니다  : "+result);
		    location.href='./main.me';
		   }).fail(function(error) { //환불 실패시 로직
		      
		      alert("환불에 실패하였습니다 :  "+error);
		      location.href='./bookinglist.bo';
		   });
		}
	</script>
</head>
<body>
	<a href="#" onclick="pay()">결제하기</a><br><br>
	<a href="#" onclick="cancelPay()">결제취소</a>
</body>
</html>