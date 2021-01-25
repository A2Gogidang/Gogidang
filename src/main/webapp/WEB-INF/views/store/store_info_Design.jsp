<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.spring.gogidang.domain.*"%>
<%@ page import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="kr">
<head>
<link rel="stylesheet" href="resources/css/newDetailStore.css"
	type="text/css">
<link rel="stylesheet" href="resources/css/DetailStore.css"
	type="text/css">
<script src="resources/js/newDetailStore.js"></script>
<script src="resources/DetailStore/newDetailStore.css"></script>
<%@include file="../includes/header.jsp"%>
<%
	MemberVO mvo = (MemberVO) session.getAttribute("memberVO");
	String u_id = "";
	int seller_key;
	if(mvo != null) {
		u_id = mvo.getU_id();
		seller_key = mvo.getSeller_key();
	} else {
		seller_key = 0;
	}
	
	StoreVO svo = (StoreVO) request.getAttribute("storeVO");
	PageDTO  pageMaker = (PageDTO) request.getAttribute("pageMaker");
	ArrayList<MenuVO> menu_List = (ArrayList<MenuVO>) request.getAttribute("menuList");
	ArrayList<ReviewVO> review_List = (ArrayList<ReviewVO>) request.getAttribute("reviewList");
%>
<script>
	$(function() {

		$('#show').on('click', function() {
			$('.card-reveal').slideToggle('slow');
		});

		$('.card-reveal .close').on('click', function() {
			$('.card-reveal').slideToggle('slow');
		});
	});
	jQuery(document).ready(function($) {

		$(".scroll").click(function(event) {
			event.preventDefault();
			$('html,body').animate({
				scrollTop : $(this.hash).offset().top
			}, 900); //속도조절 900으로 맞춤
		});
	});
	//부드러운 스크롤링 jquery
</script>
<style type="text/css">
.lib-panel {
	margin-bottom: 20Px;
}

.lib-panel img {
	width: 100%;
	background-color: transparent;
}

.lib-panel .row, .lib-panel .col-md-6 {
	padding: 0;
	background-color: #FFFFFF;
}

.lib-panel .lib-row {
	padding: 0 20px 0 20px;
}

.lib-panel .lib-row.lib-header {
	background-color: #FFFFFF;
	font-size: 20px;
	padding: 10px 20px 0 20px;
}

.lib-panel .lib-row.lib-header .lib-header-seperator {
	height: 2px;
	width: 26px;
	background-color: #d9d9d9;
	margin: 7px 0 7px 0;
}

.lib-panel .lib-row.lib-desc {
	position: relative;
	height: 100%;
	display: block;
	font-size: 13px;
}

.lib-panel .lib-row.lib-desc a {
	position: absolute;
	width: 100%;
	bottom: 10px;
	left: 20px;
}

.row-margin-bottom {
	margin-bottom: 20px;
}

.box-shadow {
	-webkit-box-shadow: 0 0 10px 0 rgba(0, 0, 0, .10);
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, .10);
}

.no-padding {
	padding: 0;
}
</style>
<!-- 4.Hero Section Begin -->
<!--메인 사진크기 1400*380-->
<!--메인 사진사용 시작
        <section class="hero">
            <div class="container">
                        <div class="hero__item__box"> 
                            
                            <div class="hero__item set-bg" data-setbg="img/hero/top-banner-test3.jpg">
                            </div>
                        </div>
                    
            </div>
        </section>
    메인 사진 사용 끝-->

<!--네비게이션바 사용 시작-->
<section class="hero">
	<div class="container">
		<div class="hero__item__box2"></div>

	</div>
