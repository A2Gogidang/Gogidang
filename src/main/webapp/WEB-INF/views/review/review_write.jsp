<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.spring.gogidang.domain.*"%>
<%@include file="../includes/header_simple.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%
	PayVO pvo = (PayVO) request.getAttribute("pvo");
%>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/review_import.css"
	type="text/css">



<div class="section-title product__discount__title" style="display: flex; justify-content: center; aligin-items: center; margin-top: 10px;">
	<h2>리뷰작성</h2>
</div>

<div class="container-fluid" style="padding-right: 400px; padding-left: 400px;">
	<div class="row" style="display: flex; aligin-items: center; justify-content: center;">
	
		<form id="reviewForm" name="reviewForm" action="./reviewRegist.re" method="post" enctype="multipart/form-data">
			<div>
				<input type="hidden" id="u_id" name="u_id" value="<%=mvo.getU_id()%>"> 
				<input type="hidden" id="nickname" name="nickname" value="<%=mvo.getU_nick()%>">
				<input type="hidden" id="pay_num" name="pay_num" value="<%=pvo.getPay_num()%>"> 
				<input type="hidden" id="s_num" name="s_num" value="<%=pvo.getS_num()%>"> 
				<input type="hidden" id="s_name" name="s_name" value ="<%=pvo.getS_name()%>">
			</div>
			<div class="col-md-12">
				<div class="modal-textbox-s" style="display: flex; justify-content: center; aligin-items: center; margin-top: 50px; margin-bottom: 30px;">
					<ts for="star">별점</ts>
					<td>
						<input type="radio" id="star" name="star" class="star" value="1" style="width: 40px;">1 
						<input type="radio" id="star" name="star" class="star" value="2" style="width: 40px;">2 
						<input type="radio" id="star" name="star" class="star" value="3" style="width: 40px;">3
						<input type="radio" id="star" name="star" class="star" value="4" style="width: 40px;">4 
						<input type="radio" id="star" name="star" class="star" value="5" style="width: 40px;">5
					</td>
				</div>
			</div>
			
			<div class="form-group">
				<img id="reviewimg2" src="" width="350px;" height="200px;" />
			</div>

			<div class="form-group">
				<label for="reviewimg1"> 파일첨부 </label> 
				<input id="reviewimg1" name="file" type="file" width="350px;" height="200px;" multiple="multiple" />
			</div>

			<div class="form-group">
				<label for="title"> 제목 </label> 
				<input type="text" class="form-control" id="title" name="title" />
			</div>

			<div class="form-group">
				<label for="content"> 내용 </label>
				<textarea type="content" class="form-control" id="content" name="content" style="height: 250px;"></textarea>
			</div>
			
			<button type="submit" onclick="fnAction('reviewRegist.re')" class="btn btn-primary" style="background-color: #7fad39; border: 0px; width: 100%;" multiple>작성</button>
		</form>
		
	</div>
</div>

<script>
function fnAction(url1) {
	alert(url1);
	var frm = document.getElementById("reviewForm");
	frm.action = url1;
	alert(frm.action);
	frm.submit();
}

$("#reviewimg1").change(function() {
	var reader = new FileReader;
	reader.onload = function(data) {
		$("#reviewimg2").attr("src", data.target.result).width(500);
	}
	reader.readAsDataURL(this.files[0]);
});

</script>


<%@include file="../includes/footer.jsp"%>