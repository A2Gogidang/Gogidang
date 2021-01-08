<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border=1 width=300 align=center>
		<tr align=center><td>글번호 : </td><td>${eventVO.getEvent_num()}</td></tr>
		<tr align=center><td>사진 : </td><td>${eventVO.getPhoto()}</td></tr>
		<tr align=center><td>메인사진 : </td><td>${eventVO.getThumbnail()}</td></tr>
		<tr align=center><td>글내용 : </td><td>${eventVO.getContent()}</td></tr>
		<tr align=center><td>이벤트 등록일 : </td><td>${eventVO.getRe_date()}</td></tr>
		<td colspan=2><a href="eventpage.ev">이벤트 페이지로 돌아가기</a>
	</table>
</body>
</html>