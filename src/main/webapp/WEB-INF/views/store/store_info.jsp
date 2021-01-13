<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.spring.gogidang.domain.*" %>
<%@ page import="java.util.*" %>
<%
	MemberVO mvo = (MemberVO) session.getAttribute("MemberVO");
	ArrayList<MenuVO> menu_List = (ArrayList<MenuVO>)request.getAttribute("menuList");
	ArrayList<ReviewVO> review_List = (ArrayList<ReviewVO>)request.getAttribute("reviewList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<a href="./review_reg.re?s_num=${storeVO.getS_num() }">가게 리뷰작성</a>
	<table border="1" align=center>
	<tr>
		<td rowspan=5>${storeVO.getThumbnail()}</td>
		<td>${storeVO.getS_addr()}</td>
	</tr>
	<tr>
		<td>${storeVO.getS_phone()}</td>
	</tr>
	<tr>
		<td>${storeVO.getS_hour()}</td>
	</tr>
	<tr>
		<td>${storeVO.getDelibery()}</td>
	</tr>
	</table>
	
	 <table align=center>
		<tr>
			<%
				for(int i=0; i<menu_List.size(); i++)
				{
					MenuVO vo =(MenuVO)menu_List.get(i);
				
			%>
			<tr>
			<td><%=vo.getImg() %></td>
			<td><%=vo.getMenu_name() %></td>
			<td><%=vo.getGram() %></td>
			<td><%=vo.getGrade() %></td>
			<td><%=vo.getPrice() %></td>
			<td>
			</tr>
			<%} %>
		</tr>
		
		<tr>
			<table border=1 align=center>
			<tr>
				<td>사진</td>
				<td>별점</td>
				<td>제목</td>
			</tr>
			<%
				for(int i=0; i<review_List.size(); i++)
				{
					ReviewVO vo1 =(ReviewVO)review_List.get(i);
				
			%>
			<tr>
				<td><a href="reviewInfo.re?review_num=<%=vo1.getReview_num()%>"><%=vo1.getPhoto1() %></a></td>
				<td><%=vo1.getStar() %></td>
				<td><a href="reviewInfo.re?review_num=<%=vo1.getReview_num()%>"><%=vo1.getTitle() %></a></td>
			<%} %>
			</tr>
			</table>
		</tr>
	</table>
	
	<div id="map" style="width:100%;height:350px;"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=241b4077cebf45bee1ed06d47263650b&libraries=services"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();
function addr(){
var addr=document.getElementById('${storeVO.getS_addr()}').value;

// 주소로 좌표를 검색합니다
geocoder.addressSearch(addr, function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">우리회사</div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});   
}
</script>
</body>
</html>