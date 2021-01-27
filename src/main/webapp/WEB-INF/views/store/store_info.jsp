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
   
   
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
   
   

<%
   MemberVO membervo = (MemberVO)session.getAttribute("memberVO");
   String u_id=(String)membervo.getU_id();
   %>

<%
   ArrayList<MenuVO> menu_List = (ArrayList<MenuVO>)request.getAttribute("menuList");
   ArrayList<ReviewVO> review_List = (ArrayList<ReviewVO>)request.getAttribute("reviewList");
   
%>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>

</head>
<body>
<table border="1" align=center>
   <tr>
 		<td><button onclick="location.href='./review_reg.re?s_num=${storeVO.getS_num() }'">리뷰작성</button></td>
   </tr>
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
      <%
            for(int i=0; i<menu_List.size(); i++)
            {
               MenuVO vo =(MenuVO)menu_List.get(i);
         %>
          <form id="addCart<%=i%>" action="./addCart.ct" method="post">
          <input type="hidden" id ="menu_num" name="menu_num" value="<%=vo.getMenu_num() %>">
	  	<table border="1">
	  		 <tr>
		  		 <td>사진</td>
		         <td>상품명</td>
		         <td>그램</td>
		         <td>등급</td>
		         <td>가격</td>
		         <td>구입 수량</td>
		         <td rowspan="2">
		         <input type="submit" value="장바구니에 담기" id="addCart<%=i%>"/>
		         </td>		    
	         </tr>
	         <tr>
		         <td><%=vo.getImg() %></td>
		         <td><%=vo.getMenu_name() %></td>
		         <td><%=vo.getGram() %></td>
		         <td><%=vo.getGrade() %></td>
		         <td><input type="hidden" id ="price" name="price" value="<%=vo.getPrice()%>"><%=vo.getPrice() %></td>
		         <td><input type="number" id="cartStock" name="cartStock" min="1" max="100" value="1" /></td>		         
	         </tr>
	         
	 	</table><br><br>	 	
 	</form>
 <%} %>
          <tr>
         <table border=1 align=center>
         <tr>
         <%
            for(int i=0; i<review_List.size(); i++)
            {
               ReviewVO vo1 =(ReviewVO)review_List.get(i);
         %>
         <td><%=vo1.getStar() %></td>
         <td><%=vo1.getTitle() %>
         <%} %>
         </tr>
         </table>
      </tr>
   </table>
      <tr>
         <table border=1 align=center>
         <tr>
         <%
            for(int i=0; i<review_List.size(); i++)
            {
               ReviewVO vo1 =(ReviewVO)review_List.get(i);
            
         %>
         <td><%=vo1.getStar() %></td>
         <td><%=vo1.getTitle() %>
         <%} %>
         </tr>
         </table>
      </tr>
   
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
         <li class="left clearfix" data-qs_num='1'>
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
      
      <div class="panel-footer">
      
      </div>
      
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
                <label>제목</label> 
                <input class="form-control" name='u_id' value='New Reply!!!!'>
              </div>      
              <div class="form-group">
                <label>내용</label> 
                <input class="form-control" name='content' value='replyer'>
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

	<script type="text/javascript" src="./resources/js/qnastore.js"></script>
    <script src="./resources/vendor/bootstrap/js/bootstrap.min.js"></script>
    <!-- Metis Menu Plugin JavaScript -->
    <script src="./resources/vendor/metisMenu/metisMenu.min.js"></script>
    <!-- DataTables JavaScript -->
    <script src="./resources/vendor/datatables/js/jquery.dataTables.min.js"></script>
    <script src="./resources/vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
    <script src="./resources/vendor/datatables-responsive/dataTables.responsive.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="./resources/dist/js/sb-admin-2.js"></script>


