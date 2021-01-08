<%@ page language="java" contentType="text/html; charset=utf-8"%>
<html>
<head>
<title>회원관리 시스템 회원가입 페이지</title>
</head>
<body>
<form name="joinform" action="./joinprocess.me" method="post">
<center>
<table border=1>
	<tr>
		<td colspan="2" align=center>
			<b><font size=5>회원가입 페이지</font></b>
		</td>
	</tr>
	<tr><td>아이디 : </td><td><input type="text" name="u_id"/></td></tr>
	<tr><td>비밀번호 : </td><td><input type="password" name="u_pw"/></td></tr>
	<tr><td>이름 : </td><td><input type="text" name="u_name"/></td></tr>
	<tr><td>닉네임 : </td><td><input type="text" name="u_nick"/></td></tr>
	<tr><td>생년월일 : </td><td><input type="text" name="u_birth"/></td></tr>
	<tr><td>주소 : </td><td><input type="text" name="u_addr"/></td></tr>
	<tr><td>이메일 : </td><td><input type="text" name="u_email"/></td></tr>
	<tr><td>전화번호 : </td><td><input type="text" name="u_phone"/></td></tr>
	<tr>
		<td>약관동의 : </td>
		<td>
			<input type="radio" name="u_agree" value="1" checked/>동의
			<input type="radio" name="u_agree" value="0"/>비동의
		</td>
	</tr>
		<tr>
		<td>판매자식별 : </td>
		<td>
			<input type="radio" name="seller_key" value="1" checked/>판매자
			<input type="radio" name="seller_key" value="0"/>일반
		</td>
	</tr>
	<tr>
		<td colspan="2" align=center>
			<a href="javascript:joinform.submit()">회원가입</a>&nbsp;&nbsp;
			<a href="javascript:joinform.reset()">다시작성</a>
		</td>
	</tr>
</table>
</center>
</form>
</body>
</html>