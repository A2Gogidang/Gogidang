<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.spring.gogidang.domain.*"%>
<%
	StoreVO vo = (StoreVO)session.getAttribute("StoreVO");
	MemberVO memberVO = (MemberVO)session.getAttribute("MemberVO");	
%>
<html>
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
                            <!--로그인후 모드-->
                            <div class="header__top__right__auth">
                                <a href="#"><i class="fa fa-user"><%=memberVO.getU_nick() %></i> </a>
                                <aa>님 !</aa>
                            </div>
                          
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
                    <a href="./main.me"><img src="resources/img/mainlogo.png" alt=""></a>
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
                                <h4><ul><a href="./updateList.me">마이 페이지</a></ul></h4>
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
    <section class="hero">
        <div class="container">
            <div class="hero__item__box2"></div>
                    <div class="EventNav">
                        <ul>
                            <li><a href="./updateList.me">내정보</a></li>
                            <li><a href="./storeRegForm.st">가게 정보</a>
                            <li><a href="./menuRegForm.st">메뉴 정보</a></li>
                            <li><a href="./storeNoticeList.no">문의 관리</a></li>
                            <li><a href="./storereviewList.bo">리뷰 관리</a></li>
                        </ul>
                    </div>   
            </div>   
        </div>
    </section>
<form name="storeform" action="./storeInsert.st" method="post">
<input type="hidden" name = "u_id" value=<%=memberVO.getU_id() %>>
<center>

<table border=1>
	<tr>
		<td colspan="2" align=center>
			<b><font size=5>가게등록 페이지</font></b>
		</td>
	</tr>
	<tr>
	<td>메인사진 : </td> 
	<%if( vo == null || vo.getThumbnail() == null || vo.getThumbnail() == ""){ %>
	<td><input name="thumbnail" type="file" /></td>
	<%}else{ %>
	
	<td><span name="thumbnail" type="file" value="<%=vo.getThumbnail() %>"/><%=vo.getThumbnail() %></td>
	<%} %>
	</tr>
	<tr>
	<td>사업자등록번호  : </td>
	<%if( vo == null || vo.getS_num() == 0 ){ %>
	<td><input type="text" name="s_num" /></td>
	<%}else{ %>
	<td><span type="text" name="s_num"  value="<%=vo.getS_num() %>"/><%=vo.getS_num() %></td>
	<%} %>
	</tr>
	<tr>
	<td>사업자등록증  : </td>
	<%if( vo == null|| vo.getS_img() == null || vo.getS_img() == ""){ %>
	<td><input name="s_img" type="file"/></td>
	<%}else{ %>
	<td><span name="s_img" type="file" value="<%=vo.getS_img() %>"/><%=vo.getS_img() %></td>
	<%} %>
	</tr>
	<tr>
	<td>가게이름 </td>
	<%if( vo == null|| vo.getS_name() == null || vo.getS_name() == ""){ %>
	<td><input name="s_name" type="text"/></td>
	<%}else{ %>
	<td><span type="text" name="s_name" value="<%=vo.getS_name() %>"/><%=vo.getS_name()%></td>
	<%} %>
	</tr>
	<tr>
	<td>가게주소  : </td>
	<%if( vo == null|| vo.getS_addr() == null || vo.getS_addr() == ""){ %>
	<td><input name="s_addr" type="text"/></td>
	<%}else{ %>
	<td><span type="text" name="s_addr" value="<%=vo.getS_addr() %>"/><%=vo.getS_addr() %></td>
	<%} %>
	</tr>
	<tr>
	<td>가게전화번호  : </td>
	<%if( vo == null|| vo.getS_phone() == null || vo.getS_phone() == ""){ %>
	<td><input name="s_phone" type="text"/></td>
	<%}else{ %>
	<td><span type="text" name="s_phone" value="<%=vo.getS_phone() %>"/><%=vo.getS_phone() %></td>
	<%} %>
	</tr>
	<tr>
	<td>가게운영시간  : </td>
	<%if( vo == null|| vo.getS_hour() == null || vo.getS_hour() == ""){ %>
	<td><input name="s_hour" type="text"/></td>
	<%}else{ %>
	<td><span type="text" name="s_hour" size=30 value="<%=vo.getS_hour() %>"/><%=vo.getS_hour() %></td>
	<%} %>
	</tr>
	<tr>
	<td>배달가능여부  : </td>
	<td><input type="radio" name="delibery" value="0" checked/>불가능
		<span type="radio" name="delibery" value="1"/>가능</td>
	</tr>
	<tr>
		<td colspan="2" align=center>
<<<<<<< HEAD
	<%if( vo == null || vo.getS_num() == 0 ){ %>
			<a href="javascript:storeform.submit()">저장</a>&nbsp;&nbsp;
=======
	<%if( vo == null || vo.getS_num() == null || vo.getS_num() == ""){ %>
			<a href="javascript:storeform.submit()">저장</a>
			<a href="javascript:storeform.reset()">다시작성</a>
>>>>>>> e2f76e0d6d11d780b99ca425c362b062a150b092
	<%}else{ %>
			<a href="./storeUpdateForm.st">수정</a>
	<%}%>
			
		</td>
	</tr>
</table>
</center>
</form>
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