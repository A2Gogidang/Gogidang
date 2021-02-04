<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<%@ page import="java.util.*"%>
<%@include file="../includes/header_simple.jsp"%>
<%@ page import="com.spring.gogidang.domain.*"%>
<%
	MemberVO memberVO = (MemberVO) session.getAttribute("memberVO");
%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/updateStyle.css" type="text/css">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
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
	                   extraAddr += (extraAddr !== '' ?  + data.buildingName : data.buildingName);
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
  
<%
	StoreVO storevo = (StoreVO)session.getAttribute("StoreVO");

%>
 <!--네비게이션바 사용 시작-->
 
 <section class="product spad">
        <div class="container">
            <div class="row">
 				<div class="col-lg-3" id="nav-bar">
		            <div class="hero__categories">
		                  <%
		                  if (u_id.equals("admin")) {
		                  %>
		                 <div class="hero__categories__all">
		                  	<span>관리자 페이지</span>
		                 </div>

			<ul>
				<li><a href="storeWait.st">대기중인 가게 승인</a></li>
				<li><a href="noticelist.no">공지사항 관리</a></li>
				<li><a href="qnalist.qn">문의 관리</a></li>
				<li><a href="eventList.ev">이벤트 관리</a></li>
			</ul>
			<%
				} else {
					if (memberVO.getSeller_key() == 0) {
			%>
			<div class="hero__categories__all">
		       	<span>마이 페이지</span>
		    </div>
			<ul>
				<li><a href="./updateList.me">내정보</a></li>
				<li><a href="./bookingList.bo?u_id=<%=memberVO.getU_id()%>">내예약확인</a></li>
				<li><a href="./likeStoreList.li?u_id=<%=memberVO.getU_id()%>">찜목록</a></li>
				<li><a
					href="./reviewListByIdWithPaging.re?u_id=<%=memberVO.getU_id()%>">내가
						작성한 후기</a></li>
				<li><a href="./cartList.ct">장바구니</a></li>
			</ul>
			<%
				} else {
						if (storevo == null || storevo.getConfirm() == 0 || storevo.getS_num() == 0) {
			%>
			<div class="hero__categories__all">
		       	<span>마이 페이지</span>
		    </div>
			<ul>
				<li><a href="./updateList.me">내정보</a></li>
				<li><a href="./storeRegForm.st">가게 정보</a>
			</ul>
			<%
				} else {
			%>
			<div class="hero__categories__all">
		       	<span>마이 페이지</span>
		    </div>
			<ul>
				<li><a href="./updateList.me">내정보</a></li>
				<li><a href="./storeRegForm.st">가게 정보</a></li>
				<li><a href="./menuRegForm.mn">메뉴 등록</a></li>
				<li><a href="./storeNoticeList.no">문의 관리</a></li>
				<li><a href="./storereviewList.bo">리뷰 관리</a></li>
			</ul>
			<%
				}
					}
				}
			%>
					</div>
				</div>
    
        <div class="col-lg-9">
<!-- ---------------------------------------------------시작----------------------------------------------------- -->      
  

   <!--네비게이션바 사용 끝-->
    <!-- Hero Section End -->
		 <!-- Hero Section End -->
	
        		<div class="section-title product__discount__title">
	          		<h2>내정보 수정</h2>
				    		</div>
				<div class="container" id="update">
				<div class="linez"></div>
					<div class="row justify-content-center">
			        <div class="col-lg-8">
			        	<div class="update">
			        		
			        		<!-- join form -->
			         		<form name="updateform" action="./updateProcess.me" method="post">
			         			<div class="id_input_box">
													<ts>아이디</ts>
													<td> <input type="text" name="u_id"
														value="<%=memberVO.getU_id()%>" readonly
														style="font-size: 13px;" /></td>
												</div>
			
												<div class="id_input_box">
													<ts>비밀번호</ts>
													<td> <input type="password" name="u_pw"
														value="<%=memberVO.getU_pw()%>" 
														style="font-size: 13px;" /></td>
												</div>
			
												<div class="id_input_box">
													<ts>이름</ts>
													<td> <input type="text" name="u_name"
														value="<%=memberVO.getU_name()%>" readonly
														style="font-size: 13px;" /></td>
												</div>
			
												<div class="id_input_box">
													<ts>닉네임</ts>
													<td> <input type="text" name="u_nick"
														value="<%=memberVO.getU_nick()%>" 
														style="font-size: 13px;" /></td>
												</div>
			
												<div class="id_input_box">
													<ts>생년월일</ts>
													<td> <input type="text" name="u_birth"
														value="<%=memberVO.getU_birth()%>" 
														style="font-size: 13px;" /></td>
												</div>
			
												<div class="id_input_box_s">
												<div class="id_input_box_p">
													<div class="id_input_box_d">
														<ts>주소</ts>
														</div>
														<div class="id_input_box_ps">
															<td><input class="add_input" type="text" 
															id="u_post" name="u_post" placeholder="우편번호" 
															style="font-size:13px;"/>
					         	 							<input class="add_btn" type="button" 
					         	 							onclick="execDaumPostcode()" value="우편번호찾기" 
					         	 							style="font-size:10px;"/></td>
					         	 					</div>
					         	 					</div>
					         	 					<div class="id_input_box_a">
					         	 					<ts></ts>
															<td><input type="text" id="u_addr" name="u_addr"
															value="<%=memberVO.getU_addr()%>" 
															style="font-size: 13px;" /></td>
													</div>
													<div class="id_input_box_at">
													<ts></ts>
															<td><input type="text" name="u_addr"
															value="<%=memberVO.getU_addr()%>" 
															style="font-size: 13px;" /></td>
													</div>				
												</div>
			
												<div class="id_input_box">
													<div class="id_input_box_es">
													<div class="id_input_box_e">
													<ts>이메일 주소</ts>
													</div>
													<td>
														<div class="input_emails">
															<input type="text" class="add_input_email" name="u_email"
															value="<%=memberVO.getU_email()%>" 
															style="font-size: 13px;" /><span class="ico_email" style="font-size:13px;">@</span>
												         	 <select class="add_input_email_se" name="u_email" > 
												         	 		<option value="">메일주소선택</option>
																	<option value="@naver.com">naver.com</option>
																	<option value="@hanmail.net">hanmail.net</option>
																	<option value="@daum.net">daum.net</option>
																	<option value="@gmail.com">gmail.com</option>
																	<option value="@nate.net">nate.net</option>
															</select>
														</div>
													</td>
													</div>
												</div>
												<div class="id_input_box_pn">
												<div class="id_input_box">
													<ts>핸드폰 번호</ts>
													<td> <input type="text" name="u_phone"
														value="<%=memberVO.getU_phone()%>" readonly
														style="font-size: 13px;" /></td>
												</div>
												</div>
			         		
			         			<!-- <tr align=center>
								<td colspan=2><a href="./updateForm.me">수정</a></td>
								</tr> -->
			         			
								
								<div class="update_btn">
				         	 	<button type="submit" class="btn-jj btn-lg btn-block btn-success" > 수정하기</button>
				         	 	</div>
			         			
			         		</form>
			       		   </div><!--join -->
						</div><!-- col-lg-8 -->.
					</div><!-- row justify-content-center -->
				</div><!-- container id="join" -->
			 <!-- ----------------------------------------------------끝---------------------------------------------------- --> 
				</div>
            </div>
        </div>
    </section>       		

		
		
<%@include file="../includes/footer.jsp"%>