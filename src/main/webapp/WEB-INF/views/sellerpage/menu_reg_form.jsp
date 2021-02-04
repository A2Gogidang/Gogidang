<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.spring.gogidang.domain.*"%>
<%@include file="../includes/header_simple.jsp"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/menu_regStyle.css"
	type="text/css">

<%
	StoreVO vo = (StoreVO) request.getAttribute("StoreVO");
	ArrayList<MenuVO> menuList = (ArrayList<MenuVO>) request.getAttribute("menuList");
%>

<section class="product spad">
	<div class="container">
		<div class="row">
			<div class="col-lg-3" id="nav-bar">
	            <div class="hero__categories">
	                  <div class="hero__categories__all">
	                  <span>마이페이지</span>
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
			<div class="col-lg-9">
				<div class="section-title product__discount__title">
					<h2>메뉴 등록</h2>
				</div>
				<div class="linez"></div>
				<div class="container" id="menu_reg">
					<div class="row justify-content-center">
						<div class="col-lg-9">
							<div class="menu_reg">
								<form name="menuForm" id="menuForm" action="./menuProcess.mn"
									method="post" enctype="multipart/form-data">
									<div class="id_input_box">
										<ts>품목</ts>
										<input type="hidden" name="s_num" value="<%=vo.getS_num() %>">
										<td><select name="meat">
												<option value="">종류를 선택하세요</option>
												<option value="1">소</option>
												<option value="0">돼지</option>
										</select></td>
									</div>
									<div class="id_input_box">
										<ts>상품이름 </ts>
										<td><select name="menu_name">
												<option value="">상품을 선택하세요</option>
												<option value="안심">안심</option>
												<option value="등심">등심</option>
												<option value="채끝살">채끝살</option>
												<option value="살치살">살치살</option>
												<option value="항정살">항정살</option>
												<option value="목살">목살</option>
												<option value="사태">사태</option>
										</select></td>
									</div>

									<!-- <div class="id_input_box">
										<ts>기타</ts>
										<td><input name="menu_name" type="text" /></td>
									</div> -->

									<div class="id_input_box_ss">
										<ts>상품사진</ts>
										<td><img id="menu_img2" src="" width="350px;"
											height="200px;" /></td>
									</div>
									<div class="id_input_box">
										<ts> </ts>
										<td><input id="menu_img1" name="file" type="file"
											width="350px;" height="200px;" multiple="multiple" /></td>
									</div>


									<div class="id_input_box">
										<ts>상품 금액</ts>
										<td><input name="price" type="text" /></td>
									</div>

									<!-- <div class="id_input_box">
										<ts>상품 그램</ts>
										<td><input name="gram" type="text" /></td>
									</div> -->

									<div class="id_input_box">
										<ts>상품 등급</ts>
										<td><select name="grade">
												<option value="">등급을 선택하세요</option>
												<option value="0">일반</option>
												<option value="1">1등급</option>
												<option value="2">특등급</option>
										</select></td>
									</div>
									
									<div class="id_input_box">
										<ts>원산지</ts>
										<td><select name="origin">
												<option value="">원산지를 선택하세요.</option>
												<option value="한국">한국</option>
												<option value="일본">일본</option>
												<option value="호주">호주</option>
												<option value="미국">미국</option>
										</select></td>
									</div>

									<div class="join_btn">
										<button type="submit"
											class="btn-jj btn-lg btn-block btn-success"
											onclick="fnAction('menuProcess.mn')" multiple>저장</button>
										<button type="reset"
											class="btn-j btn-lg btn-block btn-success">다시 작성</button>

										<!-- <a href="./storeUpdateForm.st">수정</a> -->
									</div>
								</form>



							</div>
							<!-- store_reg_form -->
						</div>
						<!-- col-lg-8 -->
						.
					</div>
					<!-- row justify-content-center -->
				</div>
				<!-- container id="join" -->

			</div>
			<div class="menulist">
				<div class="section-title product__discount__title">
					<h2>상품 등록 내역</h2>
				</div>
				<table class="table">
					<thead>
						<tr>
							<th>번호</th>
							<th>상품 사진</th>
							<th>상품 명</th>
							<th>상품 금액</th>
							<th>그램</th>
							<th>등급</th>
						</tr>
					</thead>
					<%
						if (menuList != null || menuList.size() > 0) {
							for (int i = 0; i < menuList.size(); i++) {

								MenuVO menuVO = (MenuVO) menuList.get(i);
					%>
					<tbody>
						<td><%=i + 1%></td>
						<td><img src="resources/img/store/store_gogi.png"></td>
						<td><%=menuVO.getMenu_name()%></td>
						<td><%=menuVO.getPrice()%> 원</td>
						<td><%=menuVO.getGram()%> g</td>
						<td><%=menuVO.getGrade()%></td>
					</tbody>
					<%
						}
					%>
					<%
						} else {
					%>
					<h1>상품을 추가해주세요.</h1>
					
				<%} %>

				</table>
				<!-- ----------------------------------------------------끝---------------------------------------------------- -->
			</div>
		</div>
	</div>
</section>
<!-- Product Section End -->
-


<%@include file="../includes/footer.jsp"%>



<script type="text/javascript">
	function fnAction(url1) {
		alert(url1);
		var frm = document.getElementById("menuForm");
		frm.action = url1;
		alert(frm.action);
		frm.submit();
	}

	$("#menu_img1").change(function() {
		var reader = new FileReader;
		reader.onload = function(data) {
			$("#menu_img2").attr("src", data.target.result).width(500);
		}
		reader.readAsDataURL(this.files[0]);
	});
</script>

<script type="text/javascript">
	var str, i, ch = "";
	function check_input() {

		if (document.menuForm.price.value == "") {
			alert("금액을 입력하세요!!!");
			document.menuForm.price.focus();
			return false;
		} else {
			str = document.menuForm.price.value;
			for (i = 0; i < str.length; i++) {
				ch = str.substring(i, i + 1);
				if (!((ch >= "0" && ch <= "9") || (ch >= "a" && ch <= "z") || (ch >= "A" && ch <= "z"))) {
					alert("특수문자가 포함되어있습니다, 다시입력해주세요!!");
					document.menuForm.price.focus();
					return false;
				}
			}
		}

		if (document.menuForm.gram.value == "") {
			alert("금액을 입력하세요!!!");
			document.menuForm.gram.focus();
			return false;
		}

		str = document.menuForm.menu_name.value;
		var regExp = /,/gi;
		var str2 = str.match(regExp);
		if (str2.length > 0) {
			alert("한가지 종류만 선택해 주세요!!!");
			document.menuForm.menu_name.focus();
			return false;
		}

	}
</script>



<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous">
	
</script>
