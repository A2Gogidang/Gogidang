<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../includes/header.jsp"%>
	
<%@ page import="java.util.*"%>
<%@ page import="com.spring.gogidang.domain.*"%>

<%
	MemberVO memberVO = (MemberVO) session.getAttribute("memberVO");
	StoreVO storevo = (StoreVO) session.getAttribute("StoreVO");
	ArrayList<LikeStoreVO> likeStoreList = (ArrayList<LikeStoreVO>) request.getAttribute("likeStoreList");
%>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/member_liststoreStyle.css"
	type="text/css">

<!-- Product Section Begin -->
<section class="product spad">
	<div class="container">
		<div class="row">
			<div class="col-lg-3 col-md-5">
				<div class="sidebar">
					<div class="sidebar__item">
						<h4>마이페이지</h4>
						<ul>
							<li><a href="./updateList.me">내정보</a></li>
							<li><a href="./bookingList.bo?u_id=<%=memberVO.getU_id()%>">내예약확인</a></li>
							<li><a
								href="./likeStoreList.li?u_id=<%=memberVO.getU_id()%>">찜목록</a></li>
							<li><a
								href="./reviewListByIdWithPaging.re?u_id=<%=memberVO.getU_id()%>">내가
									작성한 후기</a></li>
							<li><a href="./cartList.ct">장바구니</a></li>
						</ul>
					</div>
				</div>
			</div>
			<!-- content Start -->
			<div class="update">
				<h2>찜한가게</h2>
			</div>
			<div class="card_box">
				<%
					//for(int i=0;i<likestore_list.size();i++){
					//LikeStoreVO likestore=(LikeStoreVO)likestore_list.get(i);
					for (int i = 0; i < likeStoreList.size(); i++) {
						LikeStoreVO lsvo = likeStoreList.get(i);
				%>
				<br /> <br /> <br />

				<div id="card">
					<div class="card" style="width: 18rem;">
						<a href="./storeInfo.st?s_num=<%=lsvo.getS_num()%>"><img
							src="resources/img/store/<%=lsvo.getThumbnail()%>"
							class="card-img-top" width="200" height="150"></a>
						<div class="card-body">
							<p class="card-text">
								<a href="./storeInfo.st?s_num=<%=lsvo.getS_num()%>"><%=lsvo.getS_name()%></a>
							</p>
						</div>
					</div>
				</div>
				<%
					}
				%>
			</div>
			<!-- content End -->
		</div>
	</div>
</section>
<!-- Product Section End -->

<%@include file="../includes/footer.jsp"%>