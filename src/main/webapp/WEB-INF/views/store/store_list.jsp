<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import = "com.spring.gogidang.domain.*" %>
<%@ page import="java.util.ArrayList"%>
<%@include file="../includes/header.jsp"%>

<!-- MemberVO mvo = (MemberVO) session.getAttribute("MemberVO");
	String id = mvo.getU_id();
	int seller_key = mvo.getSeller_key(); -->
<%
	
	
	ArrayList<StoreVO> storeList = (ArrayList<StoreVO>) request.getAttribute("storeList");
%>

<body>
    <!-- 4.Hero Section Begin -->
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
                     			<li><input type="checkbox" id="s_seoul" class="f_check" name="f_Acheck" value="서울" checked="checked" >서울</li>
                            <li><input type="checkbox" id="s_gyeong" class="f_check" name="f_Acheck"  value="경기"  checked="checked">경기</li>
                            <li><input type="checkbox" id="s_gang" class="f_check" name="f_Acheck"  value="강원" checked="checked">강원</li>
         					
                        </ul>
                        
                        <ul>
                            <li>품목</li>
                        	<li><input type="checkbox" id="cow" class="f_check" name="f_Mcheck" value="0" >소고기</li>
                            <li><input type="checkbox" id="pig" class="f_check" name="f_Mcheck"  value="1" >돼지고기</li>
                            <li></li>
                       </ul> 
                    </div>   
            </div>   
        </div>
    </section>
    <!--네비게이션바 사용 끝-->
    <!-- Hero Section End -->
    <!-- 내용 내용 내용 -->
	<div id="card_row" >
		<%
		for(int i=0; i<storeList.size(); i++) {
			StoreVO svo = (StoreVO) storeList.get(i);
		%>
			<div class="card_store_box">
				<div class="card_store_addr" >
					<div class="text_left">
						<h5> <%=svo.getS_addr()%> </h5>
					
					</div>
				</div>
				
				<div class="card_store_img" >
					<div><img src="resources/img/up/1610939661018image.png"></div>
				</div>
				
				
				<div class="card_store_name" >
					<div class="text_right">
						<h5><a href="#"><%= svo.getS_name() %></a></h5>
					</div>
				</div>
				
				<div class="card_store_tag" >
					<div class="text_right">
						<%
						if(svo.getMeat() == 0) {
						%>
							<h6>소고기 </h6> 
						<%
						} else if (svo.getMeat() == 1) {
						%>
							<h6> 돼지고기 </h6>
						<%
						} else {
						%>
							<h6>식당</h6>
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
   	<!-- Footer Section -->
	<%@include file="../includes/footer.jsp"%>

    <!-- Js Plugins -->
    <script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.nice-select.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery-ui.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.slicknav.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/mixitup.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/main.js"></script>


	<script src="https://code.jquery.com/jquery-latest.js"></script> 
	 
	<script type="text/javascript"  charset="utf-8" src="${pageContext.request.contextPath}/resources/js/storelistAjaxx.js"></script>
</body>

</html>