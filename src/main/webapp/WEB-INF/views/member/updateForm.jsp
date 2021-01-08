<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@page import="javax.sql.*"%>
<%@page import="javax.naming.*"%>
<%@page import="java.sql.*"%>
<%@page import="com.spring.gogidang.domain.*" %>
<%
	String id =(String)session.getAttribute("id");
	MemberVO vo=(MemberVO)request.getAttribute("result");
%>
<html>
<head>
<title>내정보 수정</title>
</head>
<body>
	<center>
	<form name="updateform" action="./updateprocess.me" method="post">
	<table border=1>
	<tr>
	<td>아이디 : </td>
	<td><input type="hidden" name="u_id" value="<%=vo.getU_id() %>"><%=vo.getU_id()%></td>
	</tr>
	<tr>
	<td>비밀번호 : </td>
	<td><input type="password" name="u_pw" value="<%=vo.getU_pw()%>"></td>
	</tr>
	<tr>
	<td>이름 :</td>
	<td><input type="text" name="u_name" value="<%=vo.getU_name() %>"></td>
	</tr>
	<tr>
	<td>닉네임 :</td>
	<td><input type="text" name="u_nick" value="<%=vo.getU_nick() %>"></td>
	</tr>
	<tr>
	<td>생년월일 :</td>
	<td><input type="text" name="u_birth" value="<%=vo.getU_birth() %>"></td>
	</tr>
	<tr>
	<td>주소 :</td>
	<td><input type="text" name="u_addr" value="<%=vo.getU_addr() %>"></td>
	</tr>
	<tr>
	<td>이메일 :</td>
	<td><input type="email" name="u_email" value="<%=vo.getU_email() %>"></td>
	</tr>
	<tr>
	<td>전화번호 :</td>
	<td><input type="tel" name="u_phone" value="<%=vo.getU_phone() %>"></td>
	</tr>
	<tr align="center">
	<td colspan="2"><a href="javascript:updateform.submit()">수정</a>&nbsp;&nbsp;
	<a href = "memberinfo.me?u_id=<%=vo.getU_id()%>">내정보로 돌아가기</a></td>
	</tr>
	</table>
	</form>
	</center>
</body>
</html>