<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="com.spring.gogidang.domain.*"%>

<%@ include file="../includes/header_simple.jsp"%>
<%
	ArrayList<EventVO> event_list = (ArrayList<EventVO>) request.getAttribute("event_list");
%>
<title>Insert title here</title>
<style>
.col-md-12 {
	margin-top: 30px;
}
</style>

<div class="section-title" style="margin-top: 70px;">
	<h2 style="margin-top: 30px;">이벤트</h2>
</div>

<section class="product spad">
	<div class="container">
		<div class="container-fluid">
			<div class="row">
				<div class="qnaList" style="width: 960px; margin-left: 50px;">
					<table class="table table-striped">
						<tr>
							<%
								for (int i = 0; i < event_list.size(); i++) {
									EventVO vo = (EventVO) event_list.get(i);
							%>
							<div class="row">
								<div class="col-md-12">
									<a href="eventGet.ev?event_num=<%=vo.getEvent_num()%>"><img
										alt="Bootstrap Image Preview"
										src="resources/img/event/eventPicex.jpg" /> </a>
								</div>
							</div>
						</tr>
						<%
							}
						%>
					</table>
					<!-- 					<div class="qna_insert" style="text-align: right;">
						<a href="noticewriteform.no"><button type="button"
								class="btn btn-lg btn-outline-secondary"
								style="background-color: #076507; color: white;">글쓰기</button> </a>
					</div> -->
				</div>
			</div>
			<%-- <div class="container-fluid">
				<div class="row">
					<div class="col-md-2"></div>
					<div class="col-md-8">
						<class class="pagination-lg">
						<ul class="pagination"
							style="margin-bottom: 30px; display: flex; justify-content: center; align-items: center;">
							<%
								if (nowpage <= 1) {
							%>

							<li class="page-item"><a class="page-link"
								style="color: rgb(51, 131, 51);">Previous</a></li>
							<%
								} else {
							%>
							<li class="page-item"><a class="page-link"
								href="./noticelist.no?page=<%=nowpage - 1%>"
								style="color: rgb(51, 131, 51);">Previous</a></li>
							<%
								}
							%>
							<%
								for (int a = startpage; a <= endpage; a++) {
									if (a == nowpage) {
							%>
							<%=a%>
							<%
								} else {
							%>
							<li class="page-item"><a class="page-link"
								href="./noticelist.no?page=<%=a%>"
								style="color: rgb(51, 131, 51);"><%=a%></a></li>
							<%
								}
							%>
							<%
								}
							%>
							<%
								if (nowpage >= maxpage) {
							%>

							<li class="page-item"><a class="page-link"
								style="color: rgb(51, 131, 51);">Next</a></li>
							<%
								} else {
							%>
							<li class="page-item"><a class="page-link"
								href="./noticelist.no?page=<%=nowpage + 1%>"
								style="color: rgb(51, 131, 51);">Next</a></li>
							<%
								}
							%>
						</ul>
					</div>
					<div class="col-md-2"></div>
				</div>
			</div> --%>

		</div>
	</div>
</section>

<%@include file="../includes/footer.jsp"%>
