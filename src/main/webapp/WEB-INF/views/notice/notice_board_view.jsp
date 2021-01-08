<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="com.spring.gogidang.domain.NoticeVO" %>
<%
	String u_id=null;
	u_id=(String)session.getAttribute("u_id");
	
	NoticeVO notice = (NoticeVO)request.getAttribute("notice");
%>

<html>
<head>
	<title>공지사항</title>

</head>

<body>
<!-- 게시판 수정 -->
<table cellpadding="0" cellspacing="0">
	<tr align="center" valign="middle">
		<td colspan="5">공지사항</td>
	</tr>
	
	<tr>
		<td style="font-family:돋음; font-size:12" height="16">
			<div align="center">제 목&nbsp;&nbsp;</div>
		</td>
		
		<td style="font-family:돋음; font-size:12">
		<%=notice.getTitle()%>
		</td>
	</tr>
	
	<tr bgcolor="cccccc">
		<td colspan="2" style="height:1px;">
		</td>
	</tr>
	
	<tr>
		<td style="font-family:돋음; font-size:12">
			<div align="center">내 용</div>
		</td>
		<td style="font-family:돋음; font-size:12">
			<table border=0 width=490 height=250 style="table-layout:fixed">
				<tr>
					<td valign=top style="font-family:돋음; font-size:12">
					<%=notice.getContent() %>
					</td>
				</tr>

			</table>
	<tr>
		<td style="font-family:돋음; font-size:12">
	<div align="center">비밀번호</div>
		<td>
			<input readonly type="password" name="notice_password" cols="10" rows="15"  value="<%=notice.getNotice_password() %>" />
			
		</td>
		</td>
	</tr>
		<tr>
		<td style="font-family:돋음;font-size:12">
	<div align="center">비밀번호 확인</div>
		<td>
			<input type="password" name="notice_password1" cols="10" rows="15" />
			
		</td>
		</td>
	</tr>

	<tr bgcolor="cccccc">
		<td colspan="2" style="height:1px;"></td>
	</tr>
	<tr><td colspan="2">&nbsp;</td></tr>
	<tr align="center" valign="middle">
		<td colspan="5">
			<font size=2>
			<a onclick="return qnacheck()" href="./noticemodifyform.no?notice_num=<%=notice.getNotice_num() %>">
			[수정]
			</a>&nbsp;&nbsp;
			<a onclick="return qnacheck()" href="./noticedelete.no?notice_num=<%=notice.getNotice_num() %>"
			>
			[삭제]
			</a>&nbsp;&nbsp;
			<a href="./noticelist.no">[목록]</a>&nbsp;&nbsp;
			</font>
		</td>
	</tr>
</table>
<script type="text/javascript">
/* 	document.addEventListener('DOMContentLoaded', function(){
		
		
	}) */
	function qnacheck() {
		
	
		var p1 = document.querySelector('input[name="notice_password"]').value;
		var p2 = document.querySelector('input[name="notice_password1"]').value;
		
		if(p1 != p2) {
			alert("비밀번호가 일치 하지 않습니다");
		
			return false;
		} else {
			alert("비밀번호가 일치합니다");
			

			return true;
		}
	}
</script>

</body>
</html>