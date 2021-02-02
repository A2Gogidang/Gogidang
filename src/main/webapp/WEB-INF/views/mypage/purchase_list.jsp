<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.spring.gogidang.domain.*" %>
<%@include file="../includes/header_simple.jsp"%>
<%
	ArrayList<PayVO> purchase_list =  (ArrayList<PayVO>)request.getAttribute("purchase_list");
%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/member_liststoreStyle.css"
	type="text/css">

<!-- Product Section Begin -->
<section class="product spad">
	<div class="container">
		<div class="row">
			<div class="myreview">
				<div class="col-lg-3 col-md-5">
					<div class="sidebar">
						<div class="sidebar__item">
							<h4>마이페이지</h4>
							<ul>
								<li><a href="./updateList.me">내정보</a></li>
								<li><a href="./purchase_list.py?u_id=<%=mvo.getU_id()%>">구매내역</a></li>
								<li><a
									href="./likeStoreList.li?u_id=<%=mvo.getU_id()%>">찜목록</a></li>
								<li><a
									href="./reviewListByIdWithPaging.re?u_id=<%=mvo.getU_id()%>">내가
										작성한 후기</a></li>
								<li><a href="./cartList.ct">장바구니</a></li>
							</ul>
						</div>
					</div>
				</div>
		<!-- ---------------------------------------------------시작----------------------------------------------------- -->
				<div class="reviewboard">
					<div class="section-title product__discount__title">
						<h2>구매내역</h2>
					</div>
					<div class="container">
						<table class="table table-hover">
							<thead>
								<tr align=center>
									<th>번호</th>
									<th>가게명</th>
									<th>구매 금액</th>
									<th>구매 일자</th>
								</tr>
							</thead>
							<tbody class="text-center">
								<%
									for (int i = 0; i < purchase_list.size(); i++) {
	
										PayVO pvo = (PayVO) purchase_list.get(i);
								%>
								<tr align=center>
									<td><%=i + 1%></td>
									<td><%=pvo.getS_name()%></td>
									<td><%=pvo.getTotalPrice()%></td>
									<td><%=pvo.getPaydate()%></td>
									<%
										}
									%>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<!-- ----------------------------------------------------끝---------------------------------------------------- -->
		</div>
	</div>
</section>
<!-- Product Section End -->

<%@include file="../includes/footer.jsp" %>