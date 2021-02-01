<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<%@ page import="com.spring.gogidang.domain.*"%>
<%@ page import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header_simple.jsp"%>

<%
	StoreVO svo = (StoreVO) request.getAttribute("storeVO");
	ArrayList<MenuVO> menu_List = (ArrayList<MenuVO>) request.getAttribute("menuList");
	ArrayList<ReviewVO> review_List = (ArrayList<ReviewVO>) request.getAttribute("reviewList");
%>

<!DOCTYPE html>

<html lang="zxx">


<head>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/shop-details.css"
	type="text/css">
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Ogani | Template</title>

<!-- Google Font -->
<link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet" href="resources/css/bootstrap.min.css"
	type="text/css">
<link rel="stylesheet" href="resources/css/font-awesome.min.css"
	type="text/css">
<link rel="stylesheet" href="resources/css/elegant-icons.css"
	type="text/css">
<link rel="stylesheet" href="resources/css/nice-select.css"
	type="text/css">
<link rel="stylesheet" href="resources/css/jquery-ui.min.css"
	type="text/css">
<link rel="stylesheet" href="resources/css/owl.carousel.min.css"
	type="text/css">
<link rel="stylesheet" href="resources/css/slicknav.min.css"
	type="text/css">
<link rel="stylesheet" href="resources/css/style.css" type="text/css">



<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<style>
.row .col-md-5{
margin-top:30px; 
}


</style>
</head>

<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-section set-bg" data-setbg="">
	<div class="container">
      <div class="row">
         <div class="col-lg-12 text-center">
            <div class="section-title">
               <h2 style="margin-top: 30px;">가게 상세보기</h2>
            </div>
         </div>
      </div>
   </div>
</section>
<!-- Breadcrumb Section End -->

<!-- Product Details Section Begin -->
<section class="product-details spad">
   <div class="container">
      <div class="row">
         <div class="col-lg-6 col-md-6">
            <div class="product__details__pic">
               <div class="product__details__pic__item">
                  <img class="product__details__pic__item--large"
							src="resources/img/store/<%=svo.getThumbnail()%>" width="400px;"
							height="380px;">
               </div>
<!--                         <div class="product__details__pic__slider owl-carousel">
                            <img data-imgbigurl="resources/img/product/details/product-details-2.jpg"
                                src="resources/img/product/details/thumb-1.jpg" alt="">
                            <img data-imgbigurl="resources/img/product/details/product-details-3.jpg"
                                src="resources/img/product/details/thumb-2.jpg" alt="">
                            <img data-imgbigurl="resources/img/product/details/product-details-5.jpg"
                                src="resources/img/product/details/thumb-3.jpg" alt="">
                            <img data-imgbigurl="resources/img/product/details/product-details-4.jpg"
                                src="resources/img/product/details/thumb-4.jpg" alt="">
                        </div> -->
</div>
</div>
<div class="col-lg-6 col-md-6">
	<div class="product__details__text">

		<h3 style="display: inline-flex; color: #7fad39;"><%=svo.getS_name()%></h3>

		<a href="#" class="heart-icon"><span class="icon_heart_alt"></span></a>

		<div class="product__details__rating">
			<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
				class="fa fa-star"></i> <i class="fa fa-star"></i> <i
				class="fa fa-star-half-o"></i> <span>(18 reviews)</span>
		</div>
		<div class="product__details__price"
			style="color: #7fad39; font-size: 25px; width: 400px; height: 73px;"><%=svo.getS_addr()%></div>

		<ul style="margin-top: 60px;">
			<li><img src="resources/DetailStore/Icon/time.ico" width="40px"
				height="42px;" alt='' / style="margin-right: 10px;"><span>운영시간
					: &nbsp;&nbsp;<%=svo.getS_hour()%></span></li>
			<li><img src="resources/DetailStore/Icon/call.ico" width="40px"
				height="42px;" alt='' / style="margin-right: 10px;"><span>전화번호
					: &nbsp;&nbsp;<%=svo.getS_phone()%></span></li>
			<li><img src="resources/DetailStore/Icon/delivery.ico"
				width="40px" height="42px;" alt='' / style="margin-right: 10px;"><span>가게소개
					: &nbsp;&nbsp;한줄소개글 추가</span></li>
		</ul>
	</div>
