<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@include file="../includes/header.jsp"%>
<%@ page import="com.spring.gogidang.domain.*"%>
<%
	MemberVO memberVO = (MemberVO) session.getAttribute("memberVO");
	NoticeVO notice = (NoticeVO)request.getAttribute("notice");
%>
	

	<title>공지사항</title>



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
			<%-- <a onclick="return qnacheck()" href="./noticedelete.no?notice_num=<%=notice.getNotice_num() %>"
			>
			[삭제]
			</a>&nbsp;&nbsp; --%>
			<a href="./noticelist.no">[목록]</a>&nbsp;&nbsp;
			</font>
		</td>
	</tr>
</table>

	<%@include file="../includes/footer.jsp"%>	
	

