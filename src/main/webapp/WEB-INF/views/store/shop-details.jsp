<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.spring.gogidang.domain.*"%>

<%@include file="../includes/header_simple.jsp"%>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/shop-details.css"
	type="text/css">
	
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/modal.css"
	type="text/css">
<%
	StoreVO svo = (StoreVO) request.getAttribute("storeVO");
	ArrayList<MenuVO> menu_List = (ArrayList<MenuVO>) request.getAttribute("menuList");
	ArrayList<ReviewVO> review_List = (ArrayList<ReviewVO>) request.getAttribute("reviewList"); 
%>
<%
	List<QnaStoreVO> qnalist = (List<QnaStoreVO>) request.getAttribute("qnalist");
	int listcount = ((Integer) request.getAttribute("listcount")).intValue();
	int nowpage = ((Integer) request.getAttribute("page")).intValue();
	int maxpage = ((Integer) request.getAttribute("maxpage")).intValue();
	int startpage = ((Integer) request.getAttribute("startpage")).intValue();
	int endpage = ((Integer) request.getAttribute("endpage")).intValue();
%>

<link rel="preconnect" href="https://fonts.gstatic.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&family=Nanum+Gothic+Coding:wght@400;700&family=Poor+Story&display=swap"
	rel="stylesheet">
<link
	href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script>
	$(document).ready(function() {
		$('[id^=detail-]').hide();
		$('.toggle').click(function() {
			$input = $(this);
			$target = $('#' + $input.attr('data-toggle'));
			$target.slideToggle();
		});
		map.relayout();
	});
</script>

<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-section set-bg" data-setbg="">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 text-center"></div>
		</div>
	</div>
</section>
<!-- Breadcrumb Section End -->

