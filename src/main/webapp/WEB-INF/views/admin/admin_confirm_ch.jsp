<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/updateStyle.css"
	type="text/css">
<%
	StoreVO svo = (StoreVO) request.getAttribute("storeVO");
%>

<%@include file="../includes/header.jsp"%>

<!--네비게이션바 사용 시작-->
<section class="hero">
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
</section>

<!-- Hero Section End -->

<div class="container" id="update">
	<div class="row justify-content-center">
		<div class="col-lg-8">
			<div class="update">

				<h3>
					<!-- 가게이름 -->
					<%=svo.getS_name() %>
				</h3>
				<div class="container-fluid" style="margin-bottom: 30px;">
					<div class="row">
						<div class="col-md-12">
							<img alt="Bootstrap Image Preview"
								src="resources/img/store/<%=svo.getThumbnail()%>" />
						</div>
					</div>
				</div>
				<!-- join form -->
				<form name="seller_info_form" action="./updateForm.me" method="post">
					<div class="id_input_box">
						<ts>사업자 등록 번호</ts>
						<td><%=svo.getS_num()%></td>
					</div>

					<div class="id_input_box">
						<ts>아이디</ts>
						<td><%=svo.getU_id()%></td>
					</div>

					<div class="id_input_box">
						<ts>가게 이름</ts>
						<td><%=svo.getS_name()%></td>
					</div>

					<div class="id_input_box">
						<ts>휴대폰번호</ts>
						<td><%=svo.getS_phone()%></td>
					</div>

					<div class="id_input_box">
						<ts>가게 주소</ts>
						<td><%=svo.getS_addr()%></td>
					</div>

					<div class="id_input_box">
						<ts>영업시간</ts>
						<td><%=svo.getS_hour()%></td>
					</div>

					<div class="id_input_box">
						<ts>배달가능 여부</ts>
						<%
							if (svo.getDelibery() == 0) {
						%>
						<td>불가능</td>
						<%
							} else {
						%>
						<td>가능</td>
						<%
							}
						%>
					</div>

					<div class="join_btn">
						<a href="./confirmStore.st?s_num=<%=svo.getS_num()%>">승인</a>
						<a href="./refuseStore.st?s_num=<%=svo.getS_num()%>">거절</a>
						<!-- <button class="btn-jj btn-lg btn-block btn-success"
							style="margin-top: 5px;">승인</button>
						&nbsp;&nbsp;&nbsp;
						<button class="btn-jj btn-lg btn-block btn-success"
							style="color: white">거절</button> -->
					</div>


					<!-- 
					<tr align=center>
						<td colspan=2><a href="./updateForm.me">수정</a></td>
					</tr>
					 -->
				</form>
			</div>
		</div>
	</div>
</div>

<%@include file="../includes/footer.jsp"%>