<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ page import = "com.spring.gogidang.domain.*" %>
<%@include file="../includes/header.jsp"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member_liststoreStyle.css" type="text/css">
<%
	StoreVO storevo = (StoreVO)session.getAttribute("StoreVO");
	String id = memberVO.getU_id();
	List<ReviewVO> review_list = (List<ReviewVO>) request.getAttribute("list");
	List<ReviewVO> reviewUidList = (List<ReviewVO>) request.getAttribute("reviewUidList");
	PageDTO  pageMaker = (PageDTO) request.getAttribute("pageMaker");
%>
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
	<h3 align="center">가게 후기 리스트</h3>
	<br><br><br>
	<hr/>	
		<div class="container">
			<table class="table table-hover">
			<thead>
				<tr align=center>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>가게명</th>
					<th>별점</th>
					<th >등록일</th>
				</tr>
			</thead>
			<tbody class="text-center">
 		<%
			for (int i=0; i<review_list.size(); i++){
				
				ReviewVO vo = (ReviewVO)review_list.get(i);
		%>
			<tr align=center>
				<td>
					<%=vo.getReview_num() %>
				</td>
				<td>
					<a href="reviewInfo.re?review_num=<%=vo.getReview_num()%>"><%=vo.getTitle() %></a>
				</td>
				<td>
					<%=vo.getNickname() %>
				</td>
				<td>
					<%=vo.getS_name() %>
				</td>
				<td>
					<%=vo.getStar() %>
				</td>
				<td>
					<%=vo.getReview_date() %>
				</td>
			</tr>
		<%
			} 
		%>
			<tr align=center height=20>
				<td colspan=7 style=font-family:Tahoma;font-size:10pt;>
					<%if(pageMaker.isPrev()){ %>
					<a href="./reviewList.re?pageNum=pageMaker.getCri().getPageNum()-1">[이전]</a>&nbsp;
					<%}else{ %>
					[이전]&nbsp;
					<%} %>
					
					<%for(int a=pageMaker.getStartPage();a<=pageMaker.getEndPage();a++){
						if(a==pageMaker.getCri().getPageNum()){%>
						[<%=a %>]
						<%}else{ %>
						<a href="./reviewList.re?pageNum=<%=a %>">[<%=a %>]</a>
						&nbsp;
						<%} %>
					<%} %>
					
					<%if(pageMaker.isNext()){ %>
					<a href="./reviewList.re?pageNum=<%=pageMaker.getCri().getPageNum()+1 %>&amount=10">[다음]</a>
					<%}else{ %>
					[다음]
					<%} %>
				</td>
			</tr>
		</tbody>
</table>
</div>
</center>
<%@include file="../includes/footer.jsp"%>