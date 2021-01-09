<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.spring.gogidang.domain.*" %>
<% 
	String u_id =(String)session.getAttribute("u_id");
	MemberVO memberVO = (MemberVO)request.getAttribute("memberVO");
	ArrayList<ReviewVO> review_list = (ArrayList<ReviewVO>)request.getAttribute("review_list");
%>
<html>
<head>
<title>내가 작성한 후기</title>
</head>
<body>
	<center>
	<div>
	<table border=1>
		<tr>
			<td><a href="./memberInfo.me?u_id=<%=memberVO.getU_id()%>">내정보</a></td>
			<td><a href="./bookingList.bo?u_id=<%=memberVO.getU_id()%>">내예약확인</a></td>
			<td><a href="./likeStoreList.li?u_id=<%=memberVO.getU_id()%>">찜목록</a></td>
			<td><a href="./reviewListUid.re?u_id=<%=memberVO.getU_id()%>">내가 작성한 후기</a></td>
		</tr>
	</table>
	</div>
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
	<%=review.getRe_date()%>
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