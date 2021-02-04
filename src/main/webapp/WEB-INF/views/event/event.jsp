<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="com.spring.gogidang.domain.*"%>

<%@ include file="../includes/header_simple.jsp"%>
<%
	ArrayList<EventVO> event_list = (ArrayList<EventVO>) request.getAttribute("event_list");
%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/event.css"
	type="text/css">
<title>Insert title here</title>
<style>
.col-md-12 {
	margin-top: 30px;
}
</style>



<section class="product spad">
	<div class="container">
			<div class="row">
				<div class="rowNotice">
					<div class="col-lg-3" id="nav-bar">
			            <div class="hero__categories">
			                  <div class="hero__categories__all">
			                  	<span>이벤트</span>
			              	 </div>
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

					<div class="col-lg-9">
						<div class="section-title product__discount__title">
							<h2>이벤트</h2>
						</div>

								<%
									for (int i = 0; i < event_list.size(); i++) {
										EventVO vo = (EventVO) event_list.get(i);
								%>

									<div class="col-md-12">
										<a href="eventGet.ev?event_num=<%=vo.getEvent_num()%>">
										<img src="resources/img/event/<%=vo.getPhoto() %>" /> </a>
									</div>

							<%
								}
							%>
							
					</div>
				</div>	
			</div>
	</div>
</section>

<%@include file="../includes/footer.jsp"%>
