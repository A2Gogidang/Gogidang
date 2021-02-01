
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@include file="../includes/header.jsp"%>
<%@ page import="com.spring.gogidang.domain.*"%>
<%
	MemberVO memberVO = (MemberVO) session.getAttribute("memberVO");
%>
<%
	QnaStoreVO qna = (QnaStoreVO)request.getAttribute("qna");
%>




<!-- 게시판 수정 -->
<table cellpadding="0" cellspacing="0">
	<tr align="center" valign="middle">
		<td colspan="5">문의 게시판</td>
	</tr>

	<tr>
		
	
		<td style="font-family:돋음; font-size:12" height="16">
			<div align="center">제 목&nbsp;&nbsp;</div>
		</td>
		
		<td style="font-family:돋음; font-size:12">
		<%=qna.getTitle()%>
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
					<%=qna.getContent() %>
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
			 <%if(memberVO.getU_id()!=null && memberVO.getU_id().equals("admin")){%>
				<a href="./qnareplyform.st?qnastore_num=<%=qna.getQnastore_num() %>">
				[답변]
				</a>&nbsp;&nbsp;
				
			<%}%>
			
			
			<a href="./qnamodifyform.st?qnastore_num=<%=qna.getQnastore_num() %>">
			[수정]
			</a>&nbsp;&nbsp;
			<a href="./storeInfo.st">[목록]</a>&nbsp;&nbsp;
			</font>
		</td>
	</tr>
</table>
<!-- <script type="text/javascript">
/* 	document.addEventListener('DOMContentLoaded', function(){
		
		
	}) */
	function qnacheck() {
		
	
		var p1 = document.querySelector('input[name="qna_password"]').value;
		var p2 = document.querySelector('input[name="qna_password1"]').value;
		
		if(p1 != p2) {
			alert("비밀번호가 일치 하지 않습니다");
		
			return false;
		} else {
			alert("비밀번호가 일치합니다");
			

			return true;
		}
	}
</script> -->
<%@include file="../includes/footer.jsp"%>