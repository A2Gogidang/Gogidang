<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<%@ page import="java.util.*"%>
<%@include file="../includes/header.jsp"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/store_reviewStyle.css" type="text/css">
<%
	ArrayList<SRReviewVO> srReviewList = (ArrayList<SRReviewVO>)request.getAttribute("srReviewList");

%>
  
    <!--네비게이션바 사용 시작-->
    <section class="hero">
        <div class="container">
            <div class="hero__item__box2"></div>
                    <div class="EventNav">
                        <ul>
                            <li><a href="./updateList.me">내정보</a></li>
                            <li><a href="./storeRegForm.st">가게 정보</a>
                            <li><a href="./menuRegForm.mn">메뉴 정보</a></li>
                            <li><a href="./storeNoticeList.no">문의 관리</a></li>
                            <li><a href="./storereviewList.bo">리뷰 관리</a></li>
                        </ul>
             		</div>   
        </div>   
    </section>
    <!--네비게이션바 사용 끝-->
    <!-- Hero Section End -->

    <div class="title">
		<h3>리뷰 관리</h3>
	</div>
	<hr align="center" style="border: solid 3px black; width: 40%;">
<%
for(int i = 0; i < srReviewList.size(); i++){ 
	
	SRReviewVO srReviewvo = (SRReviewVO)srReviewList.get(i);
%>
	 <p class="date">등록일 : <%=srReviewvo.getReview_date() %></p>
  	 <div class="reviewbox" >
  	 	<div class="reviewimg">
  	 		<img src="./resources/img/DetailStoreImg/Review/BestReview1.png"/>
  	 	</div>
  	 	<div class="content">	
  	 		<h5></h5><br><br>   	
	  	   	<h5>소비자 : <%=srReviewvo.getU_id() %> 고객님</h5><br>
	  	  	<h5>제목 : <%=srReviewvo.getContent() %></h5><br>	  	    
	  	    <p>별점 :
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
			    <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
				</svg><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
			    <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
				</svg><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
			    <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
				</svg><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
			    <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
				</svg><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
			    <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
			    </svg>
			</p>
  	   </div>
  	 </div>
<%
 		if(srReviewvo.getRe_content() == null || srReviewvo.getRe_content() == ""){
%>

	  	<button class="button"><h5>답변 등록</h5></button>

<% 		}else{%>
	 <div class="reviewbox" >
	 	<h4>내 답변</h4>
	 	<div class="recontent">
	 		<p><%=srReviewvo.getRe_content() %></p>
	 	</div>	 
	 </div>
	  	<button class="button"><h5>답변 삭제</h5></button>
<% }%>
	<hr align="center" class="aaa">  	
<% }%>
   		

<%@include file="../includes/footer.jsp"%>