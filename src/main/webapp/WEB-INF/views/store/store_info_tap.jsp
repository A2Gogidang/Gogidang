<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>  
<%@ page import="com.spring.gogidang.domain.*" %>
<%@ page import="java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<link rel="stylesheet" href="resources/css/newDetailStore.css"
   type="text/css">
<link rel="stylesheet" href="resources/css/DetailStore.css"
   type="text/css">
<script src="resources/js/newDetailStore.js"></script>
<script src="resources/DetailStore/newDetailStore.css"></script>
<%@include file="../includes/header.jsp"%>
<%
   MemberVO mvo = (MemberVO) session.getAttribute("memberVO");
   String u_id = "";
   int seller_key;
   if (mvo != null) {
      u_id = mvo.getU_id();
      seller_key = mvo.getSeller_key();
   } else {
      seller_key = 0;
   }

   StoreVO svo = (StoreVO) request.getAttribute("storeVO");
   PageDTO pageMaker = (PageDTO) request.getAttribute("pageMaker");
   ArrayList<MenuVO> menu_List = (ArrayList<MenuVO>) request.getAttribute("menuList");
   ArrayList<ReviewVO> review_List = (ArrayList<ReviewVO>) request.getAttribute("reviewList");
%>
<script>
   $(function() {

      $('#show').on('click', function() {
         $('.card-reveal').slideToggle('slow');
      });

      $('.card-reveal .close').on('click', function() {
         $('.card-reveal').slideToggle('slow');
      });
   });
   jQuery(document).ready(function($) {

      $(".scroll").click(function(event) {
         event.preventDefault();
         $('html,body').animate({
            scrollTop : $(this.hash).offset().top
         }, 900); //속도조절 900으로 맞춤
      });
   });
   //부드러운 스크롤링 jquery
</script>
<style type="text/css">
.lib-panel {
   margin-bottom: 20Px;
}

.lib-panel img {
   width: 100%;
   background-color: transparent;
}

.lib-panel .row, .lib-panel .col-md-6 {
   padding: 0;
   background-color: #FFFFFF;
}

.lib-panel .lib-row {
   padding: 0 20px 0 20px;
}

.lib-panel .lib-row.lib-header {
   background-color: #FFFFFF;
   font-size: 20px;
   padding: 10px 20px 0 20px;
}

.lib-panel .lib-row.lib-header .lib-header-seperator {
   height: 2px;
   width: 26px;
   background-color: #d9d9d9;
   margin: 7px 0 7px 0;
}

.lib-panel .lib-row.lib-desc {
   position: relative;
   height: 100%;
   display: block;
   font-size: 13px;
}

.lib-panel .lib-row.lib-desc a {
   position: absolute;
   width: 100%;
   bottom: 10px;
   left: 20px;
}

.row-margin-bottom {
   margin-bottom: 20px;
}

.box-shadow {
   -webkit-box-shadow: 0 0 10px 0 rgba(0, 0, 0, .10);
   box-shadow: 0 0 10px 0 rgba(0, 0, 0, .10);
}

.no-padding {
   padding: 0;
}
</style>

<!--네비게이션바 사용 시작-->
<section class="hero">
   <div class="container">
      <div class="hero__item__box2"></div>

   </div>
