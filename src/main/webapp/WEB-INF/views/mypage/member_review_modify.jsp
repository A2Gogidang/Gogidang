<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="com.spring.gogidang.domain.*" %>
<%
	String id = (String)session.getAttribute("id");
   ReviewVO review = (ReviewVO)request.getAttribute("review");
%>
<html>
<head>
<title>후기</title>
   <script type="text/javascript">
   function modifyReview(){
	   reviewModify.submit();
   }
   </script>
</head>
<body>
   <form action="reviewModify.re" method="post" name="reviewModify">
   <input type="hidden" name="review_num" value="<%=review.getReview_num()%>">
   <input type="hidden" name="u_id" value="<%=review.getU_id()%>"><%=review.getU_id()%>
   <table cellpadding="0" cellspacint="0">
   <tr>
   <td><textarea name="content" rows="15" cols="67">
   <%=review.getContent()%>
   </textarea>
   </td>
   <tr align="right" valign="middle">
   <td>
   <input type="button" value="수정"  onclick="location.href='javascript:modifyReview()'">
   </td>
   </tr>
   </table>
   </form>
</body>
</html>