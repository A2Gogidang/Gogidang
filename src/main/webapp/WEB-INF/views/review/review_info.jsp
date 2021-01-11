<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="java.util.*" %>
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
                        <b><font size=5><%=rvo.getTitle() %></font></b>
                    </td>
                </tr>
				<tr>
                    <td>가게명 : </td>
                    <td><%=rvo.getS_num() %></td>
                </tr>
                <tr>
                    <td>작성자 아이디 : </td>
                    <td><%=rvo.getU_id() %></td>
                </tr>
                <tr>
                    <td>작성자 닉네임 : </td>
                    <td><%=rvo.getNickname() %></td>
                </tr>
                <tr>
                    <td>별점 : </td>
                    <td><%=rvo.getStar() %></td>
                </tr>
                <tr>
                    <td>내용 : </td>
                    <td><%=rvo.getContent() %></td>
                </tr>
                <tr>
                    <td>리뷰사진 : </td>
                    <td><%=rvo.getPhoto1() %></td>
                </tr>
                <tr>
                    <td>리뷰등록일 : </td>
                    <td><%=rvo.getRe_date() %></td>
                </tr>
                <tr>
                    <td colspan="2" align=center>
                        <a href="#">댓글달기 (가게사장이 봣을때만나오게)</a>&nbsp;&nbsp;
                    </td>
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