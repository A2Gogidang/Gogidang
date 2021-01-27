<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<%@ page import="java.util.*"%>
<%@include file="../includes/header.jsp"%>
<%
	StoreVO storevo = (StoreVO)session.getAttribute("StoreVO");
	
	ArrayList<CartVO> cart_list = (ArrayList<CartVO>)session.getAttribute("cart_list");
	
%>
    <!--네비게이션바 사용 시작-->
    <%if(memberVO.getSeller_key() == 0 ){ %>
	   <section class="hero">
        <div class="container">
            <div class="hero__item__box2"></div>
                    <div class="EventNav">
                        <ul>
                            <li><a href="./updateList.me">내정보</a></li>
                            <li><a href="./bookingList.bo?u_id=<%=memberVO.getU_id()%>">내예약확인</a></li>
                            <li><a href="./likeStoreList.li?u_id=<%=memberVO.getU_id()%>">찜목록</a></li>
                            <li><a href="./reviewList.re?u_id=<%=memberVO.getU_id()%>">내가 작성한 후기</a></li>
                            <li><a href="./cartList.ct">장바구니</a></li>
                        </ul>
                    </div>   
            </div>   
        </div>
    </section>
<%
}else{ 
	if(storevo == null || storevo.getConfirm() == 0 || storevo.getS_num() == 0 ){
%>
 <section class="hero">
        <div class="container">
            <div class="hero__item__box2"></div>
                    <div class="EventNav">
                        <ul>
                            <li><a href="./updateList.me">내정보</a></li>
                            <li><a href="./storeRegForm.st">가게 정보</a>
                        </ul>
                    </div>   
            </div>   
        </div>  
<%
	}else{
%></section>
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
<%
	} 
}
%>

<center>
	<table border=1 width=400>
		<tr>장바구니</tr>		
		<tr>
			<td>상품번호</td>
			<td>상품명</td>
			<td>상품 사진</td>
			<td>구매 수량</td>
			<td>금액</td>
			<td>담은 날짜</td>
		</tr>
<%
	int tot = 0;
	
	for(int i =0; i < cart_list.size(); i++){
		
		CartVO cvo = (CartVO)cart_list.get(i);
		
		int price = cvo.getPrice() * cvo.getCartStock(); 
		tot = price + tot;
%>
	<form id = "cartDelet<%=i %>" action="./cartdelete.ct">
		<input type="hidden" id ="cartNum" name="cartNum" value="<%=cvo.getCartNum() %>">
		<tr>
			<td><%=i+1 %></td>
			<td><%=cvo.getMenu_name() %></td>
			<td><%=cvo.getImg()%></td>
			<td><%=cvo.getCartStock() %></td>
			<td><%=price %></td>
			<td><%=cvo.getAddDate() %></td>
			<td><input type="submit" value="삭제" id="cartDelet<%=i%>"/></td>
		</tr>
		<br>		
	</form>		
<%
	}
%>
		
	</table>
</center>

<h2>총 금액 : <%=tot %>원</h2>

<%@include file="../includes/footer.jsp" %> --%>