<section class="product-details spad" id="cartCon"
	style="padding-top: 0%; padding-bottom: 10px;">
	<div class="container">
		<div class="row">

			<div class="col-lg-6 col-md-6">
				<div class="product__details__pic">
					<div class="product__details__pic__item">
						<img class="product__details__pic__item--large"
							src="resources/img/store/<%=svo.getThumbnail()%>" alt="">
					</div>
					<div class="product__details__pic__slider owl-carousel">
						<img src="resources/img/product/details/thumb-1.jpg" alt="">
						<img src="resources/img/product/details/thumb-2.jpg" alt="">
						<img src="resources/img/product/details/thumb-3.jpg" alt="">
						<img src="resources/img/product/details/thumb-4.jpg" alt="">
					</div>
				</div>
			</div>

			<!-- 사진옆정보 -->
			<div class="col-lg-6 col-md-6">
				<div class="product__details__text">
					<h3 style="display: inline-flex; color: #7fad39;"><%=svo.getS_name()%></h3>

					<a href="#" class="heart-icon"><span class="icon_heart_alt"></span></a>

					<div class="product__details__rating" style="margin-bottom: 45px;">
						<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
							class="fa fa-star"></i> <i class="fa fa-star"></i> <i
							class="fa fa-star-half-o"></i> <span>(18 reviews)</span>
					</div>
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

			<!-- tab Start -->
			<div class="col-lg-12">
				<div class="product__details__tab">
					<ul class="nav nav-tabs" role="tablist">
						<li class="nav-item"><a class="nav-link active"
							data-toggle="tab" href="#tabs-1" role="tab" aria-selected="true">메뉴</a></li>
						<li class="nav-item"><a class="nav-link" data-toggle="tab"
							href="#tabs-2" role="tab" aria-selected="false">후기 </a></li>
						<li class="nav-item"><a class="nav-link" data-toggle="tab"
							id="jongu" href="#tabs-3" role="tab" aria-selected="false">문의
						</a></li>
					</ul>

					<div class="tab-content">

						<div class="tab-pane active" id="tabs-1" role="tabpanel">
							<div class="product__details__tab__desc"
								style="padding-left: 30px; padding-right: 30px;">

								<div class="row featured__filter">
									<%
										for (int i = 0; i < menu_List.size(); i++) {

											MenuVO mv = (MenuVO) menu_List.get(i);
									%>
									<div class="col-lg-3 col-md-4 col-sm-6" id="Menucontents">

									 <form id="addCart<%=i%>" action="./addCart.ct" method="post">
									 
										<div class="featured__item">

											<input type="hidden" id="menu_num" name="menu_num"
												value="<%=mv.getMenu_num()%>">
											<input type="hidden" id="price" name="price"
												value="<%=mv.getPrice()%>">
											<input type="hidden" id=s_num name="s_num"
												value="<%=mv.getS_num()%>">
											<div class="featured__item__pic set-bg"
												data-setbg="resources/img/menu/<%=mv.getImg()%>"></div>

											<div class="container-fluid">
												<div class="row">
													<div class="menu_info" id="menu_info">
														<table class="table">
															<tbody>
																<tr>
																	<td><%=mv.getMenu_name()%></td>
																	<td><%=mv.getGrade()%>등급</td>
																</tr>
																<tr class="table">
																	<td><%=mv.getGram()%>g</td>
																	<td><%=mv.getPrice()%> 원</td>
																</tr>
																<tr class="table">
																	<td><input type="number" id="cartStock"
																		name="cartStock" min="1" max="100" value="1" /></td>
																	<td><input type="submit" value="장바구니에 담기" id="addCart<%=i%>"/></td>
																</tr>
															</tbody>
														</table>
													</div>
												</div>
											</div>
										</div>
									</div>
									</form>
									<%
										}
									%>
								</div>
							</div>
						</div>

						<div class="tab-pane" id="tabs-2" role="tabpanel">
							<div class="panel panel-default" id="panel-default">
								<div class="panel-heading" id="panel-heading">
									<h3 class="panel-title">후기</h3>
								</div>
								<ul class="list-group">
									<%
										for (int i = 0; i < review_List.size(); i++) {
											ReviewVO reviewVO = (ReviewVO) review_List.get(i);
									%>
									<li class="list-group-item">
										<div class="row toggle" id="dropdown-detail-<%=i%>"
											data-toggle="detail-<%=i%>">

											<div class="col-xs-10" id="ReviewTitle">
												<div><%=reviewVO.getTitle()%></div>
												<span id="ReviewId">작성자 : <%=reviewVO.getU_id()%></span>
											</div>
											<div class="col-xs-10" id="ReviewTitle">
												<span id="reviewStar"> <%
 	if (reviewVO.getStar() == 5) {
 %>
													<sapn class="fa fa-star" /><span class="fa fa-star" /><span
													class="fa fa-star" /><span class="fa fa-star" /><span
													class="fa fa-star" /> <%
 	} else if (reviewVO.getStar() == 4) {
 %>
													<span class="fa fa-star" /><span class="fa fa-star" /><span
													class="fa fa-star" /><span class="fa fa-star" /> <%
 	} else if (reviewVO.getStar() == 3) {
 %>
													<span class="fa fa-star" /><span class="fa fa-star" /><span
													class="fa fa-star" /> <%
 	} else if (reviewVO.getStar() == 2) {
 %>
													<span class="fa fa-star" /><span class="fa fa-star" /> <%
 	} else if (reviewVO.getStar() == 1) {
 %>
													<span class="fa fa-star" /> <%
 	}
 %>
												</span> <span id="Insert_date">등록일: <%=reviewVO.getReview_date()%></span>
											</div>


											<div class="col-xs-2">
												<i class="fa fa-chevron-down pull-right"></i>
											</div>

											<div id="detail-<%=i%>">
												<hr>
												<div class="review_Container">
													<div class="fluid-row" id="Review_user">
														<div class="review_Pic">
															<img
																src="resources/img/DetailStoreImg/Review/BestReview3.png">
														</div>
														<div>
															<div id="reviewTextContent">
																리뷰내용 :
																<%=reviewVO.getContent()%></div>
														</div>
													</div>
													<hr>
													<!-- 사장댓글 -->
													<div class="Seller_answer">
														↳&nbsp;ex)
														<%=svo.getS_name()%>사장님 : 다음에 오실때는 더욱만족 하실수있도록 노력하겠습니다.
													</div>
												</div>
											</div>
										</div>
									</li>
								</ul>
								<%
									}
								%>
							</div>
						</div>

						<div class="tab-pane" id="tabs-3" role="tabpanel">
							<section class="product spad">
								<div class="container">
									<div class="container-fluid">
										<div class="row">
											<div class="qnaList" style="width: 960px; margin-left: 50px;">
											<div class="qna_insert" style="text-align: right;">
												<button type="button" class="btn btn-lg btn-outline-secondary" id="storeQnaWrite" name="storeQnaWrite"
														style="background-color: #076507; color: white;">글쓰기</button>
														<input type="hidden" id="ms_num" name="ms_num" value="<%=svo.getS_num()%>">
														<input type="hidden" id="mu_id" name="mu_id" value="<%=u_id%>">
											</div>
												<table class="table table-striped">
													<thead>
														<tr>
															<th>번호</th>
															<th>제목</th>
															<th>작성자</th>
															<th>등록일</th>
															<th>답변상태</th>
														</tr>
													</thead>
													<tbody id="storeQna_content">
														
													</tbody>
												</table>
												<div class="container-fluid">
													<div class="row">
														<div class="col-md-2"></div>

														<div class="col-md-8">
															<class class="pagination-lg">
															<ul class="pagination"
																style="margin-bottom: 30px; display: flex; justify-content: center; align-items: center;">
																<%
																	if (nowpage <= 1) {
																%>
																<li class="page-item"><a class="page-link" href="#"
																	style="color: rgb(51, 131, 51);">Previous</a></li>
																<%
																	} else {
																%>
																<li class="page-item"><a class="page-link"
																	href="./qnalist.qn?page=<%=nowpage - 1%>"
																	style="color: rgb(51, 131, 51);">Previous</a></li>
																<%
																	}
																%>
																<%
																	for (int a = startpage; a <= endpage; a++) {
																		if (a == nowpage) {
																%>
																<%=a%>
																<%
																	} else {
																%>
																<li class="page-item"><a class="page-link"
																	href="./noticelist.no?page=<%=a%>"
																	style="color: rgb(51, 131, 51);"><%=a%></a></li>
																<%
																	}
																%>
																<%
																	}
																%>
																<%
																	if (nowpage >= maxpage) {
																%>
																<li class="page-item"><a class="page-link" href="#"
																	style="color: rgb(51, 131, 51);">Next</a></li>
																<%
																	} else {
																%>
																<li class="page-item"><a class="page-link"
																	href="./qnalist.qn?page=<%=nowpage + 1%>"
																	style="color: rgb(51, 131, 51);">Next</a></li>
																<%
																	}
																%>
															</ul>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</section>
						</div>
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
		<form name="storeQnaInsertForm">
			<fieldset>
				<legend>가게 문의 작성</legend>
				<ol>
					<li>
						<label for="title">제목</label> 
						<input type="text" id="title" name="title">
					</li>
					<li>
						<label for="mu_id">유저아이디</label>
						<input type="text" id="u_id" name="u_id" readonly>
					</li>
					<li>
						<label for="ms_num">가게번호</label>
						<input type="text" id="s_num" name="s_num" readonly>
					</li>
					<li>
						<label for="content">문의내용</label>
						<input type="text" id="content" name="content">
					</li>
				</ol>
			</fieldset>

			<fieldset>
				<button type="button" id="storeQnaInsertBtn" name="storeQnaInsertBtn">작성</button>
				<input type="button" id="closeBtn" value="닫기" />
			</fieldset>
		</form>
	</div>
