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
	href="${pageContext.request.contextPath}/resources/css/updateList.css"
	type="text/css">

<!-- Product Section Begin -->
<section class="product spad">
        <div class="container">
            <div class="row">
 <div class="col-lg-3 col-md-5">
				<div class="sidebar">
					<div class="sidebar__item">
						<%
				if (u_id.equals("admin")) {
			%>
			<h4>관리자 페이지</h4>
			<ul>
				<li><a href="storeWait.st">대기중인 가게 승인</a></li>
				<li><a href="noticeAdmin.no">공지사항 관리</a></li>
				<li><a href="qnaAdmin.qn">문의 관리</a></li>
				<li><a href="eventAdmin.ev">이벤트 관리</a></li>
			</ul>
			<%
				} else {
					if (memberVO.getSeller_key() == 0) {
			%>
			<h4>마이페이지</h4>
			<ul>
				<li><a href="./updateList.me">내정보</a></li>
				<li><a href="./bookingList.bo?u_id=<%=memberVO.getU_id()%>">내예약확인</a></li>
				<li><a href="./likeStoreList.li?u_id=<%=memberVO.getU_id()%>">찜목록</a></li>
				<li><a
					href="./reviewListByIdWithPaging.re?u_id=<%=memberVO.getU_id()%>">내가
						작성한 후기</a></li>
				<!-- <li><a href="./cartList.ct">장바구니</a></li> -->
				<li><a href="./cartList.ct">장바구니</a></li>
			</ul>
			<%
				} else {
						if (storevo == null || storevo.getConfirm() == 0 || storevo.getS_num() == 0) {
			%>
			<h4>판매자 마이페이지</h4>
			<ul>
				<li><a href="./updateList.me">내정보</a></li>
				<li><a href="./storeRegForm.st">가게 정보</a>
			</ul>
			<%
				} else {
			%>
			<h4>판매자 마이페이지</h4>
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
			</div>
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
								<form name="updateform" action="./updateForm.me"
									method="post">
									<div class="updateform_info">
									<div class="id_input_box">
										<ts>아이디</ts>
										<td> <input type="text" name="u_id"
											value="<%=memberVO.getU_id()%>" readonly
											style="font-size: 13px;" /></td>
									</div>

									<div class="id_input_box">
										<ts>비밀번호</ts>
										<td> <input type="password" name="u_pw"
											value="<%=memberVO.getU_pw()%>" readonly
											style="font-size: 13px;" /></td>
									</div>

									<div class="id_input_box">
										<ts>이름</ts>
										<td> <input type="text" name="u_name"
											value="<%=memberVO.getU_name()%>" readonly
											style="font-size: 13px;" /></td>
									</div>

									<div class="id_input_box">
										<ts>닉네임</ts>
										<td> <input type="text" name="u_nick"
											value="<%=memberVO.getU_nick()%>" readonly
											style="font-size: 13px;" /></td>
									</div>

									<div class="id_input_box">
										<ts>생년월일</ts>
										<td> <input type="text" name="u_birth"
											value="<%=memberVO.getU_birth()%>" readonly
											style="font-size: 13px;" /></td>
									</div>

									<div class="id_input_box">
										<ts>주소</ts>
										<td> <input type="text" name="u_addr"
											value="<%=memberVO.getU_addr()%>" readonly
											style="font-size: 13px;" /></td>
									</div>

									<div class="id_input_box">
										<ts>이메일 주소</ts>
										<td> <input type="text" name="u_email"
											value="<%=memberVO.getU_email()%>" readonly
											style="font-size: 13px;" /></td>
									</div>

									<div class="id_input_box">
										<ts>핸드폰 번호</ts>
										<td> <input type="text" name="u_phone"
											value="<%=memberVO.getU_phone()%>" readonly
											style="font-size: 13px;" /></td>
									</div>

									<div class="update_btn">
										<button class="btn-jj btn-lg btn-block btn-success">
											수정하기</button>
									</div>
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