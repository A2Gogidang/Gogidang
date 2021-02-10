<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.spring.gogidang.domain.*"%>
<%@ page import="java.util.ArrayList"%>

<%
	ArrayList<ReviewVO> reviewList = (ArrayList<ReviewVO>) request.getAttribute("reviewList");
%>

<%@include file="../includes/header_simple.jsp"%>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/shopgrid.css"
	type="text/css">
<%-- 
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/storelist.css"
	type="text/css">
 --%>
<!-- Product Section Begin -->
<section class="product spad">
	<div class="container">
		<div class="reviewl">
			<div class="reviewlist">
				<div class="reviewlistt">
					<div class="shoplis">
						<div class="shoplistt">
							<div class="section-title product__discount__title">
								<h2>리뷰리스트</h2>
							</div>
						</div>
						<div class="shoplist">
							<div class="shoplistone">
								<div class="shoplistoness">
									<i class="fa fa-search" aria-hidden="true"></i>
								</div>
								<div class="shoplistones">
									<h3>S E A R C H</h3>
								</div>
							</div>
							<div class="shoplisttwo">
								<div class="shoplisttwoo">
									<h5>지역</h5>
								</div>
								<div class="shoplisttwot">
									<li><input type="checkbox" id="s_seoul" class="f_check"
										name="f_Acheck" value="서울">서울</li>
									<li><input type="checkbox" id="s_gyeong" class="f_check"
										name="f_Acheck" value="경기">경기</li>
									<li><input type="checkbox" id="s_gang" class="f_check"
										name="f_Acheck" value="강원">강원</li>
									<li><input type="checkbox" id="s_jeon" class="f_check"
										name="f_Acheck" value="전라">전라</li>
									<li><input type="checkbox" id="s_gyeong" class="f_check"
										name="f_Acheck" value="경상">경상</li>
									<li><input type="checkbox" id="s_chung" class="f_check"
										name="f_Acheck" value="충청">충청</li>
								</div>
							</div>
							<div class="shoplistth">
								<div class="shoplisttho">
									<h5>품목</h5>
								</div>
								<div class="shoplisttht">
									<li><input type="checkbox" id="cow" class="f_check"
										name="f_Mcheck" value="0">소고기</li>
									<li id="pig_li"><input type="checkbox" id="pig" class="f_check"
										name="f_Mcheck" value="1">돼지고기</li>
								</div>
							</div>
							
							<div class="shopliststar">
								<div class="shopliststarone">
									<h5>별점</h5>
								</div>
								<div class="shopliststartwo">
									<li><input type="radio" id="one" class="f_check"
										name="f_Scheck" value="0" checked />모든별점</li>
									<li><input type="radio" id="one" class="f_check"
										name="f_Scheck" value="1" />1점 이상</li>
									<li><input type="radio" id="two" class="f_check"
										name="f_Scheck" value="2" />2점 이상</li>
									<li><input type="radio" id="three" class="f_check"
										name="f_Scheck" value="3" />3점 이상</li>
									<li><input type="radio" id="four" class="f_check"
										name="f_Scheck" value="4" />4점 이상</li>
									<li><input type="radio" id="five" class="f_check"
										name="f_Scheck" value="5" />5점 이상</li>
								</div>
							</div>
							
							<div class="shoplistb">
								<div class="shoplistbu">
									<div class="shoplist_but">
										<button class="site-btn" type="button" name="button"
											id="checkBtn" style="">검색</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				<div class="row" id="reviewListContent" name="reviewListContent" style="width: 960px; margin-top: 30px;">
					<%
						for (int i = 0; i < reviewList.size(); i++) {
							ReviewVO rvo = (ReviewVO) reviewList.get(i);
					%>
					<div class="col-lg-4 col-md-6 col-sm-6">
						<div class="product__item">
							<div class="product__item__pic set-bg"
								data-setbg="./resources/img/store/<%=rvo.getReview_img1() %>"></div>
							<div class="product__item__text">
								<h6>
									<a href="./reviewDetail.re?review_num=<%=rvo.getReview_num()%>"><%=rvo.getTitle()%></a>
								</h6>
								<span id="reviewStar" style="color: #edbb0e;"> 
								<%
								for (int j=0; j<rvo.getStar(); j++) {
 								%> 
 								<sapn class="fa fa-star" />
 								<%
 								}
 								%> 
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
</section>

<script src="https://code.jquery.com/jquery-latest.js"></script>

<script type="text/javascript" charset="utf-8"
	src="${pageContext.request.contextPath}/resources/js/reviewlistAjaxx.js"></script>

<%@include file="../includes/footer.jsp"%>



