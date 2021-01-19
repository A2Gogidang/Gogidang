<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.spring.gogidang.domain.*" %>
<%
	MemberVO mvo = (MemberVO) session.getAttribute("MemberVO");
	StoreVO svo = (StoreVO) request.getAttribute("svo");
	ReviewVO rvo = (ReviewVO) request.getAttribute("rvo");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰작성</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous">
</script>
</head>
<body>
	<form id="review_reg_form" action="./reviewReg.re" method="post" enctype="multipart/form-data">
		<input type="hidden" name="s_name" value="<%=svo.getS_name() %>">
        <input type="hidden" name="u_id" value="<%=mvo.getU_id() %>">
        <input type="hidden" name="s_num" value="<%=svo.getS_num() %>">
        <input type="hidden" name="nickname" value="<%=mvo.getU_nick()%>">
		제목 : <input type="text" name="title" /> <br><br>
		내용 : <input type="text" name="content" /> <br><br>
		별점 : <input type="text" name="star" /> <br><br>
		<div class="inputArea"></div>
			<label for="review_img">이미지</label>
			파일1 : <input id="review_img1" type="file" name="file" multiple="multiple"> <br><br>
			파일2 : <input id="review_img2" type="file" name="file" multiple="multiple"> <br><br>
			파일3 : <input id="review_img3" type="file" name="file" multiple="multiple"> <br><br>
			<div class="select_img">
				<img id="review_img1" src="" />
				<img id="review_img2" src="" />
				<img id="review_img3" src="" />
			</div>
		</div>
		<input type="button" value="리뷰작성" onclick="fnAction('./reviewReg.re')" multiple />
	</form>
	
	<script>
		function fnAction(url) {
			var frm = document.getElementById("review_reg_form");
			frm.action = url;
			frm.submit();
		}
		
		$("#review_img1").change(function () {
			var reader = new FileReader;
			reader.onload = function(data) {
				$(".select_img>#review_img1").attr("src", data.target.result).width(500);
			}
			reader.readAsDataURL(this.files[0]);
		});
		
		$("#review_img2").change(function () {
			var reader = new FileReader;
			reader.onload = function(data) {
				$(".select_img>#review_img2").attr("src", data.target.result).width(500);
			}
			reader.readAsDataURL(this.files[0]);
		});
		
		$("#review_img3").change(function () {
			var reader = new FileReader;
			reader.onload = function(data) {
				$(".select_img>#review_img3").attr("src", data.target.result).width(500);
			}
			reader.readAsDataURL(this.files[0]);
		});
	</script>
</body>
</html>