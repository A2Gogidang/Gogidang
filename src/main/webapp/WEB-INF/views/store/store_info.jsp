<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="java.util.*" %>
<%@ page import = "com.spring.gogidang.domain.*" %>

<%
	MemberVO memberVO = (MemberVO) session.getAttribute("MemberVO");
	String id = memberVO.getU_id();
	StoreVO vo = (StoreVO) request.getAttribute("storeVO");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가게정보</title>
</head>
<body>
	<h1><%=id %></h1>
        <form name="store_info" method="post">
            <table border=1>
                <tr>
                    <td colspan="2" align=center>
                        <b><font size=5>가게 정보</font></b>
                    </td>
                </tr>
				<tr>
                    <td>사업자등록번호 : </td>
                    <td><%=vo.getS_num() %></td>
                </tr>
                <tr>
                    <td>아이디 : </td>
                    <td><%=vo.getU_id() %></td>
                </tr>
                <tr>
                    <td>메인사진 : </td>
                    <td><%=vo.getThumbnail() %></td>
                </tr>
                <tr>
                    <td>가게이름 : </td>
                    <td><%=vo.getS_name() %></td>
                </tr>
                <tr>
                    <td>가게주소 : </td>
                    <td><%=vo.getS_addr() %></td>
                </tr>
                <tr>
                    <td>가게전화번호 : </td>
                    <td><%=vo.getS_phone() %></td>
                </tr>
                <tr>
                    <td>사업자등록증 : </td>
                    <td><%=vo.getS_img() %></td>
                </tr>
                <tr>
                    <td>가게운영시간 : </td>
                    <td><%=vo.getS_hour() %></td>
                </tr>
                <tr>
                    <td>배달가능여부 : </td>
                    <td><%=vo.getDelibery() %></td>
                </tr>
                <tr>
                    <td>가게등록승인여부 : </td>
                    <td><%=vo.getConfirm() %></td>
                </tr>
                <%
                	if(vo.getConfirm() == 1) {
           		%>
                <tr>
                    <td colspan="2" align=center>
                        <a href="./reviewWriteForm.re?s_num=<%=vo.getS_num()%>">해당가게리뷰작성</a>&nbsp;&nbsp;
                        <a href="./reviewListSnum.re?s_num=<%=vo.getS_num()%>">해당가게리뷰보기</a>
                    </td>
                </tr>           			
           		<%
                	} else {
            	%>
         		<tr>
					<td colspan="2" align=center>
						<a href="confirmStore.st?s_num=<%=vo.getS_num() %>">승인</a>
						<a href="refuseStore.st?s_num=<%=vo.getS_num() %>">거절</a>
					</td>
				</tr>
            	<%
                	}
                %>
                <tr>
                    <td colspan="2" align=center>
                        <a href="./storeList.st">가게리스트보기</a>&nbsp;&nbsp;
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>