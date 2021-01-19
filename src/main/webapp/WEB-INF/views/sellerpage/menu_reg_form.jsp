<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@include file="../includes/header.jsp"%>
<%
	StoreVO vo = (StoreVO)request.getAttribute("StoreVO");
	ArrayList<MenuVO> menuList = (ArrayList<MenuVO>)request.getAttribute("menuSelectList");
%>
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
  <script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous">
  </script>

<form name="menuForm" id="menuForm" action="./menuProcess.mn" method="post" enctype="multipart/form-data">
	<input type="hidden" name = "s_num" value=<%=vo.getS_num() %>>
	<input type="hidden" name = "u_id" value=<%=vo.getU_id() %>>
	<center>
		<table border=1>
			<tr>
				<td colspan="2" align=center>
					<b><font size=5>상품등록</font></b>
				</td>
			</tr>
			
			<tr>
				<td>상품이름 : </td> 
				<td><input name="menu_name" type="text" /></td>
			</tr>
			
			<tr>
				<td>상품 사진 : </td>
				<td>
					<input id="menu_img1" name="file" type="file" multiple="multiple" />
					<img id="menu_img2" src="" />
				</td>
			</tr>
			
			<tr>
				<td>고기 종류 : </td>  
				<td><input name=" meat" type="text" /></td>
			</tr>
			
			<tr>
				<td>상품 금액 : </td> 
				<td><input name="price" type="text" /></td>
			</tr>
			
			<tr>
				<td>상품 그램 : </td> 
				<td><input name="gram" type="text" /></td>
			</tr>
			
			<tr>
				<td>상품 등급 : </td> 
				<td><input name="grade" type="text" /></td>
			</tr>
			
			<tr>
				<td>
					<input type="button" value="저장" onclick="fnAction('menuProcess.mn')" multiple />
					<a href="javascript:menuForm.reset()">다시 입력</a>
				</td>
			</tr>
		</table>
	</center>
</form>
  <script>
		function fnAction(url1) {
			alert(url1);
			var frm = document.getElementById("menuForm"); 
			frm.action = url1;
			alert(frm.action); 
			frm.submit();
		}
		
		$("#menu_img1").change(function () {
			var reader = new FileReader;
			reader.onload = function(data) {
				$("#menu_img2").attr("src", data.target.result).width(500);
			}
			reader.readAsDataURL(this.files[0]);
		});
	</script>
	
 <%if ( menuList != null || menuList.size() > 0 ){ %>
	<%for(int i = 0; i < menuList.size(); i++){ 
	
		MenuVO menuVO = (MenuVO)menuList.get(i);
	%>
		<!-- for 문으로 저장된 리스트 출력해주기 -->
		<table border=1>
			<tr>
				<td colspan="2" align=center>
					<b><font size=5>등록 내역</font></b>
				</td>
			</tr>
			<tr>
				<td>상품이름 : </td> 
				<td><span name="menu_name" type="text" ><%=menuVO.getMenu_name() %></span></td>
			</tr>
			<tr>
				<td>상품 사진 : </td> 
				<td><img src="resources/img/menu/<%=menuVO.getImg() %>"  width="100px" height="100px" /></td>
			</tr>
			<tr>
				<td>상품 금액 : </td> 
				<td><span name="price" type="text" ></span><%=menuVO.getPrice() %></td>
			</tr>
			<tr>
				<td>상품 그램 : </td> 
				<td><span name="gram" type="text" ></span><%=menuVO.getGram() %></td>
			</tr>
			<tr>
				<td>상품 등급 : </td> 
				<td><span name="grade" type="text" ></span><%=menuVO.getGrade() %></td>
			</tr>
		</table>
	<%} %>
<%}else{ %>
	<h1>상품을 추가해주세요.</h1>
<%} %>
<%@include file="../includes/footer.jsp"%>