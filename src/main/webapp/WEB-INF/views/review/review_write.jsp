<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.spring.gogidang.domain.*"%>
<%@include file="../includes/header_simple.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%
	PayVO pvo = (PayVO) request.getAttribute("pvo");
%>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/member_liststoreStyle.css"
	type="text/css">
	
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/review_import.css"
	type="text/css">
	
<style>
 #star_grade a{
        text-decoration: none;
        color: gray;
    }
    #star_grade a.on{
        color: red;
    }
</style>



<!-- Product Section Begin -->
<section class="product spad">
	<div class="container" >
		<div class="row">
			<div class="myreview">
				<div class="col-lg-3" id="nav-bar">
		            <div class="hero__categories">
		                  <div class="hero__categories__all">
		                  	<span>마이페이지</span>
		              	  </div>
		              	  	<ul>
								<li><a href="./updateList.me">내정보</a></li>
								<li><a href="./purchase_list.py?u_id=<%=mvo.getU_id()%>">구매내역</a></li>
								<li><a href="./likeStoreList.li?u_id=<%=mvo.getU_id()%>">찜목록</a></li>
								<li><a href="./reviewListByIdWithPaging.re?u_id=<%=mvo.getU_id()%>">내가
										작성한 후기</a></li>
								<li><a href="./cartList.ct">장바구니</a></li>
							</ul>
						</div>
					</div>
		<!-- ---------------------------------------------------시작----------------------------------------------------- -->
				<div class="reviewboard">
					<div class="section-title product__discount__title">
						<h2>리뷰작성</h2>
					</div>
					<div class="container">
						<form id="reviewForm" name="reviewForm" action="./reviewRegist.re" method="post" enctype="multipart/form-data">
			<div>
				<input type="hidden" id="u_id" name="u_id" value="<%=mvo.getU_id()%>"> 
				<input type="hidden" id="nickname" name="nickname" value="<%=mvo.getU_nick()%>">
				<input type="hidden" id="pay_num" name="pay_num" value="<%=pvo.getPay_num()%>"> 
				<input type="hidden" id="s_num" name="s_num" value="<%=pvo.getS_num()%>"> 
				<input type="hidden" id="s_name" name="s_name" value ="<%=pvo.getS_name()%>">
			</div>
			<div class="col-md-12">
				<div class="modal-textbox-s" style="display: flex; justify-content: left; aligin-items: center; margin-top: 50px; margin-bottom: 30px;">
					<ts for="star">별점</ts>
					<td>
					<div class="startRadio">
						<form action="write_review.bo" name = "place_review_form" method="post">
						<%int star = 0; %>
								<p id="star_grade" style="margin-top: -3px;margin-left: 10px;">
							        <a href="#" id="star1">★</a>
							        <a href="#" id="star2">★</a>
							        <a href="#" id="star3">★</a>
							        <a href="#" id="star4">★</a>
							        <a href="#" id="star5">★</a>
								</p>
						<input type="hidden" id="star" name="star" value="<%=star %>">
						</form>

<script>
        $('#star_grade a').click(function(){
            $(this).parent().children("a").removeClass("on");  /* 별점의 on 클래스 전부 제거 */ 
            $(this).addClass("on").prevAll("a").addClass("on"); /* 클릭한 별과, 그 앞 까지 별점에 on 클래스 추가 */
            return false;
        });
        
        $('#star1').click(function(star_rating) {
        	document.getElementById("star").value = 1;
        })
        
        $('#star2').click(function() {
        	document.getElementById("star").value = 2;
        })
        
        $('#star3').click(function() {
        	document.getElementById("star").value = 3;
        })
        
        $('#star4').click(function() {
        	document.getElementById("star").value = 4;
        })
        
        $('#star5').click(function() {
        	document.getElementById("star").value = 5;
        })
</script>


						
						
				<!-- <input type="radio" id="star" name="star" class="star" value="1" style="width: 40px;">1 
						<input type="radio" id="star" name="star" class="star" value="2" style="width: 40px;">2 
						<input type="radio" id="star" name="star" class="star" value="3" style="width: 40px;">3
						<input type="radio" id="star" name="star" class="star" value="4" style="width: 40px;">4 
						<input type="radio" id="star" name="star" class="star" value="5" style="width: 40px;">5 -->
					</td>
				</div>
			</div>
			
			<div class="form-group">
				<img id="reviewimg2" src="" width="350px;" height="200px;" />
			</div>

			<div class="form-group">
				<label for="reviewimg1"> 파일첨부 </label> 
				<input id="reviewimg1" name="file" type="file" width="350px;" height="200px;" multiple="multiple" />
			</div>

			<div class="form-group">
				<label for="title"> 제목 </label> 
				<input type="text" class="form-control" id="title" name="title" />
			</div>

			<div class="form-group">
				<label for="content"> 내용 </label>
				<textarea type="content" class="form-control" id="content" name="content" style="height: 250px;"></textarea>
			</div>
			
			<button type="submit" onclick="fnAction('reviewRegist.re')" class="btn btn-primary" style="background-color: #7fad39; border: 0px; width: 100%;" multiple>작성</button>
		</form>
					</div>
				</div>
			</div>
			<!-- ----------------------------------------------------끝---------------------------------------------------- -->
		</div>
	</div>
</section>
<!-- Product Section End -->

<script>
function fnAction(url1) {
	alert(url1);
	var frm = document.getElementById("reviewForm");
	frm.action = url1;
	alert(frm.action);
	frm.submit();
}

$("#reviewimg1").change(function() {
	var reader = new FileReader;
	reader.onload = function(data) {
		$("#reviewimg2").attr("src", data.target.result).width(500);
	}
	reader.readAsDataURL(this.files[0]);
});

</script>


<%@include file="../includes/footer.jsp"%>