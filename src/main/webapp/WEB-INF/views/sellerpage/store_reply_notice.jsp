<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.spring.gogidang.domain.*"%>
<%
	MemberVO memberVO = (MemberVO)session.getAttribute("MemberVO");	
	SRNoticeVO srNoticevo = (SRNoticeVO)request.getAttribute("srNoticevo");

	
%>
<html>
<head>
<title>판매자 마이페이지</title>
<script>

</script>
</head>
<h1><a href="./main.me">메인페이지</a></h1>
<h2><a href="./sellerupdateform.me">내정보</a></h2>
<h2><a href="./storeRegForm.st">가게 정보</a></h2>
<h2><a href="./menuRegForm.st">메뉴 정보</a></h2>
<h2><a href="./storeRegForm.st">리뷰 관리</a></h2>
<body>
<header><%=memberVO.getU_nick() %>님 </header>
<form name="reply_regForm" action="./replyNoticeInsert.no" method="post">
<input type="hidden" name = "qs_num" value=<%=srNoticevo.getQs_num() %>>
<input type="hidden" name = "s_num" value=<%=srNoticevo.getS_num() %>>
<input type="hidden" name = "s_comment_num" value=<%=srNoticevo.getS_comment_num() %>>
<center>
<table border=1>
	<thead>		
	<tr><th colspan="4">문의 게시판</th></tr>
	<tr>
		<th>글제목</th>
		<th>작성자</th>
		<th>글내용 </th>
		<th>문의날짜</th>
	</tr>
	</thead>
	<tbody>
	<tr>
		<td><span name="title" type="text" /><%=srNoticevo.getTitle() %></td>
		<td><span name="u_id" type="text" /><%=srNoticevo.getU_id() %></td>
		<td><span name="content" type="text" /><%=srNoticevo.getContent() %></td>
		<td><span name="qna_date" type="text" /><%=srNoticevo.getQna_date() %></td>
	</tr>		
	<tr>
		<th colspan="2">답변내용 : </th> 
		<td colspan="2"><input name="re_content" type="text" /><%=srNoticevo.getRe_content() %></td>
	</tr>
	<tr>
		<th colspan="2">답변날짜 : </th> 		
		<td colspan="2"><input name="re_date" type="text" /><%=srNoticevo.getRe_date() %></td>
	</tr>
	<tr>
		<td><a href="javascript:reply_regForm.submit()">등록</a></td>
		<td><a href="javascript:reply_regForm.reset()">다시 입력</a></td>
	</tr>
	</tbody>
</table>
</center>
</body>
</html>
