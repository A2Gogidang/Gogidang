<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ page import = "com.spring.gogidang.domain.*" %>
<%@include file="../includes/header.jsp"%>

<%
	MemberVO memberVO = (MemberVO) session.getAttribute("MemberVO");
	String id = memberVO.getU_id();
	List<ReviewVO> review_list = (List<ReviewVO>) request.getAttribute("list");
	PageDTO  pageMaker = (PageDTO) request.getAttribute("pageMaker");
%>
<!-- <script type="text/javascript">
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
</script> -->

	<h3><%=id %></h3>
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
<%-- 			<c:forEach items="${review_list }" var="review_list">
				<tr>
					<td><c:out value="${review_list.title }" /></td>
					<td><a href='reviewInfo.re?review_num=<c:out value="${reviewList.review_num }" />&s_num=<c:out value="${reviewList.s_num }" />'><c:out value="${reviewList.title }" /></a></td>
					<td><c:out value="${reviewList.star }" /></td>
					<td ><fmt:formatDate pattern="yyyy-MM-dd" value="${reviewList.re_date }" /></td>
				</tr>
			</c:forEach> --%>
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
		
<!-- 		
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
					/.modal-content
				</div>
				/.modal-dialog
			</div>
-->
<%@include file="../includes/footer.jsp"%>