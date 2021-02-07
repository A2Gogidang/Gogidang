<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@include file="../includes/header_simple.jsp"%>
<%@ page import="com.spring.gogidang.domain.*"%>
<%
	MemberVO memberVO = (MemberVO) session.getAttribute("memberVO");
	QnaStoreVO qsVO = (QnaStoreVO)request.getAttribute("qsVO");
%>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/qna_view.css"
	type="text/css">

<script>
	function addboard() {
		qnaform.submit();
	}
</script>


<section class="product spad">
	<div class="container">
		<div class="row">
			<div class="qnaboards">
				<div class="col-lg-9">
					<div class="section-title product__discount__title">
						<h2>문의 내용</h2>
					</div>

					<form action="./qnawrite.qn" method="post" name="qnaform">
						<input type="hidden" name="u_id" value="<%=memberVO.getU_id()%>">
						<div class="qnaboardsl">
							<div class="id_input_box">
								<ts> 글쓴이 </ts>
								<td><%=memberVO.getU_id()%></td>
							</div>
							<div class="id_input_box_t">
								<ts> 제 목 </ts>
								<td><input name="title" type="text" size="50"
									value="<%=qsVO.getTitle()%>" readonly /></td>
							</div>
							<div class="id_input_box">
								<ts> 내 용 </ts>
								<td><textarea readonly><%=qsVO.getContent()%></textarea></td>
							</div>
							<div class="id_input_box" style="margin-top: 10px;">
							<%if(qsVO.getRe_content() != null) {%>
								<ts> 답 변 </ts>
								<td><textarea readonly><%=qsVO.getRe_content()%></textarea></td>
							<%}else { %>
								<ts> 답 변 대 기 </ts>
							<%} %>
							</div>
						</div>
						<div class="join_btns">
							<div class="join_btn">
								<button type="button"
									class="btn-jj btn-lg btn-block btn-success"
									onClick="history.go(-1)">목록</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</section>
<%@include file="../includes/footer.jsp"%>