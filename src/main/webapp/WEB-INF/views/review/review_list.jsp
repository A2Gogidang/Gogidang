<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page import = "com.spring.gogidang.domain.*" %>

<%
	MemberVO memberVO = (MemberVO) session.getAttribute("MemberVO");
	String id = memberVO.getU_id();
	ArrayList<ReviewVO> reviewList = (ArrayList<ReviewVO>) request.getAttribute("reviewList");
	PageDTO  pageMaker = (PageDTO) request.getAttribute("pageMaker");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가게리뷰리스트</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		
		$(document).ready(function() {
			var result = '<c:out value="${result}"/>';
			checkModal(result);
			history.replaceState({},null,null);
			function checkModal(result) {
				
				if (result === '' || history.state) {
					return;
				}
		
				if (parseInt(result) > 0) {
					$(".modal-body").html( "게시글 " + parseInt(result) + " 번이 등록되었습니다.");
				}
				$("#myModal").modal("show");
			}
		});
	</script>
</head>
<body>
	<h1><%=id %></h1>
	<center>
		<table border=1 width=300>
			<tr align=center>
				<td colspan=4>가게 후기 리스트</td>
			</tr>
		<%
			if (reviewList.size() == 0) {
		%>
			<h3>아직 등록된 후기가 없습니다.</h3>
		<%
			}
		%>
			<tr>
				<td>num</td>
				<td>title</td>
				<td>star</td>
				<td >reg_date</td>
			</tr>
			<c:forEach items="${reviewList }" var="reviewList">
				<tr>
					<td><c:out value="${reviewList.review_num }" /></td>
					<td><a href='reviewInfo.re?review_num=<c:out value="${reviewList.review_num }" />&s_num=<c:out value="${reviewList.s_num }" />'><c:out value="${reviewList.title }" /></a></td>
					<td><c:out value="${reviewList.star }" /></td>
					<td ><fmt:formatDate pattern="yyyy-MM-dd" value="${reviewList.re_date }" /></td>
				</tr>
			</c:forEach>
<%-- 		<%
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
		%> --%>
			<tr align=center>
				<td colspan=4>
					<a href="#">해당가게리뷰작성</a>
				</td>
			</tr>
			<tr align=center height=20>
				<td colspan=7 style=font-family:Tahoma;font-size:10pt;>
					<%if(pageMaker.isPrev()){ %>
					<a href="./boardlist.bo?page=pageMaker.getCri().getPageNum()-1">[이전]</a>&nbsp;
					<%}else{ %>
					[이전]&nbsp;
					<%} %>
					
					<%for(int a=pageMaker.getStartPage();a<=pageMaker.getEndPage();a++){
						if(a==pageMaker.getCri().getPageNum()){%>
						[<%=a %>]
						<%}else{ %>
						<a href="./boardlist.bo?page=<%=a %>">[<%=a %>]</a>
						&nbsp;
						<%} %>
					<%} %>
					
					<%if(pageMaker.isNext()){ %>
					<a href="./boardlist.bo?page=<%=pageMaker.getCri().getPageNum()+1 %>">[다음]</a>
					<%}else{ %>
					[다음]
					<%} %>
				</td>
			</tr>
		</table>
		
		
			<!-- Modal  추가 -->
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
							<h4 class="modal-title" id="myModalLabel">Modal title</h4>
						</div>
						<div class="modal-body">처리가 완료되었습니다.</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
							<button type="button" class="btn btn-primary" data-dismiss="modal">Save changes</button>
						</div>
					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal-dialog -->
			</div>
			<!-- /.modal -->

	
</body>
</html>