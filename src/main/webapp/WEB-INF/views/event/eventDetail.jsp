<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.col-md-12{
margin-top: 30px;
}
</style>
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
								<h2 style="margin-top: 30px;">이벤트 내용</h2>
							</div>
            
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<img alt="Bootstrap Image Preview" src="resources/img/event/eventPicex.jpg" />
			<h4><dl style="margin-top: 30px;">
				고기당 오픈 기념 이벤트~
				<div>
					친구 초대하면 현금처럼 사용 가능한 2천포인트가 무제한으로~
				</div>
				<div>
					기간: 20.01.26~20.02.26까지
				</div>
				
			</dl>
			</h4>
			
		</div>
	</div>
</div>
<%@include file="../includes/footer.jsp"%>
</body>
</html>