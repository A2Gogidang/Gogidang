<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page import = "com.spring.gogidang.domain.*" %>
<%@include file="../includes/header.jsp"%>

<%
	MemberVO mvo = (MemberVO) session.getAttribute("MemberVO");
	ReviewVO rvo = (ReviewVO) request.getAttribute("review");
%>

        <form name="review_info" action="./shop_reg.st" method="post">
            <table border=1>
                <tr>
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
				<tr>
                    <td>가게명 : </td>
                    <td>${review.s_name }</td>
                </tr>
                <tr>
                    <td>작성자 아이디 : </td>
                    <td>${review.u_id }</td>
                </tr>
                <tr>
                    <td>작성자 닉네임 : </td>
                    <td>${review.nickname }</td>
                </tr>
                <tr>
                    <td>별점 : </td>
                    <td>${review.star }</td>
                </tr>
                <tr>
                    <td>내용 : </td>
                    <td>${review.content }</td>
                </tr>
                <tr>
                    <td>리뷰등록일 : </td>
                    <td><fmt:formatDate pattern="yyyy-MM-dd" value="${review.review_date }" /></td>
                </tr>
                <tr>
                    <td colspan="2" align=center>
                        <a href="#">가게리뷰리스트보기</a>&nbsp;&nbsp;
                    </td>
                </tr>
            </table>
        </form>
        
<%@ include file="../includes/footer.jsp" %>