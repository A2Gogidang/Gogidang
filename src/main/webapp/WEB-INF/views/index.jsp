<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="./includes/header.jsp"%>

<%@ page import="com.spring.gogidang.domain.*"%>
<%@ page import="java.util.ArrayList"%>
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/css/mainPage.css"
   type="text/css">
  

<!-- Hero Section Begin -->
<section class="hero">
	<div class="container">
		<div class="row">
			<div class="col-lg-3">
				<div class="hero__categories">
					<div class="hero__categories__all">
						<i class="fa fa-bars"></i> <span>All departments</span>
					</div>
					<ul>
						<li><a href="./storeList.st">전체가게 보기</a></li>
						<li><a href="./reviewList.re">전체리뷰 보기</a></li>
						<li><a href="noticelist.no">공지사항</a></li>
						<li><a href="qnalist.qn">문의</a></li>
						<li><a href="eventList.ev">이벤트</a></li>
						<li><a href="./updateList.me">마이페이지</a></li>
						<!--<li><a href="#">Fastfood</a></li>
                            <li><a href="#">Fresh Onion</a></li>
                            <li><a href="#">Papayaya & Crisps</a></li>
                             <li><a href="#">Oatmeal</a></li>
                            <li><a href="#">Fresh Bananas</a></li> -->
					</ul>
				</div>
			</div>


			<div class="col-lg-9">
				<!-- 기존위치에잇던 검색창자리
                    <div class="hero__search">
                        <div class="hero__search__form">
                            <form action="#">
                                <div class="hero__search__categories">
                                       가게검색하기
                                   <span class="arrow_carrot-down"></span> 
                                    
                                </div>
                                <input type="text" placeholder="What do yo u need?">
                                <button type="submit" class="site-btn">SEARCH</button>
                            </form>
                        </div>
                           헤더쪽 전화아이콘, 전화번호 시작
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
                    -->
				<div class="hero__item set-bg"
					data-setbg="./resources/img/hero/top-banner-test3.jpg">
					<div class="hero__text">
						<!-- 
                            <span>FRUIT FRESH</span>
                            <h2>Vegetable <br />100% Organic</h2>
                            <p>Free Pickup and Delivery Available</p>
                             -->
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Hero Section End -->

<!-- Categories Section Begin -->
<section class="categories">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="section-title">
					<h2>추천가게</h2>
				</div>
				<div class="featured__controls">
					<ul>
						<li>자신있게 추천 드립니다 !</li>
					</ul>
				</div>
			</div>
			<div class="categories__slider owl-carousel">
				<%
					for (int i = 0; i < store_list.size(); i++) {

						StoreVO vo = (StoreVO) store_list.get(i);
				%>
				<div class="col-lg-3">
					<div class="categories__item set-bg"
						data-setbg="./resources/img/store/<%=vo.getThumbnail()%>">
						<h5>
							<a href="./storeInfo.st?s_num=<%=vo.getS_num()%>"><%=vo.getS_name()%></a>
						</h5>
					</div>
				</div>
				<%
					}
				%>
				<!-- 
                       <div class="col-lg-3">
                           <div class="categories__item set-bg" data-setbg="./resources/img/categories/cat-2.jpg">
                               <h5><a href="#">Dried Fruit</a></h5>
                           </div>
                       </div>
                       <div class="col-lg-3">
                           <div class="categories__item set-bg" data-setbg="./resources/img/categories/cat-3.jpg">
                               <h5><a href="#">Vegetables</a></h5>
                           </div>
                       </div>
                       <div class="col-lg-3">
                           <div class="categories__item set-bg" data-setbg="./resources/img/categories/cat-4.jpg">
                               <h5><a href="#">drink fruits</a></h5>
                           </div>
                       </div>
                       <div class="col-lg-3">
                           <div class="categories__item set-bg" data-setbg="./resources/img/categories/cat-5.jpg">
                               <h5><a href="#">drink fruits</a></h5>
                           </div>
                       </div>
                   </div>
                    -->
            </div>
            <!-- row -->
         </div>
        </div>
   </section>
   <!-- Categories Section End -->
   
   <!-- 베스트리뷰 디자인 수정추가 -->
   <section class="categories">
      <div class="container">
         <div class="row">
            <div class="col-lg-12">
               <div class="section-title">
                  <h2 class="index_h">베스트 리뷰</h2>
               </div>
               <div class="featured__controls">
                  <ul>
                     <li>고기당이 엄선한 베스트 리뷰 !</li>
                  </ul>
               </div>
            </div>
            <div class="categories__slider owl-carousel">
               <%
                  for (int i = 0; i < review_list.size(); i++) {

                     ReviewVO vo = (ReviewVO)review_list.get(i);
               %>
               <div class="col-lg-3">
                  <div class="categories__item set-bg"
                     data-setbg="./resources/img/store/<%=vo.getImg()%>">
                     <h5>
                        <a href="./storeInfo.st?s_num=<%=vo.getS_num()%>"><%=vo.getS_name()%></a>
                     </h5>
                  </div>
               </div>
               <%
                  }
               %>            
            </div><!-- row -->
         </div>
        </div>
   </section>
   <!-- 베스트리뷰 디자인 수정추가 끝 -->

   <!-- Featured Section Begin -->
  
   <!-- Featured Section End -->


<!-- Banner Begin -->
<div class="banner">
	<div class="container">
		<div class="row">
			<div class="col-lg-6 col-md-6 col-sm-6">
				<div class="banner__pic">
					<img src="./resources/img/banner/banner-1.jpg" alt="">
				</div>
			</div>
			<div class="col-lg-6 col-md-6 col-sm-6">
				<div class="banner__pic">
					<img src="./resources/img/banner/banner-2.jpg" alt="">
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Banner End -->

<%@include file="./includes/footer.jsp"%>