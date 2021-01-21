<%@ page import="com.spring.gogidang.domain.*"%>
<%@ page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	
	MemberVO mvo = (MemberVO) session.getAttribute("memberVO");
	String u_id = mvo.getU_id();
	int seller_key = mvo.getSeller_key();
	
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
		<h3>관리자입니다.</h3>
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
    <link rel="shortcut icon" href="resources/cut-pig.jpg"> 
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
                               <header><h6><%=u_id %> 로 로그인하셨습니다.</h6></header>
	<%
	if (mvo.getU_id() == "" || mvo.getU_id() == null) {	
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
		<h5><%=u_id %>님 환영합니다!</h5>
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
    <!-- Header Section End --> 

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

    <!-- Categories Section Begin -->
    <section class="categories">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <h2>추천 가게</h2>
                    </div>
                    <div class="featured__controls">
                        <ul>
                            <li data-filter="*">고기당이 자신있게 추천 합니다 !</li>
                            <!--
                            <li class="active" data-filter="*">고기당이 자신있게 추천 합니다 !</li>
                            <li data-filter=".oranges">Oranges</li>
                            <li data-filter=".fresh-meat">Fresh Meat</li>
                            <li data-filter=".vegetables">Vegetables</li>
                            <li data-filter=".fastfood">Fastfood</li>
                            -->
                        </ul>
                    </div>
                </div>
            </div>
            <div class="categories__slider owl-carousel">
                <!--추천가게 액션이미지 320*270으로 넣을것-->
                <div class="col-lg-3">
                    <div class="categories__item set-bg" data-setbg="resources/img/categories/seller1.jpg">
                        <h5><a href="#">맛나식육식당</a></h5>
                    </div>
                </div>
                <div class="col-lg-3">
                    <div class="categories__item set-bg" data-setbg="resources/img/categories/seller4.jpg">
                        <h5><a href="#">명성한우돼지</a></h5>
                    </div>
                </div>
                <div class="col-lg-3">
                    <div class="categories__item set-bg" data-setbg="resources/img/categories/seller3.jpg">
                        <h5><a href="#">종우명가 식당</a></h5>
                    </div>
                </div>
                <div class="col-lg-3">
                    <div class="categories__item set-bg" data-setbg="resources/img/categories/seller2.jpg">
                        <h5><a href="#">횡성길 한우</a></h5>
                    </div>
                </div>
                <div class="col-lg-3">
                    <div class="categories__item set-bg" data-setbg="resources/img/categories/seller5.jpg">
                        <h5><a href="#">수빈정육</a></h5>
                    </div>
                </div>
            </div>
            <div class="row">
            </div>
        </div>
    </section>
    <!-- Categories Section End -->

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

    <!-- Banner Begin -->
    <div class="banner">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6 col-sm-6">
                    <!--이미지크기 570*270-->
                    <div class="banner__pic">
                        <img src="resources/img/banner/bottom-banner1.jpg" alt="">
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-sm-6">
                    <div class="banner__pic">
                        <img src="resources/img/banner/bottom-banner1.jpg" alt="">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Banner End -->

    <!-- Footer Section Begin -->
    
    <footer class="footer spad">
        <div class="container">
            <div class="row1">
                <div class="col-lg-3 col-md-6 col-sm-6">
                    <div class="footer__about">
                        <div class="footer__about__logo">
                            <!--logo크기 120*50-->
                            <a href="./index.html"><img src="resources/img/bottom-logo-test1.jpg" alt=""></a>
                        </div>
                        <ul>
                            <li>법인명(상호) : 주식회사 고기당 </li>
                            <li>사업자등록번호 000-00-0000</li>
                            <li>통신판매업: 제2020-서울종로-00000                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             호 &nbsp; </li> &nbsp;
                            <li>대표이사 : 정수빈</li>
                            <li>개인정보 보호 책임자 : 임도형, 고종우</li>
                            
                        </ul>
                    </div>
                </div>
                <div class="vertical-line">
                    &nbsp;
                    &nbsp;
                    &nbsp;
                </div>
                <!--<div class="col-lg-4 col-md-6 col-sm-6 offset-lg-1">
                    <div class="footer__widget">
                        <h6>Links</h6>
                        <ul>
                            <li>입점문의 : <a href="#">입점문의하기</a></li>
                            <li><a href="#">About Our Shop</a></li>
                            <li><a href="#">Secure Shopping</a></li>
                            <li><a href="#">Delivery infomation</a></li>
                            <li><a href="#">Privacy Policy</a></li>
                            <li><a href="#">Our Sitemap</a></li>
                        </ul>
                        <ul>
                            <li><a href="#">Who We Are</a></li>
                            <li><a href="#">Our Services</a></li>
                            <li><a href="#">Projects</a></li>
                            <li><a href="#">Contact</a></li>
                            <li><a href="#">Innovation</a></li>
                            <li><a href="#">Testimonials</a></li>
                        </ul>
                    </div>
                </div>
                -->
                <div class="col-lg-3 col-md-6 col-sm-6">
                    <div class="footer__widget">
                        <h6></h6>
                        <h6>< 입점 문의 하기 ></h6>
                        <h6>함께 하실 탁월한 사장님들을 기다립니다.</h6>
                        <p><a href="#">>> 지금 바로 입점 신청하기 <<</a></p>
                        <!--
                        <form action="#">
                            <input type="text" placeholder="Enter your mail">
                            <button type="submit" class="site-btn">Subscribe</button>
                        </form>
                        -->
                        <div class="footer__widget__social">
                            <a href="#"><i class="fa fa-facebook"></i></a>
                            <a href="#"><i class="fa fa-instagram"></i></a>
                            <a href="#"><i class="fa fa-twitter"></i></a>
                            <a href="#"><i class="fa fa-pinterest"></i></a>
                        </div>
                    </div>
                </div>
            </div> <!--row1 end-->
            <div class="row">
                <div class="col-lg-12">
                    <div class="footer__copyright">
                        <div class="footer__copyright__text"><p>
                        <!--<div class="footer__copyright__payment"><img src="img/payment-item.png" alt=""></div>-->
                    </div>
                </div>
            </div>
        </div>
    </footer> 
<!-- Footer Section End -->

    <!-- Js Plugins -->
    <script src="resources/js/jquery-3.3.1.min.js"></script>
    <script src="resources/js/bootstrap.min.js"></script>
    <script src="resources/js/jquery.nice-select.min.js"></script>
    <script src="resources/js/jquery-ui.min.js"></script>
    <script src="resources/js/jquery.slicknav.js"></script>
    <script src="resources/js/mixitup.min.js"></script>
    <script src="resources/js/owl.carousel.min.js"></script>
    <script src="resources/js/main.js"></script>



</body>

</html>


