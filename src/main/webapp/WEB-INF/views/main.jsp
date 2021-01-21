<%@ page import="com.spring.gogidang.domain.*"%>
<%@ page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	MemberVO mvo = (MemberVO) session.getAttribute("memberVO");
	String u_id = "";
	int seller_key;
	if(mvo != null) {
		u_id = mvo.getU_id();
		seller_key = mvo.getSeller_key();
	} else {
		u_id = "test";
		seller_key = 0;
	}
	
	ArrayList<EventVO> event_list =(ArrayList<EventVO>) request.getAttribute("eventList");
	ArrayList<StoreVO> store_list =(ArrayList<StoreVO>) request.getAttribute("storeList");
	ArrayList<ReviewVO> review_list =(ArrayList<ReviewVO>) request.getAttribute("reviewList");
%>
<%-- <html>
<head>
<title>회원관리 시스템 메인 페이지</title>
</head>
<body>	
<header><h3><%=u_id %> 로 로그인하셨습니다.</h3></header>
	<%
	if (mvo.getU_id() == "" || mvo.getU_id() == null) {	
	%>
	<h2><a href="./loginForm.me">로그인</a></h2>
	<h2><a href="./joinForm.me">회원가입</a></h2>
	<%
	}else if (seller_key == 1) {	
	%>
		<h3>판매자입니다.</h3>
		<h2><a href="./updateList.me">판매자 마이페이지</a></h2>
		<%
			if (u_id.equals("admin")) {
		%>
				<h3>관리자입니다.</h3>
				<a href="./storeList.st">전체 가게 리스트 보기</a>
				<br>
				<a href="./storeWaitListWithPaging.st">승인 대기 중인 가게 리스트 확인</a>
		<%
			}
		%>
	<% 
	}else {
	%>
		<h3>환영합니다.</h3>
		<a href="./storeList.st">전체 가게 리스트 보기</a>
		<br>
		<br>
		<a href="./updateList.me?u_id=<%=mvo.getU_id()%>">내정보보러가기</a>
		<a href="./storeWaitListWithPaging.st">승인 대기 중인 가게 리스트 확인</a>
	<% 
	}
	%>			
<center>
	<h3>이벤트 메인사진</h3>
			<table border=1 width=300>
				
					<%
						for (int i=0; i<event_list.size(); i++)
							{
							EventVO vo = (EventVO)event_list.get(i);
					%>
					<tr align=center>
						<td colspan=2>
							<a href="eventInfo.ev?event_num=<%=vo.getEvent_num()%>"><%=vo.getThumbnail() %>
						</td>
					</tr>
					<%
							} 
					%>
				
				
			</table>
			
			<h3>가게 메인사진</h3>
			<a href="./storeList.st">가게전체보기</a>
			<table border=1 width=300>
					<%
						for (int i=0; i<store_list.size(); i++) {
							
							StoreVO vo1 = (StoreVO)store_list.get(i);
					%>
					<tr align=center>
						<td colspan=2>
							<a href="storeInfo.st?s_num=<%=vo1.getS_num()%>"><%=vo1.getThumbnail() %>
						</td>
					</tr>	
					<%
							}
					%>
				
				</table>
				<h3>리뷰 닉네임,사진,등록날짜,별점</h3>
				<a href="./reviewList.re">리뷰전체보기</a>
				<table border=1 width=300>
				<c:forEach items="${review_list }" var="review_list">
					<tr>
						<td><c:out value="${review_list.title }" /></td>
						<td><c:out value="${review_list.nickname }" /></td>
						<td><c:out value="${review_list.star }" /></td>
						<td><fmt:formatDate pattern="yyyy-MM-dd" value="${review_list.review_date }" /></td>
					</tr>
				</c:forEach>
				</table>
				<table border=1 width=300>
					<%
						for (int i=0; i<3; i++)
							{
							ReviewVO vo2 = (ReviewVO)review_list.get(i);
					%>
					<tr>
						<td><a href="./reviewInfo.re?review_num=<%=vo2.getReview_num() %>"><%=vo2.getTitle() %></a></td>
						<td><%=vo2.getNickname() %></td>
						<td><%=vo2.getPhoto1() %></td>
						<td><fmt:formatDate pattern="yyyy-MM-dd" value="<%=vo2.getRe_date() %>" /><%=vo2.getRe_date() %></td>
						<td><%=vo2.getStar()%></td>
					</tr>
					<%
							} 
					%>
			</table>
			<a href="./eventPage.ev">이벤트 페이지</a>
		</center>
