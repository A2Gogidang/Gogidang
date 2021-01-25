<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/updateStyle.css" type="text/css">
  
<%@include file="../includes/header.jsp"%>

    <!--네비게이션바 사용 시작-->
	   <section class="hero">
        <div class="container">
            <div class="hero__item__box2"></div>
                    <div class="EventNav">
                        <ul>
                            <li><a href="">내정보</a></li>
                            <li><a href="">공지사항 등록</a></li>
                            <li><a href="">이벤트 등록</a></li>
                            <li><a href="">가게 승인</a></li>
                        </ul>
                    </div>   
            </div>   
    </section>

    <!-- Hero Section End -->
  
	<div class="container" id="update">
		<div class="row justify-content-center">
        <div class="col-lg-8">
        	<div class="update">
        	
        		<h3><!-- 가게이름 --> 정육식당</h3>
        		<div class="container-fluid" style="margin-bottom : 30px;">
	<div class="row">
		<div class="col-md-12">
			<img alt="Bootstrap Image Preview" src="resources/img/DetailStoreImg/SellerImg/sellerpic.png" />
		</div>
	</div>
</div>
        		<!-- join form -->
         		<form name="seller_info_form" action="./updateForm.me" method="post">
         			<div class="id_input_box">
         				<ts>상점번호</ts>
         				<td><input type="text" name="s_num" style="font-size:13px;" /></td>
         	 		</div>
         	 		
         	 		<div class="id_input_box">
         				<ts>상점아이디</ts>
         				<td><input type="password" name="u_id"   style="font-size:13px;"/></td>
         	 		</div>
         	 		
         	 		<div class="id_input_box">
         				<ts>판매자이름</ts>
         				<td><input type="text" name="s_name"  style="font-size:13px;"/></td>
         	 		</div>
         	 		
         	 		<div class="id_input_box">
        				<ts>휴대폰번호</ts> 
         				<td><input type="text" name="s_phone"  style="font-size:13px;"/></td>
         	 		</div>
         	 		
         	 		<div class="id_input_box">
         				<ts>상점이미지</ts>
         				<td><input type="text" name="s_img"  style="font-size:13px;"/></td>
         	 		</div>
         	 		
         	 		<div class="id_input_box">
         				<ts>영업시간</ts>
         				<td><input type="text" name="s_hour"  style="font-size:13px;"/></td>
         	 		</div>
         	 		
         	 		<div class="id_input_box">
         				<ts>배달가능 여부</ts>
         				<td><input type="text" name="delibery"  style="font-size:13px;"/></td>
         	 		</div>
         	 		
         	 		<div class="id_input_box">
         				<ts>사업자등록 번호</ts>
         				<td><input type="text" name="s_businessN" style="font-size:13px;"/></td>
         	 		</div>
         	 		<div class="id_input_box">
         				<ts>승인여부</ts>
         				<td><input type="text" name="confirm"  style="font-size:13px;"/></td>
         	 		</div>
				
					<div class="join_btn">
	         	 	<button  class="btn-jj btn-lg btn-block btn-success" style="margin-top : 5px;"> 승인</button>
	         	 	&nbsp;&nbsp;&nbsp;
	         	 	<button  class="btn-jj btn-lg btn-block btn-success" style="color:white"> 승인거절</button>
	         	 	</div>
	         	 
	         	 	
					<!-- 
					<tr align=center>
						<td colspan=2><a href="./updateForm.me">수정</a></td>
					</tr>
					 -->
         		</form>
        	</div>
        </div>
        </div>
    </div>
        	
<%@include file="../includes/footer.jsp"%>