</div>
<!-- modal END -->

<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

<script>
	// Get the modal
	var modal = document.getElementById('myModal');

	// Get the button that opens the modal
	var btn = document.getElementById('storeQnaWrite');

	// Get the <span> element that closes the modal
	var span = document.getElementsByClassName("close")[0];
	
	var s_num = $('input[name=ms_num]').val();
	var u_id = $('input[name=mu_id]').val();

	$(document).ready(function() {
		
		btn.onclick = function(event) {
			alert(s_num);
			alert(u_id);
			$('input#s_num').val(s_num);
			$('input#u_id').val(u_id);
		    modal.style.display = "block";
		}
		
		storeQnaList();
	});

	$('[name=storeQnaInsertBtn]').click(function() { //댓글 등록 버튼 클릭시 속성이름 [] 으로 접근 가능
		
		var insertData = $('[name=storeQnaInsertForm]').serialize(); //noticeInsertForm의 내용을 가져옴
		alert("insertData = " + insertData);
		storeQnaInsert(insertData); //Insert 함수호출(아래)
	});

 	function storeQnaInsert(insertData) {
		$.ajax({
			url : 'qnaStoreInsert.qs',
			type : 'POST',
			data : insertData,
			success : function(data) {
				if (data == "ok") {
					alert("good");
					modal.style.display = "none";
					storeQnaList();
				} else {
					alert("notice insert Fail!!!!");
				}
			}
		});
	} 

 	function storeQnaList() {
		$.ajax({
			url : 'qnastoreListAjax.re',
			type : 'POST',
			data : {"s_num": s_num},
			contentType : 'application/x-www-form-urlencoded; charset=utf-8',
			success : function(data) {
				var a = '';
					$.each(data,function(key, value) {
						a += '<tr><td>'+ value.qnastore_num + '</td>';
						a += '<td>' + value.title + '</td>';
						a += '<td>' + value.u_id + '</td>';
						a += '<td>' + value.re_date + '</td>';
						if (value.re_content != null) {
							a += '<td><h6>답변완료</h6></td></tr>';
						} else {
							a += '<td><h6>답변대기</h6></td></tr>';
						}
					});
						$("#storeQna_content").html(a); //a내용을 html에 형식으로 .commentList로 넣음
				},error : function() {
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