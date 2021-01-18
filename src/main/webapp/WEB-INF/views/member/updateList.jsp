<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<%@ page import="java.util.*"%>
<%@include file="../includes/header.jsp"%>
<%
	StoreVO storevo = (StoreVO)session.getAttribute("StoreVO");
	
%>
    <!--네비게이션바 사용 시작-->
    <%if(memberVO.getSeller_key() == 0 ){ %>
	   <section class="hero">
        <div class="container">
            <div class="hero__item__box2"></div>
                    <div class="EventNav">
                        <ul>
                            <li><a href="./updateList.me">내정보</a></li>
                            <li><a href="./bookingList.bo?u_id=<%=memberVO.getU_id()%>">내예약확인</a>
                            <li><a href="./likeStoreList.li?u_id=<%=memberVO.getU_id()%>">찜목록</a></li>
                            <li><a href="./reviewList.re?u_id=<%=memberVO.getU_id()%>">내가 작성한 후기</a></li>
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
                            <li><a href="./menuRegForm.st">메뉴 정보</a></li>
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
    <!-- Hero Section End -->
		<center>
			<table border=1 width=400>
				<tr>회원 정보 수정</tr>
				<tr>
					<td>아이디 :</td>
					<td><%=memberVO.getU_id()%></td>
					<!-- id는 수정사항에 포함되지 않기 때문에 hidden으로 설정 -->
				</tr>
				<tr>
					<td>비밀번호 :</td>
					<td><span type="password" name="u_pw" value="<%=memberVO.getU_pw()%>" /></td>
				</tr>
				<tr>
					<td>이름 :</td>
					<td><%=memberVO.getU_name()%></td>
				</tr>
				<tr>
					<td>닉네임 :</td>
					<td><%=memberVO.getU_nick()%></td>
					
				</tr>
				<tr>
					<td>생년월일 :</td>
					<td><%=memberVO.getU_birth()%></td>
				</tr>
				<tr>
					<td>주소 :</td>
					<td><%=memberVO.getU_addr()%></td>
				</tr>	
				<tr>
					<td>이메일 주소 :</td>
					<td><%=memberVO.getU_email()%></td>
				</tr>
				<tr>
					<td>핸드폰 번호 :</td>
					<td><%=memberVO.getU_phone()%></td>
				</tr>
				<tr align=center>
					<td colspan=2><a href="./updateForm.me">수정</a></td>
				</tr>
			</table>
		</center>
<%@include file="../includes/footer.jsp"%>