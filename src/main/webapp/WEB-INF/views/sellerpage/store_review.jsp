<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.spring.gogidang.domain.*"%>
<%@include file="../includes/header_simple.jsp"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/store_reviewStyle.css"
	type="text/css">
<%
	ArrayList<SRReviewVO> srReviewList = (ArrayList<SRReviewVO>) request.getAttribute("srReviewList");
	MemberVO memberVO = (MemberVO) session.getAttribute("memberVO");
%>

<!-- Product Section Begin -->
<section class="product spad">
	<div class="container">
		<div class="row">
			<div class="col-lg-3 col-md-5">
				<div class="sidebar">
					<div class="sidebar__item">
						<h4>판매자 마이페이지</h4>
						<ul>
							<li><a href="./updateList.me">내정보</a></li>
							<li><a href="./storeRegForm.st">가게 정보</a></li>
							<li><a href="./menuRegForm.mn">메뉴 등록</a></li>
							<li><a href="./storeNoticeList.no">문의 관리</a></li>
							<li><a href="./storereviewList.bo">리뷰 관리</a></li>
						</ul>
					</div>
				</div>
			</div>
			<!-- ---------------------------------------------------시작----------------------------------------------------- -->
			<div class="reviewboard">
				<div class="section-title product__discount__title">
					<h2>리뷰 관리</h2>
				</div>
				<div class="container">
					<table class="table table-hover">
						<thead>
							<tr align=center>
								<th>번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>별점</th>
								<th>등록일</th>
								<th>답변 상태</th>
							</tr>
						</thead>
						<tbody class="text-center">
							<%
								for (int i = 0; i < srReviewList.size(); i++) {

									SRReviewVO srReviewvo = (SRReviewVO) srReviewList.get(i);
							%>
							<tr align=center>
								<td><%=i + 1%></td>
								<td><a
									href="storereviewInfo.bo?review_num=<%=srReviewvo.getReview_num()%>"><%=srReviewvo.getTitle()%></a>
								</td>
								<td><%=srReviewvo.getU_id()%></td>
								<td><%=srReviewvo.getStar()%></td>
								<td><%=srReviewvo.getReview_date()%></td>

								<%
									if (srReviewvo.getRe_content() == null || srReviewvo.getRe_content() == "") {
								%>
								<td>
									<button class="button">답변 등록</button>
								</td>

								<%
									} else {
								%>
								<td>답변 완료</td>
								<%
									}
								%>

								<%
									}
								%>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<!-- ----------------------------------------------------끝---------------------------------------------------- -->
		</div>
	</div>
</section>
<!-- Product Section End -->

<%@include file="../includes/footer.jsp"%>