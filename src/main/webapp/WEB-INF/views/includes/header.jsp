<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="com.spring.gogidang.domain.*"%>
<%
	MemberVO memberVO = (MemberVO)session.getAttribute("memberVO");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>고기당</title>
	<link rel="shortcut icon" href="reources/cut-pig.jpg"> 
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
    
    <!-- taehyun modal -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>	

    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <!--sidebar action and hamburger icon action START START -->
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
	<!--sidebar action and hamburger icon action END END -->
 
    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/storelist.css" type="text/css">
	

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
                           <%if (memberVO == null ||memberVO.getU_nick() == null || memberVO.getU_nick() == ""){ %>
                           <div class="header__top__right__auth">
                                <aa><a href="#">로그인 </a></aa>
                                <aa><a href="#"> 회원가입 </a></aa>
                            </div>
                           <%}else{ %>
                            <div class="header__top__right__auth">
                                <a href="#"><i class="fa fa-user" style="margin-top: 10px;"><%=memberVO.getU_nick() %>님! 환영합니다!</i></a> <a href="#"><img class="cart" src="resources/img/storeinfo/cart1.ico" style ="width:30px;height:30px;"/></a>
                           <%} %>
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
            <div class="sidebar-icon" style="align:left;"> 
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
                                <h4><ul><a href="./storeList.st" >가게 검색</a></ul></h4>
                            </div>
                            <div class="sidebar__item">
                                <h4><ul><a href="./reviewList.re">후기 검색</a></ul></h4>
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
                    <input type="text" placeholder="식당검색하기 GO" />
                    <button type="submit" class="site-btn ">검색</button>
                </form>
            </div>
        </div>
    </div>
    </header>
    <!-- Header Section End --> 