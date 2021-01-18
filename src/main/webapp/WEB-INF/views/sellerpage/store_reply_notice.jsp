<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<%@ page import="java.util.*"%>
<%@include file="../includes/header.jsp"%>
<%
	SRNoticeVO srNoticevo = (SRNoticeVO)request.getAttribute("srNoticevo");
	
%>
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
<form name="reply_regForm" action="./replyNoticeInsert.no" method="post">
<input type="hidden" name = "qs_num" value=<%=srNoticevo.getQs_num() %>>
<input type="hidden" name = "s_num" value=<%=srNoticevo.getS_num() %>>
<input type="hidden" name = "s_comment_num" value=<%=srNoticevo.getS_comment_num() %>>
<center>
<table border=1>
	<thead>		
	<tr><th colspan="4">문의 게시판</th></tr>
	<tr>
		<th>글제목</th>
		<th>작성자</th>
		<th>글내용 </th>
		<th>문의날짜</th>
	</tr>
	</thead>
	<tbody>
	<tr>
		<td><span name="title" type="text" /><%=srNoticevo.getTitle() %></td>
		<td><span name="u_id" type="text" /><%=srNoticevo.getU_id() %></td>
		<td><span name="content" type="text" /><%=srNoticevo.getContent() %></td>
		<td><span name="qna_date" type="text" /><%=srNoticevo.getQna_date() %></td>
	</tr>		
	<tr>
		<th colspan="2">답변내용 : </th> 
		<td colspan="2"><input name="re_content" type="text" /></td>
	</tr>
	<tr>
		<th colspan="2">답변날짜 : </th> 		
		<td colspan="2"><input name="re_date" type="text" /></td>
	</tr>
	<tr>
		<td><a href="javascript:reply_regForm.submit()">등록</a></td>
		<td><a href="javascript:reply_regForm.reset()">다시 입력</a></td>
	</tr>
	</tbody>
</table>
</center>
</form>
<%@include file="../includes/footer.jsp"%>
