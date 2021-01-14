<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.spring.gogidang.domain.*"%>
<%
	MemberVO vo = (MemberVO)session.getAttribute("MemberVO");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내정보</title>
</head>
<body>
<header><%=vo.getU_nick() %>님 안녕하세요.</header>
<center>
<h1><a href="./main.me">메인페이지</a></h1>
<%if(vo.getSeller_key() == 0 ){ %>
	<table border="1">
	<tr>
	<td><a href="./updateForm.me">내정보</a></td>
	<td><a href="./bookingList.bo?u_id=<%=vo.getU_id()%>">내예약확인</a></td>
	<td><a href="./likeStoreList.li?u_id=<%=vo.getU_id()%>">찜목록</a></td>
	<td><a href="./reviewUidList.re?u_id=<%=vo.getU_id()%>">내가 작성한 후기</a></td>
	</tr>
	</table><br><br>
<%}else{ %>
	<table border="1">
	<tr>
	<td><a href="./updateForm.me">내정보</a></td>
	<td><a href="./storeRegForm.st">가게 정보</a></td>
	<td><a href="./menuRegForm.st">메뉴 정보</a></td>
	<td><a href="./storeNoticeList.no">문의 관리</a></td>
	<td><a href="./storeRegForm.st">리뷰 관리</a></td>
	</tr>
	</table><br><br>
<%} %>
	<form name="updateform" action="./updateProcess.me" method="post">
		<center>
			<table border=1 width=400>
				<tr>회원 정보 수정</tr>
				<tr>
					<td>아이디 :</td>
					<td><%=vo.getU_id()%></td>
					<!-- id는 수정사항에 포함되지 않기 때문에 hidden으로 설정 -->
				</tr>
				<tr>
					<td>비밀번호 :</td>
					<td><input type="password" name="u_pw" value="<%=vo.getU_pw()%>" /></td>
				</tr>
				<tr>
					<td>이름 :</td>
					<td><%=vo.getU_name()%></td>
				</tr>
				<tr>
					<td>닉네임 :</td>
					<td><input type="text" name="u_nick" value="<%=vo.getU_nick()%>"/></td>
					
				</tr>
				<tr>
					<td>생년월일 :</td>
					<td><%=vo.getU_birth()%></td>
				</tr>
				<tr>
					<td>주소 :</td>
					<td><input type="text" name="u_addr" value="<%=vo.getU_addr()%>"/></td>
				</tr>	
				<tr>
					<td>이메일 주소 :</td>
					<td><input type="text" name="u_email" size=30 value="<%=vo.getU_email()%>"></td>
				</tr>
				<tr>
					<td>핸드폰 번호 :</td>
					<td><input type="text" name="u_phone" value="<%=vo.getU_phone()%>"></td>
				</tr>
				<tr align=center>
					<td colspan=2>
					<a href="javascript:updateform.submit()">수정</a>&nbsp;&nbsp;&nbsp;
					<a href="javascript:updateform.reset()">다시작성</a>
					</td>
				</tr>
			</table>
		</center>
	</form>
</body>
</html>