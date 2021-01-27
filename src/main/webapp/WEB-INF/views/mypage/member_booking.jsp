<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="java.util.*" %>
<%@include file="../includes/header.jsp"%>
<%@ page import="com.spring.gogidang.domain.*"%>
<%
	MemberVO memberVO = (MemberVO) session.getAttribute("memberVO");
%>
<% 
	ArrayList<BookingVO> booking_list = (ArrayList<BookingVO>)request.getAttribute("booking_list");
	StoreVO storevo = (StoreVO)session.getAttribute("StoreVO");
	
	int b_state = 1;
	for(int i=0;i<booking_list.size();i++){
		BookingVO booking=(BookingVO)booking_list.get(i);
		if(booking.getBooking_state() == 0 ){
			b_state = 0;
			break;
		}
	}
%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member_liststoreStyle.css" type="text/css">
    <!--네비게이션바 사용 시작-->
    <%if(memberVO.getSeller_key() == 0){ %>
      <section class="hero">
        <div class="container">
            <div class="hero__item__box2"></div>
                    <div class="EventNav">
                        <ul>
                            <li><a href="./updateList.me">내정보</a></li>
                            <li><a href="./bookingList.bo?u_id=<%=memberVO.getU_id()%>">내예약확인</a>
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
        </section>  
<%
   }else{
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
<%
   } 
}
%>
    <!--네비게이션바 사용 끝-->
<center>
	<h3 align="center">예약현황</h3>
	<br><br><br>
	<hr/>
	<div class="container">
	<table class="table table-hover">
		<thead>
			<tr align=center>
				<th>가게명</th>
				<th>예약일자</th>
				<th>예약시간</th>
				<th>인원수</th>
			<%
			if(b_state == 1){
			%>
				<th>예약승인상태</th>	
			<%				
			}else{
			%>
				<th>예약승인상태</th>
				<th>예약취소</th>
			<%				
			}
			%>
			</tr>
		</thead>
		<tbody class="text-center">
			<%
			for(int i=0;i<booking_list.size();i++){
				BookingVO booking=(BookingVO)booking_list.get(i);
			%>
			<tr>
				<td><%=booking.getS_name() %></td>
				<td><%=booking.getB_date()%></td>
				<td><%=booking.getTime()%></td>
				<td><%=booking.getHead_count()%></td>
				<%
				if(booking.getBooking_state()==0){
				%>
				<td><input type="hidden" name="booking_state" value="<%=booking.getBooking_state()%>">대기중</td>
				<td><a href="bookingCancelForm.bo?getBooking_num()=<%=booking.getBooking_num() %>">예약취소</a></td>
				<% } else {%>
				<td><input type="hidden" name="booking_state" value="<%=booking.getBooking_state()%>">예약완료</td>
				<%} %>
			</tr>
				<%}%>
		</tbody>		
	</table>
<hr/>
<!-- 
	<div class="text-center">
		<ul class="pagination">
			<li><a href="#">1</a></li>
			<li><a href="#">2</a></li>
			<li><a href="#">3</a></li>
			<li><a href="#">4</a></li>
		</ul>
	</div>
-->
</div>
</center>
<%@include file="../includes/footer.jsp"%>