<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="com.spring.gogidang.domain.*"%>
<%@ include file="../includes/header_simple.jsp"%>

<%
	u_id = null;
	u_id = (String) session.getAttribute("u_id");

	List<NoticeVO> noticelist = (List<NoticeVO>) request.getAttribute("noticelist");
	int listcount = ((Integer) request.getAttribute("listcount")).intValue();
	int nowpage = ((Integer) request.getAttribute("page")).intValue();
	int maxpage = ((Integer) request.getAttribute("maxpage")).intValue();
	int startpage = ((Integer) request.getAttribute("startpage")).intValue();
	int endpage = ((Integer) request.getAttribute("endpage")).intValue();
%>

<title>공지사항</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/notice.css"
	type="text/css">


<section class="product spad">
	<div class="container">
		<div class="row">
		
				<div class="col-lg-3" id="nav-bar">
		            <div class="hero__categories">
		                  <div class="hero__categories__all">
		                  	<span>공지사항</span>
		              	 </div>
								<ul>
									<li><a href="noticelist.no">공지사항</a></li>
									<li><a href="qnalist.qn">문의</a></li>
									<li><a href="eventList.ev">이벤트</a></li>
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
						<h2>공지사항</h2>
					</div>
					<table class="table table-striped">
						<thead>
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>날짜</th>
							</tr>
						</thead>

						<tbody>
							<tr>
								<%
									int notice_num = listcount - ((nowpage - 1) * 10);
									for (int i = 0; i < noticelist.size(); i++) {
										NoticeVO nl = (NoticeVO) noticelist.get(i);
								%>
								<td><%=notice_num%></td>

								<td><a
									href="./noticedetail.no?notice_num=<%=nl.getNotice_num()%>">
										<%=nl.getTitle()%>
								</a></td>
								<td><%=nl.getU_id()%></td>
								<td><%=nl.getRe_date()%></td>

							</tr>

							<%
								notice_num--;
								}
							%>
						</tbody>
					</table>
					
					<div class="product__pagination">
						<div class="paging">
						<% if(nowpage <= 1) { %>
						<a href="#"><i class="fa fa-long-arrow-left"></i></a>
						<%}else{%>
						<a href="./noticelist.no?page=<%=nowpage - 1%>"><i class="fa fa-long-arrow-left"></i></a>
						<%} %>
						<% 
							for(int a =startpage; a<=endpage; a++){
								if(a== nowpage){
						%>
						<a href="./noticelist.no?page=<%=a%>"><%=a %></a>
						<%}else{ %>
                        <a href="./noticelist.no?page=<%=a%>"><%=a %></a>
                        <%} 
                        	}%>
						<%if(nowpage >= maxpage) {%>
                        <a href="#"><i class="fa fa-long-arrow-right"></i></a>
                        <%}else{ %>
                        <a href="./noticelist.no?page=<%=nowpage + 1%>"><i class="fa fa-long-arrow-right"></i></a>
                        <%} %>
				</div>
			</div>
			</div>
		</div>
	</div>
</section>

<%@include file="../includes/footer.jsp"%>