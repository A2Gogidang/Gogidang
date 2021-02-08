<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.spring.gogidang.domain.*"%>
<%@include file="../includes/header_simple.jsp"%>

<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/modal_middle.css"
	type="text/css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/store_reviewStyle.css"
	type="text/css">
<script src = "${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js"></script>	

<%
	MemberVO memberVO = (MemberVO) session.getAttribute("memberVO");
	String id1 = memberVO.getU_id();
	String id = "'" + memberVO.getU_id() + "'";
%>

<!-- Product Section Begin -->
<section class="product spad">
	<div class="container">
		<div class="row">
			<div class="col-lg-3" id="nav-bar">
	            <div class="hero__categories">
	                  <div class="hero__categories__all">
	                  	<span>마이페이지</span>
	              	  </div>
		                  <ul>
		                     <li><a href="./updateList.me">내정보</a></li>
		                     <li><a href="./storeRegForm.st">가게 정보</a></li>
		                     <li><a href="./menuRegForm.mn">메뉴 등록</a></li>
		                     <li><a href="./storeNoticeList.no">문의 관리</a></li>
		                     <li><a href="./storereviewList.re">리뷰 관리</a></li>
		                  </ul>				
	               </div>
				</div>
				<div class="col-lg-9">
					<div class="section-title product__discount__title">
						<h2>리뷰 관리</h2>
					</div>
					<div class="reviewbor">
					<div class="container">
						<table class="table table-hover">
							<thead>
								<tr align=center>
									<th>번호</th>
									<th>제목</th>
									<th>작성자</th>
									<th>별점</th>
									<th>등록일</th>
									<th>답변 상태</th>
								</tr>
							</thead>
							<tbody id="review_content" class="text-center">
								
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<!-- The Modal -->
<div id="myModal" class="modal">

	<!-- Modal content -->
	<div class="modal-content">
		<span class="close">&times;</span>
		<form name="reReviewStoreInsertForm">
				
				<h3>고객 리뷰</h3>
				<ol>
					<div class="modal-textbox">
					  	<div class="modal-textbox-star-num">
					  		<ts for="review_num" id="qna_num_f">리뷰번호</ts>
					    	<td><input type="text"  id="review_num" name="review_num" readonly></td>
					    </div>
					    <div class="modal-textbox-star">
					  		<ts for="u_id" id="u_id_re">아이디</ts> <!-- 여기서 아이디는css용 -->
					    	<td><input type="text" id="u_id" name="u_id" readonly></td>
					    </div>
					    <div class="modal-textbox-star">
					  		<ts for="nickname" id="u_id_re">닉네임</ts>
					    	<td><input type="text" id="nickname" name="nickname" readonly></td>
					    </div>
					    <div class="modal-textbox-starr">
					  		<ts for="star" id="u_id_star">별점</ts>
					    	<td><input type="text" id="nickname" name="nickname" readonly></td>
					    </div>
			    	</div>
					
					<div class="modal-textbox">
					  	<div class="modal-textbox-s">
					  		<ts for="title">리뷰제목</ts>
					    	<td><input type="text" id="title" name="title" readonly></td>
					    </div>
			    	</div>
			    	
					<div class="modal-textbox-ff">
					  	<div class="modal-textbox-sf">
					  		<ts for="content">리뷰내용</ts>
					    	<td><textarea id="content" name="content" type="text" readonly></textarea></td>
					    </div>
			    	</div>
					
					<div class="modal-textbox-ff">
					  	<div class="modal-textbox-sf">
					  		<ts for="review_sub_content">답글</ts>
					    	<td><textarea id="review_sub_content" name="review_sub_content"/></textarea>
					    	<script>CKEDITOR.replace('review_sub_content',{
					    		height:'95px',
					    		width:'100%'
					    	});</script>
					    	</td>
					    </div>
			    	</div>		
					
				</ol>
				
				<div class="form-check-f">
			  		<button type="button" id="reReviewStoreInsertBtn" name="reReviewStoreInsertBtn" class="btn btn-lg btn-block btn-success">작성</button>
			  		<br>
				</div>
				<!-- <input type="button" id="reReviewStoreInsertBtn" name="reReviewStoreInsertBtn" value="댓글달기" /> 
				<input type="button" id="closeBtn" value="닫기" /> -->
				
			
		</form>
	</div>