</section>
<body>
	<!--네비게이션바 사용 끝-->
	<!-- Hero Section End -->
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12 cc_cursor" style="margin-bottom: 30px;">
				<div class="card bg-default">
					<div class="CardHeader" style="color: #ffffff;">
						<h3 class="card-header" style="text-align: center;">
							<%=svo.getS_name() %>
							<button type="button" id="show" class="btn btn-custom pull-right"
								aria-label="Left Align">
								<p>위치</p>
							</button>
					</div>
					</h3>
					<div class="card-body">
						<p class="card-text"
							style="display: flex; align-items: center; justify-content: center;">
							<img class="img-responsive"
								src="resources/img/store/<%=svo.getThumbnail() %>" alt=''
								/ width="350px ">
						</p>
					</div>
					<div class="card-footer"
						style="display: flex; align-items: center; justify-content: center; flex-flow: column; background-color: #ffffff;">
						<ul class="SellerInfoDetail">
							<ul>
								<h5>
									<a href="#"><img
										src="resources/DetailStore/Icon/location.ico" width="40px"
										height="40px;" alt='' /> <%=svo.getS_addr() %></a>
								</h5>
							</ul>
							<ul>
								<h5>
									<a href="#"><img src="resources/DetailStore/Icon/time.ico"
										width="40px" height="42px;" alt='' /> <%=svo.getS_hour() %></a>
								</h5>
							</ul>
							<ul>
								<h5>
									<a href="#"><img src="resources/DetailStore/Icon/call.ico"
										width="40px" height="40px;" alt='' /> <%=svo.getS_phone() %></a>
								</h5>
							</ul>
							<ul>
								<h5>
									<a href="#"><img
										src="resources/DetailStore/Icon/delivery.ico" width="40px"
										height="40px;" alt='' /> 한줄 소개 글 작성</a>
								</h5>
							</ul>
						</ul>
						<div class="card-reveal">
							<span class="card-title">가게위치 상세보기</span>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">×</span>
							</button>
							<div class="DetailLocation"
								style="text-align: left; margin-top: 30px;">
								<h4>서울 송파구 양재대로 932 38</h4>
								<h6>가락시장역8번 출구에서215m</h6>
								<div class="container-fluid">
									<div class="row">
										<div class="col-md-12">
											<div id="map" style="width: 800px; height: 400px;"></div>

											<script type="text/javascript"
												src="//dapi.kakao.com/v2/maps/sdk.js?appkey=241b4077cebf45bee1ed06d47263650b&libraries=services"></script>
											<script>
												var mapContainer = document
														.getElementById('map'), // 지도를 표시할 div 
												mapOption = {
													center : new kakao.maps.LatLng(
															33.450701,
															126.570667), // 지도의 중심좌표
													level : 3
												// 지도의 확대 레벨
												};

												// 지도를 생성합니다    
												var map = new kakao.maps.Map(
														mapContainer, mapOption);

												// 주소-좌표 변환 객체를 생성합니다
												var geocoder = new kakao.maps.services.Geocoder();

												// 주소로 좌표를 검색합니다
												geocoder
														.addressSearch(
																'${storeVO.getS_addr()}',
																function(
																		result,
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
																					content : '<div style="width:150px;text-align:center;padding:6px 0;">저희 가게</div>'
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
							<!--DetailLocation end-->
						</div>
						<!-- card reveal -->
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Tab을 구성할 영역 설정-->
	<div class="EventNav">
		<div style="margin: 10px;">
			<!-- Tab 영역 태그는 ul이고 클래스는 nav와 nav-tabs를 설정한다. -->
			<ul class="nav nav-tabs">
				<!-- Tab 아이템이다. 태그는 li과 li > a이다. li태그에 active는 현재 선택되어 있는 탭 메뉴이다. -->
				<li class="active"><a href="#Price_info" data-toggle="tab">가격정보</a></li>
				<!-- a 태그의 href는 아래의 tab-content 영역의 id를 설정하고 data-toggle 속성을 tab으로 설정한다. -->
				<li><a href="#location" data-toggle="tab">가게위치</a></li>
				<li><a href="#BestReview" data-toggle="tab">가게리뷰</a></li>
				<li><a href="#Qna" data-toggle="tab">문의</a></li>
			</ul>
		</div>
	</div>
	<!-- Tab이 선택되면 내용이 보여지는 영역이다. -->
	<!-- 태그는 div이고 class는 tab-content로 설정한다. -->
	<div class="tab-content">
		<!-- 각 탭이 선택되면 보여지는 내용이다. 태그는 div이고 클래스는 tab-pane이다. -->
		<!-- active 클래스는 현재 선택되어 있는 탭 영역이다. -->
		<div class="tab-pane fade in active" id="Price_info">
			<section class="Price_info">
				<div class="Price_info"
					style="display: flex; flex-flow: column; justify-content: center; align-items: center;">
					<div class="section-title">
						<h2 style="margin-top: 30px;">가격정보</h2>
					</div>


					<img src="resources/img/price_info.png"> <img
						src="resources/img/PriceInfo_Detail.png">

				</div>
			</section>
		</div>
		<!-- id는 고유한 이름으로 설정하고 tab의 href와 연결되어야 한다. -->
		<div class="tab-pane fade" id="location">
			<br>
			<section id="locationNav_s">
				<br>
				<div class="container">
					<!-- Portfolio Section Heading-->
					<div class="row">
						<div class="col-lg-12">
							<div class="section-title">
								<h2 style="margin-top: 30px;">가게 위치</h2>
							</div>
						</div>
					</div>
				</div>
				<div class="location"
					style="display: flex; flex-flow: column; justify-content: center; align-items: center;">
					<img src="resources/DetailStore/Location/location.png"> <img
						src="resources/DetailStore/Location/loc1.png"> <span
						class="locText"></span>
					<p>가락시장역2번 출구로 나오세요</p>
					<p>가락몰이 보입니다</p>
					<img src="resources/DetailStore/Location/loc2.png"> <span
						class="locText"></span>
					<p>가락몰 쪽으로 주욱 가다보시면</p>
					<img src="resources/DetailStore/Location/loc3.png"> <span
						class="locText"></span>
					<p>축산이 써져있는 문들이 보입니다</p>
					<img src="resources/DetailStore/Location/loc4.png"> <span
						class="locText"></span>
					<p>축산 3이 써져있는 문을 열고 들어가주세요</p>
					<img src="resources/DetailStore/Location/loc5.png"> <span
						class="locText"></span>
					<p>들어가시면 많은 축산 점포가 보입니다.</p>
					<img src="resources/DetailStore/Location/loc6.png"> <span
						class="locText"></span>
					<p>B66 점포번호를 확인해주세요</p>
					<p>정육 백화점이 보입니다.</p>
				</div>
			</section>
		</div>
		<!-- fade 클래스는 선택적인 사항으로 트랜지션(transition)효과가 있다.
<!-- in 클래스는 fade 클래스를 선언하여 트랜지션효과를 사용할 때 in은 active와 선택되어 있는 탭 영역의 설정이다. -->
		<div class="tab-pane fade" id="BestReview">
			<section class="page-section BestReview" id="BestReview">
				<br>
				<div class="container">
					<!-- Portfolio Section Heading-->
					<div class="row">
						<div class="col-lg-12">
							<div class="section-title">
								<h2 style="margin-top: 30px;">가게 리뷰</h2>
							</div>
						</div>
					</div>
					<!-- Portfolio Grid Items-->
					<div class="row justify-content-center" style="margin-top: 20px;">
						<%for (int i=0; i<review_List.size(); i++) {

            				ReviewVO vo = (ReviewVO) review_List.get(i);
           				%>
						<!-- Portfolio Item 1-->
						<div class="col-md-6 col-lg-4 mb-5">
							<div class="BestReview-item mx-auto" data-toggle="modal"
								data-target="#BestReviewModal1">
								<div class="BestReview-item-caption d-flex align-items-center justify-content-center h-100 w-100">
									<div
										class="BestReview-item-caption-content text-center text-white"></div>
								</div>
								<a href=""><img class="img-fluid"
									src="resources//DetailStore/Review/추천리뷰1.png" alt="" /></a>
							</div>
						</div>
						<%
						}
						%>
					</div>
				</div>
			</section>
		</div>
		<!--         </div> -->
		<div class="tab-pane fade" id="Qna">

			<div class="row">
				<div class="col-lg-12">
					<div class="section-title">
						<h2 style="margin-top: 30px;">문의</h2>
					</div>
				</div>
			</div>

			<div class='row'>

				<div class="col-lg-12">

					<!-- /.panel -->
					<div class="panel panel-default">
						<!-- <div class="panel-heading">
        <i class="fa fa-comments fa-fw"></i> Reply
      </div> -->

						<div class="panel-heading">
							<h5>
								<i class="fa fa-comments fa-fw"></i> 가게문의
							</h5>
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


						<div class="col-md-2"></div>
					</div>
				</div>
			</div>
			</section>
		</div>
	</div>
	<a style="display: scroll; position: fixed; bottom: 10px; right: 5px;"
		href="#" title="top">TOP</a>



	<%@include file="../includes/footer.jsp"%>

</body>
</html>