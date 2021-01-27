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
	
	StoreVO storeVO = (StoreVO)session.getAttribute("StoreVO");

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
                            <li><a href="./reviewListBySnWithPaging.re?s_num=<%=storeVO.getS_num() %>">리뷰 관리</a></li>
                        </ul>
                    </div>   
            </div>   
        </div>
    </section>
    

		        	
	<!-- store_notice -->
	<form  id="store_not" action="./storeUpdateForm.st" method="post" enctype="multipart/form-data">
	
   <h3 align="center">문의 관리</h3>
  	 <hr/>
   		<div class="container">
   		<table class="table table-hover">
      	<thead>
	         <tr align=center>
	           <th>글번호</th>
				<th>글제목</th>
				<th>작성자</th>
				<th>글내용 </th>
				<th>문의날짜</th>
				<th>답변하기</th>
	         </tr>
     	 </thead>
     	 <tbody class="text-center">
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
         
			<%
			if(vo.getRe_content() == null || vo.getRe_content() == ""){
			%>	
		  	<td colspan="6"><a href="replyNoticeInputForm.no?qs_num=<%=vo.getQs_num()%>">답변하기</a></td>
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
   </div>
<hr/>

</form>

<%@include file="../includes/footer.jsp"%>