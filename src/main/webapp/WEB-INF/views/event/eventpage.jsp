<%@page import="java.util.ArrayList"%>
<%@page import="com.spring.gogidang.domain.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<%
ArrayList<EventVO> event_list =(ArrayList<EventVO>) request.getAttribute("event_list");
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1 align=center>이벤트 페이지</h1>
	<table border=1 align=center>
	<tr>
		<td><a href="eventpage.ev">이벤트</a></td>
		<td><a href="qnalist.qn">문의</a></td>
		<td><a href="noticelist.no">공지사항</a></td>
	</tr>
	</table>
	<table border=1 width=300 align=center>
					
					<%
						for (int i=0; i<event_list.size(); i++)
							{
							EventVO vo = (EventVO)event_list.get(i);
					%>
					
						<tr align=center>
							<td colspan=2>
								<a href="eventinfo.ev?event_num=<%=vo.getEvent_num()%>"><%=vo.getThumbnail() %>
							</td>
					</tr>
					
					<%
							} 
					%>
					
				
			</table>
			
			
			<a href="main.me">메인페이지로 돌아가기</a>
</body>
</html>