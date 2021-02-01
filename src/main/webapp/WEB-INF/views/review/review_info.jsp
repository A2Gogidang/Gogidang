<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page import = "com.spring.gogidang.domain.*" %>
<%@include file="../includes/header_simple.jsp"%>

<%

	if(mvo != null) {
		u_id = mvo.getU_id();
		seller_key = mvo.getSeller_key();
	} else {
		seller_key = 0;
	}


	SRReviewVO srrvo = (SRReviewVO)request.getAttribute("srReviewvo");
%>

         <form name="review_info" action="./replyReviewInsert.bo" method="post">
            <table border=1>
       <%--          <tr>
                    <td colspan="2" align=center>
                        <b><font size=5>${review.title }</font></b>
                    </td>
                </tr>
                <tr>
                <%
                	if(!(rvo.getReview_img1().toString().equals("null"))) {
                %>	
                	<td><img src="resources/img/up/<%=rvo.getReview_img1() %>" width="100px" height="100px"/></td>
                <%
                	}
                
                	if (!(rvo.getReview_img2().toString().equals("null"))) {
               	%>
               		<td><img src="resources/img/up/<%=rvo.getReview_img2() %>" width="100px" height="100px" /></td>
               	<%
                	} 
                	if (!(rvo.getReview_img3().toString().equals("null"))) {
                %>
                	<td><img src="resources/img/up/<%=rvo.getReview_img3() %>" width="100px" height="100px"/> </td>
                <%
                	}
                %>
                </tr>
 	               --%>
				<tr>
                    <td>제목 : </td>
                    <td><%=srrvo.getTitle() %></td>
                </tr>
                <tr>
                    <td>작성자 아이디 : </td>
                    <td><%=srrvo.getU_id() %></td>
                </tr>
                <tr>
                    <td>별점 : </td>
                    <td><%=srrvo.getStar() %></td>
                </tr>
                <tr>
                    <td>내용 : </td>
                    <td><%=srrvo.getContent() %></td>
                </tr>
                <table border="1">
                <form name="replyform" action="./replyReviewInsert.bo" method="post">
                	<tr>
                		<td>관리자 아이디:</td>
                		<td><%=u_id %></td>
                	</tr>
                	<tr>
                		<td>댓글번호</td>
                		<td><%=srrvo.getReview_num() %></td>
                	</tr>
                	<tr>
                		<td><input type="text" name="re_content"></td>
                	</tr>
                	<tr>
                		<td><button type="submit">등록</button></td>
                	</tr>
                </form>
            	</table>
   
                <tr>
                    <td align=center>
                        <%-- <a href="./storeInfo.st?s_num=<%=rvo.getS_num() %>">해당가게로이동</a>&nbsp;&nbsp; --%>
                        <a href="./reviewListWithPaging.re">후기 목록보기</a>
                    </td>
                </tr>
            </table>
        </form>
        
<%@ include file="../includes/footer.jsp" %>