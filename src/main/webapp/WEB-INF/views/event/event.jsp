<%@page import="java.util.ArrayList"%>
<%@page import="com.spring.gogidang.domain.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<%
ArrayList<EventVO> event_list =(ArrayList<EventVO>) request.getAttribute("event_list");
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.col-md-12{
margin-top: 30px;
}
</style>
</head>
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
								<h2 style="margin-top: 30px;">이벤트</h2>
							</div>
            
<div class="container-fluid"style="display: flex; justify-content: center; align-items: center;">
	<ul>
	<%
			for (int i=0; i<event_list.size(); i++)
				{
				EventVO vo = (EventVO)event_list.get(i);
		%>
	<div class="row">
		<div class="col-md-12">
			<a href="eventGet.ev?event_num=<%=vo.getEvent_num()%>"><img alt="Bootstrap Image Preview" src="resources/img/event/eventPicex.jpg"/>
		</a></div>
	</div>
	<%
	}
	%>
</div>
</ul>
<%@include file="../includes/footer.jsp"%>

</body>
</html>