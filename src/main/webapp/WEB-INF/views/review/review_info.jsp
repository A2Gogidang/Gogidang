<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page import = "com.spring.gogidang.domain.*" %>
<%
	MemberVO mvo = (MemberVO) session.getAttribute("MemberVO");
	ReviewVO rvo = (ReviewVO) request.getAttribute("reviewVO");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
        <form name="review_info" action="./shop_reg.st" method="post">
            <table border=1>
                <tr>
                    <td colspan="2" align=center>
                        <b><font size=5>${reviewVO.title }</font></b>
                    </td>
                </tr>
				<tr>
                    <td>가게명 : </td>
                    <td>${reviewVO.s_name }</td>
                </tr>
                <tr>
                    <td>작성자 아이디 : </td>
                    <td>${reviewVO.u_id }</td>
                </tr>
                <tr>
                    <td>작성자 닉네임 : </td>
                    <td>${reviewVO.nickname }</td>
                </tr>
                <tr>
                    <td>별점 : </td>
                    <td>${reviewVO.star }</td>
                </tr>
                <tr>
                    <td>내용 : </td>
                    <td>${reviewVO.content }</td>
                </tr>
                <tr>
                    <td>리뷰사진 : </td>
                    <td>${reviewVO.photo1 }</td>
                </tr>
                <tr>
                    <td>리뷰등록일 : </td>
                    <td><fmt:formatDate pattern="yyyy-MM-dd" value="${reviewVO.re_date }" /></td>
                </tr>
                <tr>
                    <td colspan="2" align=center>
                        <a href="#">가게리뷰리스트보기</a>&nbsp;&nbsp;
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>