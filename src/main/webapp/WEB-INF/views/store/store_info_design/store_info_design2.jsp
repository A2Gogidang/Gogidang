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
    <link rel="stylesheet" href="DetailStore/css/DetailStore.css">
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <script src="newDetailStore.js"></script>
    

    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <!--사이드바 및 햄버거 아이콘 액션 end-->

        <!-- Google Font -->
        <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">
        

        <!-- Css Styles -->
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
        <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
        <link rel="stylesheet" href="css/nice-select.css" type="text/css">
        <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
        <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
        <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
        <link rel="stylesheet" href="/newDetailStore.css" type="text/css">
        <link rel="stylesheet" href="css/style.css" type="text/css">

        <script>
            jQuery(document).ready(function($) {

$(".scroll").click(function(event){            
        event.preventDefault();
        $('html,body').animate({scrollTop:$(this.hash).offset().top}, 900);
});
});
//부드러운 스크롤링 jquery
            </script>
<style>
.page-link
{
    color: #338333;
}
</style>
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
                                <aa><a href="#">로그인 </a></aa>
                                <aa><a href="#"> 회원가입 </a></aa>
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
                    <a href="indexmain.html"><img src="img/mainlogo.png" alt=""></a>
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
                    
                            <li><a href="#">가격정보</a></li>
                            <li><a href="#BestReview" class="scroll">추천리뷰</a></li>
                            <li><a href="#locationNav_s" class="scroll">가게위치</a></li>
                            <li><a href="#Qna_s" class="scroll">문의</a></li>
                            
                        </ul>
                    </div>   
            </div>   
        </div>
    </section>
    <!--네비게이션바 사용 끝-->
    <!-- Hero Section End -->
    <div class="container" style = "display: flex; align-items: center; justify-content: center;">
        <div class="row" style = "display: flex; align-items: center; justify-content: center;>  
          
            <div class="col-md-6 col-md-offset-3">
                <div class="card" style="margin-bottom: 70px;">
                    <div class="card-image">
                        <img class="img-responsive" src="DetailStore/SellerImg/sellerpic.png">
                        
                    </div><!-- card image -->
                    
                    <div class="card-content">
                        <span class="card-title">정육백화점</span>                    
                        <button type="button" id="show" class="btn btn-custom pull-right" aria-label="Left Align">
                            <p>위치</p>
                        </button>
                    </div><!-- card content -->
                    <div class="card-action"style="text-align: left;">
                        <div class="SellerInfo">
                            <ul class="SellerInfoDetail">
                            <ul><a href="#"><img src="DetailStore/Icon/location.ico" width="40px" height="40px;">&nbsp;&nbsp;서울 특별시 성동구 마장동 정육백화점</a></ul>
                            <ul><a href="#"><img src="DetailStore/Icon/time.ico" width="40px" height="42px;">&nbsp;&nbsp;10:00 ~ 21:00</a></ul>
                            <ul><a href="#"><img src="DetailStore/Icon/call.ico" width="40px" height="40px;">&nbsp;&nbsp;010-0000-0000 &nbsp; 02-0000-0000</a></ul>
                            <ul><a href="#"><img src="DetailStore/Icon/delivery.ico" width="40px" height="40px;">&nbsp;&nbsp;서울 특별시 성동구 마장동 정육백화점</a></ul>
                           </ul>
                        </div>
                    </div><!-- card actions -->
                    <div class="card-reveal">
                        <span class="card-title">가게위치 상세보기</span> <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                        <div class="DetailLocation" style="text-align: left; margin-top: 30px;">
                        <h4>서울 송파구 양재대로 932 38</h4>
                        <h6>가락시장역8번 출구에서215m</h6>
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-md-12">
                                    <img src="SampleLocation.png" src="정육백화점" />
                                </div>
                            </div>
                        </div>
                    </div><!--DetailLocation end-->
                    </div><!-- card reveal -->
                </div><!-- card reveal -->
                </div>
            </div>
        </div>
    </div>
    <section class="page-section BestReview" id="BestReview">
        <br>
        <div class="container">
            <!-- Portfolio Section Heading-->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="section-title">
                            <h2 style="margin-top: 30px;">추천 리뷰</h2>
                        </div>
                        </div>
                    </div>
            <!-- Portfolio Grid Items-->
            <div class="row justify-content-center" style="margin-top: 20px;">
                <!-- Portfolio Item 1-->
                <div class="col-md-6 col-lg-4 mb-5">
                    <div class="BestReview-item mx-auto" data-toggle="modal" data-target="#BestReviewModal1">
                        <div class="BestReview-item-caption d-flex align-items-center justify-content-center h-100 w-100">
                            <div class="BestReview-item-caption-content text-center text-white"></div>
                        </div>
                        <img class="img-fluid" src="/DetailStore/Review/추천리뷰1.png" alt="" />
                    </div>
                </div>
                <!-- Portfolio Item 2-->
                <div class="col-md-6 col-lg-4 mb-5">
                    <div class="BestReview-item mx-auto" data-toggle="modal" data-target="#BestReviewModal2">
                        <div class="BestReview-item-caption d-flex align-items-center justify-content-center h-100 w-100">
                            <div class="BestReview-item-caption-content text-center text-white"></div>
                        </div>
                        <img class="img-fluid" src="/DetailStore/Review/추천리뷰2.png" alt="" />
                    </div>
                </div>
                <!-- Portfolio Item 3-->
                <div class="col-md-6 col-lg-4 mb-5">
                    <div class="BestReview-item mx-auto" data-toggle="modal" data-target="#BestReviewModal3">
                        <div class="BestReview-item-caption d-flex align-items-center justify-content-center h-100 w-100">
                            <div class="BestReview-item-caption-content text-center text-white"></div>
                        </div>
                        <img class="img-fluid" src="/DetailStore/Review/추천리뷰3.png" alt="" />
                    </div>
                </div>
                <!-- Portfolio Item 4-->
                <div class="col-md-6 col-lg-4 mb-5 mb-lg-0">
                    <div class="BestReview-item mx-auto" data-toggle="modal" data-target="#BestReviewModal4">
                        <div class="BestReview-item-caption d-flex align-items-center justify-content-center h-100 w-100">
                            <div class="BestReview-item-caption-content text-center text-white"></div>
                        </div>
                        <img class="img-fluid" src="/DetailStore/Review/추천리뷰4.png" alt="" />
                    </div>
                </div>
                <!-- Portfolio Item 5-->
                <div class="col-md-6 col-lg-4 mb-5 mb-md-0">
                    <div class="BestReview-item mx-auto" data-toggle="modal" data-target="#BestReviewModal5">
                        <div class="BestReview-item-caption d-flex align-items-center justify-content-center h-100 w-100">
                            <div class="BestReview-item-caption-content text-center text-white"></div>
                        </div>
                        <img class="img-fluid" src="/DetailStore/Review/추천리뷰5.png" alt="" />
                    </div>
                </div>
                 <!-- Portfolio Item 3-->
                 <div class="col-md-6 col-lg-4 mb-5">
                    <div class="BestReview-item mx-auto" data-toggle="modal" data-target="#BestReviewModal3">
                        <div class="BestReview-item-caption d-flex align-items-center justify-content-center h-100 w-100">
                            <div class="BestReview-item-caption-content text-center text-white"></div>
                        </div>
                        <img class="img-fluid" src="/DetailStore/Review/추천리뷰6.png" alt="" />
                    </div>
                </div>
            </div>
        </div>
    </section>
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
<div class="location">
    <img src="DetailStore/Location/location.png">
    <img src="DetailStore/Location/loc1.png">
    <span class="locText"></span>
    <p>가락시장역2번 출구로 나오세요</p>
    <p>가락몰이 보입니다</p>
    <img src="DetailStore/Location/loc2.png">
    <span class="locText"></span>
    <p>가락몰 쪽으로 주욱 가다보시면</p>
    <img src="DetailStore/Location/loc3.png">
    <span class="locText"></span>
    <p>축산이 써져있는 문들이 보입니다</p>
    <img src="DetailStore/Location/loc4.png">
    <span class="locText"></span>
    <p>축산 3이 써져있는 문을 열고 들어가주세요</p>
    <img src="DetailStore/Location/loc5.png">
    <span class="locText"></span>
    <p>들어가시면 많은 축산 점포가 보입니다.</p>
    <img src="DetailStore/Location/loc6.png">
    <span class="locText"></span>
    <p>B66 점포번호를 확인해주세요</p>
    <p>정육 백화점이 보입니다.</p>
