<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="com.spring.gogidang.domain.*"%>

<%@ include file="../includes/header_simple.jsp"%>
<%
	List<QnaVO> qnalist=(List<QnaVO>)request.getAttribute("qnalist");
	int listcount=((Integer)request.getAttribute("listcount")).intValue();
	int nowpage=((Integer)request.getAttribute("page")).intValue();
	int maxpage=((Integer)request.getAttribute("maxpage")).intValue();
	int startpage=((Integer)request.getAttribute("startpage")).intValue();
	int endpage=((Integer)request.getAttribute("endpage")).intValue();
%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/qna.css"
	type="text/css">

<section class="product spad">
	<div class="container">
			<div class="row">

			<div class="col-lg-3" id="nav-bar">
		            <div class="hero__categories">
		                  <div class="hero__categories__all">
		                  	<span>문의</span>
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
					<h2>문의 게시판</h2>
				</div>
				
				<div class="container">
					<table class="table table-striped">
						<thead>
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>날짜</th>
							</tr>
						</thead>
						<tr>

							<%
								int qna_num = listcount - ((nowpage - 1) * 10);
								for (int i = 0; i < qnalist.size(); i++) {
									QnaVO ql = (QnaVO) qnalist.get(i);
							%>
						
						<tr>
							<td><%=qna_num%></td>

							<td style="font-family: Tahoma; font-size: 10pt;">
								
									<%-- <%
										if (ql.getRe_lev() != 0) {
									%>
									<%
										for (int a = 0; a <= ql.getRe_lev() * 2; a++) {
									%>
									&nbsp;
									<%
										}
									%>
									▶
									<%
										} else {
									%>

									<%
										}
									%> --%>
									<a href="./qnadetail.qn?qna_num=<%=ql.getQna_num()%>"> <%=ql.getTitle()%>
									</a>
							</td>

							<td style="font-family: Tahoma; font-size: 10pt;">
								<%=ql.getU_id()%>
							</td>
							<td style="font-family: Tahoma; font-size: 10pt;">
								<%=ql.getRe_date()%>
							</td>

						</tr>
						<%
							qna_num--;
							}
						%>
						</tbody>
					</table>
					<div class="qnabutton">
					<% if (u_id != "admin") { %>
							<a href="./qnawriteform.qn"><button type="button"
									class="btn">글쓰기</button> </a>
					<%}%>
					</div>
					<div class="product__pagination">
						<div class="paging">
						<% if(nowpage <= 1) { %>
						<a href="#"><i class="fa fa-long-arrow-left"></i></a>
						<%}else{%>
						<a href="./qnalist.qn?page=<%=nowpage - 1%>"><i class="fa fa-long-arrow-left"></i></a>
						<%} %>
						<% 
							for(int a =startpage; a<=endpage; a++){
								if(a== nowpage){
						%>
						<a href="./qnalist.qn?page=<%=a%>"><%=a %></a>
						<%}else{ %>
                        <a href="./qnalist.qn?page=<%=a%>"><%=a %></a>
                        <%} 
                        	}%>
						<%if(nowpage >= maxpage) {%>
                        <a href="#"><i class="fa fa-long-arrow-right"></i></a>
                        <%}else{ %>
                        <a href="./qnalist.qn?page=<%=nowpage + 1%>"><i class="fa fa-long-arrow-right"></i></a>
                        <%} %>
                    </div>
                    </div>
				</div>
				</div>
			</div>
			</div>

</section>

<%@ include file="../includes/footer.jsp"%>