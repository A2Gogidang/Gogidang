<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>  
<%@ page import="com.spring.gogidang.domain.*" %>
<%@ page import="java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%
	StoreVO svo = (StoreVO) request.getAttribute("storeVO");
%>

<!DOCTYPE html>

<html lang="zxx">
	
	
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/shop-details.css" type="text/css">
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Ogani | Template</title>

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
    
  <!-- Bootstrap Core CSS -->
    <link href="resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="resources/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- DataTables CSS -->
    <link href="resources/vendor/datatables-plugins/dataTables.bootstrap.css" rel="stylesheet">

    <!-- DataTables Responsive CSS -->
    <link href="resources/vendor/datatables-responsive/dataTables.responsive.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="resources/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
   
   
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
   
   

<%
   MemberVO membervo = (MemberVO)session.getAttribute("memberVO");
   String u_id=(String)membervo.getU_id();
   %>

<%
   ArrayList<MenuVO> menu_List = (ArrayList<MenuVO>)request.getAttribute("menuList");
   ArrayList<ReviewVO> review_List = (ArrayList<ReviewVO>)request.getAttribute("reviewList");
   
%>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>

</head>
<body>
   <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

    <!-- Humberger Begin -->
    <div class="humberger__menu__overlay"></div>
    <div class="humberger__menu__wrapper">
        <div class="humberger__menu__logo">
            <a href="#"><img src="resources/img/logo.png" alt=""></a>
        </div>
        <div class="humberger__menu__cart">
            <ul>
                <li><a href="#"><i class="fa fa-heart"></i> <span>1</span></a></li>
                <li><a href="#"><i class="fa fa-shopping-bag"></i> <span>3</span></a></li>
            </ul>
            <div class="header__cart__price">item: <span>$150.00</span></div>
        </div>
        <div class="humberger__menu__widget">
            <div class="header__top__right__language">
                <img src="img/language.png" alt="">
                <div>English</div>
                <span class="arrow_carrot-down"></span>
                <ul>
                    <li><a href="#">Spanis</a></li>
                    <li><a href="#">English</a></li>
                </ul>
            </div>
            <div class="header__top__right__auth">
                <a href="#"><i class="fa fa-user"></i> Login</a>
            </div>
        </div>
        <nav class="humberger__menu__nav mobile-menu">
            <ul>
                <li class="active"><a href="./index.html">Home</a></li>
                <li><a href="./shop-grid.html">Shop</a></li>
                <li><a href="#">Pages</a>
                    <ul class="header__menu__dropdown">
                        <li><a href="./shop-details.html">Shop Details</a></li>
                        <li><a href="./shoping-cart.html">Shoping Cart</a></li>
                        <li><a href="./checkout.html">Check Out</a></li>
                        <li><a href="./blog-details.html">Blog Details</a></li>
                    </ul>
                </li>
                <li><a href="./blog.html">Blog</a></li>
                <li><a href="./contact.html">Contact</a></li>
            </ul>
        </nav>
        <div id="mobile-menu-wrap"></div>
        <div class="header__top__right__social">
            <a href="#"><i class="fa fa-facebook"></i></a>
            <a href="#"><i class="fa fa-twitter"></i></a>
            <a href="#"><i class="fa fa-linkedin"></i></a>
            <a href="#"><i class="fa fa-pinterest-p"></i></a>
        </div>
        <div class="humberger__menu__contact">
            <ul>
                <li><i class="fa fa-envelope"></i> hello@colorlib.com</li>
                <li>Free Shipping for all Order of $99</li>
            </ul>
        </div>
    </div>
    <!-- Humberger End -->

    <!-- Header Section Begin -->
    <header class="header">
        <div class="header__top">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="header__top__left">
                            <ul>
                                <li><i class="fa fa-envelope"></i> hello@colorlib.com</li>
                                <li>Free Shipping for all Order of $99</li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="header__top__right">
                            <div class="header__top__right__social">
                                <a href="#"><i class="fa fa-facebook"></i></a>
                                <a href="#"><i class="fa fa-twitter"></i></a>
                                <a href="#"><i class="fa fa-linkedin"></i></a>
                                <a href="#"><i class="fa fa-pinterest-p"></i></a>
                            </div>
                            <div class="header__top__right__language">
                                <img src="resources/img/language.png" alt="">
                                <div>English</div>
                                <span class="arrow_carrot-down"></span>
                                <ul>
                                    <li><a href="#">Spanis</a></li>
                                    <li><a href="#">English</a></li>
                                </ul>
                            </div>
                            <div class="header__top__right__auth">
                                <a href="#"><i class="fa fa-user"></i> Login</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="header__logo">
                        <a href="./index.html"><img src="resources/img/logo.png" alt=""></a>
                    </div>
                </div>
                <div class="col-lg-6">
                    <nav class="header__menu">
                        <ul>
                            <li><a href="./index.html">Home</a></li>
                            <li class="active"><a href="./shop-grid.html">Shop</a></li>
                            <li><a href="#">Pages</a>
                                <ul class="header__menu__dropdown">
                                    <li><a href="./shop-details.html">Shop Details</a></li>
                                    <li><a href="./shoping-cart.html">Shoping Cart</a></li>
                                    <li><a href="./checkout.html">Check Out</a></li>
                                    <li><a href="./blog-details.html">Blog Details</a></li>
                                </ul>
                            </li>
                            <li><a href="./blog.html">Blog</a></li>
                            <li><a href="./contact.html">Contact</a></li>
                        </ul>
                    </nav>
                </div>
                <div class="col-lg-3">
                    <div class="header__cart">
                        <ul>
                            <li><a href="#"><i class="fa fa-heart"></i> <span>1</span></a></li>
                            <li><a href="#"><i class="fa fa-shopping-bag"></i> <span>3</span></a></li>
                        </ul>
                        <div class="header__cart__price">item: <span>$150.00</span></div>
                    </div>
                </div>
            </div>
            <div class="humberger__open">
                <i class="fa fa-bars"></i>
            </div>
        </div>
    </header>
    <!-- Header Section End -->
    <!-- Hero Section Begin -->
    <section class="hero hero-normal">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="hero__categories">
                        <div class="hero__categories__all">
                            <i class="fa fa-bars"></i>
                            <span>All departments</span>
                        </div>
                        <ul>
                            <li><a href="#">Fresh Meat</a></li>
                            <li><a href="#">Vegetables</a></li>
                            <li><a href="#">Fruit & Nut Gifts</a></li>
                            <li><a href="#">Fresh Berries</a></li>
                            <li><a href="#">Ocean Foods</a></li>
                            <li><a href="#">Butter & Eggs</a></li>
                            <li><a href="#">Fastfood</a></li>
                            <li><a href="#">Fresh Onion</a></li>
                            <li><a href="#">Papayaya & Crisps</a></li>
                            <li><a href="#">Oatmeal</a></li>
                            <li><a href="#">Fresh Bananas</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-9">
                    <div class="hero__search">
                        <div class="hero__search__form">
                            <form action="#">
                                <div class="hero__search__categories" font-size="15px">
                                    All Categories
                                    <span class="arrow_carrot-down"></span>
                                </div>
                                <input type="text" placeholder="What do yo u need?">
                                <button type="submit" class="site-btn">SEARCH</button>
                            </form>
                        </div>
                        <div class="hero__search__phone">
                            <div class="hero__search__phone__icon">
                                <i class="fa fa-phone"></i>
                            </div>
                            <div class="hero__search__phone__text">
                                <h5>+65 11.188.888</h5>
                                <span>support 24/7 time</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Hero Section End -->

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
                 src="resources/img/store/<%=svo.getThumbnail() %>"width="400px;" height="380px;">
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

                        <h3 style="display:inline-flex; color:#7fad39;"><%=svo.getS_name() %></h3>
                        
                        <a href="#" class="heart-icon"><span class="icon_heart_alt"></span></a>
                        
                        <div class="product__details__rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star-half-o"></i>
                            <span>(18 reviews)</span>
                        </div>
                        <div class="product__details__price" style="color:#7fad39; font-size: 25px; width:400px; height:73px;"><%=svo.getS_addr() %></div>
                        
						<ul style="margin-top : 60px;">
                           <li><img src="resources/DetailStore/Icon/time.ico"
                              width="40px" height="42px;" alt='' / style="margin-right : 10px;"><span>운영시간 : &nbsp;&nbsp;<%=svo.getS_hour() %></span></li>
                            <li><img src="resources/DetailStore/Icon/call.ico"
                              width="40px" height="42px;" alt='' / style="margin-right : 10px;"><span>전화번호 : &nbsp;&nbsp;<%=svo.getS_phone() %></span></li>
                            <li><img src="resources/DetailStore/Icon/delivery.ico"
                              width="40px" height="42px;" alt='' / style="margin-right : 10px;"><span>가게소개 : &nbsp;&nbsp;한줄소개글 추가</span></li>
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
                </div> <!-- 사진옆정보 -->
                <div class="col-lg-12">
                    <div class="product__details__tab">
                        <ul class="nav nav-tabs" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab"
                                    aria-selected="true">메뉴</a>
                            </li>
                            <li class="nav-item">
                               <a class="nav-link" data-toggle="tab" href="#tabs-2" role="tab"
                                    aria-selected="false">위치</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-3" role="tab"
                                    aria-selected="false">후기 </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-4" role="tab"
                                    aria-selected="false">문의 </a>
                            </li>
                        </ul>
                        
                        <div class="tab-content">
                            <div class="tab-pane active" id="tabs-1" role="tabpanel">
                                <div class="product__details__tab__desc">
                                       <div class="section-title">
                        <h2>메뉴</h2>
                     </div>
                                    <div class="row featured__filter">
                <div class="col-lg-3 col-md-4 col-sm-6 mix oranges fresh-meat">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="resources/img/featured/feature-1.jpg">
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="#">항정살</a></h6>
                            <h5>600g</h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mix vegetables fastfood">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="resources/img/featured/feature-2.jpg">
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="#">삼겹살</a></h6>
                            <h5>600g</h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mix vegetables fresh-meat">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="resources/img/featured/feature-3.jpg">
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="#">차돌박이</a></h6>
                            <h5>300g</h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mix fastfood oranges">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="resources/img/featured/feature-4.jpg">
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="#">꽃등심</a></h6>
                            <h5>600g</h5>
                        </div>
                    </div>
                </div>
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
                   <div id="map" style="width:100%;height:350px;"></div>
 <button onclick="resizeMap()">지도 크기 바꾸기</button> 
