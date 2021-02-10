<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.spring.gogidang.domain.*"%>
<%@ page import="java.util.ArrayList"%>
<%
	ArrayList<StoreVO> storeList = (ArrayList<StoreVO>) request.getAttribute("storeList");
%>

<%@include file="../includes/header_simple.jsp"%>


<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/shopgrid.css"
	type="text/css">

<%-- <link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/storelist.css"
	type="text/css"> --%>

<!-- Product Section Begin -->
<section class="product spad">
	<div class="container">
		<div class="reviewl">
			<div class="reviewlist">
				<div class="reviewlistt">
					<div class="shoplis">
						<div class="shoplistt">
							<div class="section-title product__discount__title">
								<h2>가게리스트</h2>
							</div>
						</div>
						<div class="shoplist">
							<div class="shoplistone">
								<div class="shoplistoness">
									<i class="fa fa-search" aria-hidden="true"></i>
								</div>
								<div class="shoplistones">
									<h3>S E A R C H</h3>
								</div>
							</div>
							<div class="shoplisttwo">
								<div class="shoplisttwoo">
									<h5>지역</h5>
								</div>
								<div class="shoplisttwot">
									<li><input type="checkbox" id="s_seoul" class="f_check"
										name="f_Acheck" value="서울">서울</li>
									<li><input type="checkbox" id="s_gyeong" class="f_check"
										name="f_Acheck" value="경기">경기</li>
									<li><input type="checkbox" id="s_gang" class="f_check"
										name="f_Acheck" value="강원">강원</li>
									<li><input type="checkbox" id="s_jeon" class="f_check"
										name="f_Acheck" value="전라">전라</li>
									<li><input type="checkbox" id="s_gyeong" class="f_check"
										name="f_Acheck" value="경상">경상</li>
									<li><input type="checkbox" id="s_chung" class="f_check"
										name="f_Acheck" value="충청">충청</li>
								</div>
							</div>
							<div class="shoplistth">
								<div class="shoplisttho">
									<h5>품목</h5>
								</div>
								<div class="shoplisttht">
									<li><input type="checkbox" id="cow" class="f_check"
										name="f_Mcheck" value="0">소고기</li>
									<li id="pig_li"><input type="checkbox" id="pig"
										class="f_check" name="f_Mcheck" value="1">돼지고기</li>
								</div>
							</div>

							<div class="shopliststar">
								<div class="shopliststarone">
									<h5>별점</h5>
								</div>
								<div class="shopliststartwo">
									<li><input type="radio" id="one" class="f_check"
										name="f_Scheck" value="0" checked />모든별점</li>
									<li><input type="radio" id="one" class="f_check"
										name="f_Scheck" value="1" />1점 이상</li>
									<li><input type="radio" id="two" class="f_check"
										name="f_Scheck" value="2" />2점 이상</li>
									<li><input type="radio" id="three" class="f_check"
										name="f_Scheck" value="3" />3점 이상</li>
									<li><input type="radio" id="four" class="f_check"
										name="f_Scheck" value="4" />4점 이상</li>
									<li><input type="radio" id="five" class="f_check"
										name="f_Scheck" value="5" />5점 이상</li>
								</div>
							</div>
							<div class="shoplistb">
								<div class="shoplistbu">
									<div class="shoplist_but">
										<button class="site-btn" type="button" name="button"
											id="checkBtn">검색</button>
									</div>
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>
</section>
 <div class="container">
     <div class="row" style="display : flex; padding: 0 30px; flex-wrap: wrap; aligin-items : center; justify-content: flex-start;">
                 <%
      for(int i=0; i<storeList.size(); i++) 
         {
            StoreVO svo = (StoreVO) storeList.get(i);
               %>
      <!--  --><div class="col-lg-box">
         <!--<div class="col-lg-6">  -->
             <div class="table">
             
                <div class="table-ri">
                    <img src="resources/img/store/<%=svo.getThumbnail()%>" alt="" style="width : 200px; height : 180px;">
                </div>
                <div class="table-le">
                   
                   <div class="table-le-topbox">
                      <div class="table-le-name">
                         <a href="./storeInfo.st?s_num=<%=svo.getS_num()%>"><%=svo.getS_name() %></a>
                      </div>
                      <div class="avgStar" id="avgStar"  name="avgStar" value="<%=svo.getAvgStar() %>">
                         ★ <%=svo.getAvgStar() %>
                      </div>
                   </div><!-- table-le-topbox -->
                   
                   <div class="table-le-text">TEL : <%=svo.getS_phone() %></div>
                   <div class="table-le-text">지역 : <%=svo.getS_addr() %></div>
                   <div class="table-le-text">품목 : <%
                     if(svo.getMeat() == 0) {
                     %>
                     소고기
                     <%
                     } else if (svo.getMeat() == 1) {
                     %>
                      돼지고기
                     <%
                     } else {
                     %>
                     식당
                     <%
                     }
                     %>
               </div>
               <div class="table-le-text">운영시간 : <%=svo.getS_hour() %></div>
               
                </div>
                
             </div><!-- table -->      
         <!--</div>  -->
        </div><!--col-lg-box -->
             <%
            }
         %>
    </div>
</div>


<%@include file="../includes/footer.jsp"%>

<script type="text/javascript" charset="utf-8"
	src="${pageContext.request.contextPath}/resources/js/storelistAjaxx.js"></script>
