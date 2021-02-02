<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<%@ page import="java.util.*"%>
<%@ include file="../includes/header_simple.jsp"%>
<%@ page import="com.spring.gogidang.domain.*"%>
<%
	StoreVO storevo = (StoreVO)session.getAttribute("storeVO");
	CartVO cvo = (CartVO)session.getAttribute("CartVO");
	ArrayList<CartVO> cart_list = (ArrayList<CartVO>)session.getAttribute("cart_list");
	int totalPrice = 0;	
	
%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/cartStyle.css"
	type="text/css">
    <!-- Header Section End -->

  

   <!-- Product Section Begin -->
<section class="product spad">
	<div class="container">
		<div class="row">
			
			<!-- 좌측네비바 시작 -->
			<div class="col-lg-3" id="nav-bar">
				<div class="hero__categories">
						<%
						if (u_id.equals("admin")) {
						%>
						<div class="hero__categories__all">
							<span>관리자 페이지</span>
						</div>
						<ul>
							<li><a href="storeWait.st">대기중인 가게 승인</a></li>
							<li><a href="noticelist.no">공지사항 관리</a></li>
							<li><a href="qnalist.qn">문의 관리</a></li>
							<li><a href="eventList.ev">이벤트 관리</a></li>
							<!--<li><a href="#">Fastfood</a></li>
	                            <li><a href="#">Fresh Onion</a></li>
	                            <li><a href="#">Papayaya & Crisps</a></li>
	                             <li><a href="#">Oatmeal</a></li>
	                            <li><a href="#">Fresh Bananas</a></li> -->
						</ul>
						<%
							} else {
								if (mvo.getSeller_key() == 0) {
						%>
						<div class="hero__categories__all">
						<span>마이페이지</span>
						</div>
						<ul>
							<li><a href="./updateList.me">내정보</a></li>
							<li><a href="./bookingList.bo?u_id=<%=mvo.getU_id()%>">내예약확인</a></li>
							<li><a href="./likeStoreList.li?u_id=<%=mvo.getU_id()%>">찜목록</a></li>
							<li><a
								href="./reviewListByIdWithPaging.re?u_id=<%=mvo.getU_id()%>">내가
									작성한 후기</a></li>
							<!--<li><a href="./cartList.ct">장바구니</a></li>  -->
							<li><a href="./cartTest.ct">장바구니</a></li>
							
						</ul>
						
						<%
							} else {
									if (storevo == null || storevo.getConfirm() == 0 || storevo.getS_num() == 0) {
						%>
						<div class="hero__categories__all">
						<span>판매자 마이페이지</span>
						</div>
						<ul>
							<li><a href="./updateList.me">내정보</a></li>
							<li><a href="./storeRegForm.st">가게 정보</a>
						</ul>
						
									<%
									} else {
									%>
						<!-- <h4>판매자 마이페이지</h4> -->
						<div class="hero__categories__all">
						<span>판매자 마이페이지</span>
						</div>
						<ul>
							<li><a href="./updateList.me">내정보</a></li>
							<li><a href="./storeRegForm.st">가게 정보</a></li>
							<li><a href="./menuRegForm.mn">메뉴 등록</a></li>
							<li><a href="./storeNoticeList.no">문의 관리</a></li>
							<li><a href="./storereviewList.bo">리뷰 관리</a></li>
						</ul>
						
						<%
							}
								}
							}
						%>
					</div>
				</div>
			<!-- 좌측네비바 끝 -->	

    <!-- Shoping Cart Section Begin -->
   
                <div class="col-lg-9">
                    <div class="shoping__cart__table">
                        <table>
                            <thead>
                                <tr>
                                    <th class="shoping__product">상품</th>
                                    <th>가격</th>
                                    <th>수량</th>
                                    <th>합 계</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
 <!-- ----------------------------------시작------------------------------------------------------------- -->
<%	

	for(int i =0; i < cart_list.size(); i++){
		
		CartVO cvo_list = (CartVO)cart_list.get(i);
		
		int price = cvo_list.getPrice() * cvo_list.getCartStock(); 
		totalPrice = price + totalPrice;
		
		java.sql.Date sqlDate = new java.sql.Date(cvo_list.getAddDate().getTime());
%>	
				<form id = "cartDelet<%=i %>" action="./cartdelete.ct">
					<input type="hidden" id ="cartNum" name="cartNum" value="<%=cvo_list.getCartNum() %>">
                                <tr>
                                    <td class="shoping__cart__item">
                                        <img src="img/cart/cart-1.jpg" alt="">
                                        <h5><%=cvo_list.getMenu_name() %></h5>
                                    </td>
                                    <td class="shoping__cart__price">
                                       <%=price %>
                                    </td>
                                    <td class="shoping__cart__quantity">
                                        <div class="quantity">
                                            <div class="pro-qty">
                                                <input type="text" value="1">
                                            </div>
                                        </div>
                                    </td>
                                    <td class="shoping__cart__total">
                                       <%=totalPrice %>
                                    </td>
                                    <td class="shoping__cart__item__close">
                                        <span class="icon_close"><input type="submit" value="삭제" id="cartDelet<%=i%>"/></span>
                                    </td>
                                </tr>
				</form>
<%
	}
%>	
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__btns">
                        <a href="#" class="primary-btn cart-btn">쇼핑 계속 하기</a>
                        <!-- <a href="#" class="primary-btn cart-btn cart-btn-right"><span class="icon_loading"></span>
                            Upadate Cart</a> -->
                    </div>
                </div>
             </div>  
             
             <div class="row">
             	<div class="col-lg-3"></div>
                <div class="col-lg-9">
                    <div class="shoping__checkout">
                        <h5>Cart Total</h5>
                        <ul>
                            <li id="ul-li">소 계 <span>39,000 원</span></li>
                            <li>상차림비<span>3,000 원</span></li>
                            <li id="tot-li">Total <span><%=totalPrice %></span></li>
                        </ul>
                        <button onclick="pay()" class="primary-btn">PROCEED TO CHECKOUT</button>
                    </div>
                </div>
            </div><!-- col-lg-6 -->

        </div>
    </section>
    <!-- Shoping Cart Section End -->

    <!-- Footer Section Begin -->
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
<%@include file="../includes/footer.jsp"%>