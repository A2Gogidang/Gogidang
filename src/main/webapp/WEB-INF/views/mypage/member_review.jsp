<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="java.util.*" %>
<%@include file="../includes/header.jsp"%>
<% 
	String u_id =(String)session.getAttribute("u_id");
	
	ArrayList<ReviewVO> review_list = (ArrayList<ReviewVO>)request.getAttribute("reviewUidList");
	PageDTO  pageMaker = (PageDTO) request.getAttribute("pageMaker");
%>
  
	<center>
	
	<br><br>
	<div>
	<table border=1>
	<tr align=center>
	<td>등록일</td>
	<td>가게이름</td>
	<td>내용</td>
	<td>수정</td>
	</tr>
	<%
	for(int i=0;i<review_list.size();i++)
	{
		ReviewVO review=(ReviewVO)review_list.get(i);
	%>
	<tr align=center>
	<td>
	<%=review.getReview_date()%>
	</td>
	<td>
	<%=review.getS_name()%>
	</td>
	<td size="6">
	<%=review.getContent()%>
	</td>
	<td><a href="reviewmodifyform.re?review_num=<%=review.getReview_num()%>">수정</a></td>
	</tr>
	<% } %>
	</table>
	</div>
	</center>
</body>
</html>