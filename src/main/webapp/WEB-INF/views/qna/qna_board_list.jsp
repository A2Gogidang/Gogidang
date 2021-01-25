<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import = "com.spring.gogidang.domain.*" %>
<%@include file="../includes/header.jsp"%>

<%
	MemberVO mvo = (MemberVO) session.getAttribute("MemberVO");
	List<QnaVO> qnalist=(List<QnaVO>)request.getAttribute("qnalist");
	int listcount=((Integer)request.getAttribute("listcount")).intValue();
	int nowpage=((Integer)request.getAttribute("page")).intValue();
	int maxpage=((Integer)request.getAttribute("maxpage")).intValue();
	int startpage=((Integer)request.getAttribute("startpage")).intValue();
	int endpage=((Integer)request.getAttribute("endpage")).intValue();
%>

<html>
<head>
	<title>MVC 게시판</title>
	<style>
.th,td{
font-size: 16px;
}
.pagination-lg{
font-size: 16px;
}
.page-item{
color :rgb(51,131,51);
}
.page-link{
color :rgb(51,131,51);
}

.pagination{
color :rgb(51,131,51);
}
</style>
</head>

<body>

        <div class="container">
            <div class="hero__item__box2"></div>
                    <div class="EventNav">
                        <ul>
                            <li><a href="eventPage.ev">이벤트</a></li>
                            <li><a href="qnalist.qn">문의</a>
                            <li><a href="noticelist.no">공지사항</a></li>
                        </ul>
                    </div>   
            </div>   
            
             
            <div class="section-title" style="margin-top : 70px;">
								<h2 style="margin-top: 30px;">문의 게시판</h2>
							</div>
	
	<div class="container-fluid">
	<div class="row">
		<div class="qnaList" style="width: 1370px;">
			<table class="table table-striped">
				<thead>
					<tr>
						<th>
							번호
						</th>
						<th>
							제목
						</th>
						<th>
							작성자
						</th>
						<th>
							날짜
						</th>
					</tr>
				</thead>
				<tr>
	
	<%	
		int qna_num = listcount - ((nowpage - 1) * 10);
		for(int i=0;i<qnalist.size();i++){
			QnaVO ql=(QnaVO)qnalist.get(i);
	%>
	<tr>
						<td>
							<%=qna_num %>
                        </td>
		
		<td style="font-family:Tahoma;font-size:10pt;">
			<div align="left">
			<%if(ql.getRe_lev()!=0){ %>
				<%for(int a=0;a<=ql.getRe_lev()*2;a++){ %>
				&nbsp;
				<%} %>
				▶
			<%}else{ %>
				▶
			<%} %>
			<a href="./qnadetail.qn?qna_num=<%=ql.getQna_num()%>">
				<%=ql.getTitle()%>
			</a>
			</div>
		</td>
		
		<td style="font-family:Tahoma;font-size:10pt;">
			<div align="center"><%=ql.getU_id() %></div>
		</td>
		<td style="font-family:Tahoma;font-size:10pt;">
			<div align="center"><%=ql.getRe_date() %></div>
		</td>	

	</tr>
	<%
		qna_num--;
		} %>
		</tbody>
		</table>
		<div class="qna_insert" style="text-align: right;">
			<a href="./qnawriteform.qn"><button type="button" class="btn btn-lg btn-outline-secondary" style="background-color: #076507; color: white;">
				글쓰기
            </button>
        </a>
        </div>
	  <div class="container-fluid">
        <div class="row">
            <div class="col-md-2">
            </div>
            <div class="col-md-8">
                <class class="pagination-lg">
                    <ul class="pagination" style="margin-bottom: 30px;display: flex; justify-content: center; align-items: center;">
                      <%if(nowpage<=1){ %>
					<li class="page-item">
                            <a class="page-link" href="#"style="color :rgb(51,131,51);">Previous</a>
                        </li>
					<%}else{ %>
                        <li class="page-item">
                            <a class="page-link" href="./qnalist.qn?page=<%=nowpage-1 %>"style="color :rgb(51,131,51);">Previous</a>
                        </li>
                        <%} %>
                        <%for(int a=startpage;a<=endpage;a++){
				if(a==nowpage){%>
				<%=a %>
				<%}else{ %>
				 <li class="page-item">
                            <a class="page-link" href="./noticelist.no?page=<%=a %>"style="color :rgb(51,131,51);"><%=a %></a>
                        </li>
                       <%} %>
                       <%} %>
                    <%if(nowpage>=maxpage){ %>   
                        <li class="page-item">
                            <a class="page-link" href="#"style="color :rgb(51,131,51);">Next</a>
                        </li>
                    <%}else{ %> 
                     <li class="page-item">
                            <a class="page-link" href="./qnalist.qn?page=<%=nowpage+1 %>"style="color :rgb(51,131,51);">Next</a>
                        </li>
                    <%} %>   
                    </ul>
            </div>
            <div class="col-md-2">
            </div>
        </div>
    </div>

</body>
</html>