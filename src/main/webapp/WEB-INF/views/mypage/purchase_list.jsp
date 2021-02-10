<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.spring.gogidang.domain.*" %>
<%@include file="../includes/header_simple.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>


<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/member_liststoreStyle.css"
	type="text/css">
	
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/modal_small.css"
	type="text/css">

<!-- Product Section Begin -->
<section class="product spad">
	<div class="container" >
		<div class="row">
			<div class="myreview">
				<div class="col-lg-3" id="nav-bar">
		            <div class="hero__categories">
		                  <div class="hero__categories__all">
		                  	<span>마이페이지</span>
		              	  </div>
		              	  	<ul>
								<li><a href="./updateList.me">내정보</a></li>
								<li><a href="./purchase_list.py?u_id=<%=mvo.getU_id()%>">구매내역</a></li>
								<li><a href="./likeStoreList.li?u_id=<%=mvo.getU_id()%>">찜목록</a></li>
								<li><a href="./reviewListByIdWithPaging.re?u_id=<%=mvo.getU_id()%>">내가
										작성한 후기</a></li>
								<li><a href="./cartList.ct">장바구니</a></li>
							</ul>
						</div>
					</div>
		<!-- ---------------------------------------------------시작----------------------------------------------------- -->
				<div class="reviewboard">
					<div class="section-title product__discount__title">
						<h2>구매내역</h2>
					</div>
					<div class="container">
						<table class="table table-hover">
							<thead>
								<tr align=center>
									<th>번호</th>
									<th>가게명</th>
									<th>구매 금액</th>
									<th>구매 일자</th>
									<th>리뷰 작성</th>
									<input type="hidden" id="tu_id" name="tu_id" value="<%=mvo.getU_id()%>" />
									<input type="hidden" id="tnickname" name="tnickname" value="<%=mvo.getU_nick()%>" />
								</tr>
							</thead>
							
							<tbody id="pay_content" class="text-center">
								
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<!-- ----------------------------------------------------끝---------------------------------------------------- -->
		</div>
	</div>
</section>
<!-- Product Section End -->

<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

<script>
var u_id = $('[name=tu_id]').val();
// Get the modal
var modal = document.getElementById('myModal');

// Get the button that opens the modal
var btn = document.getElementById('myBtn');

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];  

$(document).ready(function() {

	payList(u_id);
});

function payList(data){
	  $.ajax({
	     url : 'payListAjax.re',
	     data : {'u_id' : data},
	     contentType : 'application/x-www-form-urlencoded; charset=utf-8',
	     success : function(data){ 
	        var a ='';
	        var i = 0;
        
	        $.each(data, function(key,value){
	        	
	        /* function getFormatDate(pydate){
	            var year = pydate.getFullYear();              //yyyy
	            var month = (1 + pydate.getMonth());          //M
	            month = month >= 10 ? month : '0' + month;  //month 두자리로 저장
	            var day = pydate.getDate();                   //d
	            day = day >= 10 ? day : '0' + day;          //day 두자리로 저장
	            return  year + '' + month + '' + day;       //'-' 추가하여 yyyy-mm-dd 형태 생성 가능
	        }
	        
	        var pydate = new Date();
	        pydate = getFormatDate(value.paydate); */
	        
	        	i = i + 1;
	      		a += '<tr align=center><td>'+ i + '</td>';
	      		a += '<td>' + value.s_name + '</td>';
	      		a += '<td>' + value.totalPrice + '</td>';
	      		a += '<td>' + value.paydate + '</td>';
	      		
	      		if (value.content != null) {
	      			a += '<td><h6>작성완료</h6></td>';
	      		} else {
		      		a += '<td><button id="myBtn" name="myBtn" onclick="location=\'./review_write.re?pay_num=' + value.pay_num + '\'" class="btn btn-primary btn-xs" style="background: #7fad39; color:white; border: 1px solid #7fad39;margin-top:0px; padding-top:0px; padding-bottom:0px;">리뷰작성</button></td></tr>';
	      		}
	      		
	        });
	        
	        $("#pay_content").html(a); //a내용을 html에 형식으로 .commentList로 넣음
	     },
	     error:function(){
	        alert("ajax통신 실패(list)!!!");
	     }
	  });
	}

// When the user clicks on <span> (x), close the modal
span.onclick = function(event) {
	modal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
	if (event.target == modal) {
		modal.style.display = "none";
	}
}
</script>

<%@include file="../includes/footer.jsp"%>