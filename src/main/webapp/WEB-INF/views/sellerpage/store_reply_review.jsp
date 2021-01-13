<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.spring.gogidang.domain.*"%>
<%
	MemberVO memberVO = (MemberVO)session.getAttribute("MemberVO");	
	SRReviewVO srReviewvo = (SRReviewVO)request.getAttribute("srReviewvo");

	
%>
<html>
<head>
<title>판매자 마이페이지</title>
<script>

</script>
</head>
<body>
<header><%=memberVO.getU_nick() %>님 </header>
<form name="reply_regForm" action="./replyReviewInsert.bo" method="post">
<input type="hidden" name = "review_num" value=<%=srReviewvo.getReview_num() %>>
<input type="hidden" name = "s_num" value=<%=srReviewvo.getS_num() %>>
<input type="hidden" name = "comment_num" value=<%=srReviewvo.getComment_num()+1 %>>
<center>
<h1><a href="./main.me">메인페이지</a></h1>
	<table border="1">
	<tr>
	<td><a href="./updateForm.me">내정보</a></td>
	<td><a href="./storeRegForm.st">가게 정보</a></td>
	<td><a href="./menuRegForm.st">메뉴 정보</a></td>
	<td><a href="./storeNoticeList.no">문의 관리</a></td>
	<td><a href="./storereviewList.bo">리뷰 관리</a></td>
	</tr>
	</table><br><br>
<table border=1>
	<thead>		
	<tr><th colspan="6">리뷰 게시판</th></tr>
	<tr>
		<th>글제목</th>
		<th>작성자</th>
		<th>글내용 </th>
		<th>리뷰사진</th>
		<th>등록일자</th>
		<th>별점</th>
	</tr>
	</thead>
	<tbody>
	<tr>
		<td><span name="title" type="text" /><%=srReviewvo.getTitle() %></td>
		<td><span name="u_id" type="text" /><%=srReviewvo.getU_id() %></td>
		<td><span name="content" type="text" /><%=srReviewvo.getContent() %></td>
		<td><span name="photo1" type="text" /><%=srReviewvo.getPhoto1() %></td>
		<td><span name="review_date" type="text" /><%=srReviewvo.getReview_date() %></td>
		<td><span name="star" type="text" /><%=srReviewvo.getStar() %></td>
	</tr>		
	<tr>
		<th colspan="2">답변내용 : </th> 
		<td colspan="4"><input name="re_content" type="text" /></td>
	</tr>
	<tr>
		<th colspan="3">답변날짜 : </th> 		
		<td colspan="3"><input name="re_date" type="text" /></td>
	</tr>
	<tr>
		<td colspan="3"><a href="javascript:reply_regForm.submit()">등록</a></td>
		<td colspan="3"><a href="javascript:reply_regForm.reset()">다시 입력</a></td>
	</tr>
	</tbody>
</table>
</center>
</form>
</body>
</html>
