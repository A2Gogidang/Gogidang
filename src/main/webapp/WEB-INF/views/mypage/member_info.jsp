<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="com.spring.gogidang.domain.*" %>
<%
	String id = (String) session.getAttribute("id");
	MemberVO memberVO=(MemberVO)request.getAttribute("memberVO");
%>
<html>
<head>
<title>마이페이지</title>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    <!--  <link rel="stylesheet" href="../css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="../css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="../css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="../css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="../css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="../css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="../css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="../css/style.css" type="text/css">-->
</head>
<body>

<center>
<ul class="nav nav-tabs">
  <li role="presentation" class="active"><a href="#">Home</a></li>
  <li role="presentation"><a href="#">Profile</a></li>
  <li role="presentation"><a href="#">Messages</a></li>
</ul>
<div class="navigation">
	<table border="1">
	<tr>
	<td><a href="./memberinfo.me?u_id=<%=memberVO.getU_id()%>">내정보</a></td>
	<td><a href="./bookinglist.bo?u_id=<%=memberVO.getU_id()%>">내예약확인</a></td>
	<td><a href="./likestorelist.li?u_id=<%=memberVO.getU_id()%>">찜목록</a></td>
	<td><a href="./myreviewlist.re?u_id=<%=memberVO.getU_id()%>">내가 작성한 후기</a></td>
	</tr>
	</table>
</div>
	<br><br>
	
<div>
	<table border="1" width="300">
	<tr><td>아이디 : </td><td>${memberVO.getU_id()}</td></tr>
	<tr><td>비밀번호 : </td><td>${memberVO.getU_pw()}</td></tr>
	<tr><td>이름 : </td><td>${memberVO.getU_name()}</td></tr>
	<tr><td>닉네임 : </td><td>${memberVO.getU_nick()}</td></tr>
	<tr><td>생년월일 : </td><td>${memberVO.getU_birth()}</td></tr>
	<tr><td>주소 : </td><td>${memberVO.getU_addr()}</td></tr>
	<tr><td>이메일 : </td><td>${memberVO.getU_email()}</td></tr>
	<tr><td>전화번호 : </td><td>${memberVO.getU_phone()}</td></tr>
	<tr><td>고객유형 : </td>
	<%
	if(memberVO.getSeller_key()==0){
	%>
	<td><input type="hidden" name="seller_key" value="<%=memberVO.getSeller_key()%>">소비자</td>
	<% }
	else{
		%>
	<td><input type="hidden" name="seller_key" value="<%=memberVO.getSeller_key()%>">판매자</td>
	<% 
	}
	%>
	<tr><td colspan=2 align="center"><a href="./updateform.me?u_id=<%=memberVO.getU_id() %>">수정</a></td></tr>
	</table>
</div>
</center>
</body>
</html>