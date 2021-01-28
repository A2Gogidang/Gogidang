<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.spring.gogidang.domain.*"%>

<%@ include file="../includes/header_simple.jsp"%>

<%
	//MemberVO mvo = (MemberVO) session.getAttribute("memberVO");
	String id = mvo.getU_id();
	ArrayList<StoreVO> storeList = (ArrayList<StoreVO>) request.getAttribute("list");
	PageDTO pageMaker = (PageDTO) request.getAttribute("pageMaker");
%>

<title>대기가게리스트</title>

<h3>대기가게리스트</h3>
<center>
	<table border=1 width=300>
		<tr align=center>
			<td colspan=2>가게 대기 리스트</td>
		</tr>
		<%
			if (storeList.size() > 0) {
				for (int i = 0; i < storeList.size(); i++) {
					StoreVO vo = (StoreVO) storeList.get(i);
		%>
		<tr>
			<td><a href="storeInfo.st?s_num=<%=vo.getS_num()%>"><%=vo.getS_num()%>
					/ <%=vo.getS_name()%> - <%=vo.getU_id()%></a></td>
			<td><a href="confirmStore.st?s_num=<%=vo.getS_num()%>">승인</a> <a
				href="refuseStore.st?s_num=<%=vo.getS_num()%>">거절</a></td>
		</tr>
		<%
			}
			} else {
		%>
		<h2>대기중인 가게가 없습니다.</h2>
		<%
			}
		%>
		<tr align=center height=20>
			<td colspan=7 style="font-family: Tahoma; font-size: 10pt;">
				<%
					if (pageMaker.isPrev()) {
				%> <a
				href="./reviewList.re?pageNum=pageMaker.getCri().getPageNum()-1">[이전]</a>&nbsp;
				<%
					} else {
				%> [이전]&nbsp; <%
 	}
 %> <%
 	for (int a = pageMaker.getStartPage(); a <= pageMaker.getEndPage(); a++) {
 		if (a == pageMaker.getCri().getPageNum()) {
 %> [<%=a%>] <%
 	} else {
 %> <a href="./reviewList.re?pageNum=<%=a%>">[<%=a%>]
			</a> &nbsp; <%
 	}
 %> <%
 	}
 %> <%
 	if (pageMaker.isNext()) {
 %> <a
				href="./reviewList.re?pageNum=<%=pageMaker.getCri().getPageNum() + 1%>&amount=10">[다음]</a>
				<%
					} else {
				%> [다음] <%
					}
				%>
			</td>
		</tr>
	</table>
</center>

<%@include file="../includes/footer.jsp"%>