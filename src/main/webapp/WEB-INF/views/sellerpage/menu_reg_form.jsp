<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
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
                            <li><a href="./menuRegForm.st">메뉴 정보</a></li>
                            <li><a href="./storeNoticeList.no">문의 관리</a></li>
                            <li><a href="./storereviewList.bo">리뷰 관리</a></li>
                        </ul>
                    </div>   
            </div>   
        </div>
    </section>
    
<script type="text/javascript">
    
var str,i,ch ="";

function check_input() {
	
	if(document.menuForm.price.value=="") {
        alert("금액을 입력하세요!!!");
        document.menuForm.price.focus();
        return false;
     } else {
    	 str=document.menuForm.price.value;
           for(i=0;i<str.length;i++) {
              ch=str.substring(i,i+1);
              if(!((ch>="0" && ch<="9")||(ch>="a" && ch<="z") ||(ch>="A" && ch<="z"))) {
              alert("특수문자가 포함되어있습니다, 다시입력해주세요!!");
              document.menuForm.price.focus();
              return false;
              }
           }
        }
	
	if(document.menuForm.gram.value=="") {
        alert("금액을 입력하세요!!!");
        document.menuForm.gram.focus();
        return false;
     }
	
	str = document.menuForm.menu_name.value;
	var regExp = /,/gi;

	var str2 = str.match(regExp);

	if( str2.length > 0) {
        alert("한가지 종류만 선택해 주세요!!!");
        document.menuForm.menu_name.focus();
        return false;
     }
	
	
     }
    
    
</script>
<form name="menuForm" action="./menuProcess.st" method="post">
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
		<td><select name="menu_name"> 
		<option value="">상품을 선택하세요</option>
		<option value="안심">안심</option>
	    <option value="등심">등심</option>
	    <option value="채끝살">채끝살</option>
	    <option value="살치살">살치살</option>
	    <option value="항정살">항정살</option>
	    <option value="목살">목살</option>
	    <option value="사태">사태</option>
		<td>기타<input name="menu_name" type="text" /></td>
		</select></td>
	</tr>
	<tr>
		<td>상품 사진 : </td> 
		<td><input name="img" type="file" /></td>
	</tr>
	<tr>
		<td>고기 종류 : </td>  
		<td><select name="meat"> 
		<option value="">종류를 선택하세요</option>
		<option value="1">소</option>
		<option value="0">돼지</option>
		</select></td>
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
		<td><select name="grade"> 
		<option value="">등급을 선택하세요</option>
		<option value="0">일반</option>
		<option value="1">1등급</option>
		<option value="2">특등급</option>
		</select></td>

	</tr>
	<tr>
		<td><a href="javascript:menuForm.submit()">저장</a></td>
		<td><a href="javascript:menuForm.reset()">다시 입력</a></td>
	</tr>
</table>
</center>
</form>

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
		<td><span name="img" type="file" ></span><%=menuVO.getImg() %></td>
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