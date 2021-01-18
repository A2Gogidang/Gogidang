<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<%@ page import="java.util.*"%>
<%@include file="../includes/header.jsp"%>
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
                            <li><a href="./menuRegForm.st">메뉴 정보</a></li>
                            <li><a href="./storeNoticeList.no">문의 관리</a></li>
                            <li><a href="./storereviewList.bo">리뷰 관리</a></li>
                        </ul>
                    </div>   
            </div>   
        </div>
    </section>
    <!--네비게이션바 사용 끝-->
    <!-- Hero Section End -->
<table border=1>
	<thead>		
	<tr><th colspan="7">리뷰 게시판</th></tr>
	<tr>
		<th>글번호</th>
		<th>글제목</th>
		<th>작성자</th>
		<th>글내용 </th>
		<th>리뷰사진</th>
		<th>등록일자</th>
		<th>별점</th>
	</tr>
	</thead>
	<tbody>

	<%
	
	for(int i = 0; i < srReviewList.size(); i++){ 
		SRReviewVO vo = (SRReviewVO)srReviewList.get(i);
		
		int num = i+1;
	%>
	<tr>
		<td><%=num %></td>
		<td><span name="title" type="text" /><%=vo.getTitle() %></td>
		<td><span name="u_id" type="text" /><%=vo.getU_id() %></td>
		<td><span name="content" type="text" /><%=vo.getContent() %></td>
		<td><span name="photo1" type="text" /><%=vo.getPhoto1() %></td>
		<td><span name="review_date" type="text" /><%=vo.getReview_date() %></td>
		<td><span name="star" type="text" /><%=vo.getStar() %></td>
	</tr>
		<%
		if(vo.getRe_content() == null || vo.getRe_content() == ""){
		%>
	<tr>
		<td colspan="7"><a href="replyReviewInputForm.bo?Review_num=<%=vo.getReview_num()%>">답변하기</a></td>
	</tr>
		<%
		}else{
		%>
	<tr>
		<th colspan="3">답변내용 : </th> 
		<td colspan="4"><span name="re_content" type="text" /><%=vo.getRe_content() %></td>
	</tr>
	<tr>
		<th colspan="3">답변날짜 : </th> 		
		<td colspan="4"><span name="re_date" type="text" /><%=vo.getRe_date() %></td>
	</tr>
	<tr>
		<td colspan="7"><a href="replyReviewDelete.bo?Review_num=<%=vo.getReview_num()%>">답변 삭제</a></td>		
	</tr>	
	<%
		}
	}
	%>
	</tbody>
</table>
</center>
<%@include file="../includes/footer.jsp"%>