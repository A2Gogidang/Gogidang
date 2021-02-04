<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ include file="../includes/header.jsp"%>
<%@ page import="com.spring.gogidang.domain.*"%>
<%
	MemberVO memberVO = (MemberVO) session.getAttribute("memberVO");
%>
<%
	//String u_id=(String)session.getAttribute("u_id");
	QnaStoreVO qna=(QnaStoreVO)request.getAttribute("qna"); 
%>

	<script language="javascript">
	function replyboard(){
		boardform.submit();
	}
	</script>

<!-- 게시판 답변 -->
<form action="./qnareply.qn" method="post" name="boardform">
<!-- 원글에 대한 정보 -->
<input type="hidden" name="qna_num" value="<%=qna.getQnastore_num() %>">
<input type="hidden" name="u_id" value="<%=memberVO.getU_id() %>">

<table cellpadding="0" cellspacing="0">
	<tr align="center" valign="middle">
		<td colspan="5">문의 게시판</td>
	</tr>
	<tr>
		<td style="font-family:돋음; font-size:12" height="16">
			<div align="center">글쓴이</div>
		</td>
		<td>
			<%=memberVO.getU_id() %>
		</td>
	</tr>
	<tr>
		<td style="font-family:돋음; font-size:12" height="16">
			<div align="center">제 목</div>
		</td>
		<td>
			<input name="title" type="text" size="50" 
				maxlength="100" value="Re: <%=qna.getTitle() %>"/>
		</td>
	</tr>
	<tr>
		<td style="font-family:돋음; font-size:12">
			<div align="center">내 용</div>
		</td>
		<td>
			<textarea name="content" cols="67" rows="15"></textarea>
		</td>
	</tr>
	

	<tr bgcolor="cccccc">
		<td colspan="2" style="height:1px;">
		</td>
	</tr>
	<tr><td colspan="2">&nbsp;</td></tr>
	
	<tr align="center" valign="middle">
		<td colspan="5">
		<a href="javascript:replyboard()">[등록]</a>&nbsp;&nbsp;
		<a href="javascript:history.go(-1)">[뒤로]</a>
		</td>
	</tr>
</table>
</form>
<%@include file="../includes/footer.jsp"%>