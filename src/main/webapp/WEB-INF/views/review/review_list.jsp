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
	
	
ArrayList<ReviewVO> review_List = (ArrayList<ReviewVO>)request.getAttribute("reviewList");
%>

<body>
    <!-- 4.Hero Section Begin -->
  	<!--네비게이션바 사용 시작-->
    <!-- filter bar -->
    
    <!--네비게이션바 사용 끝-->
    <!-- Hero Section End -->
    <!-- 내용 내용 내용 -->
	<div id="card_row" >
		<%
		for(int i=0; i<review_List.size(); i++) {
			ReviewVO rvo = (ReviewVO) review_List.get(i);
		%>
			<div class="card_store_box">
				
				
				<div class="card_store_img" >
					<div><img src="resources/img/store/김선호님1.jpg"></div>
				</div>
				
				
				<div class="card_store_name" >
					<div class="text_right">
						<h5><a href="#"><%= rvo.getS_name() %></a></h5>
					</div>
				</div>
				
				<div class="card_store_name" >
					<div class="text_right">
						<h5><a href="#"><%= rvo.getStar() %></a></h5>
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