<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="java.util.*" %>
<%@ page import = "com.spring.gogidang.domain.*" %>

<%
	MemberVO memberVO = (MemberVO) session.getAttribute("MemberVO");
	String id = memberVO.getU_id();
	ArrayList<ReviewVO> reviewList = (ArrayList<ReviewVO>) request.getAttribute("reviewList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가게리뷰리스트</title>
</head>
<body>
	<h1><%=id %></h1>
	<center>
		<table border=1 width=300>
			<tr align=center>
				<td colspan=2>가게 후기 리스트</td>
			</tr>
		<%
			if (reviewList.size() == 0) {
		%>
			<h3>아직 등록된 후기가 없습니다.</h3>
		<%
			}
		%>
		<%
			for (int i=0; i<reviewList.size(); i++)
			{
				ReviewVO vo = (ReviewVO)reviewList.get(i);
		%>
			<tr align=center>
				<td>
					<%=i+1 %>
				</td>
				<td>
					<a href="reviewInfo.re?review_num=<%=vo.getReview_num()%>"><%=vo.getTitle() %> - <%=vo.getS_num() %></a>
				</td>
			</tr>
		<%
			} 
		%>
			<tr align=center>
				<td colspan=2>
					<a href="#">해당가게리뷰작성</a>
				</td>
			</tr>
		</table>
	</center>
</body>
</html>