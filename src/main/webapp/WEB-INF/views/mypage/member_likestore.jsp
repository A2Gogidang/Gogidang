<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.spring.gogidang.domain.*" %>
<% 
	MemberVO vo = (MemberVO)session.getAttribute("MemberVO");
	ArrayList<LikeStoreVO>likestore_list = (ArrayList<LikeStoreVO>)request.getAttribute("likestore_list");
%>
<html>
<head>
<title>내 찜</title>
</head>
<body>
	<center>
	<h1><a href="./main.me">메인페이지</a></h1>
	<div>
	<table border="1">
		<tr>
			<td><a href="./updateForm.me">내정보</a></td>
			<td><a href="./bookingList.bo?u_id=<%=vo.getU_id()%>">내예약확인</a></td>
			<td><a href="./likeStoreList.li?u_id=<%=vo.getU_id()%>">찜목록</a></td>
			<td><a href="./reviewUidList.re?u_id=<%=vo.getU_id()%>">내가 작성한 후기</a></td>
		</tr>
	</table>
	</div>
	<br><br>
	<div>
	<h1 align="left">찜한가게</h1>
	<br>
	<table border="1">
	<%
	for(int i=0;i<likestore_list.size();i++)
	{
		LikeStoreVO likestore=(LikeStoreVO)likestore_list.get(i);
	%>
	<tr>
	<td><%=likestore.getThumbnail()%>
	</td>
	<td>
	가게명 : <%=likestore.getS_name()%>
	<br>
	주소 : <%=likestore.getS_addr()%>
	<br>
	영업시간 : <%=likestore.getS_hour()%>
	<br>
	전화번호 : <%=likestore.getS_phone()%>
	<br>
	</td>
	</tr>
	<%} %>
	</table>
	</div>
	</center>
</body>
</html>