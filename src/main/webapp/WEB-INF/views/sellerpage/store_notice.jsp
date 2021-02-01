<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.spring.gogidang.domain.*"%>
<%@include file="../includes/header.jsp"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/store_reviewStyle.css" type="text/css">
<%
	ArrayList<SRNoticeVO> srNoticeList = (ArrayList<SRNoticeVO>)request.getAttribute("srNoticeList");
	StoreVO storeVO = (StoreVO)session.getAttribute("StoreVO");
	
%>

    <!-- Product Section Begin -->
    <section class="product spad">
        <div class="container">
            <div class="row">
            	
            	<!-- 좌측네비바 시작 -->
				<div class="col-lg-3" id="nav-bar">
					<div class="hero__categories">
                		<div class="hero__categories__all">
						<span>판매자 마이페이지</span>
						</div>
                            <ul>
	                            <li><a href="./updateList.me">내정보</a></li>
	                            <li><a href="./storeRegForm.st">가게 정보</a></li>
	                            <li><a href="./menuRegForm.mn">메뉴 등록</a></li>
	                            <li><a href="./storeNoticeList.no">문의 관리</a></li>
	                            <li><a href="./storereviewList.bo">리뷰 관리</a></li>
                       		 </ul> 
                        </div>
                    </div>
                     
<!-- ---------------------------------------------------시작----------------------------------------------------- -->          
        <div class="reviewboard">
    <div class="section-title product__discount__title">
          <h2>문의 관리</h2>
    </div>
	<div class="container">
			<table class="table table-hover">
			<thead>
				<tr align=center>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>등록일</th>
					<th>답변 상태</th>
				</tr>
			</thead>
			<tbody class="text-center">
<%
for(int i = 0; i < srNoticeList.size(); i++){ 
	
	SRNoticeVO srNoticevo = (SRNoticeVO)srNoticeList.get(i);
%>
	 <tr align=center>
				<td>
					<%=i+1 %>
				</td>
				<td>
					<a href="reviewInfo.re?review_num=<%=srNoticevo.getQs_num()%>"><%=srNoticevo.getTitle() %></a>
				</td>
				<td>
					<%=srNoticevo.getU_id() %>
				</td>
				<td>
					<%=srNoticevo.getQna_date() %>
				</td>
<%
 		if(srNoticevo.getRe_content() == null || srNoticevo.getRe_content() == ""){
%>				
	  			<td>
	  			<button class="button">답변 등록</button>
	  			</td>

<% 		}else{%>
	 			<td>답변 완료</td>
	<% }%>
				
<% }%>
   			  </tr>
			</tbody>
		</table>
	</div>
</div>
<!-- ----------------------------------------------------끝---------------------------------------------------- --> 
            </div>
            </div>
        </div>
    </section>
    <!-- Product Section End -->
  
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