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
					<h2>문의 관리</h2>
				</div>
				<div class="container">
					<table class="table table-hover">
						<thead>
							<tr align=center>
								<th>번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>등록일</th>
								<th>답변 상태</th>
							</tr>
						</thead>
						<tbody id="storeQna_content">
														
						</tbody>
					</table>
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
		<form name="storeQnaInsertForm">
				
				<h3>고객 문의</h3>
				<ol>
					<!-- 문의번호 -->
					<div class="modal-textbox-detail">
					  	<div class="modal-textbox-f">
					  		<ts for="qna_num" id="qna_num_f">문의번호</ts>
					    	<td><input type="text"  id="qnastore_num" name="qnastore_num" readonly></td>
					    </div>
					    <div class="modal-textbox-f">
					  		<ts for="u_id" id="u_id_f">회원아이디</ts>
					    	<td><input type="text" id="u_id" name="u_id" readonly></td>
					    </div>
			    	</div>
			    	
			    	 <div class="modal-textbox">
					  	<div class="modal-textbox-s">
					  		<ts for="title">문의제목</ts>
					    	<td><input type="text" id="title" name="title" readonly></td>
					    </div>
			    	</div>
			    	
			    	<div class="modal-textbox-ff">
					  	<div class="modal-textbox-sf">
					  		<ts for="content">문의내용</ts>
					    	<td><textarea id="content" name="content" type="text" readonly></textarea></td>
					    </div>
			    	</div>
			    	<div class="modal-textbox-ff">
				  	<div class="modal-textbox-sf">
				  		<ts for="re_content">답글</ts>
				    	<td><textarea id="re_content" name="re_content"/></textarea>
				    	<script>CKEDITOR.replace('re_content',{
				    		height:'95px',
				    		width:'100%'
				    	});</script>
				    	</td>
				    </div>
			    </div>			
			</ol>
			
			<div class="form-check-f">
			  	<button type="button" id="storeQnaInsertBtn" name="storeQnaInsertBtn" class="btn btn-lg btn-block btn-success">작성</button>
			  	<br>
			</div>
			<!-- <fieldset>
				<button type="button" id="storeQnaInsertBtn" name="storeQnaInsertBtn">작성</button>
				<input type="button" id="closeBtn" value="닫기" />
			</fieldset> -->
			
		</form>
	</div>
</div>
<!-- modal END -->

<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

<script>

	var u_id = <%=id%>;
	
	// Get the modal
	var modal = document.getElementById('myModal');

	// Get the button that opens the modal
	var btn = document.getElementById('storeQnaWrite');

	// Get the <span> element that closes the modal
	var span = document.getElementsByClassName("close")[0];

	$(document).ready(function() {
		storeQnaList();
	}); 
	
	function callModal(event) {
		$.ajax({
			url : 'qnastoreInfoAjax.re',
			type : 'POST',
			data : {'qnastore_num' : event},
			contentType : 'application/x-www-form-urlencoded;charset=utf-8',
			dataType : 'json',
			success : function(retVal) {
				if (retVal.res == "OK") {
					var qnastore_num = retVal.qnastore_num;
					var u_id = retVal.u_id;
					var title = retVal.title;
					var content = retVal.content;
					$('input#qnastore_num').val(qnastore_num);
					$('input#u_id').val(u_id);
					$('input#title').val(title);
					$('textarea#content').val(content);
				} else {
					alert("confirm Fail!!!!");
				}
			}
		});

		modal.style.display = "block";
	}

 	function storeQnaList() {
		$.ajax({
			url : 'qnastoreListAjaxuid.re',
			type : 'POST',
			data : {"u_id": u_id},
			contentType : 'application/x-www-form-urlencoded; charset=utf-8',
			success : function(data) {
				var a = '';
					$.each(data,function(key, value) {
						a += '<tr style="text-align: center;"><td>'+ value.qnastore_num + '</td>';
						a += '<td>' + value.title + '</td>';
						a += '<td>' + value.u_id + '</td>';
						a += '<td>' + value.re_date + '</td>';
						if (value.re_content != null) {
							a += '<td><a href="./qnaStoreInfo.qs?qnastore_num='+ value.qnastore_num + '"><h6><button class="btn btn-primary btn-xs pull-right" style="margin-top: 0px;">답변확인</button></a></td></tr>';
						} else {
							a += '<td><button onclick="callModal('+ value.qnastore_num + ');" id="myBtn" class="btn btn-primary btn-xs pull-right" style="margin-top: 0px;">문의댓글</button></td></tr>';
						}
					});
						$("#storeQna_content").html(a); //a내용을 html에 형식으로 .commentList로 넣음
				},error : function() {
					alert("ajax통신 실패(list)!!!");
				}
			});
	}
 	
 	$('[name=storeQnaInsertBtn]').click(function () {
 		var insertData = $('[name=storeQnaInsertForm]').serialize();
 		alert(insertData);
 		reQnaStoreInsert(insertData);
 	});

 	function reQnaStoreInsert(insertData) {
 		$.ajax({
 			url : 'reQnaStoreInsert.qs',
 			type : 'POST',
 			data : insertData,
 			success : function(data) {
 				if (data == "ok") {
 					modal.style.display = "none";
 					storeQnaList();
 				} else {
 					alert("qnaRe insert Fail!!!!");
 				}
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
