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
			<div class="qnaListn">
			<div class="col-lg-3 col-md-5">
				<div class="sidebar">
					<div class="sidebar__item">
						<h4>문의</h4>
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
			<div class="rowNotice">
				<div class="section-title product__discount__title">
					<h2>문의 게시판</h2>
				</div>
				
				<div class="qnaList">
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
								
									<%
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
									%>
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
						<a href="./qnawriteform.qn"><button type="button"
								class="btn">글쓰기</button> </a>
					</div>
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
	</div>
</section>

<%@ include file="../includes/footer.jsp"%>