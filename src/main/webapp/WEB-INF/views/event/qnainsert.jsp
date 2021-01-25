<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.th,td{
font-size: 16px;
}
.pagination-lg{
font-size: 16px;
}

</style>
<body>
 <!--네비게이션바 사용 시작-->
<%@include file="../includes/header.jsp"%>
        <div class="container">
            <div class="hero__item__box2"></div>
                    <div class="EventNav">
                        <ul>
                            <li><a href="event.jsp">이벤트</a></li>
                            <li><a href="qna.jsp">문의</a>
                            <li><a href="notice.jsp">공지사항</a></li>
                        </ul>
                    </div>   
            </div>   
            
             
            <div class="section-title" style="margin-top : 70px;">
								<h2 style="margin-top: 30px;">문의 글쓰기</h2>
							</div>
            
  <div class="container-fluid">
	<div class="row">
		<div class="col-md-8 cc_cursor">
			<form role="form">
				<div class="form-group">
					 
				
					<input type="qna_title" class="form-control" id="qna_title1" placeholder="제목" style="font-size:15px;"/>
				</div>
				<div class="form-group">
					 
					<textarea type="qna_insert_content" class="form-control" id="qna_insert_content1"placeholder="내용"/ style="height: 300px;font-size:15px;"></textarea>
				</div>
					<input type="radio" name="chk_info" value="agree">동의
					&nbsp;
					<input type="radio" name="chk_info" value="nagree">비동의
					<br>
					<br>
                <label class="qna_insert_password">
                    <h4><input type="password" class="form-control" id="password" placeholder="비밀번호를 입력해주세요"/></h4>
                </label>
                <br>
                <br>
                <button type="button" class="btn btn-success" style="background-color:#026202;">입력</button>
                <button type="button" class="btn btn-back" style="background-color:#026202; color: white;" >뒤로가기</button>
		</div>
	</div>
</div>


<%@include file="../includes/footer.jsp"%>

</body>
</html>