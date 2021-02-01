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
	href="${pageContext.request.contextPath}/resources/css/updateStyle.css"
	type="text/css">

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
			
			
			<!-- content Start -->
			<div class="reviewboard">
				<!-- Hero Section End -->
				<div class="container" id="update">
					<div class="section-title product__discount__title">
						<h2>내정보</h2>
					</div>
					<div class="row justify-content-center">
						<div class="col-lg-8">
							<div class="update">
								<form name="seller_info_form" action="./updateForm.me"
									method="post">
									<div class="id_input_box">
										<ts>아이디</ts>
										<ts> <input type="text" name="u_id"
											value="<%=memberVO.getU_id()%>" readonly
											style="font-size: 13px;" /></ts>
									</div>

									<div class="id_input_box">
										<ts>비밀번호</ts>
										<ts> <input type="password" name="u_pw"
											value="<%=memberVO.getU_pw()%>" readonly
											style="font-size: 13px;" /></ts>
									</div>

									<div class="id_input_box">
										<ts>이름</ts>
										<ts> <input type="text" name="u_name"
											value="<%=memberVO.getU_name()%>" readonly
											style="font-size: 13px;" /></ts>
									</div>

									<div class="id_input_box">
										<ts>닉네임</ts>
										<ts> <input type="text" name="u_nick"
											value="<%=memberVO.getU_nick()%>" readonly
											style="font-size: 13px;" /></ts>
									</div>

									<div class="id_input_box">
										<ts>생년월일</ts>
										<ts> <input type="text" name="u_birth"
											value="<%=memberVO.getU_birth()%>" readonly
											style="font-size: 13px;" /></ts>
									</div>

									<div class="id_input_box">
										<ts>주소</ts>
										<ts> <input type="text" name="u_addr"
											value="<%=memberVO.getU_addr()%>" readonly
											style="font-size: 13px;" /></ts>
									</div>

									<div class="id_input_box">
										<ts>이메일 주소</ts>
										<ts> <input type="text" name="u_email"
											value="<%=memberVO.getU_email()%>" readonly
											style="font-size: 13px;" /></ts>
									</div>

									<div class="id_input_box">
										<ts>핸드폰 번호</ts>
										<ts> <input type="text" name="u_phone"
											value="<%=memberVO.getU_phone()%>" readonly
											style="font-size: 13px;" /></ts>
									</div>

									<div class="join_btn">
										<button class="btn-jj btn-lg btn-block btn-success">
											수정하기</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- content End -->
		</div>
	</div>
</section>
<!-- Product Section End -->


<%@include file="../includes/footer.jsp"%>