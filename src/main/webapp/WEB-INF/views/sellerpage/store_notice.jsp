<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<%@ page import="java.util.*"%>
<%@include file="../includes/header.jsp"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/store_noticeStyle.css" type="text/css">

<%
	ArrayList<SRNoticeVO> srNoticeList = (ArrayList<SRNoticeVO>)request.getAttribute("srNoticeList");

%>
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
        </div>
    </section>
	        	
	<!-- store_notice -->
    <div class="title">
		<h3>문의 관리</h3>
	</div>
	<hr align="center" style="border: solid 3px black; width: 40%;">
		
<%
		for(int i = 0; i < 5; i++){
%>
<%
			if(i == 3){						
	%>		
				<div class="uid">
		            <h5>작성자 : 정수빈 고객님</h5>
		        </div>
			 <div class="qnabox1">	
				<div class="qnatitle">	 
		            <h5>제목 : 문의 이씁니다ㅏ</h5><br>         
		        </div>
		        <div class="qnacontent">
		            <h5>내용 : 홈페이지 디자인 왜이래여</h5>
		        </div>
		        <div class="qnabox2">
		        	<p><br></p>
		         	<h5>답변 : 글쎄여 저두 몰라여</h5>
		        </div>
		   	 </div>
		        <button class="button"><h5>답변 삭제</h5></button>
		<%}else{%>
				<div class="uid">
		            <h5>작성자 : 정수빈 고객님</h5>
		        </div>
		      <div class="qnabox3">	
				<div class="qnatitle">	 
		            <h5>제목 : 문의 이씁니다ㅏ</h5><br>         
		        </div>
		        <div class="qnacontent">
		            <h5>내용 : 홈페이지 디자인 왜이래여</h5>
		        </div>
		      </div>
		        <button class="button"><h5>답변 등록</h5></button>
		<%	}%>
		
<%	}%>


















	      