</section>
<body>
   <!--네비게이션바 사용 끝-->
   <!-- Hero Section End -->
   <div class="container-fluid">
      <div class="row">
         <div class="col-md-12 cc_cursor" style="margin-bottom: 30px;">
            <div class="card bg-default">
               <div class="CardHeader" style="color: #ffffff;">
                  <h3 class="card-header" style="text-align: center;">
                     <%=svo.getS_name()%>
                     <button type="button" id="show" class="btn btn-custom pull-right"
                        aria-label="Left Align">
                        <p>위치</p>
                     </button>
               </div>
               </h3>
               <div class="card-body">
                  <p class="card-text"
                     style="display: flex; align-items: center; justify-content: center;">
                     <img class="img-responsive"
                        src="resources/img/store/<%=svo.getThumbnail()%>" alt=''
                        width="350px">
                  </p>
               </div>
               <div class="card-footer"
                  style="display: flex; align-items: center; justify-content: center; flex-flow: column; background-color: #ffffff;">
                  <ul class="SellerInfoDetail">
                     <ul>
                        <h5>
                           <a href="#"><img
                              src="resources/DetailStore/Icon/location.ico" width="40px"
                              height="40px;" alt='' /> <%=svo.getS_addr()%></a>
                        </h5>
                     </ul>
                     <ul>
                        <h5>
                           <a href="#"><img src="resources/DetailStore/Icon/time.ico"
                              width="40px" height="42px;" alt='' /> <%=svo.getS_hour()%></a>
                        </h5>
                     </ul>
                     <ul>
                        <h5>
                           <a href="#"><img src="resources/DetailStore/Icon/call.ico"
                              width="40px" height="40px;" alt='' /> <%=svo.getS_phone()%></a>
                        </h5>
                     </ul>
                     <ul>
                        <h5>
                           <a href="#"><img
                              src="resources/DetailStore/Icon/delivery.ico" width="40px"
                              height="40px;" alt='' /> 한줄 소개 글 작성</a>
                        </h5>
                     </ul>
                  </ul>
                  <div class="card-reveal">
                     <span class="card-title">가게위치 상세보기</span>
                     <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close">
                        <span aria-hidden="true">×</span>
                     </button>
                     <div class="DetailLocation"
                        style="text-align: left; margin-top: 30px;">
                        <h4>서울 송파구 양재대로 932 38</h4>
                        <h6>가락시장역8번 출구에서215m</h6>
                        <div class="container-fluid">
                           <div class="row">
                              <div class="col-md-12">
                                 <div id="map" style="width: 800px; height: 400px;"></div>

                                 <script type="text/javascript"
                                    src="//dapi.kakao.com/v2/maps/sdk.js?appkey=241b4077cebf45bee1ed06d47263650b&libraries=services"></script>
                                 <script>
                                    var mapContainer = document
                                          .getElementById('map'), // 지도를 표시할 div 
                                    mapOption = {
                                       center : new kakao.maps.LatLng(
                                             33.450701,
                                             126.570667), // 지도의 중심좌표
                                       level : 3
                                    // 지도의 확대 레벨
                                    };

                                    // 지도를 생성합니다    
                                    var map = new kakao.maps.Map(
                                          mapContainer, mapOption);

                                    // 주소-좌표 변환 객체를 생성합니다
                                    var geocoder = new kakao.maps.services.Geocoder();

                                    // 주소로 좌표를 검색합니다
                                    geocoder
                                          .addressSearch(
                                                '${storeVO.getS_addr()}',
                                                function(
                                                      result,
                                                      status) {

                                                   // 정상적으로 검색이 완료됐으면 
                                                   if (status === kakao.maps.services.Status.OK) {

                                                      var coords = new kakao.maps.LatLng(
                                                            result[0].y,
                                                            result[0].x);

                                                      // 결과값으로 받은 위치를 마커로 표시합니다
                                                      var marker = new kakao.maps.Marker(
                                                            {
                                                               map : map,
                                                               position : coords
                                                            });

                                                      // 인포윈도우로 장소에 대한 설명을 표시합니다
                                                      var infowindow = new kakao.maps.InfoWindow(
                                                            {
                                                               content : '<div style="width:150px;text-align:center;padding:6px 0;">저희 가게</div>'
                                                            });
                                                      infowindow
                                                            .open(
                                                                  map,
                                                                  marker);

                                                      // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                                                      map
                                                            .setCenter(coords);
                                                   }
                                                });
                                 </script>
                              </div>
                           </div>
                        </div>
                     </div>
                     <!--DetailLocation end-->
                  </div>
                  <!-- card reveal -->
               </div>
            </div>
         </div>
      </div>
   </div>   
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
 /*   MemberVO membervo = (MemberVO)session.getAttribute("MemberVO");
  
   ArrayList<MenuVO> menu_List = (ArrayList<MenuVO>)request.getAttribute("menuList");
   ArrayList<ReviewVO> review_List = (ArrayList<ReviewVO>)request.getAttribute("reviewList");
   //ArrayList<CartListVO> cartList= (ArrayList<CartListVO>)request.getAttribute("cartList"); */
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
   
<%--      <table>
   
               
            
    
 <thead>
  <tr>
   <th>번호</th>
   <th>종류</th>
   <th>이름</th>
   <th>가격</th>
   <th>이미지</th>
   <th>등급</th>
   <th>이미지</th>
  </tr>
 </thead>
 <tbody>
  <c:forEach items="${menuList}" var="menuList">
  <tr>
   <td>${menuList.menu_num}</td>
   <td>${menuList.meat}</td>
   <td>${menuList.menu_name}</td>
   <td>${menuList.price}</td>
   <td>${menuList.img}</td>
   <td>${menuList.grade}</td>
   <td>${menuList.gram}</td>
  </tr>   
  </c:forEach>
 </tbody>
