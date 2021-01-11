<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.spring.gogidang.domain.*" %>

<%
	MemberVO memberVO = (MemberVO) session.getAttribute("MemberVO");
	String id = memberVO.getU_id();
	String nick = memberVO.getU_nick();
	StoreVO storeVO = (StoreVO) request.getAttribute("storeVO");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰작성</title>
</head>
<body>
	<h1><%=id %></h1>
	<form name="review_form" action="./reviewWrite.re" method="post">
            <table border=1>
                <tr>
                    <td colspan="2" align=center>
                        <b><font size=3><%=storeVO.getS_name() %>가게 후기등록 페이지</font></b>
                    </td>
                </tr>
                <tr>
                    <td>작성자 아이디 : </td>
                    <td><input type="hidden" name="u_id" value="<%=id %>"/><%=id %></td>
                </tr>
                <tr>
                    <td>사업자등록번호 : </td>
                    <td><input type="hidden" name="s_num" value="<%=storeVO.getS_num() %>"><%=storeVO.getS_num() %></td>
                </tr>
                <tr>
                    <td>리뷰제목 : </td>
                    <td><input type="text" name="title"></td>
                </tr>
                <tr>
                    <td>소비자닉네임 : </td>
                    <td><input type="hidden" name="nickname" value="<%=nick %>"><%=nick %></td>
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
                    <td>리뷰조회수 : </td>
                    <td><input type="text" name="hit"></td>
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