<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet"href="${pageContext.request.contextPath}/resources/css/review_detail.css"type="text/css">
<link rel="stylesheet"href="${pageContext.request.contextPath}/resources/css/review_detail2.css"type="text/css">

<%
   ReviewVO vo = (ReviewVO) request.getAttribute("ReviewVO");
%>
 <!--네비게이션바 사용 시작-->
<%@include file="../includes/header.jsp"%>
             
            <div class="section-title" style="margin-top : 70px;">
								<h2 style="margin-top: 50px;">리뷰</h2>
							</div>
            
   <!-- Product Details Section Begin -->
    <section class="product-details spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6">
                    <div class="product__details__pic">
                        <div class="product__details__pic__item">
                            <img class="product__details__pic__item--large"
                                src="resources/img/store/store_gogi.png" alt="">
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="product__details__text">
                        <h3><%=vo.getTitle()%></h3>
                        <div class="product__details__rating">
                        <% for(int i=0; i<vo.getStar(); i++) { %>
                            <i class="fa fa-star"></i>
                        <%} %>
                        </div>
                        <div class="product__details__Nickname"style="font-size: 30px;color: #7fad39;font-weight: 600;margin-bottom: 15px;"><%=vo.getS_name() %></div>
                        <div class="product__details__Nickname"style="font-size: 30px;color: #7fad39;font-weight: 600;margin-bottom: 15px;"><%=vo.getNickname() %></div>
                        <p><%=vo.getContent()%></p>
                        <a href="./storeInfo.st?s_num=<%=vo.getS_num()%>" class="primary-btn">가게 보러가기</a>
                    </div>
                </div>
            </div>
            </div>
            </section>
            

<%@include file="../includes/footer.jsp"%>