</p>
</body>
</html> --%>
<!DOCTYPE html>


<html lang="kr">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>고기당</title>
    <link rel="shortcut icon" href="cut-pig.jpg"> 
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">

    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <!--사이드바 및 햄버거 아이콘 액션-->
    <style>
        input[id="menuicon"] {display:none;}
        input[id="menuicon"] + label {display:block;margin:10px 0 ;width:30px;height:20px;position:relative;cursor:pointer;}
        input[id="menuicon"] + label span {display:block;position:absolute;width:100%;height:5px;border-radius:30px;background: rgba(0, 100, 0,0.6);transition:all .35s;}
        input[id="menuicon"] + label span:nth-child(1) {top:0;}
        input[id="menuicon"] + label span:nth-child(2) {top:50%;transform:translateY(-50%);} 
        input[id="menuicon"] + label span:nth-child(3) {bottom:0;}
        input[id="menuicon"]:checked + label {z-index:2;}
        input[id="menuicon"]:checked + label span {background:rgb(62, 163, 105, 0.8);}
        input[id="menuicon"]:checked + label span:nth-child(1) {top:50%;transform:translateY(-50%) rotate(45deg);}
        input[id="menuicon"]:checked + label span:nth-child(2) {opacity:0;}
        input[id="menuicon"]:checked + label span:nth-child(3) {bottom:50%;transform:translateY(50%) rotate(-45deg);}
        div[class="sidebar"] {width:300px;height:100%;background :  rgba(0, 100, 0,0.2);position:fixed;top:0;left:-300px;z-index:1;transition:all .35s;}
        input[id="menuicon"]:checked + label + div {left:0;}


		
   </style>
    <!--사이드바 및 햄버거 아이콘 액션 end-->

    
    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="resources/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="resources/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="resources/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="resources/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="resources/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="resources/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="resources/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="resources/css/style.css" type="text/css">
	<!-- 제이쿼리 불러오기 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
 
<!-- Slick 불러오기 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick-theme.min.css">
    
<script>
  		$(function(){
			$('#slider-div').slick({
				slide: 'div',		//슬라이드 되어야 할 태그 ex) div, li 
				infinite : true, 	//무한 반복 옵션	 
				slidesToShow : 4,		// 한 화면에 보여질 컨텐츠 개수
				slidesToScroll : 1,		//스크롤 한번에 움직일 컨텐츠 개수
				speed : 100,	 // 다음 버튼 누르고 다음 화면 뜨는데까지 걸리는 시간(ms)
				arrows : true, 		// 옆으로 이동하는 화살표 표시 여부
				dots : true, 		// 스크롤바 아래 점으로 페이지네이션 여부
				autoplay : true,			// 자동 스크롤 사용 여부
				autoplaySpeed : 10000, 		// 자동 스크롤 시 다음으로 넘어가는데 걸리는 시간 (ms)
				pauseOnHover : true,		// 슬라이드 이동	시 마우스 호버하면 슬라이더 멈추게 설정
				vertical : false,		// 세로 방향 슬라이드 옵션
				prevArrow : "<button type='button' class='slick-prev'>Previous</button>",		// 이전 화살표 모양 설정
				nextArrow : "<button type='button' class='slick-next'>Next</button>",		// 다음 화살표 모양 설정
				dotsClass : "slick-dots", 	//아래 나오는 페이지네이션(점) css class 지정
				draggable : true, 	//드래그 가능 여부 
				
				responsive: [ // 반응형 웹 구현 옵션
					{  
						breakpoint: 960, //화면 사이즈 960px
						settings: {
							//위에 옵션이 디폴트 , 여기에 추가하면 그걸로 변경
							slidesToShow:3 
						} 
					},
					{ 
						breakpoint: 768, //화면 사이즈 768px
						settings: {	
							//위에 옵션이 디폴트 , 여기에 추가하면 그걸로 변경
							slidesToShow:2 
						} 
					}
				]

			});
  		})
  		
  		$(function(){
  		$('.single-item').slick();
  		})
	</script>
    
    
    
