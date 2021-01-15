<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.spring.gogidang.domain.*" %>

<%
	MemberVO mvo = (MemberVO) session.getAttribute("MemberVO");
	StoreVO svo = (StoreVO) request.getAttribute("svo");
	ReviewVO rvo = (ReviewVO) request.getAttribute("rvo");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰작성</title>
</head>
<body>
	<h1><%=mvo.getU_id() %></h1>
	<form name="review_form" action="./reviewReg.re" method="post">
            <table border=1>
                <tr>
                    <td colspan="2" align=center>
                        <b><font size=3><%=svo.getS_name() %>가게 후기등록 페이지</font></b>
                        <input type="hidden" name="s_name" value="<%=svo.getS_name() %>">
                        <input type="hidden" name="u_id" value="<%=mvo.getU_id() %>">
                    	<input type="hidden" name="s_num" value="<%=svo.getS_num() %>">
                    	<input type="hidden" name="nickname" value="<%=mvo.getU_nick()%>">
                    </td>
                </tr>
                <tr>
                    <td>리뷰제목 : </td>
                    <td><input type="text" name="title"></td>
                </tr>
                <tr>
                    <td>리뷰내용 : </td>
                    <td><input type="text" name="content"></td>
                </tr>
                <tr>
                    <td>별점 : </td>
                    <td>
						<input type="radio" name="star" value="1"/>1점
						<input type="radio" name="star" value="2"/>2점
						<input type="radio" name="star" value="3"/>3점
						<input type="radio" name="star" value="4"/>4점
						<input type="radio" name="star" value="5"/>5점
					</td>
                </tr>
                <tr>
                    <td>리뷰사진1 : </td>
                    <td><input type="text" name="photo1"></td>
                </tr>
                <tr>
                    <td>리뷰사진2 : </td>
                    <td><input type="text" name="photo2"></td>
                </tr>
                <tr>
                    <td>리뷰사진3 : </td>
                    <td><input type="text" name="photo3"></td>
                </tr>
                <tr>
                    <td colspan="2" align=center>
                        <a href="javascript:review_form.submit()">리뷰등록</a>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align=center>
                        <a href="./reviewList.re">리뷰리스트보기</a>
                    </td>
                </tr>
            </table>
        </form>
</body>
</html>