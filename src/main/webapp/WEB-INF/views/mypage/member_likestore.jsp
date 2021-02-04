<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../includes/header_simple.jsp"%>
	
<%@ page import="java.util.*"%>
<%@ page import="com.spring.gogidang.domain.*"%>

<%
	MemberVO memberVO = (MemberVO) session.getAttribute("memberVO");
	StoreVO storevo = (StoreVO) session.getAttribute("StoreVO");
	ArrayList<LikeStoreVO> likeStoreList = (ArrayList<LikeStoreVO>) request.getAttribute("likeStoreList");
%>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/likestore.css"
	type="text/css">

<!-- Product Section Begin -->
<section class="product spad">
	<div class="container">
		<div class="row">
			<div class="likestore">
				<div class="col-lg-3" id="nav-bar">
		            <div class="hero__categories">
		                  <div class="hero__categories__all">
		                  	<span>마이페이지</span>
		              	  </div>
								<ul>
									<li><a href="./updateList.me">내정보</a></li>
									<li><a href="./purchase_list.py?u_id=<%=memberVO.getU_id()%>">구매내역</a></li>
									<li><a href="./likeStoreList.li?u_id=<%=memberVO.getU_id()%>">찜목록</a></li>
									<li><a href="./reviewListByIdWithPaging.re?u_id=<%=memberVO.getU_id()%>">내가작성한 후기</a></li>
									<li><a href="./cartList.ct">장바구니</a></li>
								</ul>
							</div>
						</div>

			<!-- ---------------------------------------------------시작----------------------------------------------------- -->
					<div class="col-lg-9">
						<div class="section-title product__discount__title">
							<h2>찜 목록</h2>
						</div>
						<div class="linez"></div>
						<div class="row">
							<%
								//for(int i=0;i<likestore_list.size();i++){
								//LikeStoreVO likestore=(LikeStoreVO)likestore_list.get(i);
								for (int i = 0; i < likeStoreList.size(); i++) {
									LikeStoreVO lsvo = likeStoreList.get(i);
							%>
							<div class="col-lg-4 col-md-6 col-sm-6">
								<div class="product_item">
									<a href="./storeInfo.st?s_num=<%=lsvo.getS_num()%>"><img
										src="resources/img/store/<%=lsvo.getThumbnail()%>"></a>
                             
								 <div class="card-text">
								 	<a href="./storeInfo.st?s_num=<%=lsvo.getS_num()%>"><%=lsvo.getS_name()%></a><i class="fa fa-heart"style="color: rgb(222, 131, 175, 0.8); margin-top:3px;"></i>
								 </div>
								 </div>
							</div>
							<%
								}
							%>
						</div>
					</div>
				</div>	
			</div>	
		</div>
</section>
<!-- Product Section End -->

<%@include file="../includes/footer.jsp"%>