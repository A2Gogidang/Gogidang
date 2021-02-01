<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<%@ page import="java.util.*"%>
<%@ include file="../includes/header_simple.jsp"%>
<%@ page import="com.spring.gogidang.domain.*"%>
<%
	MemberVO memberVO = (MemberVO) session.getAttribute("memberVO");
	u_id = memberVO.getU_id();
	StoreVO storevo = (StoreVO) session.getAttribute("StoreVO");
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
								if (memberVO.getSeller_key() == 0) {
						%>
						<div class="hero__categories__all">
						<span>마이페이지</span>
						</div>
						<ul>
							<li><a href="./updateList.me">내정보</a></li>
							<li><a href="./bookingList.bo?u_id=<%=memberVO.getU_id()%>">내예약확인</a></li>
							<li><a href="./likeStoreList.li?u_id=<%=memberVO.getU_id()%>">찜목록</a></li>
							<li><a
								href="./reviewListByIdWithPaging.re?u_id=<%=memberVO.getU_id()%>">내가
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
                                <tr>
                                    <td class="shoping__cart__item">
                                        <img src="img/cart/cart-1.jpg" alt="">
                                        <h5>Vegetable’s Package</h5>
                                    </td>
                                    <td class="shoping__cart__price">
                                        $55.00
                                    </td>
                                    <td class="shoping__cart__quantity">
                                        <div class="quantity">
                                            <div class="pro-qty">
                                                <input type="text" value="1">
                                            </div>
                                        </div>
                                    </td>
                                    <td class="shoping__cart__total">
                                        $110.00
                                    </td>
                                    <td class="shoping__cart__item__close">
                                        <span class="icon_close"></span>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="shoping__cart__item">
                                        <img src="img/cart/cart-2.jpg" alt="">
                                        <h5>Fresh Garden Vegetable</h5>
                                    </td>
                                    <td class="shoping__cart__price">
                                        $39.00
                                    </td>
                                    <td class="shoping__cart__quantity">
                                        <div class="quantity">
                                            <div class="pro-qty">
                                                <input type="text" value="1">
                                            </div>
                                        </div>
                                    </td>
                                    <td class="shoping__cart__total">
                                        $39.99
                                    </td>
                                    <td class="shoping__cart__item__close">
                                        <span class="icon_close"></span>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="shoping__cart__item">
                                        <img src="img/cart/cart-3.jpg" alt="">
                                        <h5>Organic Bananas</h5>
                                    </td>
                                    <td class="shoping__cart__price">
                                        $69.00
                                    </td>
                                    <td class="shoping__cart__quantity">
                                        <div class="quantity">
                                            <div class="pro-qty">
                                                <input type="text" value="1">
                                            </div>
                                        </div>
                                    </td>
                                    <td class="shoping__cart__total">
                                        $69.99
                                    </td>
                                    <td class="shoping__cart__item__close">
                                        <span class="icon_close"></span>
                                    </td>
                                </tr>
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
                            <li>배송비 <span>3,000 원</span></li>
                            <li id="tot-li">Total <span>$454.98</span></li>
                        </ul>
                        <a href="#" class="primary-btn">PROCEED TO CHECKOUT</a>
                    </div>
                </div>
            </div><!-- col-lg-6 -->

        </div>
    </section>
    <!-- Shoping Cart Section End -->

    <!-- Footer Section Begin -->

<%@include file="../includes/footer.jsp"%>