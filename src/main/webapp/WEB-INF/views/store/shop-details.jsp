<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.spring.gogidang.domain.*"%>


<%@include file="../includes/header_simple.jsp"%>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/shop-details.css"
	type="text/css">
<%
	StoreVO svo = (StoreVO) request.getAttribute("storeVO");
	ArrayList<MenuVO> menu_List = (ArrayList<MenuVO>) request.getAttribute("menuList");
	ArrayList<SRReviewVO> srReviewList = (ArrayList<SRReviewVO>) request.getAttribute("srReviewList");
	/* ArrayList<ReviewVO> review_List = (ArrayList<ReviewVO>) request.getAttribute("reviewList"); */
%>
<%
	List<QnaStoreVO> qnalist=(List<QnaStoreVO>)request.getAttribute("qnalist");
	int listcount=((Integer)request.getAttribute("listcount")).intValue();
	int nowpage=((Integer)request.getAttribute("page")).intValue();
	int maxpage=((Integer)request.getAttribute("maxpage")).intValue();
	int startpage=((Integer)request.getAttribute("startpage")).intValue();
	int endpage=((Integer)request.getAttribute("endpage")).intValue();
	
%>
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

<section class="product-details spad" style="padding-top: 0%;">
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
							href="#tabs-2" role="tab" aria-selected="false" onclick="relayout()">위치</a></li>
						<li class="nav-item"><a class="nav-link" data-toggle="tab"
							href="#tabs-3" role="tab" aria-selected="false">후기 </a></li>
						<li class="nav-item"><a class="nav-link" data-toggle="tab"
							href="#tabs-4" role="tab" aria-selected="false">문의 </a></li>
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


										<div class="featured__item">

											<input type="hidden" id="menu_num" name="menu_num"
												value="<%=mv.getMenu_num()%>">
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
																	<td>Price</td>
																</tr>
																<tr class="table">
																	<td><input type="number" id="cartStock"
																		name="cartStock" min="1" max="100" value="1" /></td>
																	<td><input type="submit" value="장바구니에 담기"
																		id="cartbutton" /></td>
																</tr>
															</tbody>
														</table>
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

						<div class="tab-pane" id="tabs-2" role="tabpanel" >
							<div class="product__details__tab__desc">
								<div class="container">
									<!-- Portfolio Section Heading-->
									<div class="row">
										<div class="col-lg-12">


										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="tab-pane" id="tabs-3" role="tabpanel">
							<div class="panel panel-default">
								<div class="panel-heading">
									<h3 class="panel-title">후기</h3>
								</div>
								<ul class="list-group">
									<%
										for (int i = 0; i < srReviewList.size(); i++) {
											SRReviewVO srReviewvo = (SRReviewVO) srReviewList.get(i);
									%>
									<li class="list-group-item">
										<div class="row toggle" id="dropdown-detail-<%=i%>"
											data-toggle="detail-<%=i%>">
											<div class="col-xs-10"><%=srReviewvo.getTitle()%></div>
											<div class="col-xs-2">
												<i class="fa fa-chevron-down pull-right"></i>
											</div>
										</div>
										<div id="detail-<%=i%>">
											<hr></hr>
											<div class="container">
												<div class="fluid-row">
													<div class="col-xs-1">내용:</div>
													<div class="col-xs-5"><%=srReviewvo.getContent()%></div>
													<div class="col-xs-1">별점:</div>
													<div class="col-xs-5"><%=srReviewvo.getStar()%></div>
													<div class="col-xs-1">등록일:</div>
													<div class="col-xs-5"><%=srReviewvo.getReview_date()%></div>
													<div class="col-xs-1">작성자:</div>
													<div class="col-xs-5"><%=srReviewvo.getU_id()%></div>
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

						<div class="tab-pane" id="tabs-4" role="tabpanel">
							<div class="product__details__tab__desc">

							<div class="section-title" style="margin-top: 70px;">
	<h2 style="margin-top: 30px;">문의 게시판</h2>
</div>

<section class="product spad">
	<div class="container">
		<div class="container-fluid">
			<div class="row">
				<div class="qnaList" style="width: 960px; margin-left: 50px;">
					<table class="table table-striped">
						<thead>
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>날짜</th>
							</tr>
						</thead>
						<tr>

							<%
								int qnastore_num = listcount - ((nowpage - 1) * 10);
								for (int i = 0; i < qnalist.size(); i++) {
									QnaStoreVO ql = (QnaStoreVO)qnalist.get(i);
							%>
						
						<tr>
							<td><%=qnastore_num%></td>

							<td style="font-family: Tahoma; font-size: 10pt;">
								<div align="left">
									<%
										if (ql.getRe_lev() != 0) {
									%>
									<%
										for (int a = 0; a <= ql.getRe_lev() * 2; a++) {
									%>
									&nbsp;
									<%
										}
									%>
									▶
									<%
										} else {
									%>

									<%
										}
									%>
									<a href="./qnadetail.st?qnastore_num=<%=ql.getQnastore_num()%>"> <%=ql.getTitle()%>
									</a>
								</div>
							</td>

							<td style="font-family: Tahoma; font-size: 10pt;">
								<div align="center"><%=ql.getU_id()%></div>
							</td>
							<td style="font-family: Tahoma; font-size: 10pt;">
								<div align="center"><%=ql.getRe_date()%></div>
							</td>

						</tr>
						<%
							qnastore_num--;
							}
						%>
						</tbody>
					</table>
					<div class="qna_insert" style="text-align: right;">
						<a href="./qnawriteform.st"><button type="button"
								class="btn btn-lg btn-outline-secondary"
								style="background-color: #076507; color: white;">글쓰기</button> </a>
					</div>
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
							<div class="col-md-2"></div>
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
</div>
</section>
												<div id="map" style=""></div>
											
											<script type="text/javascript"
												src="//dapi.kakao.com/v2/maps/sdk.js?appkey=241b4077cebf45bee1ed06d47263650b&libraries=services"></script>
 <script>
 var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

mapContainer.style.width = '1140px';
mapContainer.style.height = '350px';


function relayout() {    
    
    // 지도를 표시하는 div 크기를 변경한 이후 지도가 정상적으로 표출되지 않을 수도 있습니다
    // 크기를 변경한 이후에는 반드시  map.relayout 함수를 호출해야 합니다 
    // window의 resize 이벤트에 의한 크기변경은 map.relayout 함수가 자동으로 호출됩니다
    map.relayout();
}


// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
geocoder.addressSearch('${storeVO.getS_addr()}', function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
          
            
        });
		
        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">저희 가게</div><div style="width:150px;text-align:center;padding:6px 0;"><a href="https://map.kakao.com/link/to/${storeVO.getS_addr()}">길찾기</a></div>'
            		 
        });
        infowindow.open(map, marker);
		
        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
     
       
        map.setCenter(coords);
       
        
        
    } 

     
});  
//map.relayout();
relayout();
</script>

<%@include file="../includes/footer.jsp"%>