</div>
<!-- <div class="product__details__quantity">
                            <div class="quantity">
                                <div class="pro-qty">
                                    <input type="text" value="1">
                                </div>
                            </div>
                        </div>
                        <a href="#" class="primary-btn">ADD TO CARD</a> -->
<!-- <ul>
                            <li><b>Availability</b> <span>In Stock</span></li>
                            <li><b>Shipping</b> <span>01 day shipping. <samp>Free pickup today</samp></span></li>
                            <li><b>Weight</b> <span>0.5 kg</span></li>
                            <li><b>Share on</b>
                                <div class="share">
                                    <a href="#"><i class="fa fa-facebook"></i></a>
                                    <a href="#"><i class="fa fa-twitter"></i></a>
                                    <a href="#"><i class="fa fa-instagram"></i></a>
                                    <a href="#"><i class="fa fa-pinterest"></i></a>
                                </div>
                            </li>
                        </ul> -->
</div>
</div>
<!-- 사진옆정보 -->
<div class="col-lg-12">
	<div class="product__details__tab">
		<ul class="nav nav-tabs" role="tablist">
			<li class="nav-item"><a class="nav-link active"
				data-toggle="tab" href="#tabs-1" role="tab" aria-selected="true">메뉴</a>
			</li>
			<li class="nav-item"><a class="nav-link" data-toggle="tab"
				href="#tabs-2" role="tab" aria-selected="false">위치</a></li>
			<li class="nav-item"><a class="nav-link" data-toggle="tab"
				href="#tabs-3" role="tab" aria-selected="false">후기 </a></li>
			<li class="nav-item"><a class="nav-link" data-toggle="tab"
				href="#tabs-4" role="tab" aria-selected="false">문의 </a></li>
		</ul>

		<div class="tab-content">
			<div class="tab-pane active" id="tabs-1" role="tabpanel">
               <div class="product__details__tab__desc" style="padding-left:30px; padding-right:30px;">
                  <div class="section-title">
                     <h2>메뉴</h2>
                  </div>
                  
                  <div class="row featured__filter">
                  <%
                     for (int i = 0; i < menu_List.size(); i++) {

                        MenuVO mv = (MenuVO) menu_List.get(i);
                  %>
                     <div class="col-lg-3 col-md-4 col-sm-6 mix oranges fresh-meat"style="padding-top : 50px;padding-bottom : 50px; padding-left:30px; padding-right:30px;">


                        <div class="featured__item" >

                           <input type="hidden" id="menu_num" name="menu_num"
                              value="<%=mv.getMenu_num()%>">
                           <div class="featured__item__pic set-bg"
                              data-setbg="resources/img/menu/<%=mv.getImg()%>">
                           </div>
                           <div class="row">
                              <div class="col-md-6">
                                 <span><%=mv.getMenu_name()%></span>
                              </div>
                              <div class="col-md-6">
                                 <span><%=mv.getGrade()%></span>
                              </div>
                           </div>

                  
                        <div class="row">
                           <div class="col-md-6">
                              <span><%=mv.getGram()%>g</span>
                           </div>
                           <div class="col-md-6"></div>
                        </div>
                        <div class="row">
                           <div class="col-md-6">
                              <td><input type="number" id="cartStock" name="cartStock"
                                 min="1" max="100" value="1" /></td>
                           </div>
                           <div class="col-md-6">
                              <input type="submit" value="장바구니에 담기" />
                           </div>
                           </div>
                        </div>
                     </div>

                        <%
                           }
                        %>
                  </div>
                  
               </div>
            </div>
			<div class="tab-pane" id="tabs-2" role="tabpanel">
				<div class="product__details__tab__desc">
					<section id="locationNav_s">
						<br>
						<div class="container">
							<!-- Portfolio Section Heading-->
							<div class="row">
								<div class="col-lg-12">
									<div class="section-title">
										<h2>가게 위치</h2>
										<div id="map" style="width: 100%; height: 350px;"></div>
										<button onclick="resizeMap()">지도 크기 바꾸기</button>
										<button onclick="relayout()">relayout 호출하기</button>
										<script type="text/javascript"
											src="//dapi.kakao.com/v2/maps/sdk.js?appkey=241b4077cebf45bee1ed06d47263650b&libraries=services"></script>
										<script>
											var mapContainer = document
													.getElementById('map'), // 지도를 표시할 div 
											mapOption = {
												center : new kakao.maps.LatLng(
														33.450701, 126.570667), // 지도의 중심좌표
												level : 3
											// 지도의 확대 레벨 
											};

											// 지도를 생성합니다    
											var map = new kakao.maps.Map(
													mapContainer, mapOption);

											//지도를 표시하는 div 크기를 변경하는 함수입니다
											function resizeMap() {
												var mapContainer = document
														.getElementById('map');
												mapContainer.style.width = '650px';
												mapContainer.style.height = '650px';
											}

											function relayout() {

												// 지도를 표시하는 div 크기를 변경한 이후 지도가 정상적으로 표출되지 않을 수도 있습니다
												// 크기를 변경한 이후에는 반드시  map.relayout 함수를 호출해야 합니다 
												// window의 resize 이벤트에 의한 크기변경은 map.relayout 함수가 자동으로 호출됩니다
												map.relayout();
											}

											// 주소-좌표 변환 객체를 생성합니다
											var geocoder = new kakao.maps.services.Geocoder();

											// 주소로 좌표를 검색합니다
											geocoder
													.addressSearch(
															'${storeVO.getS_addr()}',
															function(result,
																	status) {

																// 정상적으로 검색이 완료됐으면 
																if (status === kakao.maps.services.Status.OK) {

																	var coords = new kakao.maps.LatLng(
																			result[0].y,
																			result[0].x);

																	// 결과값으로 받은 위치를 마커로 표시합니다
																	var marker = new kakao.maps.Marker(
																			{
																				map : map,
																				position : coords
																			});

																	// 인포윈도우로 장소에 대한 설명을 표시합니다
																	var infowindow = new kakao.maps.InfoWindow(
																			{
																				content : '<div style="width:150px;text-align:center;padding:6px 0;">우리회사</div>'
																			});
																	infowindow
																			.open(
																					map,
																					marker);

																	// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
																	map
																			.setCenter(coords);
																}
															});
										</script>

									</div>
								</div>
							</div>
						</div>

					</section>
				</div>
			</div>
			<div class="tab-pane" id="tabs-3" role="tabpanel">
				<div class="product__details__tab__desc">
					<div class="section-title">
						<h2>후기</h2>
					</div>
					<div class="row featured__filter"
						style="display: flex; justify-content: center; aligin-items: center;">
						<%
							for (int i = 0; i < review_List.size(); i++) {

								ReviewVO rv = (ReviewVO) review_List.get(i);
						%>
						<div class="col-lg-3 col-md-4 col-sm-6 mix oranges fresh-meat">


							<div class="featured__item">

								<input type="hidden" id="review_num" name="review_num"
									value="<%=rv.getReview_num()%>">
								<div class="featured__item__pic set-bg"
									data-setbg="resources/img/menu/1611020284762image.png">
									<ul class="featured__item__pic__hover">
										<li><a href="#"><i class="fa fa-heart"></i></a></li>
										<li><a href="#"><i class="fa fa-retweet"></i></a></li>
										<li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
									</ul>
								</div>

								<div class="row">
									<div class="col-md-12">
										<div
											style="display: flex; aligin-text: center; justify-content: center; width: 229.66px;">
											<h4 style="align: center;">
												<span><%=rv.getTitle()%></span>
											</h4>
										</div>
									</div>
									<div class="col-md-12">
										<div
											style="display: flex; aligin-text: center; justify-content: center; width: 229.66px;">
											<span><%=rv.getStar()%></span> <i class="fa fa-star"></i>
										</div>
									</div>
								</div>

							</div>


						</div>

						<%
							}
						%>
					</div>

				</div>
			</div>
			<div class="tab-pane" id="tabs-4" role="tabpanel">
				<div class="product__details__tab__desc">

					<div class='row'>

						<div class="col-lg-12">

							<!-- /.panel -->
							<div class="panel panel-default">
								<!-- <div class="panel-heading">
        <i class="fa fa-comments fa-fw"></i> Reply
      </div> -->

								<div class="panel-heading">
									<i class="fa fa-comments fa-fw"></i> 가게문의
									<button id='addReplyBtn'
										class='btn btn-primary btn-xs pull-right'>가게 문의 등록</button>
								</div>


								<!-- /.panel-heading -->
								<div class="panel-body">

									<ul class="chat">
										<!-- start reply -->
										<li class="left clearfix" data-qs_num='1'>
											<div>
												<div class="header">
													<strong class="primary-font">user00</strong> <small
														class="pull-right text-muted">2018-01-01 13:13</small>
												</div>
												<p>Good job!</p>
											</div>
										</li>
										<!-- end reply -->
									</ul>
									<!-- ./ end ul -->
								</div>
								<!-- /.panel .chat-panel -->

								<div class="panel-footer"></div>

								<!-- Modal -->
								<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
									aria-labelledby="myModalLabel" aria-hidden="true">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal"
													aria-hidden="true">&times;</button>
												<h4 class="modal-title" id="myModalLabel">가게문의등록페이지</h4>
											</div>
											<div class="modal-body">
												<div class="form-group">
													<label>제목</label> <input class="form-control" name='u_id'
														value='New Reply!!!!'>
												</div>
												<div class="form-group">
													<label>내용</label> <input class="form-control"
														name='content' value='replyer'>
												</div>
												<div class="form-group">
													<label>등록일</label> <input class="form-control"
														name='qna_date' value=''>
												</div>

											</div>
											<div class="modal-footer">
												<button id='modalModBtn' type="button"
													class="btn btn-warning">수정</button>
												<button id='modalRemoveBtn' type="button"
													class="btn btn-danger">제거</button>
												<button id='modalRegisterBtn' type="button"
													class="btn btn-primary">등록</button>
												<button id='modalCloseBtn' type="button"
													class="btn btn-default" data-dismiss='modal'>닫기</button>
												<button id='modalClassBtn' type='button'
													class="btn btn-default" data-dismiss='modal'>닫기</button>
											</div>
										</div>
										<!-- /.modal-content -->
									</div>
									<!-- /.modal-dialog -->
								</div>
								<!-- /.modal -->

								<script type="text/javascript" src="./resources/js/qnastore.js"></script>
								<script src="./resources/vendor/bootstrap/js/bootstrap.min.js"></script>
								<!-- Metis Menu Plugin JavaScript -->
								<script src="./resources/vendor/metisMenu/metisMenu.min.js"></script>
								<!-- DataTables JavaScript -->
								<script
									src="./resources/vendor/datatables/js/jquery.dataTables.min.js"></script>
								<script
									src="./resources/vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
								<script
									src="./resources/vendor/datatables-responsive/dataTables.responsive.js"></script>

								<!-- Custom Theme JavaScript -->
								<script src="./resources/dist/js/sb-admin-2.js"></script>


								<script>
									$(document)
											.ready(
													function() {
														var s_numValue = '<c:out value="${storeVO.getS_num()}"/>';
														var replyUL = $(".chat");

														showList(1);

														function showList(page) {
															console
																	.log("show List"
																			+ page);
															qnaService
																	.getList(
																			{
																				s_num : s_numValue,
																				page : page || 1
																			},
																			function(
																					qnastoreCnt,
																					list) {
																				console
																						.log("qnastorCnt:"
																								+ qnastoreCnt);
																				console
																						.log("list:"
																								+ list);
																				console
																						.log(list);

																				if (page == -1) {
																					pageNum = Math
																							.ceil(qnastoreCnt / 10.0);
																					showList(pageNum);
																					return;
																				}

																				var str = "";

																				if (list == null
																						|| list.length == 0) {
																					return;

																				}
																				for (var i = 0, len = list.length || 0; i < len; i++) {
																					str += "<li class='left clearfix' data-qs_num='"+list[i].qs_num+"'>";
																					str += "      <div><div class='header'><strong class='primary-font'>"
																							+ list[i].u_id
																							+ "</strong>";
																					str += "         <small class='pull-right text-muted'>"
																							+ qnaService
																									.displayTime(list[i].qna_date)
																							+ "</small></div>";
																					str += "            <p>"
																							+ list[i].content
																							+ "</p></div></li>";
																				}
																				replyUL
																						.html(str);

																				showqnastorePage(qnastoreCnt);
																			});//end function
														} //end showList

														var modal = $(".modal");
														var modalInputContent = modal
																.find("input[name='content']");
														var modalInputU_id = modal
																.find("input[name='u_id']");
														var modalInputQna_date = modal
																.find("input[name='qna_date']");

														var modalModBtn = $("#modalModBtn");
														var modalRemoveBtn = $("#modalRemoveBtn");
														var modalRegisterBtn = $("#modalRegisterBtn");

														$("#addReplyBtn")
																.on(
																		"click",
																		function(
																				e) {
																			modal
																					.find(
																							"input")
																					.val(
																							"");
																			modalInputQna_date
																					.closest(
																							"div")
																					.hide();
																			modal
																					.find(
																							"button[id !='modalCloseBtn']")
																					.hide();

																			modalRegisterBtn
																					.show();

																			$(
																					".modal")
																					.modal(
																							"show");

																		});
														var qnastore;
														modalRegisterBtn
																.on(
																		"click",
																		function(
																				e) {

																			qnastore = {
																				content : modalInputContent
																						.val(),
																				u_id : modalInputU_id
																						.val(),
																				s_num : s_numValue
																			};
																			qnaService
																					.add(
																							qnastore,
																							function(
																									result) {

																								alert("추가되었습니다"
																										+ result);

																								modal
																										.find(
																												"input")
																										.val(
																												"");
																								modal
																										.modal("hide");

																								//showList(1);
																								showList(-1);
																							});

																		});

														//댓글 조회 클릭 이벤트 처리
														$(".chat")
																.on(
																		"click",
																		"li",
																		function(
																				e) {

																			var qs_num = $(
																					this)
																					.data(
																							"qs_num");
																			alert("qs_num="
																					+ qs_num);

																			qnaService
																					.get(
																							qs_num,
																							function(
																									res) {
																								console
																										.log(res);
																								alert("qnastore.qs_num="
																										+ res.qs_num);
																								modalInputContent
																										.val(res.content);
																								modalInputU_id
																										.val(res.u_id);
																								modalInputQna_date
																										.val(
																												qnaService
																														.displayTime(res.qna_date))
																										.attr(
																												"readonly",
																												"readonly");
																								modal
																										.data(
																												"qs_num",
																												res.qs_num);

																								console
																										.log(qs_num);

																								modal
																										.find(
																												"button[id !='modalCloseBtn']")
																										.hide();
																								modalModBtn
																										.show();
																								modalRemoveBtn
																										.show();

																								$(
																										".modal")
																										.modal(
																												"show");
																							});
																		});

														modalModBtn
																.on(
																		"click",
																		function(
																				e) {
																			var content = {
																				qs_num : modal
																						.data("qs_num"),
																				content : modalInputContent
																						.val()
																			};

																			qnaService
																					.update(
																							content,
																							function(
																									result) {
																								alert(result);
																								modal
																										.modal("hide");
																								showList(pageNum);
																							});

																		});

														modalRemoveBtn
																.on(
																		"click",
																		function(
																				e) {
																			var qs_num = modal
																					.data("qs_num");

																			qnaService
																					.remove(
																							qs_num,
																							function(
																									result) {
																								alert(result);
																								modal
																										.modal("hide");
																								showList(pageNum);
																							});
																		});

														var pageNum = 1;
														var qnastorePageFooter = $(".panel-footer");

														function showqnastorePage(
																qnastoreCnt) { //페이징 처리

															var endNum = Math
																	.ceil(pageNum / 10.0) * 10;
															var startNum = endNum - 9;

															var prev = startNum != 1;
															var next = false;

															if (endNum * 10 >= qnastoreCnt) {
																endNum = Math
																		.ceil(qnastoreCnt / 10.0);
															}

															if (endNum * 10 < qnastoreCnt) {
																next = true;
															}

															var str = "<ul class='pagination pull-right'>";

															if (prev) {
																str += "<li class='page-item'><a class='page-link' href='"
																		+ (startNum - 1)
																		+ "'>Previous</a></li>";
															}

															for (var i = startNum; i <= endNum; i++) {

																var active = pageNum == i ? "active"
																		: "";

																str += "<li class='page-item "+active+" '><a class='page-link' href='"+i+"'>"
																		+ i
																		+ "</a></li>";
															}

															if (next) {
																str += "<li class='page-item'><a class='page-link' href='"
																		+ (endNum + 1)
																		+ "'>Next</a></li>";
															}

															str += "</ul></div>";

															qnastorePageFooter
																	.html(str);
														}

														qnastorePageFooter
																.on(
																		"click",
																		"li a",
																		function(
																				e) { //페이지 번호를 클릭했을때 새로운 댓글 가져옴
																			e
																					.preventDefault();

																			var targetPageNum = $(
																					this)
																					.attr(
																							"href");

																			console
																					.log("targetPageNum:"
																							+ targetPageNum);

																			pageNum = targetPageNum;

																			showList(pageNum);
																		});

													});
									</script>
								
								
				<%@include file="../includes/footer.jsp"%>
	</body>
</html>