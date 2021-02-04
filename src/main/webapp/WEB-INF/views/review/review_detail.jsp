<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"href="${pageContext.request.contextPath}/resources/css/review_detail.css"type="text/css">
</head>
<style>
</style>
<body>
 <!--네비게이션바 사용 시작-->
<%@include file="../includes/header.jsp"%>
             
            <div class="section-title" style="margin-top : 70px;">
								<h2 style="margin-top: 50px;">리뷰</h2>
							</div>
            
  <div class="container-fluid">
	<div class="row">
		<div class="col-md-12 cc_cursor"id="review_detail_con" style = " display : flex; aligin-items : center;justify-content : center; width : 1140px;">
			<form role="form" id = "review_detail">
				<div class="form-group">
					 
					<div class="review_title">
					<input type="review_title" class="form-control" id="review_title1" value = "너무맛있어요~"/>
				</div>
				<div class = "review_member_data" style="display : flex;">
				<input type="review_member_nick" class="form-control" id="review_member_nick" value = "종구"/>
				<input type="review_member_date" class="form-control" id="review_member_date" value = "star"/>
				<input type="review_member_date" class="form-control" id="review_member_date" value = "date"/></div>
				</div>
				<div class="form-group">
					 
					<textarea type="notice_insert_content" class="form-control" id="notice_insert_content1"/  placeholder="내용"style="height: 500px;font-size:15px;"></textarea>
				</div>
			</form>
		</div>
	</div>
</div>
    

<%@include file="../includes/footer.jsp"%>

</body>
</html>