</head>
 <body>
 
 <!-- 3.Header Section Begin -->
    <header class="header">
        <div class="header__top">
            <div class="container">
                <div class="row">
                    
                    <div class="col-lg-6 col-md-6"> </div>
                    <div class="col-md-6">
                        <div class="header__top__right">
                           <div class="header__top__right__auth">
	<%String id = mvo.getU_id(); %>
	<%
	if (u_id == "" || u_id == null) {	
	%>
	<h2><a href="./loginForm.me">로그인</a></h2>
	<h2><a href="./joinForm.me">회원가입</a></h2>
	<%
	}else if (seller_key == 1) {	
	%>
		<h5>판매자입니다.</h5>
		<h2><a href="./updateList.me">판매자 마이페이지</a></h2>
		<%
			if (u_id.equals("admin")) {
		%>
				<h3>관리자입니다.</h3>
				<a href="./storeList.st">전체 가게 리스트 보기</a>
				<br>
				<a href="./storeWaitListWithPaging.st">승인 대기 중인 가게 리스트 확인</a>
		<%
			}
		%>
	<% 
	}else {
	%>
		<h6><%=id %>님!</h6>
		<%-- <a href="./storeList.st">전체 가게 리스트 보기</a>
		<br>
		<br>
		<a href="./updateList.me?u_id=<%=mvo.getU_id()%>">내정보보러가기</a>
		<a href="./storeWaitListWithPaging.st">승인 대기 중인 가게 리스트 확인</a> --%>
	<% 
	}
	%>			
