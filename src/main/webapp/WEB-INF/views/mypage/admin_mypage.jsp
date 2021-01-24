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
        		<h3>내 정보(관리자)</h3>
        		
        		<!-- join form -->
         		<form name="seller_info_form" action="./updateForm.me" method="post">
         			<div class="id_input_box">
         				<ts>아이디</ts>
         				<td><input type="text" name="u_id" style="font-size:13px;" /></td>
         	 		</div>
         	 		
         	 		<div class="id_input_box">
         				<ts>비밀번호</ts>
         				<td><input type="password" name="u_pw"   style="font-size:13px;"/></td>
         	 		</div>
         	 		
         	 		<div class="id_input_box">
         				<ts>이름</ts>
         				<td><input type="text" name="u_name"  style="font-size:13px;"/></td>
         	 		</div>
         	 		
         	 		<div class="id_input_box">
         				<ts>닉네임</ts>
         				<td><input type="text" name="u_nick"  style="font-size:13px;"/></td>
         	 		</div>
         	 		
         	 		<div class="id_input_box">
         				<ts>생년월일</ts>
         				<td><input type="text" name="u_birth"  style="font-size:13px;"/></td>
         	 		</div>
         	 		
         	 		<div class="id_input_box">
         				<ts>주소</ts>
         				<td><input type="text" name="u_addr"  style="font-size:13px;"/></td>
         	 		</div>
         	 		
         	 		<div class="id_input_box">
         				<ts>이메일 주소</ts>
         				<td><input type="text" name="u_email"  style="font-size:13px;"/></td>
         	 		</div>
         	 		
         	 		<div class="id_input_box">
         				<ts>핸드폰 번호</ts>
         				<td><input type="text" name="u_phone"  style="font-size:13px;"/></td>
         	 		</div>
				
					<div class="join_btn">
	         	 	<button  class="btn-jj btn-lg btn-block btn-success"> 수정하러 가기</button>
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