<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.spring.gogidang.domain.*"%>
<%@include file="../includes/header.jsp"%>
<%

	SRReviewVO srReviewvo = (SRReviewVO)request.getAttribute("srReviewvo");
	
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
        </div>
    </section>
    <!--네비게이션바 사용 끝-->
    <!-- Hero Section End -->
<form name="reply_regForm" action="./replyReviewInsert.bo" method="post">
<input type="hidden" name = "review_num" value=<%=srReviewvo.getReview_num() %>>
<input type="hidden" name = "s_num" value=<%=srReviewvo.getS_num() %>>
<input type="hidden" name = "comment_num" value=<%=srReviewvo.getComment_num()+1 %>>
<center>

<table border=1>
	<thead>		
	<tr><th colspan="6">리뷰 게시판</th></tr>
	<tr>
		<th>글제목</th>
		<th>작성자</th>
		<th>글내용 </th>
		<th>리뷰사진</th>
		<th>등록일자</th>
		<th>별점</th>
	</tr>
	</thead>
	<tbody>
	<tr>
		<td><span name="title" type="text" /><%=srReviewvo.getTitle() %></td>
		<td><span name="u_id" type="text" /><%=srReviewvo.getU_id() %></td>
		<td><span name="content" type="text" /><%=srReviewvo.getContent() %></td>
		<td><span name="photo1" type="text" /><%=srReviewvo.getPhoto1() %></td>
		<td><span name="review_date" type="text" /><%=srReviewvo.getReview_date() %></td>
		<td><span name="star" type="text" /><%=srReviewvo.getStar() %></td>
	</tr>		
	<tr>
		<th colspan="2">답변내용 : </th> 
		<td colspan="4"><input name="re_content" type="text" /></td>
	</tr>
	<tr>
		<th colspan="3">답변날짜 : </th> 		
		<td colspan="3"><input name="re_date" type="text" /></td>
	</tr>
	<tr>
		<td colspan="3"><a href="javascript:reply_regForm.submit()">등록</a></td>
		<td colspan="3"><a href="javascript:reply_regForm.reset()">다시 입력</a></td>
	</tr>
	</tbody>
</table>
</center>
</form>
<%@include file="../includes/footer.jsp"%>