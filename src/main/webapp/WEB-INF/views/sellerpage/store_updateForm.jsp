<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<%@ page import="java.util.*"%>
<%@include file="../includes/header.jsp"%>
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
	<form name="storeupdateform" action="./storeUpdate.st" method="post">
		<input type="hidden" name="u_id" value=<%=memberVO.getU_id()%>>
		<center>
			<table border=1>
				<tr>
					<td colspan="2" align=center><b><font size=5>가게등록페이지</font></b></td>
				</tr>
				<tr>
					<td>메인사진 :</td>
					<td><span name="thumbnail" type="file" value="<%=vo.getThumbnail()%>" /><%=vo.getThumbnail()%></td>
				</tr>
				<tr>
					<td>사업자등록번호 :</td>          
					<td><span type="text" name="s_num" value="<%=vo.getS_num()%>" /><%=vo.getS_num()%></td>
				</tr>
				<tr>
					<td>사업자등록증 :</td>
					<td><span name="s_img" type="file" value="<%=vo.getS_img()%>" /><%=vo.getS_img()%></td>
				</tr>
				<tr>
					<td>가게이름</td>
					<td><input type="text" name="s_name" value="<%=vo.getS_name()%>" /></td>
				</tr>
				<tr>
					<td>가게주소 :</td>
					<td><input type="text" name="s_addr" value="<%=vo.getS_addr()%>" /></td>
				</tr>
				<tr>
					<td>가게전화번호 :</td>
					<td><input type="text" name="s_phone" value="<%=vo.getS_phone()%>" /></td>
				</tr>
				<tr>
					<td>가게운영시간 :</td>
					<td><input type="text" name="s_hour" size=30 value="<%=vo.getS_hour()%>" /></td>
				</tr>
				<tr>
					<td>배달가능여부 :</td>
					<td><input type="radio" name="delibery" value="0" checked />불가능
						<input type="radio" name="delibery" value="1" />가능</td>
				</tr>
				<tr>
					<td colspan="2" align=center>
						<a href="javascript:storeupdateform.submit()">저장</a>
						<a href="javascript:storeupdateform.reset()">다시작성</a>
					</td>
				</tr>
			</table>
		</center>
	</form>
<%@include file="../includes/footer.jsp"%>