</table> --%>
<tbody>
 <c:forEach items="${menuList}" var="menuList">

   <tr>
      <!-- <td>${menuList.img}</td> -->
      <td>
          <table border="1" style="height:300px; width: 400px;">
            <tr align="center">
               <td>상품명</td>            
               <td>${menuList.menu_name}</td>   
            </tr>
            <tr align="center">
               <td>가격</td>
               <td><fmt:formatNumber value="${menuList.price}" pattern="###,###,###"/></td>
            </tr>
            <tr align="center">
               <td colspan="2">
                  <form name="form1" method="post" action="">
                     <input type="hidden" name="menu_num" value="${menuList.menu_num}">
                     <select name="amount">
                        <c:forEach begin="1" end="10" var="i">
                           <option value="${i}">${i}</option>
                        </c:forEach>
                     </select>&nbsp;개
                     <input type="submit" value="장바구니 담기">
                  </form>
               </td>
            </tr>
         </table>
       </c:forEach>
       <tbody>
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

 <!-- Tab을 구성할 영역 설정-->
       <section class="hero">
        <div class="container">
            <div class="hero__item__box2"></div>
                    <div class="EventNav">
                        <ul>
                    
                            <li><a href="#Price_info" class="scroll">가격정보</a></li>
                            <li><a href="#locationNav_s" class="scroll">가게위치</a></li>
                            <li><a href="#BestReview" class="scroll">추천리뷰</a></li>
                            <li><a href="#Qna_s" class="scroll">문의</a></li>
                            
                        </ul>
                    </div>   
            </div>   
        </div>
    </section>
   <!-- Tab이 선택되면 내용이 보여지는 영역이다. -->
   <!-- 태그는 div이고 class는 tab-content로 설정한다. --
      <!-- 각 탭이 선택되면 보여지는 내용이다. 태그는 div이고 클래스는 tab-pane이다. -->
      <!-- active 클래스는 현재 선택되어 있는 탭 영역이다. -->
         <section id="Price_info">
            <div class="Price_info"
               style="display: flex; flex-flow: column; justify-content: center; align-items: center;">
               <div class="section-title">
                  <h2 style="margin-top: 30px;">가격정보</h2>
               </div>
                  <%
                     for (int i = 0; i < review_List.size(); i++) {

                        ReviewVO vo = (ReviewVO) review_List.get(i);
                  %>
                  <!-- Portfolio Item 1-->
                  <div class="col-md-6 col-lg-4 mb-5">
                     <div class="BestReview-item mx-auto" data-toggle="modal"
                        data-target="#BestReviewModal1">
                        <a href="./reviewInfo.re?review_num=<%=vo.getReview_num()%>"><img
                           class="img-fluid" src="resources//DetailStore/Review/추천리뷰1.png" /></a>
                     </div>
                  </div>
                  <%
                     }
                  %>
               </div>
            </div>
         </section>
      <!-- id는 고유한 이름으로 설정하고 tab의 href와 연결되어야 한다. -->
         <br>
         <section id="locationNav_s">
            <br>
            <div class="container">
               <!-- Portfolio Section Heading-->
               <div class="row">
                  <div class="col-lg-12">
                     <div class="section-title">
                        <h2 style="margin-top: 30px;">가게 위치</h2>
                     </div>
                  </div>
               </div>
            </div>
            <div class="location"
               style="display: flex; flex-flow: column; justify-content: center; align-items: center;">
               <img src="resources/DetailStore/Location/location.png"> <img
                  src="resources/DetailStore/Location/loc1.png"> <span
                  class="locText"></span>
               <p>가락시장역2번 출구로 나오세요</p>
               <p>가락몰이 보입니다</p>
               <img src="resources/DetailStore/Location/loc2.png"> <span
                  class="locText"></span>
               <p>가락몰 쪽으로 주욱 가다보시면</p>
               <img src="resources/DetailStore/Location/loc3.png"> <span
                  class="locText"></span>
               <p>축산이 써져있는 문들이 보입니다</p>
               <img src="resources/DetailStore/Location/loc4.png"> <span
                  class="locText"></span>
               <p>축산 3이 써져있는 문을 열고 들어가주세요</p>
               <img src="resources/DetailStore/Location/loc5.png"> <span
                  class="locText"></span>
               <p>들어가시면 많은 축산 점포가 보입니다.</p>
               <img src="resources/DetailStore/Location/loc6.png"> <span
                  class="locText"></span>
               <p>B66 점포번호를 확인해주세요</p>
               <p>정육 백화점이 보입니다.</p>
            </div>
         </section>
         
          <!-- fade 클래스는 선택적인 사항으로 트랜지션(transition)효과가 있다. -->
      <!-- in 클래스는 fade 클래스를 선언하여 트랜지션효과를 사용할 때 in은 active와 선택되어 있는 탭 영역의 설정이다. -->
         <section id="BestReview">
            <br>
            <div class="container">
               <!-- Portfolio Section Heading-->
               <div class="row">
                  <div class="col-lg-12">
                     <div class="section-title">
                        <h2 style="margin-top: 30px;">가게 리뷰</h2>
                     </div>
                  </div>
               </div>
               <!-- Portfolio Grid Items-->
               <div class="row justify-content-center" style="margin-top: 20px;">
                  <%
                     for (int i = 0; i < review_List.size(); i++) {

                        ReviewVO vo = (ReviewVO) review_List.get(i);
                  %>
                  <!-- Portfolio Item 1-->
                  <div class="col-md-6 col-lg-4 mb-5">
                     <div class="BestReview-item mx-auto" data-toggle="modal"
                        data-target="#BestReviewModal1">
                        <a href="./reviewInfo.re?review_num=<%=vo.getReview_num()%>"><img
                           class="img-fluid" src="resources//DetailStore/Review/추천리뷰1.png" /></a>
                     </div>
                  </div>
                  <%
                     }
                  %>
               </div>
            </div>
         </section>
      <!--         </div> -->
      <br>
<section id="Qna_s">
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
<%@include file="../includes/footer.jsp"%>
         </section>
   
   <a style="display: scroll; position: fixed; bottom: 10px; right: 5px;"
      href="#" title="top">TOP</a>

</html>