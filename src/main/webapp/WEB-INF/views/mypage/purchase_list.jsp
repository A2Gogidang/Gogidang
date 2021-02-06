<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.spring.gogidang.domain.*" %>
<%@include file="../includes/header_simple.jsp"%>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/member_liststoreStyle.css"
	type="text/css">
	
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/modal_small.css"
	type="text/css">

<!-- Product Section Begin -->
<section class="product spad">
	<div class="container">
		<div class="row">
			<div class="myreview">
				<div class="col-lg-3 col-md-5">
					<div class="sidebar">
						<div class="sidebar__item">
							<h4>마이페이지</h4>
							<ul>
								<li><a href="./updateList.me">내정보</a></li>
								<li><a href="./purchase_list.py?u_id=<%=mvo.getU_id()%>">구매내역</a></li>
								<li><a
									href="./likeStoreList.li?u_id=<%=mvo.getU_id()%>">찜목록</a></li>
								<li><a
									href="./reviewListByIdWithPaging.re?u_id=<%=mvo.getU_id()%>">내가
										작성한 후기</a></li>
								<li><a href="./cartList.ct">장바구니</a></li>
							</ul>
						</div>
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


<!-- The Modal -->
<div id="myModal" class="modal">
	<!-- Modal content -->
	<div class="modal-content">
		<span class="close">&times;</span>                                                               
		<form name="reviewForm">
			
			<h3>공지사항 작성</h3>
			<ol>
				<div class="modal-textbox">
				  	<div class="modal-textbox-s">
				    	<ts for="title">제목</ts>
				    	<td><input type="text" id="title" name="title"></td>
				    	<td><input type="hidden" id="pay_num" name="pay_num"></td>
				    	<td><input type="hidden" id="s_num" name="s_num"></td>
				    	<td><input type="hidden" id="s_name" name="s_name"></td>
				    	<td><input type="hidden" id="u_id" name="u_id"></td>
				    	<td><input type="hidden" id="nickname" name="nickname"></td>
				    </div>
			    </div>
			    
				<div class="modal-textbox">
				  	<div class="modal-textbox-s">
				    	<ts for="star">별점</ts>
				    	<td><input type="text" id="star" name="star"></td>
				    </div>
			    </div>
			    
				<div class="modal-textbox">
				  	<div class="modal-textbox-s">
				    	<ts for="title">사진</ts>
				    	<td><input type="text" id="review_img1" name="review_img1"></td>
				    </div>
			    </div>
			    
			    <div class="modal-textbox">
				  	<div class="modal-textbox-ss"> 
				    	<ts for="content">내용</ts>
				    	<td><textarea type="text" id="content" name="content"></textarea></td>
				    </div>
			    </div>
			</ol>
			

			<div class="form-checkkkk">
				
			  	<button type="button" id="reviewBtn" name="reviewBtn" class="btn btn-lg btn-block btn-success">작성</button>	  	
			  	<!--<button type="button" id="closeBtn" class="btn-j btn-lg btn-block btn-success" >닫기</button>  -->
			  	<!--<input type="button" id="closeBtn" value="닫기"/>  -->
			  	<br>
			</div>
			
		</form>
	</div>
</div>
<!-- modal END -->

<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

<script>
var u_id = '';
var tu_id = '';
var fu_id = '';
var nickname = '';
var s_num = '';
var s_name = '';
var pay_num = '';
// Get the modal
var modal = document.getElementById('myModal');

// Get the button that opens the modal
var btn = document.getElementById('myBtn');

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];  

$(document).ready(function() {
	u_id = $('[name=tu_id]').val();
	tu_id = $('[name=tu_id]').val();
	nickname = $('[name=tnickname]').val();
	
	$('input#u_id').val(u_id);
	$('input#nickname').val(nickname);
	payList(tu_id);
});

$('[name=reviewBtn]').click(function () {
	var insertData = $('[name=reviewForm]').serialize();
	alert(insertData);
	reviewInsert(insertData);
});

function reviewInsert(insertData) {
	$.ajax({
		url : 'reviewRegAjax.re',
		type : 'POST',
		data : insertData,
		contentType : 'application/x-www-form-urlencoded;charset=utf-8',
		dataType : 'json',
		success : function(retVal) {
			if (retVal.res == "OK") {
				// webSocket에 보내기 (review, 리뷰작성자(tu_id), 가게주인(fu_id), pay_num)
				let socketMsg = ("review," + tu_id +"," + fu_id + "," + pay_num);
				console.debug("ssssssmsg>> ", socketMsg);
				socket.send(socketMsg);
				
				modal.style.display = "none";
				payList(tu_id);
			} else {
				alert("review insert Fail!!!!");
			}
		}, 
		error:function() {
			alert("review ajax 통신 실패!!")
		}
	});
}

function payList(data){
	  $.ajax({
	     url : 'payListAjax.re',
	     data : {'u_id' : data},
	     contentType : 'application/x-www-form-urlencoded; charset=utf-8',
	     success : function(data){ 
	        var a ='';
	        $.each(data, function(key,value){
	      		a += '<tr align=center><td>'+ value.pay_num + '</td>';
	      		a += '<td>' + value.s_name + '</td>';
	      		a += '<td>' + value.totalPrice + '</td>';
	      		a += '<td>' + value.paydate + '</td>';
	      		if (value.content != null) {
	      			a += '<td><h6>답변완료</h6></td>';
	      		} else {
		      		a += '<td><button onclick="callModal(' + value.pay_num + ');" id="myBtn" class="btn btn-primary btn-xs pull-right">리뷰작성</button></td></tr>';
	      		}
	      		
	        });
	        
	        $("#pay_content").html(a); //a내용을 html에 형식으로 .commentList로 넣음
	     },
	     error:function(){
	        alert("ajax통신 실패(list)!!!");
	     }
	  });
	}

function callModal(event) {
	$.ajax({
		url : 'payInfoAjax.re',
		type : 'POST',
		data : {'pay_num' : event},
		contentType : 'application/x-www-form-urlencoded;charset=utf-8',
		dataType : 'json',
		success : function(retVal) {
			if (retVal.res == "OK") {
				pay_num = retVal.pay_num;
				s_num = retVal.s_num;
				s_name = retVal.s_name;
				fu_id = retVal.fu_id;
				$('input#pay_num').val(pay_num);
				$('input#s_num').val(s_num);
				$('input#s_name').val(s_name);
			} else {
				alert("review modal Fail!!!!");
			}
		}
	});
    modal.style.display = "block";
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