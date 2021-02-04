<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.spring.gogidang.domain.*"%>
<%@include file="../includes/header_simple.jsp"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/store_reviewStyle.css" type="text/css">
<%
	ArrayList<SRNoticeVO> srNoticeList = (ArrayList<SRNoticeVO>)request.getAttribute("srNoticeList");
	StoreVO storeVO = (StoreVO)session.getAttribute("StoreVO");
	
%>
<html lang="zxx">

<head>
    <title>Ogani | Template</title>
</head>

<body>
    <!-- Product Section Begin -->
    <section class="product spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-3" id="nav-bar">
					<div class="hero__categories">
                		<div class="hero__categories__all">
						<span>판매자 마이페이지</span>
						</div>
                            <ul>
	                            <li><a href="./updateList.me">내정보</a></li>
	                            <li><a href="./storeRegForm.st">가게 정보</a></li>
	                            <li><a href="./menuRegForm.mn">메뉴 등록</a></li>
	                            <li><a href="./storeNoticeList.no">문의 관리</a></li>
	                            <li><a href="./storereviewList.bo">리뷰 관리</a></li>
                       		 </ul> 
                        </div>
                    </div>     
<!-- ---------------------------------------------------시작----------------------------------------------------- -->          
        <div class="reviewboard">
    <div class="section-title product__discount__title">
          <h2>문의 관리</h2>
    </div>
	<div class="container">
			<table class="table table-hover">
			<thead>
				<tr align=center>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>등록일</th>
					<th>답변 상태</th>
				</tr>
			</thead>
			<tbody class="text-center">
<%
for(int i = 0; i < srNoticeList.size(); i++){ 
	
	SRNoticeVO srNoticevo = (SRNoticeVO)srNoticeList.get(i);
%>
	 <tr align=center>
				<td>
					<%=i+1 %>
				</td>
				<td>
					<a href="reviewInfo.re?review_num=<%=srNoticevo.getQs_num()%>"><%=srNoticevo.getTitle() %></a>
				</td>
				<td>
					<%=srNoticevo.getU_id() %>
				</td>
				<td>
					<%=srNoticevo.getQna_date() %>
				</td>
<%
 		if(srNoticevo.getRe_content() == null || srNoticevo.getRe_content() == ""){
%>				
	  			<td>
	  			<button class="button">답변 등록</button>
	  			</td>

<% 		}else{%>
	 			<td>답변 완료</td>
	<% }%>
				
<% }%>
   			  </tr>
			</tbody>
		</table>
	</div>
</div>
<!-- ----------------------------------------------------끝---------------------------------------------------- --> 

    </section>
  
<%@include file="../includes/footer.jsp"%>
</body>

</html>