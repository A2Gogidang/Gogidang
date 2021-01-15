<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>  
<%@ page import="com.spring.gogidang.domain.*" %>
<%@ page import="java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


	
  <!-- Bootstrap Core CSS -->
    <link href="resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="resources/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- DataTables CSS -->
    <link href="resources/vendor/datatables-plugins/dataTables.bootstrap.css" rel="stylesheet">

    <!-- DataTables Responsive CSS -->
    <link href="resources/vendor/datatables-responsive/dataTables.responsive.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="resources/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	
	
	

<%
	MemberVO membervo = (MemberVO)session.getAttribute("MemberVO");
	String u_id=(String)membervo.getU_id();
	%>

=======
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.spring.gogidang.domain.*" %>
<%@ page import="java.util.*" %>
>>>>>>> e2f76e0d6d11d780b99ca425c362b062a150b092
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
<<<<<<< HEAD

=======
	<a href="./review_reg.re?s_num=${storeVO.getS_num() }">가게 리뷰작성</a>
>>>>>>> e2f76e0d6d11d780b99ca425c362b062a150b092
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
			</tr>
			<%} %>
		</tr>
		
		<tr>
			<table border=1 align=center>
			<tr>
				<td>번호</td>
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
				<td><%= i+1 %></td>
				<td><a href="reviewInfo.re?review_num=<%=vo1.getReview_num()%>"><%=vo1.getPhoto1() %></a></td>
				<td><%=vo1.getStar() %></td>
				<td><a href="reviewInfo.re?review_num=<%=vo1.getReview_num()%>"><%=vo1.getTitle() %></a></td>
			<%} %>
			</tr>
			</table>
		</tr>
	</table>
	
	<div id="map" style="width:800px;height:400px;"></div>

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

// 주소로 좌표를 검색합니다
geocoder.addressSearch('${storeVO.getS_addr()}', function(result, status) {

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
            content: '<div style="width:150px;text-align:center;padding:6px 0;">저희 가게</div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});    
</script>

<div class='row'>

  <div class="col-lg-12">

    <!-- /.panel -->
     <div class="panel panel-default">
       <!-- <div class="panel-heading">
        <i class="fa fa-comments fa-fw"></i> Reply
      </div> -->  
      
	  <div class="panel-heading">
       <i class="fa fa-comments fa-fw"></i> 가게문의
        <button id='addReplyBtn' class='btn btn-primary btn-xs pull-right'>가게 문의 등록</button>
      </div>   
      
      
      <!-- /.panel-heading -->
      <div class="panel-body">        
      
        <ul class="chat">
			<!-- start reply -->
			<li class="left clearfix" data-rno='1'>
				<div>
					<div class="header">
						<strong class="primary-font">user00</strong>
						<small class="pull-right text-muted">2018-01-01 13:13</small>
					</div>
					<p>Good job!</p>
				</div>
			</li>
			<!-- end reply -->
        </ul>
        <!-- ./ end ul -->
      </div>
      <!-- /.panel .chat-panel -->
      
      <!-- Modal -->
      <div class="modal fade" id="myModal" tabindex="-1" role="dialog"
        aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal"
                aria-hidden="true">&times;</button>
              <h4 class="modal-title" id="myModalLabel">가게문의등록페이지</h4>
            </div>
            <div class="modal-body">
              <div class="form-group">
                <label>content</label> 
                <input class="form-control" name='content' value='New Reply!!!!'>
              </div>      
              <div class="form-group">
                <label>아이디</label> 
                <input class="form-control" name='u_id' value='replyer'>
              </div>
              <div class="form-group">
                <label>등록일</label> 
                <input class="form-control" name='qna_date' value=''>
              </div>
      
            </div>
<div class="modal-footer">
        <button id='modalModBtn' type="button" class="btn btn-warning">수정</button>
        <button id='modalRemoveBtn' type="button" class="btn btn-danger">제거</button>
        <button id='modalRegisterBtn' type="button" class="btn btn-primary">등록</button>
        <button id='modalCloseBtn' type="button" class="btn btn-default" data-dismiss='modal'>닫기</button>
        <button id='modalClassBtn' type='button' class="btn btn-default" data-dismiss='modal'>닫기</button>
      </div>          </div>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
      </div>
      <!-- /.modal -->

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="./resources/js/qnastore.js"></script>

<script>
$(document).ready(function (){
	var s_numValue = '<c:out value="${storeVO.getS_num()}"/>';
	var replyUL = $(".chat");
		
		showList(1);
		
		function showList(page) {
			qnaService.getList({s_num:s_numValue}, function(list){
				
				var str="";
				if(list == null || list.length == 0) {
					replyUL.html("");
				}
				for (var i=0,len = list.length || 0; i < len; i++) {
					str +="<li class='left clearfix' data-rno='"+list[i].qs_num+"'>";
					str +="		<div><div class='header'><strong class='primary-font'>"+list[i].u_id+"</strong>";
					str +="			<small class='pull-right text-muted'>"+qnaService.displayTime(list[i].qna_date)+"</small></div>";
					str +="				<p>"+list[i].content+"</p></div></li>"
				}
					replyUL.html(str);
			})
		}
		
		var modal = $(".modal");
		var modalInputContent = modal.find("input[name='content']");
		var modalInputU_id = modal.find("input[name='u_id']");
		var modalInputQna_date = modal.find("input[name='qna_date']");
		
		var modalModBtn = $("#modalModBtn");
		var modalRemoveBtn = $("#modalRemoveBtn");
		var modalRegisterBtn = $("#modalRegisterBtn");
		
		$("#addReplyBtn").on("click", function(e){
			modal.find("input").val("");
			modalInputQna_date.closest("div").hide();
			modal.find("button[id !='modalCloseBtn']").hide();
			
			modalRegisterBtn.show();
			
			$(".modal").modal("show");
		});
	
		
});	
	

/* var s_numValue = '<c:out value="${storeVO.getS_num()}"/>';
 qnaService.add(
		{s_num:s_numValue,u_id:"user01" ,title:"하위1",content:"하위12"} 
	,
	function(result) {
		alert("RESULT: "+result);
	}
);   */

/* 	qnaService.getList({s_num:s_numValue}, function(list){
			
		for(var i =0, len=list.length||0; i<len; i++) {
			console.log(list[i]);
		}
	}); */
/*    	qnaService.remove(22,function(count){
		console.log(count);
		
		if(count === "success") {
			alert("REMOVED");
		}
	}, function(err) {
		alert("ERROR...");
	});  */ 
	
/*     	qnaService.update({
		qs_num : 1,
		s_num : s_numValue,
		title : "하이용",
		content : "히이"
	}, function(result) {
		alert("수정 완료");
	
	});  */
	
/* 	qnaService.get(1, function(data){
		alert("되나요");
	}); */
	
</script>


</body>



</html>