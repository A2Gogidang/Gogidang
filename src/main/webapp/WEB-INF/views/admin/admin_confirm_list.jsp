<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.spring.gogidang.domain.*"%>
<%@ page import="java.util.*"%>
<%
	ArrayList<StoreVO> storeList = (ArrayList<StoreVO>) request.getAttribute("list");
	PageDTO pageMaker = (PageDTO) request.getAttribute("pageMaker");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.th, td {
	font-size: 16px;
}

.pagination-lg {
	font-size: 16px;
}

.page-item {
	color: rgb(51, 131, 51);
}

.page-link {
	color: rgb(51, 131, 51);
}

.pagination {
	color: rgb(51, 131, 51);
}
</style>
<body>
	<!--네비게이션바 사용 시작-->
	<%@include file="../includes/header.jsp"%>
	<div class="container">
		<div class="hero__item__box2"></div>
		<div class="EventNav">
			<ul>
				<li><a href="./admin_notice_insert.me">공지사항 등록</a></li>
				<li><a href="./admin_event_insert.me">이벤트 등록</a></li>
				<li><a href="./admin_confirm_list.me">가게 승인</a></li>
			</ul>
		</div>
	</div>


	<div class="section-title" style="margin-top: 70px;">
		<h2 style="margin-top: 30px;">가게승인 리스트</h2>
	</div>


	<div class="container-fluid">
		<div class="row">
			<div class="qnaList" style="width: 1370px;">
				<table class="table table-striped">
					<thead>
						<tr>
							<th>가게번호</th>
							<th>가게이름</th>
							<th>작성자</th>
							<th>날짜</th>
						</tr>
					</thead>
					<tbody>
						<%
							if (storeList.size() > 0) {
								for (int i=0; i<storeList.size(); i++) {
									StoreVO vo = (StoreVO) storeList.get(i);
						%>
							<tr>
								<td><%=vo.getS_num() %></td>
								<td><a href="./admin_confirm_ch.me?s_num=<%=vo.getS_num() %>"> <%=vo.getS_name() %> </a></td>
								<td><%=vo.getU_id() %></td>
								<td>등록일 추가</td>
							</tr>
						<%
								}
							} else {
						%>
							<tr>
								<td colspan="4" align="center">대기중인 가게가 없습니다.</td>
							</tr>
						<%
							}
						%>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<class class="pagination-lg">
				<ul class="pagination"
					style="margin-bottom: 30px; display: flex; justify-content: center; align-items: center;">
					<li class="page-item"><a class="page-link" href="#"
						style="color: rgb(51, 131, 51);">Previous</a></li>
					<li class="page-item"><a class="page-link" href="#"
						style="color: rgb(51, 131, 51);">1</a></li>
					<li class="page-item"><a class="page-link" href="#"
						style="color: rgb(51, 131, 51);">2</a></li>
					<li class="page-item"><a class="page-link" href="#"
						style="color: rgb(51, 131, 51);">3</a></li>
					<li class="page-item"><a class="page-link" href="#"
						style="color: rgb(51, 131, 51);">4</a></li>
					<li class="page-item"><a class="page-link" href="#"
						style="color: rgb(51, 131, 51);">5</a></li>
					<li class="page-item"><a class="page-link" href="#"
						style="color: rgb(51, 131, 51);">6</a></li>
					<li class="page-item"><a class="page-link" href="#"
						style="color: rgb(51, 131, 51);">7</a></li>
					<li class="page-item"><a class="page-link" href="#"
						style="color: rgb(51, 131, 51);">8</a></li>
					<li class="page-item"><a class="page-link" href="#"
						style="color: rgb(51, 131, 51);">9</a></li>
					<li class="page-item"><a class="page-link" href="#"
						style="color: rgb(51, 131, 51);">10</a>
					<li class="page-item"><a class="page-link" href="#"
						style="color: rgb(51, 131, 51);">Next</a></li>
				</ul>
			</div>
			<div class="col-md-2"></div>
		</div>
	</div>

	</div>

	<%@include file="../includes/footer.jsp"%>

</body>
</html>