</div>
<!-- modal END -->

<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

<script>
	var u_id = <%=id%>;
	
	var wu_id = '';
	
	var review_num = '';

	$(document).ready(function() {

		commentList();
	});

	// Get the modal
	var modal = document.getElementById('myModal');

	// Get the button that opens the modal
	var btn = document.getElementById('myBtn');

	// Get the <span> element that closes the modal
	var span = document.getElementsByClassName("close")[0];

	// When the user clicks on the button, open the modal 
	function callModal(event) {
		$.ajax({
			url : 'reviewInfoAjax.re',
			type : 'POST',
			data : {
				'review_num' : event
			},
			contentType : 'application/x-www-form-urlencoded;charset=utf-8',
			dataType : 'json',
			success : function(retVal) {
				if (retVal.res == "OK") {
					review_num = retVal.review_num;
					var u_id = retVal.u_id;
					wu_id = retVal.u_id;
					var nickname = retVal.nickname;
					var title = retVal.title;
					var content = retVal.content;
					var star = retVal.star;
					$('input#review_num').val(review_num);
					$('input#u_id').val(u_id);
					$('input#nickname').val(nickname);
					$('input#title').val(title);
					$('input#content').val(content);
					$('input#star').val(star);
				} else {
					alert("confirm Fail!!!!");
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

	//리뷰 목록
	function commentList() {
		$.ajax({
			url : 'storeReviewListAjax.re',
			data : {'u_id' : u_id}, //u_id의 가게의 리뷰를 다 가져온다.
			dataType : 'json',
			contentType : 'application/x-www-form-urlencoded; charset=utf-8',
			success : function(data) {
				var a = '';
				$.each(data,function(key, value) { //data는 list객체를 받음(controller return 부분)list는 commentVO를 여려개 가지고 있음
					a += '<tr align=center><td>'+ value.review_num+ '</td>';
					a += '<td>' + value.title + '</td>';
					a += '<td>' + value.u_id + '</td>';
					a += '<td>' + value.star + '</td>';
					a += '<td>' + value.review_date + '</td>';
					if (value.review_sub_content != null) {
						a += '<td><h5>답변완료</h5></td></tr>';
					} else {
						a += '<td><button onclick="callModal('+ value.review_num + ');" id="myBtn" class="btn btn-primary btn-xs pull-right" style="margin-top: 0px;">리뷰댓글</button></td></tr>';
						
					}
				});
				$("#review_content").html(a); //a내용을 html에 형식으로 .commentList로 넣음
			},error : function() {
				alert("ajax통신 실패(list)!!!");
			}
		});
	}
	
 	$('[name="reReviewStoreInsertBtn"]').click(function () {
 		var insertData = $('[name=reReviewStoreInsertForm]').serialize();
 		alert(insertData);
 		reReviewStoreInsert(insertData);
 	});

 	function reReviewStoreInsert(insertData) {
 		$.ajax({
 			url : 'reReviewStoreInsert.re',
 			type : 'POST',
 			data : insertData,
 			contentType : 'application/x-www-form-urlencoded;charset=utf-8',
 			dataType : 'json',
 			success : function(retVal) {
 				if (retVal.res == "reviewsub") {
 					// webSocket에 보내기 (rqQna, 댓글작성자(u_id), 게시글작성자(wu_id), 글번호(review_num))
 					let socketMsg = ("reviewsub," + u_id + "," + wu_id + "," + review_num);
 					console.debug("ssssssmsg>> ", socketMsg);
 					socket.send(socketMsg);
 					
 					modal.style.display = "none";
 					commentList();
 				} else {
 					alert("reviewsub insert Fail!!!!");
 				}
 			}, 
 			error:function() {
 				alert("reviewsub ajax 통신 실패!!")
 			}
 		});
 	}
</script>


<%@include file="../includes/footer.jsp"%>