<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../includes/header_simple.jsp"%>

<%@ page import="java.util.*"%>
<%@ page import="com.spring.gogidang.domain.*"%>

<%
	MemberVO memberVO = (MemberVO) session.getAttribute("memberVO");
	u_id = (String) session.getAttribute("u_id");
	ArrayList<ReviewVO> review_list = (ArrayList<ReviewVO>) request.getAttribute("reviewList");
	PageDTO pageMaker = (PageDTO) request.getAttribute("pageMaker");
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
			<div>
				<h3>내가 작성한 후기</h3>
				<br>
				<center>
					<table border=1>
						<tr align=center>
							<td>등록일</td>
							<td>가게이름</td>
							<td>내용</td>
							<td>수정</td>
						</tr>
						<%
							for (int i = 0; i < review_list.size(); i++) {
								ReviewVO review = (ReviewVO) review_list.get(i);
						%>
						<tr align=center>
							<td><%=review.getReview_date()%></td>
							<td><%=review.getS_name()%></td>
							<td size="6"><%=review.getContent()%></td>
							<td><a
								href="reviewmodifyform.re?review_num=<%=review.getReview_num()%>">수정</a></td>
						</tr>
						<%
							}
						%>
					</table>
				</center>
			</div>
			<!-- content End -->
		</div>
	</div>
</section>
<!-- Product Section End -->

<%@include file="../includes/footer.jsp"%>