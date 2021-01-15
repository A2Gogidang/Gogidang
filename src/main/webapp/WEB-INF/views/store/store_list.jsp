<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import = "com.spring.gogidang.domain.*" %>
<%@ page import="java.util.ArrayList"%>

<!-- MemberVO mvo = (MemberVO) session.getAttribute("MemberVO");
	String id = mvo.getU_id();
	int seller_key = mvo.getSeller_key(); -->
<%
	
	
	ArrayList<StoreVO> storeList = (ArrayList<StoreVO>) request.getAttribute("storeList");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>가게 전체보기</title>
	<link rel="shortcut icon" href="cut-pig.jpg"> 
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">

    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <!--sidebar action and hamburger icon action START START-->
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
                    <a href="./index.html"><img src="resources/img/mainlogo.png" alt=""></a>
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
                </input>
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
    <!-- filter bar -->
    <section class="hero">
        <div class="container">
            
                    <div class="EventNav">
                        <ul>
                            <li>조건 필터로 검색하기</li>
                            <li></li>
                            <li></li>
                        </ul>
                        <ul>
                            <li>지역</li>
                            <!-- Seoul/ Gangwon-do /Gyeonggi-do -->
                            <!-- 
                            <li><input type="checkbox" id="s_addr_all" name="s_addr" value="전체" checked="checked">전체보기</li>
                     		 -->
                     		<li><input type="checkbox" id="s_seoul" name="f_check" value="서울" >서울</li>
                            <li><input type="checkbox" id="s_gyeong" name="f_check"  value="경기" >경기</li>
                            <li><input type="checkbox" id="s_gang" name="f_check"  value="강원" >강원</li>
         					
                        </ul>
                        
                        <ul>
                            <li>품목</li>
                        	<li><input type="checkbox" id="cow" name="f_check" value="소고기" >소고기</li>
                            <li><input type="checkbox" id="pig" name="f_check"  value="돼지고기" >돼지고기</li>
                            <li></li>
                            <!--<li><input type="checkbox" id="pig" name="f_check"  value="돼지고기" onclick="oneCheckbox(this)">돼지고기</li>  -->
                        </ul>
                        <!--
                        <ul>
                        	<li><button id="checkBtn">검색</button> </li>
                        </ul>
                          -->
                        
                    </div>   
            </div>   
        </div>
    </section>
    <!--네비게이션바 사용 끝-->
    <!-- Hero Section End -->

    
    
				<!-- ajax 내용 -->
				<!-- ajax 내용 -->
	<div id="card_row" >
		<%
		for(int i=0; i<storeList.size(); i++) {
		%>
			<div class="card_store_box">
				<div class="card_store_addr" >
					<div class="text_left">
						<h5> <%=storeList.get(i).getS_addr()%> </h5>
					
					</div>
				</div>
				
				 
				<div class="card_store_img" >
					<div><img src="best-re-img5.jpg"></div>
				</div>
				
				
				<div class="card_store_name" >
					<div class="text_right">
					<h5><a href="#"><%= storeList.get(i).getS_name() %></a></h5>
					
					</div>
				</div>
				<div class="card_store_star" >
					<div class="text_right">
					가게 평점(우정렬)
					
					</div>
				</div>
				<div class="card_store_tag" >
					<div class="text_right">
						<%
						if(storeList.get(i).getMeat()== 0) {
						%>
							<div> 소고기 </div>
						
						<%
						}
						else {
						%>
							<div> 돼지고기 </div>
						<%
						}
						%>
					</div>
				</div>
				
					
			</div>	
		<%
		}
		%>
	</div>

	 <div id="card_row" > 
 	
	 </div>
 
 
    <!-- Footer Section Begin -->
    <!-- Footer Section Begin -->
    <!-- Footer Section Begin -->
    <footer class="footer spad">
    	<div></div>
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
    <script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.nice-select.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery-ui.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.slicknav.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/mixitup.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/main.js"></script>

	<!-- 항목별 중복 방지 -->
	<!-- 
	<script type="text/javascript">
	    function oneCheckbox(a){
	        var obj = document.getElementsByName("s_addr");
	        for(var i=0; i<obj.length; i++){
	            if(obj[i] != a){obj[i].checked = false;}
	        }
	    }
	</script>
	<script type="text/javascript">
	    function oneCheckbox2(a){
	        var obj2 = document.getElementsByName("s_menu");
	        for(var i=0; i<obj2.length; i++){
	            if(obj2[i] != a){obj2[i].checked = false;}
	        }
	    }
	</script>
	 -->




	<script src="https://code.jquery.com/jquery-latest.js"></script> 
	
	<script> 
	$('[name=f_check]').change(function(){	
		
		
		if($('input[name=f_check]').is(":checked") == true){
				
				var s_addr =[];
				$('input[name=f_check]:checked').each(function(){
					
					s_addr.push($(this).val());
				});
			getlist(s_addr);
			};
	});
	
	function getlist(s_addr) {
			 	$.ajax({
						//type:'post',
						url:'./storelist_ajax.li',
						contentType : 'application/x-www-form-urlencoded;charset=utf-8',
						data: {"s_addr" : s_addr},
						dataType: 'json',
						success : function(data)
						{
							$('#card_row').empty();
							$.each(data, function(index, item){
								var output= '';
								if (item.meat == 0){
									meat = '소고기'
								}
								else {
									meat = '돼지고기'
								}
								
								output += '<div class="card_store_box">'+
											'<div class="card_store_addr" >'+
												'<div class="text_left">'+
													'<h5>'+ item.s_addr + '</h5>'+
												'</div>'+
											'</div>';
								output += '<div class="card_store_img" >' + 
											'<div>'+
												'<img src="best-re-img5.jpg">' +
											'</div>' +
										'</div>';
								output += '<div class="card_store_name" >'+
											'<div class="text_right">' +
												'<h5>' +
													'<a href="#">' + item.s_name + '</a>'+
												'</h5>' +
											'</div>' +
										'</div>' ;
								output += '<div class="card_store_tag" >' +
												'<div class="text_right">'+
													meat +
												'</div>' +
											'</div>'
										
								'</div>'; //class="card_store_box" 끝
										
								$('#card_row').append(output);
							});//each 끝
										
						}, //success 끝  
						error : function(Request,Status, error) { 
							alert("ajax통신실패")
						}//error 끝
					}); //ajax끝
				};//input:checked끝
			
			
</script>


	
</body>

<!-- 
<body>
	<h1>@=id %></h1>
	<h1>가게리스트</h1>
		<center>
			<table border=1 width=300>
				<tr align=center><td colspan=2>등록된 가게 리스트</td></tr>
			@
				for (int i=0; i<storeList.size(); i++)
					{
						StoreVO vo = (StoreVO)storeList.get(i);
						
						if (vo.getConfirm() == 1) {
			%>
				<tr>
					<td>
						<a href="storeInfo.st?s_num=@=vo.getS_num() %>">@=vo.getS_num() %> / @=vo.getS_name()%> - @=vo.getU_id()%></a>
					</td>
				</tr>
			@
					}
			%>
			@
				}
			%>
			</table>
		</center>
</body>
-->
</html>