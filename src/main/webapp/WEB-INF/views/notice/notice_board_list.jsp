<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@include file="../includes/header.jsp"%>
<%@ page import="com.spring.gogidang.domain.*"%>

<%
	String u_id=null;
	u_id=(String)session.getAttribute("u_id");
	
 	List<NoticeVO> noticelist=(List<NoticeVO>)request.getAttribute("noticelist");
	int listcount=((Integer)request.getAttribute("listcount")).intValue();
	int nowpage=((Integer)request.getAttribute("page")).intValue();
	int maxpage=((Integer)request.getAttribute("maxpage")).intValue();
	int startpage=((Integer)request.getAttribute("startpage")).intValue();
	int endpage=((Integer)request.getAttribute("endpage")).intValue();
%>

<html>
<head>
	<title>공지사항</title>
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
                            <li><a href="eventList.ev">이벤트</a></li>
                            <li><a href="qnalist.qn">문의</a>
                            <li><a href="noticelist.no">공지사항</a></li>
                        </ul>
                    </div>   
            </div>
  
            <div class="section-title" style="margin-top : 70px;">
								<h2 style="margin-top: 30px;">공지사항</h2>
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
				
				<tbody>
					<tr>
					<%	
		int notice_num = listcount - ((nowpage - 1) * 10);
		for(int i=0;i<noticelist.size();i++){
			NoticeVO nl=(NoticeVO)noticelist.get(i);
	%>
						<td>
							<%=notice_num%>
                        </td>
                       
						<td>
                          
			<a href="./noticedetail.no?notice_num=<%=nl.getNotice_num()%>">
				<%=nl.getTitle()%>
                        </a>
                        </td>
						<td>
							<%=nl.getU_id() %>
						</td>
						<td>
							<%=nl.getRe_date() %>
						</td>
                  
                    </tr>
                
					<%
		notice_num--;
		} %>
				</tbody>
            </table> 
            <div class="qna_insert" style="text-align: right;">
			<a href="noticewriteform.no"><button type="button" class="btn btn-lg btn-outline-secondary"style="background-color: #076507; color: white;">
				글쓰기
            </button>
        </a>
        </div>
    </div>
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
                            <a class="page-link"style="color :rgb(51,131,51);">Previous</a>
                        </li>
                       <%}else{ %>
                        <li class="page-item">
                            <a class="page-link" href="./noticelist.no?page=<%=nowpage-1 %>"style="color :rgb(51,131,51);">Previous</a>
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
                            <a class="page-link"style="color :rgb(51,131,51);">Next</a>
                        </li>    
                        <% }else {%>
                          <li class="page-item">
                            <a class="page-link" href="./noticelist.no?page=<%=nowpage+1%>"style="color :rgb(51,131,51);">Next</a>
                        </li>
                        <%} %> 
                    </ul>
            </div>
            <div class="col-md-2">
            </div>
        </div>
    </div>

</div>

<%@include file="../includes/footer.jsp"%>
</body>
</html>