<button onclick="relayout()">relayout 호출하기</button>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=241b4077cebf45bee1ed06d47263650b&libraries=services"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

//지도를 표시하는 div 크기를 변경하는 함수입니다
function resizeMap() {
    var mapContainer = document.getElementById('map');
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
            content: '<div style="width:150px;text-align:center;padding:6px 0;">우리회사</div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});


</script>
                     
                     </div>
                  </div>
               </div>
            </div>
           
         </section>
         </div></div>
                            <div class="tab-pane" id="tabs-3" role="tabpanel">
                                <div class="product__details__tab__desc">
                                       <div class="section-title">
                        <h2>후기</h2>
                     </div>
                                    <div class="row featured__filter">
                <div class="col-lg-3 col-md-4 col-sm-6 mix oranges fresh-meat">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="resources/img/featured/feature-1.jpg">
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="#">맛있습니다</a></h6>
                             <div class="product__details__rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star-half-o"></i>
                        </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mix vegetables fastfood">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="resources/img/featured/feature-2.jpg">
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="#">마싯어요!</a></h6>
                            <div class="product__details__rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                        </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mix vegetables fresh-meat">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="resources/img/featured/feature-3.jpg"> 
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="#">짱!</a></h6>
                            <div class="product__details__rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                        </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mix fastfood oranges">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="resources/img/featured/feature-4.jpg">
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="#">또올래요~</a></h6>
                             <div class="product__details__rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                        </div>
                        </div>
                    </div>
                </div>
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
        <button id='addReplyBtn' class='btn btn-primary btn-xs pull-right'>가게 문의 등록</button>
      </div>   
      
      
      <!-- /.panel-heading -->
      <div class="panel-body">        
      
        <ul class="chat">
         <!-- start reply -->
         <li class="left clearfix" data-qs_num='1'>
            <div>
               <div class="header">
                  <strong class="primary-font">user00</strong>
                  <small class="pull-right text-muted">2018-01-01 13:13</small>
               </div>
               <p>Good job!</p>
            </div>
         </li>
         <!-- end reply -->
        </ul>
        <!-- ./ end ul -->
      </div>
      <!-- /.panel .chat-panel -->
      
      <div class="panel-footer">
      
      </div>
      
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
                <label>제목</label> 
                <input class="form-control" name='u_id' value='New Reply!!!!'>
              </div>      
              <div class="form-group">
                <label>내용</label> 
                <input class="form-control" name='content' value='replyer'>
              </div>
              <div class="form-group">
                <label>등록일</label> 
                <input class="form-control" name='qna_date' value=''>
              </div>
      
            </div>
<div class="modal-footer">
        <button id='modalModBtn' type="button" class="btn btn-warning">수정</button>
        <button id='modalRemoveBtn' type="button" class="btn btn-danger">제거</button>
        <button id='modalRegisterBtn' type="button" class="btn btn-primary">등록</button>
        <button id='modalCloseBtn' type="button" class="btn btn-default" data-dismiss='modal'>닫기</button>
        <button id='modalClassBtn' type='button' class="btn btn-default" data-dismiss='modal'>닫기</button>
      </div>          </div>
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
    <script src="./resources/vendor/datatables/js/jquery.dataTables.min.js"></script>
    <script src="./resources/vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
    <script src="./resources/vendor/datatables-responsive/dataTables.responsive.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="./resources/dist/js/sb-admin-2.js"></script>


<script>
$(document).ready(function (){
   var s_numValue = '<c:out value="${storeVO.getS_num()}"/>';
   var replyUL = $(".chat");
      
   showList(1);
      
      function showList(page) {
    	  console.log("show List" +page);
    	  qnaService.getList({s_num:s_numValue,page: page || 1}, function(qnastoreCnt,list){
            console.log("qnastorCnt:"+ qnastoreCnt);
            console.log("list:"+ list);
            console.log(list);
            
            if(page == -1) {
            	pageNum = Math.ceil(qnastoreCnt/10.0);
            	showList(pageNum);
            	return;
            }
    		  
            var str="";
            
            if(list == null || list.length == 0) {
            	return;
               
            }
            for (var i=0,len = list.length || 0; i < len; i++) {
               str +="<li class='left clearfix' data-qs_num='"+list[i].qs_num+"'>";
               str +="      <div><div class='header'><strong class='primary-font'>"+list[i].u_id+"</strong>";
               str +="         <small class='pull-right text-muted'>"+qnaService.displayTime(list[i].qna_date)+"</small></div>";
               str +="            <p>"+list[i].content+"</p></div></li>";
            }
               replyUL.html(str);
               
               showqnastorePage(qnastoreCnt);
         });//end function
      } //end showList

      var modal = $(".modal");
      var modalInputContent = modal.find("input[name='content']");
      var modalInputU_id = modal.find("input[name='u_id']");
      var modalInputQna_date = modal.find("input[name='qna_date']");
      
      var modalModBtn = $("#modalModBtn");
      var modalRemoveBtn = $("#modalRemoveBtn");
      var modalRegisterBtn = $("#modalRegisterBtn");
      
      $("#addReplyBtn").on("click", function(e){
         modal.find("input").val("");
         modalInputQna_date.closest("div").hide();
         modal.find("button[id !='modalCloseBtn']").hide();
         
         modalRegisterBtn.show();
   
         $(".modal").modal("show");
     
	});
      var qnastore;
      modalRegisterBtn.on("click",function(e){
    	 
  	  qnastore = {
  			  content: modalInputContent.val(),
  			  u_id: modalInputU_id.val(),
  			  s_num: s_numValue
  	  	};
  	qnaService.add(qnastore, function(result) {
  		  
  		  alert("추가되었습니다"+result);
  		  
  		  modal.find("input").val("");
  		  modal.modal("hide");
  		  
  		  //showList(1);
  		  showList(-1);
});

  	});
  	
  	//댓글 조회 클릭 이벤트 처리
  	$(".chat").on("click","li",function(e){

  		var qs_num = $(this).data("qs_num");
  		alert("qs_num=" + qs_num);
  		
  		qnaService.get(qs_num,function(res) {
  			console.log(res);
  			alert("qnastore.qs_num=" + res.qs_num);
  			modalInputContent.val(res.content);
  			modalInputU_id.val(res.u_id);
  			modalInputQna_date.val(qnaService.displayTime(res.qna_date)).attr("readonly","readonly");
  			modal.data("qs_num",res.qs_num);
  			
  			console.log(qs_num);
  			
  			modal.find("button[id !='modalCloseBtn']").hide();
  			modalModBtn.show();
  			modalRemoveBtn.show();
  			
  			$(".modal").modal("show");
  		});
  	});
  	
  	modalModBtn.on("click",function(e) {
  		var content = {qs_num:modal.data("qs_num"), content:modalInputContent.val()};
  		
  		qnaService.update(content, function(result) {
  			alert(result);
  			modal.modal("hide");
  			showList(pageNum);
  		});
  		
  	});
  	
  	modalRemoveBtn.on("click",function(e) {
  		var qs_num = modal.data("qs_num");
  		
  		qnaService.remove(qs_num, function(result) {
  			alert(result);
  			modal.modal("hide");
  			showList(pageNum);
  		});
  	});
  	
  	var pageNum = 1;
	var qnastorePageFooter = $(".panel-footer");
	
	function showqnastorePage(qnastoreCnt) { //페이징 처리
		
		var endNum = Math.ceil(pageNum / 10.0) * 10;
		var startNum = endNum - 9;
		
		var prev = startNum != 1;
		var next = false;
		
		if(endNum * 10 >= qnastoreCnt) {
			endNum = Math.ceil(qnastoreCnt/10.0);
		}
		
		if(endNum * 10 < qnastoreCnt) {
			next = true;
		}
		
		var str = "<ul class='pagination pull-right'>";
		
		if(prev) {
			str += "<li class='page-item'><a class='page-link' href='"+(startNum -1)+"'>Previous</a></li>";
		}
		
		for(var i = startNum ; i <=endNum; i++) {
			
			var active = pageNum == i? "active":"";
			
			str += "<li class='page-item "+active+" '><a class='page-link' href='"+i+"'>"+i+"</a></li>";
		}
		
		if(next) {
			str += "<li class='page-item'><a class='page-link' href='"+(endNum+1)+"'>Next</a></li>";
		}
		
		str += "</ul></div>";
		
		qnastorePageFooter.html(str);
	}
	
	qnastorePageFooter.on("click","li a", function(e){ //페이지 번호를 클릭했을때 새로운 댓글 가져옴
		e.preventDefault();
		
		var targetPageNum = $(this).attr("href");
		
		console.log("targetPageNum:" + targetPageNum);
		
		pageNum = targetPageNum;
		
		showList(pageNum);
	});
  	
});	
  	

</script>

<!-- Footer Section Begin -->
    <footer class="footer spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-6 col-sm-6">
                    <div class="footer__about">
                        <div class="footer__about__logo">
                            <a href="./index.html"><img src="resources/img/logo.png" alt=""></a>
                        </div>
                        <ul>
                            <li>Address: 60-49 Road 11378 New York</li>
                            <li>Phone: +65 11.188.888</li>
                            <li>Email: hello@colorlib.com</li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 col-sm-6 offset-lg-1">
                    <div class="footer__widget">
                        <h6>Useful Links</h6>
                        <ul>
                            <li><a href="#">About Us</a></li>
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
                <div class="col-lg-4 col-md-12">
                    <div class="footer__widget">
                        <h6>Join Our Newsletter Now</h6>
                        <p>Get E-mail updates about our latest shop and special offers.</p>
                        <form action="#">
                            <input type="text" placeholder="Enter your mail">
                            <button type="submit" class="site-btn">Subscribe</button>
                        </form>
                        <div class="footer__widget__social">
                            <a href="#"><i class="fa fa-facebook"></i></a>
                            <a href="#"><i class="fa fa-instagram"></i></a>
                            <a href="#"><i class="fa fa-twitter"></i></a>
                            <a href="#"><i class="fa fa-pinterest"></i></a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="footer__copyright">
                        <div class="footer__copyright__text"><p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
  Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
  <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p></div>
                        <div class="footer__copyright__payment"><img src="img/payment-item.png" alt=""></div>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- Footer Section End -->

	
	<script src="resources/js/jquery.nice-select.min.js"></script>
    <script src="resources/js/jquery-ui.min.js"></script>
    <script src="resources/js/jquery.slicknav.js"></script>
    <script src="resources/js/mixitup.min.js"></script>
    <script src="resources/js/owl.carousel.min.js"></script>
    <script src="resources/js/main.js"></script>
</body>



</html>