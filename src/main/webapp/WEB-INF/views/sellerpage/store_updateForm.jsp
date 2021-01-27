<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.spring.gogidang.domain.*"%>
<%@ page import="com.spring.gogidang.domain.*"%>
<%
	MemberVO memberVO = (MemberVO) session.getAttribute("memberVO");
%>
<%@include file="../includes/header.jsp"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/store_updateStyle.css" type="text/css">
<%
	StoreVO vo = (StoreVO) session.getAttribute("StoreVO");
%>

    <!--네비게이션바 사용 시작-->
    <section class="hero">
        <div class="container">
            <div class="hero__item__box2"></div>
                    <div class="EventNav">
                        <ul>
                            <li><a href="./updateList.me">내정보</a></li>
                            <li><a href="./storeRegForm.st">가게 정보</a>
                            <li><a href="./menuRegForm.mn">메뉴 정보</a></li>
                            <li><a href="./storeNoticeList.no">문의 관리</a></li>
                            <li><a href="./storereviewList.bo">리뷰 관리</a></li>
                        </ul>
                    </div>   
            </div>   
        </div>
    </section>
    <!--네비게이션바 사용 끝-->
    <!-- Hero Section End -->
    <div class="container" id="store_updateform">
			<div class="row justify-content-center">
	        <div class="col-lg-8">
		        <div class="store_updateform">
		        	<h3>내 가게 정보 수정</h3>
		        	
		        	<!-- store_form -->
		        	 <form name="storeupdateform" action="./storeUpdate.st" method="post">
		        	     <input type="hidden" name="u_id" value=<%=memberVO.getU_id()%>>
		        	     
		        	    	 <div class="id_input_box_ss">
		         				<ts>가게 메인 사진 </ts>
		         				<td><img src="resources/img/store/<%=vo.getThumbnail() %>" width="350px" height="200px" /></td>      			         				
	         	 			</div>
	         	 			 <div class="id_input_box">
		         				<ts> </ts>        				
		         				<td><input type="file" id="thumbnail" name="thumbnail"  value="<%=vo.getThumbnail()%>" /></td>	      			         				
	         	 			</div>
	         	 			
	         	 			<div class="id_input_box_ss">
		         				<ts>사업자등록증</ts>	         		
		         				<td><img src="resources/img/store/<%=vo.getS_img() %>"  name="s_num" width="350px" height="200px" /></td>							
	         	 			</div>
	         	 			<div class="id_input_box">
		         				<ts> </ts>        				
		         				<td><input type="file" id="s_img" name="file" value="<%=vo.getS_img()%>" multiple="multiple"/></td>	      			         			         				
	         	 			</div>
	         	 			
	         	 			<div class="id_input_box">
		         				<ts>사업자등록번호</ts>	         		
		         				<td><input type="text" name="s_num" readonly value="<%=vo.getS_num() %>" /></td>	      			         				
	         	 			</div>
	         	 			
	         	 			<div class="id_input_box">
		         				<ts>가게이름</ts>	         		
		         				<td><input type="text" name="s_name" readonly value="<%=vo.getS_name() %>"/></td>	      			         				
	         	 			</div>
	         	 			
	         	 			<div class="id_input_box_s">    	 				
			         				<div class="id_input_box">
				         				<ts>가게주소</ts>					         								         			
					         			<td><input class="add_input" type="text" id="s_post" name="s_post"   style="font-size:13px;" />
				         	 				<input class="add_btn" type="button"   onclick="execDaumPostcode()" value="우편번호찾기" style="font-size:10px;" /></td>
			         	 			</div>
			         	 			<div class="id_input_box">
			         		 			<ts> </ts>
			         	 				<td><input  type="text" id="s_addr" name="s_addr"  value="<%=vo.getS_addr()%>" placeholder="주소" style="font-size:13px;"/></td>
			         	 			</div>
			         	 			<div class="id_input_box">
			         		 			<ts> </ts>
			         	 				<td><input  type="text" id="s_addr" name="s_addr"  placeholder="상세주소" style="font-size:13px;"/></td>
			         	 			</div>

		         	 				<div class="id_input_box">
		         	 					<ts>가게전화번호</ts>
										<td><input type="text" name="s_phone" value="<%=vo.getS_phone()%>" /></ts>
									</div>
							</div>		
							<div class="id_input_box">
		         				<ts>운영시간</ts>
		         		         <select name="s_hour">
										<option value=""><%=vo.getS_hour() %></option>
										<option value="08:00">08:00</option>
										<option value="09:00">09:00</option>
										<option value="10:00">10:00</option>
										<option value="11:00">11:00</option>
										<option value="12:00">12:00</option>
										<option value="13:00">13:00</option>
										<option value="14:00">14:00</option>
										<option value="15:00">15:00</option>
									</select>
									
									<select name="s_hour">
											<option value=""><%=vo.getS_hour() %></option>
											<option value="15:00">15:00</option>
											<option value="16:00">16:00</option>
											<option value="17:00">17:00</option>
											<option value="18:00">18:00</option>
											<option value="19:00">19:00</option>
											<option value="20:00">20:00</option>
											<option value="21:00">21:00</option>
											<option value="22:00">22:00</option>
											<option value="23:00">23:00</option>
									</select>
	         	 					
	         	 			</div>
									
							<div class="id_input_box">
				         		<ts>배달 가능여부</ts>
				         			<td><input class="radio_input" type="radio" name="delibery"  value="0" checked/>불가능</td>
									<td><input class="radio_input" type="radio" name="delibery"  value="1"/>가능</td>
			         	 	</div>
			         	 	
			         	 	<div class="join_btn">
			         	 		<button type="submit" class="btn-jj btn-lg btn-block btn-success"  multiple / >저장</button>		
								<button type="reset" class="btn-j btn-lg btn-block btn-success" >다시 작성</button>
							</div>
		        	</form>
				</div><!-- store_reg_form -->
			</div><!-- col-lg-8 -->.
		</div><!-- row justify-content-center -->
	</div><!-- container id="join" -->
    
	
 	<!-- Footer Section start -->
	<%@include file="../includes/footer.jsp"%>
	<!-- Footer Section End -->
	
	
	
	  <!-- Js Plugins -->
	 <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	 <script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
	 <script type="text/javascript">
 

	 var birthExp = /^\d{8}$/;
	
	function execDaumPostcode() {
	   new daum.Postcode({
	       oncomplete: function(data) {
           // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
           // 각 주소의 노출 규칙에 따라 주소를 조합한다.
           // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
           var Addr = ''; // 최종 주소 변수
           var extraAddr = ''; // 조합형 주소 변수
           // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
           if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
               Addr = data.roadAddress;
           } else { // 사용자가 지번 주소를 선택했을 경우(J)
               Addr = data.jibunAddress;
           }
           // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
           if(data.userSelectedType === 'R'){
               //법정동명이 있을 경우 추가한다.
               if(data.bname !== ''){
                   extraAddr += data.bname;
               }
               // 건물명이 있을 경우 추가한다.
               if(data.buildingName !== ''){
                   extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
               }
               // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
               Addr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
           }
           // 우편번호와 주소 정보를 해당 필드에 넣는다.
           document.getElementById('u_post').value = data.zonecode; //5자리 새우편번호 사용
           document.getElementById('u_addr').value = Addr;
           // 커서를 상세주소 필드로 이동한다.
           document.getElementById('u_addr').focus();
       }
   }).open();
}
</script>