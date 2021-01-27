<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>  
<%@ page import="com.spring.gogidang.domain.*" %>
<%@ page import="java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	$(document).ready(function(){
		$("#btnList").click(function(){
			location.href="";
		});
	});
</script>
</head>
<body>
	<h2>장바구니 확인</h2>
	<c:choose>
		<c:when test="${map.count == 0}">
			장바구니가 비어있습니다.
		</c:when>
		<c:otherwise>
			<form name="form1" id="form1" method="post" action="">
				<table border="1">
					<tr>
						<th>상품명</th>
						<th>단가</th>
						<th>수량</th>
						<th>금액</th>
						<th>취소</th>
					</tr>
					<c:forEach var="row" items="${map.list}" varStatus="i">
					<tr>
						<td>
							${row.menuName}
						</td>
						<td style="width: 80px" align="right">
							<fmt:formatNumber pattren="###,###,###" value="${row.menuPrice }" />
						</td>
						<td>
							<input type="number" style="width: 40px" name="amount" value="${row.amount }"  min="1"><br>
							<input type="hidden" name="menuNum" value="${row.menuNum}">							
						</td>
						<td style="width:100px" align="right">
							<fmt:formatNumber pattern="###,###,###" value="${row.money}" />
						</td>
						<td>
							<a href="${path}/store_info/cart/delete.ct?cartNum=${row.CartNum}">삭제</a>
						</td>
					</tr>
					</c:forEach>
					<tr>
						<td colspan="5" align="right">
							장바구니 금액 합계 : <fmt:formatNumber pattern="###,###,###" value="${map.sumMoney }"/><br>
							배송료 : ${map.fee}<br>
							전체 주문금액 : <fmt:formatNumber pattern="###,###,###" value="${map.allSum}"/>
						</td>
					</tr>
					</table>
						<input type="hidden" name="count" value="${map.count}">
						<button type="submit" id="btnUpdate">수정</button>
	
			</form>
		</c:otherwise>
	</c:choose>
	<button type="button" id="btnList">상품목록</button>
</body>
</html>