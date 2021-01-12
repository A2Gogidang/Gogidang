<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.spring.gogidang.domain.*"%>
<%
	MemberVO memberVO = (MemberVO)session.getAttribute("MemberVO");	
	ArrayList<SRNoticeVO> srNoticeList = (ArrayList<SRNoticeVO>)request.getAttribute("srNoticeList");

%>
<html>
<head>
<title>판매자 마이페이지</title>
<script>

</script>
</head>
<body>
<header><%=memberVO.getU_nick() %>님 </header>
<center>
<h1><a href="./main.me">메인페이지</a></h1>
	<table border="1">
	<tr>
	<td><a href="./updateForm.me">내정보</a></td>
	<td><a href="./storeRegForm.st">가게 정보</a></td>
	<td><a href="./menuRegForm.st">메뉴 정보</a></td>
	<td><a href="./storeNoticeList.no">문의 관리</a></td>
	<td><a href="./storeRegForm.st">리뷰 관리</a></td>
	</tr>
	</table><br><br>
<table border=1>
	<thead>		
	<tr><th colspan="5">문의 게시판</th></tr>
	<tr>
		<th>글번호</th>
		<th>글제목</th>
		<th>작성자</th>
		<th>글내용 </th>
		<th>문의날짜</th>
	</tr>
	</thead>
	<tbody>

	<%
	
	for(int i = 0; i < srNoticeList.size(); i++){ 
		SRNoticeVO vo = (SRNoticeVO)srNoticeList.get(i);
		
		int num = i+1;
	%>
	<tr>
		<td><%=num %></td>
		<td><span name="title" type="text" /><%=vo.getTitle() %></td>
		<td><span name="content" type="text" /><%=vo.getU_id() %></td>
		<td><span name="content" type="text" /><%=vo.getContent() %></td>
		<td><span name="qna_date" type="text" /><%=vo.getQna_date() %></td>
	</tr>
		<%
		if(vo.getRe_content() == null || vo.getRe_content() == ""){
		%>
	<tr>
		<td colspan="5"><a href="replyNoticeInputForm.no?qs_num=<%=vo.getQs_num()%>">답변하기</a></td>
	</tr>
		<%
		}else{
		%>
	<tr>
		<th colspan="2">답변내용 : </th> 
		<td colspan="3"><span name="content" type="text" /><%=vo.getRe_content() %></td>
	</tr>
	<tr>
		<th colspan="2">답변날짜 : </th> 		
		<td colspan="3"><span name="re_date" type="text" /><%=vo.getRe_date() %></td>
	</tr>
	<tr>
		<td colspan="5"><a href="replyNoticeDelete.no?qs_num=<%=vo.getQs_num()%>">답변 삭제</a></td>		
	</tr>	
	<%
		}
	}
	%>
	</tbody>
</table>
</center>


</body>
</html>
