<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.spring.gogidang.domain.*" %>
<%@include file="../includes/header_simple.jsp"%>
<%
	StoreVO storevo = (StoreVO)session.getAttribute("storeVO");
	CartVO cvo = (CartVO)session.getAttribute("CartVO");
	ArrayList<CartVO> cart_list = (ArrayList<CartVO>)session.getAttribute("cart_list");
	int totalPrice = 0;
	
	
%>

    <!--네비게이션바 사용 시작-->
    <%if(mvo.getSeller_key() == 0 ){ %>
	   <section class="hero">
        <div class="container">
            <div class="hero__item__box2"></div>
                    <div class="EventNav">
                        <ul>
                            <li><a href="./updateList.me">내정보</a></li>
                            <li><a href="./bookingList.bo?u_id=<%=mvo.getU_id()%>">내예약확인</a></li>
                            <li><a href="./likeStoreList.li?u_id=<%=mvo.getU_id()%>">찜목록</a></li>
                            <li><a href="./reviewList.re?u_id=<%=mvo.getU_id()%>">내가 작성한 후기</a></li>
                            <li><a href="./cartList.ct">장바구니</a></li>
                        </ul>
                        
                    </div>   
            </div> 
    </section>
<%
}else{ 
	if(storevo == null || storevo.getConfirm() == 0 || storevo.getS_num() == 0 ){
%>
 <section class="hero">
        <div class="container">
            <div class="hero__item__box2"></div>
                    <div class="EventNav">
                        <ul>
                            <li><a href="./updateList.me">내정보</a></li>
                            <li><a href="./storeRegForm.st">가게 정보</a>
                        </ul>
                    </div>   
            </div>   
<%
	}else{
%></section>
    <section class="hero">
        <div class="container">
            <div class="hero__item__box2"></div>
                    <div class="EventNav">
                        <ul>
                            <li><a href="./updateList.me">내정보</a></li>
                            <li><a href="./storeRegForm.st">가게 정보</a>
                            <li><a href="./menuRegForm.mn">메뉴 정보</a></li>
                            <li><a href="./storeNoticeList.no">문의 관리</a></li>
                            <li><a href="./storereviewList.bo">리뷰 관리</a></li>
                        </ul>
                    </div>   
            </div>   
    </section>
<%
	} 
}
%>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<center>
	<table border=1 width=400>
		<tr>장바구니</tr>		
		<tr>
			<td>상품번호</td>
			<td>상품명</td>
			<td>상품 사진</td>
			<td>구매 수량</td>
			<td>금액</td>
			<td>담은 날짜</td>
		</tr>
<%	


	for(int i =0; i < cart_list.size(); i++){
		
		CartVO cvo_list = (CartVO)cart_list.get(i);
		
		int price = cvo_list.getPrice() * cvo_list.getCartStock(); 
		totalPrice = price + totalPrice;
		
		java.sql.Date sqlDate = new java.sql.Date(cvo_list.getAddDate().getTime());
%>

	<form id = "cartDelet<%=i %>" action="./cartdelete.ct">
		<input type="hidden" id ="cartNum" name="cartNum" value="<%=cvo_list.getCartNum() %>"/>
		<tr>
			<td><%=i+1 %></td>
			<td><%=cvo_list.getMenu_name() %></td>
			<td><%=cvo_list.getImg()%></td>
			<td><%=cvo_list.getCartStock() %></td>
			<td><%=price %></td>
			<td><%=sqlDate %></td>
			<td><input type="submit" value="삭제" id="cartDelet<%=i%>"/></td>
		</tr>
		<br>		
	</form>		
<%
	}
%>
		
	</table>
</center>


<h2>총 금액 :<%=totalPrice %>원</h2>
<button onclick="pay()">결제하기</button>


 <script>
	
    function pay(){
        var IMP = window.IMP; // 생략가능
        IMP.init('imp77363478'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
      
        IMP.request_pay({
            pg : 'inicis',
            pay_method : 'card',
            merchant_uid : 'merchant_' + new Date().getTime(),
            name : 'gogidang',
            amount : 110,
            //amount : <%=totalPrice%>,
            buyer_email : '<%=mvo.getU_email()%>',
            buyer_name : '<%=mvo.getU_name()%>',
            buyer_tel : '<%=mvo.getU_phone()%>',
            buyer_addr : '<%=mvo.getU_addr()%>',
            buyer_postcode : '123-456',
            //m_redirect_url : 'http://www.naver.com'
        }, function(rsp) { //결제 정보를 받아옴
            if ( rsp.success ) {//결제 성공했을때
            	
            	var msg = '결제가 완료되었습니다.';
            	
            	//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
                jQuery.ajax({
                    url: "insertpay.py", //cross-domain error가 발생하지 않도록 주의해주세요
                    type: 'POST',
                    dataType: 'json',
                    data: {
                        'u_id': <%=mvo.getU_id()%>,
                        'totalPrice':rsp.paid_amount,
                        's_num':<%=cart_list.get(0).getS_num()%>,
                        'pay_code':rsp.merchant_uid,
                        'imp_uid': rsp.imp_uid
                   },
                   success: function(data){
                	   console.log(data);
                	   if(data.res == "success")
                		  
                		   alert("성공쓰"); /* loction.href='#' 구매내역으로 보내주기*/
                	   
                   },
                   error:function(){
                	   alert("실패쓰");
                   }
                   
                });
              
                
            }else {
            	var msg = '결제에 실패하였습니다.';
                <%-- msg += '에러내용 : ' + rsp.error_msg;
                //실패시 이동할 페이지 (장바구니 페이지로 이동하기)
                location.href="<%=request.getContextPath()%>/order/payFail";
                 --%>
            } 
            alert(msg);
        });
        
    }
    </script>


<%@include file="../includes/footer.jsp" %>