</div>
</section>
<section id="Qna_s">
    <br>
    <div class="container">
        <!-- Portfolio Section Heading-->
        <div class="row">
            <div class="col-lg-12">
                <div class="section-title">
                    <h2 style="margin-top: 30px;">문의</h2>
                </div>
                </div>
            </div>
</div>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<table class="table table-striped">
				<thead>
					<tr>
						<th>
							번호
						</th>
						<th>
							제목
						</th>
						<th>
							작성자
						</th>
						<th>
							날짜
						</th>
					</tr>
				</thead>
				<tbody>
					</a><tr>
						<td>
							1
                        </td>
                       
						<td>
                            <a href="#">
							홈페이지에서 예약할수 있나요?
                        </a>
                        </td>
						<td>
							오*석
						</td>
						<td>
							21/01/05
						</td>
                  
                    </tr>
                
					<tr class="table table-striped">
						<td>
							2
						</td>
						<td>
						</td>
						<td>
						</td>
						<td>
						</td>
					</tr>
					<tr class="table table-striped">
						<td>
							3
						</td>
						<td>
						</td>
						<td>
						</td>
						<td>
						</td>
					</tr>
					<tr class="table table-striped">
						<td>
							4
						</td>
						<td>
						</td>
						<td>
						</td>
						<td>
						</td>
					</tr>
					<tr class="table table-striped">
						<td>
							5
						</td>
						<td>
						</td>
						<td>
						</td>
						<td>
						</td>
					</tr>
				</tbody>
            </table> 
            <div class="qna_insert" style="text-align: right;">
			<a href="qna_insert.html"><button type="button" class="btn btn-lg btn-outline-secondary" a href = "qna_insert.html"style="background-color: #338333; color: white;">
				글쓰기
            </button>
        </a>
        </div>
    </div>
    </div>
    <div class="container-fluid" >
        <div class="row">
            <div class="col-md-2">
            </div>
            <div class="col-md-8">
                <class class="pagination-lg">
                    <ul class="pagination" style="margin-bottom: 30px;">
                        <li class="page-item">
                            <a class="page-link" href="#">Previous</a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" href="#">1</a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" href="#">2</a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" href="#">3</a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" href="#">4</a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" href="#">5</a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" href="#">6</a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" href="#">7</a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" href="#">8</a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" href="#">9</a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" href="#">10</a>
                        <li class="page-item">
                            <a class="page-link" href="#">Next</a>
                        </li>
                    </ul>
                </nav>
            </div>
            <div class="col-md-2">
            </div>
        </div>
    </div>
<a style="display:scroll;position:fixed;bottom:10px;right:5px;" href="#" title=”top">TOP</a> 


      
    
  <!-- Footer Section Begin -->
    
  <footer class="footer spad" style="margin-top: 30px;">
    <div class="container">
        <div class="row1">
            <div class="col-lg-3 col-md-6 col-sm-6">
                <div class="footer__about">
                    <div class="footer__about__logo">
                        <!--logo크기 120*50-->
                        <a href="./index.html"><img src="img/bottom-logo-test1.jpg" alt=""></a>
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
<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.nice-select.min.js"></script>
<script src="js/jquery-ui.min.js"></script>
<script src="js/jquery.slicknav.js"></script>
<script src="js/mixitup.min.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script src="js/main.js"></script>

   
</div>
</body>
</html>