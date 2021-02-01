<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>   
<%@ page import = "com.spring.gogidang.domain.*" %>
<%
	EventVO eventVO = (EventVO)request.getAttribute("EventVO");
	
%>

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

<body>
 <!--네비게이션바 사용 시작-->
<%@include file="../includes/header.jsp"%>
        <div class="container">
            <div class="hero__item__box2"></div>
                    <div class="EventNav">
                        <ul>
                            <li><a href="eventList.ev">이벤트</a></li>
                            <li><a href="qnalist.qn">문의</a>
                            <li><a href="noticelist.no">공지사항</a></li>
                        </ul>
                    </div>   
            </div>   
            
             
            <div class="section-title" style="margin-top : 70px;">
								<h2 style="margin-top: 30px;">이벤트 내용</h2>
							</div>
            
<div class="container-fluid" style= "display:flex; justify-content: center; align-items: center;" >
	<div class="row">
		<div class="col-md-12">
			<img alt="Bootstrap Image Preview" src="resources/img/event/eventPicex.jpg" />
			<dlv style="margin-top: 30px;">
		
				</div>
				<div>
					<h3>${eventVO.getContent()}</h3>
				</div>
				
				
			</dlv>
			<br>
			<br>
			<br>
			<br>
			<div>
			<!-- <a href="eventList.ev">이벤트 페이지로 돌아가기</a></td> -->
		</div>
	</div>
</div>

<%@include file="../includes/footer.jsp"%>
</body>
</html>