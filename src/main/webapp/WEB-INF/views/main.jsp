<%@ page import="com.spring.gogidang.domain.*"%>
<%@ page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	MemberVO mvo = (MemberVO) session.getAttribute("MemberVO");
	String u_id = mvo.getU_id();
	int seller_key = mvo.getSeller_key();
	
	ArrayList<EventVO> event_list =(ArrayList<EventVO>) request.getAttribute("event_list");
	ArrayList<StoreVO> store_list =(ArrayList<StoreVO>) request.getAttribute("store_list");
	ArrayList<ReviewVO> review_list =(ArrayList<ReviewVO>) request.getAttribute("review_list");
	
%>
<html>
<head>
<title>회원관리 시스템 메인 페이지</title>
</head>
<body>	
<header><h3><%=u_id %> 로 로그인하셨습니다.</h3></header>
	<%
	if (mvo.getU_id() == "" || mvo.getU_id() == null) {	
	%>
	<h2><a href="./loginForm.me">로그인</a></h2>
	<h2><a href="./joinForm.me">회원가입</a></h2>
	<%
	}else if (seller_key == 1) {	
	%>
	<h3>판매자입니다.</h3>
	<h2><a href="./updateList.me">판매자 마이페이지</a></h2>
	<% 
	}else if (u_id.equals("admin")) {
	%>
		<h3>관리자입니다.</h3>
		<a href="./storeList.st">전체 가게 리스트 보기</a>
		<br>
		<a href="./storeWait.st">승인 대기 중인 가게 리스트 확인</a>
	<% 
	} else{
	%>			
	<a href="./updateForm.me">마이페이지</a>
	<%
	}
	%>
<center>
	<h3>이벤트 메인사진</h3>
			<table border=1 width=300>
				
					<%
						for (int i=0; i<event_list.size(); i++)
							{
							EventVO vo = (EventVO)event_list.get(i);
					%>
					<tr align=center>
						<td colspan=2>
							<a href="eventInfo.ev?event_num=<%=vo.getEvent_num()%>"><%=vo.getThumbnail() %>
						</td>
					</tr>
					<%
							} 
					%>
				
				
			</table>
			
			<h3>가게 메인사진</h3>
			<a href="./storeList.st">가게전체보기</a>
			<table border=1 width=300>
					<%
						for (int i=0; i<store_list.size(); i++) {
							
							StoreVO vo1 = (StoreVO)store_list.get(i);
					%>
					<tr align=center>
						<td colspan=2>
							<a href="storeInfo.st?s_num=<%=vo1.getS_num()%>"><%=vo1.getThumbnail() %>
						</td>
					</tr>	
					<%
							}
					%>
				
				</table>
				<h3>리뷰 닉네임,사진,등록날짜,별점</h3>
				<a href="./reviewList.re">리뷰전체보기</a>
				<table border=1 width=300>
				<c:forEach items="${review_list }" var="review_list">
					<tr>
						<td><c:out value="${review_list.title }" /></td>
						<td><c:out value="${review_list.nickname }" /></td>
						<td><c:out value="${review_list.star }" /></td>
						<td><fmt:formatDate pattern="yyyy-MM-dd" value="${review_list.review_date }" /></td>
					</tr>
				</c:forEach>
				</table>
<%-- 				<table border=1 width=300>
					<%
						for (int i=0; i<3; i++)
							{
							ReviewVO vo2 = (ReviewVO)review_list.get(i);
					%>
					<tr>
						<td><a href="./reviewInfo.re?review_num=<%=vo2.getReview_num() %>"><%=vo2.getTitle() %></a></td>
						<td><%=vo2.getNickname() %></td>
						<td><%=vo2.getPhoto1() %></td>
						<td><fmt:formatDate pattern="yyyy-MM-dd" value="<%=vo2.getRe_date() %>" /><%=vo2.getRe_date() %></td>
						<td><%=vo2.getStar()%></td>
					</tr>
					<%
							} 
					%>
			</table> --%>
			<a href="./eventPage.ev">이벤트 페이지</a>
		</center>
</p>
</body>
</html>