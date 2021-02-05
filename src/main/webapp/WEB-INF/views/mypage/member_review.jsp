<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../includes/header_simple.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="com.spring.gogidang.domain.*"%>

<%	
	ArrayList<ReviewVO> reviewList = (ArrayList<ReviewVO>) request.getAttribute("reviewList");
	PageDTO pageMaker = (PageDTO) request.getAttribute("pageMaker");
%>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/member_liststoreStyle.css"
	type="text/css">

<!-- Product Section Begin -->
<section class="product spad">
	<div class="container">
		<div class="row">
			<div class="myreview">
				<div class="col-lg-3" id="nav-bar">
		            <div class="hero__categories">
		                  <div class="hero__categories__all">
		                  	<span>마이페이지</span>
		              	  </div>
		              	  	<ul>
								<li><a href="./updateList.me">내정보</a></li>
								<li><a href="./purchase_list.py?u_id=<%=mvo.getU_id()%>">구매내역</a></li>
								<li><a href="./likeStoreList.li?u_id=<%=mvo.getU_id()%>">찜목록</a></li>
								<li><a href="./reviewListByIdWithPaging.re?u_id=<%=mvo.getU_id()%>">내가
										작성한 후기</a></li>
								<li><a href="./cartList.ct">장바구니</a></li>
							</ul>
						</div>
					</div>

		<!-- ---------------------------------------------------시작----------------------------------------------------- -->
				<div class="col-lg-9">
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
									for (int i = 0; i < reviewList.size(); i++) {
	
										ReviewVO reviewVO = (ReviewVO) reviewList.get(i);
								%>
								<tr align=center>
									<td><%=i + 1%></td>
									<td id = "a_color"><a
										href="storereviewInfo.bo?review_num=<%=reviewVO.getReview_num()%>"><%=reviewVO.getTitle()%></a>
									</td>
									<td><%=reviewVO.getU_id()%></td>
									<td><%=reviewVO.getStar()%></td>
									<td><%=reviewVO.getReview_date()%></td>
	
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

<%@include file="../includes/footer.jsp"%>