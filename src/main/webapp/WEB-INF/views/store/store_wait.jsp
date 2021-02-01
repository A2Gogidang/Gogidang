<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.*"%>
<%@ page import="com.spring.gogidang.domain.*"%>

<%@include file="../includes/header_simple.jsp"%>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/shop-details.css"
	type="text/css">
<%
	StoreVO svo = (StoreVO) request.getAttribute("svo");
%>

<section class="product-details spad" style="padding-top: 0%;">
	<div class="container">
		<div class="row">

			<div class="col-lg-6 col-md-6">
				<div class="product__details__pic">
					<div class="product__details__pic__item">
						<%-- <img src="resources/img/store/<%=svo.getThumbnail()%>" style="height:240px;">
						<img src="resources/img/store/<%=svo.getS_img() %>" style="height:240px;"> --%>
						<img src="resources/img/store/daeho.jpg" style="height:240px;">
						<img src="resources/img/store/daeho.jpg" style="height:240px;">
					</div>
				</div>
			</div>

			<!-- 사진옆정보 -->
			<div class="col-lg-6 col-md-6">
				<div class="product__details__text">
					<h3 style="display: inline-flex; color: #7fad39;"><%=svo.getS_name()%></h3>
					<div class="product__details__price"
						style="color: black; font-size: 20px;">주소</div>
					<p><%=svo.getS_addr()%></p>
					<div class="product__details__price"
						style="color: black; font-size: 20px;">가게소개</div>
					<p>한줄 소개글 추가</p>
					<ul id="seller_detail">
						<li><b>운영시간</b> <span><%=svo.getS_hour()%></span></li>
						<li><b>전화번호</b> <span><%=svo.getS_phone()%></span></li>
						<li><b>휴무일</b> <span>2,4주 일요일</span></li>
					</ul>
				</div>
			</div>

			<div>
				<input type="hidden" id="msg" value="승인되었습니다." />
				<input type="hidden" id="u_id" value=<%=svo.getU_id() %> />
				<input type="hidden" id="s_num" value=<%=svo.getS_num() %> />				
				<input type="button" id="confirmBtn" value="승인"/>
				<input type="button" id="refuseBtn" value="거절"/>
			</div>
		</div>
	</div>
</section>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

<script>

var u_id = $('input#u_id').val();
var s_num = $('input#s_num').val();

$(document).ready( function() {
	$('#confirmBtn').on('click', function(evt) {
		$.ajax({
			url: 'confirmStore.re',
			type : 'POST',
			data : {'s_num' : $('input#s_num').val()},
			contentType : 'application/x-www-form-urlencoded;charset=utf-8',
			dataType : 'json',
			success : function(retVal) {
				// webSocket에 보내기 (confirm, 댓글작성자(admin), 게시글작성자(u_id), 글번호(s_num))
				if (retVal.res == "confirm") {
					let socketMsg = ("confirm," + "admin," + u_id + "," + s_num);
					console.debug("ssssssmsg>> ", socketMsg);
					socket.send(socketMsg);	
				} else {
					alert("confirm Fail!!!!");
				}
			}, 
			error:function() {
				alert("confirm ajax 통신 실패!!")
			}
		});
		
		evt.preventDefault();
		if (socket.readyState !== 1) return;
		
/* 		let msg = $('input#msg').val();
		socket.send(msg);
 */
	});
	
	$('#refuseBtn').on('click', function(evt) {
		$.ajax({
			url: 'refuseStore.re',
			type : 'POST',
			data : {'s_num' : $('input#s_num').val()},
			contentType : 'application/x-www-form-urlencoded;charset=utf-8',
			dataType : 'json',
			success : function(retVal) {
				// webSocket에 보내기 (confirm, 댓글작성자(admin), 게시글작성자(u_id), 글번호(s_num))
				if (retVal.res == "refuse") {
					let socketMsg = ("refuse," + "admin," + u_id + "," + s_num);
					console.debug("ssssssmsg>> ", socketMsg);
					socket.send(socketMsg);	
				} else {
					alert("confirm Fail!!!!");
				}
			}, 
			error:function() {
				alert("confirm ajax 통신 실패!!")
			}
		});
	});
});
</script>


<%@ include file="../includes/footer.jsp"%>