<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>
<%@ page import="java.util.*" %>

<%
	ArrayList<StoreVO> storeList = (ArrayList<StoreVO>) request.getAttribute("storeList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>대기가게리스트</title>
</head>
<body>
	<h3>대기가게리스트</h3>
		<center>
			<table border=1 width=300>
				<tr align=center><td colspan=2>가게 대기 리스트</td></tr>
			<%
				for (int i=0; i<storeList.size(); i++)
					{
						StoreVO vo = (StoreVO)storeList.get(i);

			%>
				<tr>
					<td>
						<a href="storeInfo.st?s_num=<%=vo.getS_num() %>"><%=vo.getS_num() %> / <%=vo.getS_name()%> - <%=vo.getU_id()%></a>
					</td>
					<td>
						<a href="confirmStore.st?s_num=<%=vo.getS_num() %>">승인</a>
						<a href="refuseStore.st?s_num=<%=vo.getS_num() %>">거절</a>
					</td>
				</tr>
			<%
					}
			%>
			</table>
		</center>
		
<%@include file="../includes/footer.jsp"%>