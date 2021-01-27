<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>
<%@ page import="com.spring.gogidang.domain.*"%>
<%
	MemberVO memberVO = (MemberVO) session.getAttribute("memberVO");
	NoticeVO notice = (NoticeVO)request.getAttribute("notice");
%>



	<title>MVC 게시판</title>
	<script type="text/javascript">
	function modifynotice(){
		modifyform.submit();
	}
	</script>


<body>
<!-- 게시판 수정 -->
<form action="noticemodify.no" method="post" name="modifyform">
<input type="hidden" name="notice_num" value="<%=notice.getNotice_num() %>">
<input type="hidden" name="u_id" value="<%=memberVO.getU_id() %>">

<table cellpadding="0" cellspacing="0">
	<tr align="center" valign="middle">
		<td colspan="5">공지사항</td>
	</tr>
	<tr>
		<td height="16" style="font-family:돋음; font-size:12">
			<div align="center">제 목</div>
		</td>
		<td>
			<input name="title" size="50" maxlength="100" 
				value="<%=notice.getTitle()%>">
		</td>
	</tr>
	<tr>
		<td style="font-family:돋음; font-size:12">
			<div align="center">내 용</div>
		</td>
		<td>
			<textarea name="content" cols="67" rows="15"><%=notice.getContent() %></textarea>
		</td>
	</tr>

	<tr bgcolor="cccccc">
		<td colspan="2" style="height:1px;">
		</td>
	</tr>
	<tr><td colspan="2">&nbsp;</td></tr>
	
	<tr align="center" valign="middle">
		<td colspan="5">
			<font size=2>
			<a href="javascript:modifynotice()">[수정]</a>&nbsp;&nbsp;
			<a href="javascript:history.go(-1)">[뒤로]</a>&nbsp;&nbsp;
			</font>
		</td>
	</tr>
</table>
</form>
<%@include file="../includes/footer.jsp"%>