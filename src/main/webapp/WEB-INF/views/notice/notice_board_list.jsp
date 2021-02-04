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
			<div class="rowNotice">
				<div class="col-lg-3 col-md-5">
					<div class="sidebar">
						<div class="sidebar__item">
							<h4>공지사항</h4>
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
				<div class="qnaList">
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
						<a href="#"><i class="fa fa-long-arrow-left"></i></a>
                        <a href="#">1</a>
                        <a href="#">2</a>
                        <a href="#">3</a>
                        <a href="#"><i class="fa fa-long-arrow-right"></i></a>
                    </div>
				</div>
			</div>

		</div>
	</div>
</section>

<%@include file="../includes/footer.jsp"%>