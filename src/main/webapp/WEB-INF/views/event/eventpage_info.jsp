<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>   
<%@ page import = "com.spring.gogidang.domain.*" %>
<%@ include file="../includes/header_simple.jsp"%>
<%
	EventVO eventVO = (EventVO)request.getAttribute("eventVO");
%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/event.css"
	type="text/css">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
 <!--네비게이션바 사용 시작-->

	  <section class="product spad">
			<div class="container">
					<div class="row">
						<div class="rowNotice">
							<div class="col-lg-3 col-md-5">
								<div class="sidebar">
									<div class="sidebar__item">
										<h4>이벤트</h4>
										<ul>
											<li><a href="eventList.ev">이벤트</a></li>
											<li><a href="noticelist.no">공지사항</a></li>
											<li><a href="qnalist.qn">문의</a></li>
											<!--<li><a href="#">Fastfood</a></li>
					                            <li><a href="#">Fresh Onion</a></li>
					                            <li><a href="#">Papayaya & Crisps</a></li>
					                             <li><a href="#">Oatmeal</a></li>
					                            <li><a href="#">Fresh Bananas</a></li> -->
										</ul>
									</div>
								</div>
							</div>
	            			<div class="eventList">
	            				<div class="section-title product__discount__title">
	          						<h2>이벤트 상세정보</h2>
	    						</div>
								<div class="row">
										<div class="col-md-12">
											<%-- <img src="<%=eventVO.getPhoto()%>" /> --%>
											<h5><%=eventVO.getThumbnail() %></h5>
												<div class="eventd">
													<h5>${eventVO.getContent()}</h5>
												</div>
										</div>
	            				</div>
	           				</div>
	           		</div>
	           </div>
	      </div>
	</section>
	<%@include file="../includes/footer.jsp"%>
</body>
</html>