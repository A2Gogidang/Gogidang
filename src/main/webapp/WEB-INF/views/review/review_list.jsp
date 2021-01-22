<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ page import = "com.spring.gogidang.domain.*" %>
<%@include file="../includes/header.jsp"%>

<%
	MemberVO mvo = (MemberVO) session.getAttribute("memberVO");
	String u_id = "";
	int seller_key;
	if(mvo != null) {
		u_id = mvo.getU_id();
		seller_key = mvo.getSeller_key();
	} else {
		seller_key = 0;
	}
	List<ReviewVO> review_list = (List<ReviewVO>) request.getAttribute("reviewList");
	List<ReviewVO> reviewUidList = (List<ReviewVO>) request.getAttribute("reviewUidList");
	PageDTO  pageMaker = (PageDTO) request.getAttribute("pageMaker");
%>

	<h3><%=u_id %></h3>
	<center>
		<table border=1 width=500>
			<tr align=center>
				<td colspan=6>가게 후기 리스트</td>
			</tr>
			<tr align="center">
				<td>번호</td>
				<td>제목</td>
				<td>작성자</td>
				<td>가게명</td>
				<td>별점</td>
				<td >등록일</td>
			</tr>
 		<%
			for (int i=0; i<review_list.size(); i++)
			{
				ReviewVO vo = (ReviewVO)review_list.get(i);
		%>
			<tr align=center>
				<td>
					<%=vo.getReview_num() %>
				</td>
				<td>
					<a href="reviewInfo.re?review_num=<%=vo.getReview_num()%>"><%=vo.getTitle() %></a>
				</td>
				<td>
					<%=vo.getNickname() %>
				</td>
				<td>
					<%=vo.getS_name() %>
				</td>
				<td>
					<%=vo.getStar() %>
				</td>
				<td>
					<%=vo.getReview_date() %>
				</td>
			</tr>
		<%
			} 
		%>
			<tr align=center height=20>
				<td colspan=7 style=font-family:Tahoma;font-size:10pt;>
					<%if(pageMaker.isPrev()){ %>
					<a href="./reviewList.re?pageNum=pageMaker.getCri().getPageNum()-1">[이전]</a>&nbsp;
					<%}else{ %>
					[이전]&nbsp;
					<%} %>
					
					<%for(int a=pageMaker.getStartPage();a<=pageMaker.getEndPage();a++){
						if(a==pageMaker.getCri().getPageNum()){%>
						[<%=a %>]
						<%}else{ %>
						<a href="./reviewList.re?pageNum=<%=a %>">[<%=a %>]</a>
						&nbsp;
						<%} %>
					<%} %>
					
					<%if(pageMaker.isNext()){ %>
					<a href="./reviewList.re?pageNum=<%=pageMaker.getCri().getPageNum()+1 %>&amount=10">[다음]</a>
					<%}else{ %>
					[다음]
					<%} %>
				</td>
			</tr>
		</table>

<%@include file="../includes/footer.jsp"%>