<center>
                            </div>
                            <!--로그인후 모드-->
                            <!--<div class="header__top__right__auth">
                                <a href="#"><i class="fa fa-user">맛나식육</i> </a>
                                <aa>사장님 !</aa>
                            </div>
                            -->
                        </div>
                    </div>
                   
                </div>
                
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col1"></div>
                <!--메인페이지 이미지 1400*380-->
                <div class="header__logo">
                    <a href="./indexmain.html"><img src="resources/img/mainlogo.png" alt=""></a>
                </div>
                <div class="col1"></div>
            </div>
        <div>
        <div class="row">
                <div class="col-menu">
                </div>
            </div>
        </div>
        <div class="hero__search"> <!--기존의 hero서치바를 head로 옮김-->
            <div class="sidebar-icon"> 
                <input type="checkbox" id="menuicon">
                    <label for="menuicon">
                        <span></span>
                        <span></span>
                        <span></span>
                    </label>
                    <div class="sidebar">
                        <!--<div class="navibar">-->
                            <div class="sidebar__item">
                                <h4><ul><a href="#">&nbsp;</a></ul></h4>
                            </div>
                            <div class="sidebar__item">
                            <!--style="color: black"-->
                                <h4><ul><a href="#" >가게 검색</a></ul></h4>
                            </div>
                            <div class="sidebar__item">
                                <h4><ul><a href="#">후기 검색</a></ul></h4>
                            </div>
                            <div class="sidebar__item">
                                <h4><ul><a href="#">마이 페이지</a></ul></h4>
                            </div>
                            <div class="sidebar__item">
                                <h4><ul><a href="#">예약 현황</a></ul></h4>
                            </div>
                            <!--사장님 모드-->
                            <!--
                            <div class="sidebar__item">
                                <h4><ul><a href="#">예약 관리</a></ul></h4>
                            </div>
                            -->
                            <!--사장님 모드 end-->
                               <!-- 사장님 메뉴
                                <ul><a href="#">가게 검색</a></ul>
                                <ul><a href="#">후기 검색</a></ul>
                                <ul><a href="#">마이 페이지</a></ul>
                                <ul><a href="#">가게 승인관리</a></ul>
                               -->
                           
                        <!--</div>-->
                </div>
            </div>   
            <div class="hero__search__form">
                <form action="#">
                    <div class="hero__search__categories">
                        지역
                        <span class="arrow_carrot-down"></span>
                    </div>
                    <input type="text" placeholder="식당검색하기 GO" >
                    <button type="submit" class="site-btn ">검색</button>
                </form>
            </div>
        </div>
    </header>
 
    <!--네비게이션바 사용 시작-->
    <section class="hero">
        <div class="container">
            <div class="hero__item__box2"></div>
                    <div class="EventNav">
                        <ul>
                            <li><a href="./storeList.st">가게 리스트</a></li>
                            <li><a href="./reviewList.re">리뷰 전체</a></li>
                            <li><a href="#">공지사항</a></li>
                        </ul>
                    </div>   
            </div>   
        </div>
    </section>
    <!--네비게이션바 사용 끝-->
    <!-- Hero Section End -->
	
	<div class="section-title"  style="margin: top 0%;">
                        <h2>진행중 이벤트</h2>
                    </div>
	 

	  <div class="container-fluid" style="display: flex; align-items: center; justify-content: center;">

		<div class="col-md-11" style="width:1370px;display: flex;align-items: center; justify-content: center;">
			<div class="carousel slide" id="carousel-524864">
				<ol class="carousel-indicators" style="display: flex; align-items: center; justify-content: center;">
					<li data-slide-to="0" data-target="#carousel-524864" class="active">
					</li>
					<li data-slide-to="1" data-target="#carousel-524864">
					</li>
					<li data-slide-to="2" data-target="#carousel-524864">
					</li>
				</ol>
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img class="d-block w-100" alt="Carousel Bootstrap First" src="resources/img/hero/top-banner-test3.jpg" />
						<div class="carousel-caption">
						</div>
					</div>
					<div class="carousel-item">
						<img class="d-block w-100" alt="Carousel Bootstrap Second" src="resources/img/hero/top-banner-test3.jpg" />
						<div class="carousel-caption">
						</div>
					</div>
					<div class="carousel-item">
						<img class="d-block w-100" alt="Carousel Bootstrap Third" src="resources/img/hero/top-banner-test3.jpg" />
						<div class="carousel-caption">
					</div>
				</div>
				 <a class="carousel-control-prev" href="#carousel-524864" data-slide="prev">
				 <span class="carousel-control-prev-icon"></span>
				  <span class="sr-only">Previous</span></a> 
			 
				  <a class="carousel-control-next" href="#carousel-524864" data-slide="next">
				  <span class="carousel-control-next-icon"></span>
				   <span class="sr-only">Next</span></a> 
				  <!-- <a class="carousel-control left carousel-control-prev" href="#carousel-524864" data-slide="prev">
                            <i class="fa fa-angle-left text-dark"></i>
                        </a>
                        <a class="carousel-control right carousel-control-next" href="#carousel-524864" data-slide="next">
                            <i class="fa fa-angle-right text-dark"></i>
                        </a> -->

			</div>
		</div>
	</div>
	</div> 
	
	<div class="col-lg-12">
                    <div class="section-title" style="padding-top: 80px;padding-bottom: 40px;">
                    
                        <h2>추천 가게</h2>
                    </div>
	<!-- stlye 은 slick 영역 확인용 -->
	<div class="container">
	<div class="categories">
	  	<div id="slider-div">
		      <div class="col-lg-">
                    <div class="categories__item set-bg" data-setbg="resources/img/categories/seller1.jpg">
                        <h5><a href="#">맛나식육식당</a></h5>
                    </div>
                </div>
                <div class="col-lg-">
                    <div class="categories__item set-bg" data-setbg="resources/img/categories/seller4.jpg">
                        <h5><a href="#">명성한우돼지</a></h5>
                    </div>
                </div>
                <div class="col-lg-">
                    <div class="categories__item set-bg" data-setbg="resources/img/categories/seller3.jpg">
                        <h5><a href="#">종우명가 식당</a></h5>
                    </div>
                </div>
                <div class="col-lg-">
                    <div class="categories__item set-bg" data-setbg="resources/img/categories/seller2.jpg">
                        <h5><a href="#">횡성길 한우</a></h5>
                    </div>
                </div>
                <div class="col-lg-">
                    <div class="categories__item set-bg" data-setbg="resources/img/categories/seller5.jpg">
                        <h5><a href="#">수빈정육</a></h5>
                    </div>
                </div>
            </div>
            <div class="row">
            </div>
        </div>
	  	</div>
	</div>
    <!-- Featured Section Begin -->
    <section class="featured spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <h2>BEST 리뷰</h2>
                    </div>
                    <div class="featured__controls">
                        <ul>
                            <li data-filter="*">이번달 베스트 리뷰 확인하세요 !</li>
                            <!--
                            <li class="active" data-filter="*">All</li>
                            <li data-filter=".oranges">Oranges</li>
                            <li data-filter=".fresh-meat">Fresh Meat</li>
                            <li data-filter=".vegetables">Vegetables</li>
                            <li data-filter=".fastfood">Fastfood</li>
                            -->
                        </ul>
                    </div>
                </div>
            </div>
            <!--best 리뷰-->
            <div class="row featured__filter">
                <div class="col-lg-3 col-md-4 col-sm-6 mix oranges fresh-meat">
                    <div class="featured__item">
                        <!--DATA-setbg 이미지 300*270-->
                        <div class="featured__item__pic set-bg" data-setbg="resources/img/featured/best-re-img1.jpg">
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <!--
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                -->
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="#">고기나라</a></h6>
                            <i class="fal fa-smile"></i>
                            <h5>★ 4.5</h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mix vegetables fastfood">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="resources/img/featured/best-re-img2.jpg">
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <!--
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                -->
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="#">진한우명가</a></h6>
                            <h5>★ 4.78</h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mix vegetables fresh-meat">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="resources/img/featured/best-re-img1.jpg">
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <!--
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                -->
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="#">태현한우</a></h6>
                            <h5>★ 4.88</h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mix fastfood oranges">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="resources/img/featured/best-re-img3.jpg">
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <!--
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                -->
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="#">한우리식당</a></h6>
                            <h5>★ 4.88</h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mix fresh-meat vegetables">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="resources/img/featured/best-re-img3.jpg">
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <!--
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                -->
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="#">나들평화식당</a></h6>
                            <h5>★ 4.35</h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mix oranges fastfood">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="resources/img/featured/best-re-img4.jpg">
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <!--
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                -->
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="#">민석네 식육</a></h6>
                            <h5>★4.38</h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mix fresh-meat vegetables">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="resources/img/featured/best-re-img5.jpg">
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <!--
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                -->
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="#">신선횡성한우</a></h6>
                            <h5>★ 4.5</h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mix fastfood vegetables">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="resources/img/featured/best-re-img2.jpg">
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <!--
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                -->
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="#">마장축산</a></h6>
                            <h5>★ 4.8</h5>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Featured Section End -->

 <%@include file="includes/footer.jsp"%>
<script type="text/javascript" src="resources/js/slick.js"></script>
</body>

</html>