<script>
$(document).ready(function (){
   var s_numValue = '<c:out value="${storeVO.getS_num()}"/>';
   var replyUL = $(".chat");
      
   showList(1);
      
      function showList(page) {
    	  console.log("show List" +page);
    	  qnaService.getList({s_num:s_numValue,page: page || 1}, function(qnastoreCnt,list){
            console.log("qnastorCnt:"+ qnastoreCnt);
            console.log("list:"+ list);
            console.log(list);
            
            if(page == -1) {
            	pageNum = Math.ceil(qnastoreCnt/10.0);
            	showList(pageNum);
            	return;
            }
    		  
            var str="";
            
            if(list == null || list.length == 0) {
            	return;
               
            }
            for (var i=0,len = list.length || 0; i < len; i++) {
               str +="<li class='left clearfix' data-qs_num='"+list[i].qs_num+"'>";
               str +="      <div><div class='header'><strong class='primary-font'>"+list[i].u_id+"</strong>";
               str +="         <small class='pull-right text-muted'>"+qnaService.displayTime(list[i].qna_date)+"</small></div>";
               str +="            <p>"+list[i].content+"</p></div></li>";
            }
               replyUL.html(str);
               
               showqnastorePage(qnastoreCnt);
         });//end function
      } //end showList

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
      var qnastore;
      modalRegisterBtn.on("click",function(e){
    	 
  	  qnastore = {
  			  content: modalInputContent.val(),
  			  u_id: modalInputU_id.val(),
  			  s_num: s_numValue
  	  	};
  	qnaService.add(qnastore, function(result) {
  		  
  		  alert("추가되었습니다"+result);
  		  
  		  modal.find("input").val("");
  		  modal.modal("hide");
  		  
  		  //showList(1);
  		  showList(-1);
});

  	});
  	
  	//댓글 조회 클릭 이벤트 처리
  	$(".chat").on("click","li",function(e){

  		var qs_num = $(this).data("qs_num");
  		alert("qs_num=" + qs_num);
  		
  		qnaService.get(qs_num,function(res) {
  			console.log(res);
  			alert("qnastore.qs_num=" + res.qs_num);
  			modalInputContent.val(res.content);
  			modalInputU_id.val(res.u_id);
  			modalInputQna_date.val(qnaService.displayTime(res.qna_date)).attr("readonly","readonly");
  			modal.data("qs_num",res.qs_num);
  			
  			console.log(qs_num);
  			
  			modal.find("button[id !='modalCloseBtn']").hide();
  			modalModBtn.show();
  			modalRemoveBtn.show();
  			
  			$(".modal").modal("show");
  		});
  	});
  	
  	modalModBtn.on("click",function(e) {
  		var content = {qs_num:modal.data("qs_num"), content:modalInputContent.val()};
  		
  		qnaService.update(content, function(result) {
  			alert(result);
  			modal.modal("hide");
  			showList(pageNum);
  		});
  		
  	});
  	
  	modalRemoveBtn.on("click",function(e) {
  		var qs_num = modal.data("qs_num");
  		
  		qnaService.remove(qs_num, function(result) {
  			alert(result);
  			modal.modal("hide");
  			showList(pageNum);
  		});
  	});
  	
  	var pageNum = 1;
	var qnastorePageFooter = $(".panel-footer");
	
	function showqnastorePage(qnastoreCnt) { //페이징 처리
		
		var endNum = Math.ceil(pageNum / 10.0) * 10;
		var startNum = endNum - 9;
		
		var prev = startNum != 1;
		var next = false;
		
		if(endNum * 10 >= qnastoreCnt) {
			endNum = Math.ceil(qnastoreCnt/10.0);
		}
		
		if(endNum * 10 < qnastoreCnt) {
			next = true;
		}
		
		var str = "<ul class='pagination pull-right'>";
		
		if(prev) {
			str += "<li class='page-item'><a class='page-link' href='"+(startNum -1)+"'>Previous</a></li>";
		}
		
		for(var i = startNum ; i <=endNum; i++) {
			
			var active = pageNum == i? "active":"";
			
			str += "<li class='page-item "+active+" '><a class='page-link' href='"+i+"'>"+i+"</a></li>";
		}
		
		if(next) {
			str += "<li class='page-item'><a class='page-link' href='"+(endNum+1)+"'>Next</a></li>";
		}
		
		str += "</ul></div>";
		
		qnastorePageFooter.html(str);
	}
	
	qnastorePageFooter.on("click","li a", function(e){ //페이지 번호를 클릭했을때 새로운 댓글 가져옴
		e.preventDefault();
		
		var targetPageNum = $(this).attr("href");
		
		console.log("targetPageNum:" + targetPageNum);
		
		pageNum = targetPageNum;
		
		showList(pageNum);
	});
  	
});	
  	

</script>
</body>



</html>