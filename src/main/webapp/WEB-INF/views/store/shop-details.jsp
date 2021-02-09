<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.spring.gogidang.domain.*"%>
<%@include file="../includes/header_simple.jsp"%>

<link rel="stylesheet"href="${pageContext.request.contextPath}/resources/css/shop-details.css"type="text/css">
<link rel="stylesheet"href="${pageContext.request.contextPath}/resources/css/modal_middle.css"
   type="text/css">
<%
   StoreVO svo = (StoreVO) request.getAttribute("storeVO");
   ArrayList<MenuVO> menu_List = (ArrayList<MenuVO>) request.getAttribute("menuList");
   ArrayList<ReviewVO> reviewList = (ArrayList<ReviewVO>) request.getAttribute("reviewList");
   int totalReview = (int) request.getAttribute("totalReview");
   /* ArrayList<ReviewVO> review_List = (ArrayList<ReviewVO>) request.getAttribute("reviewList"); */
%>
<%
   List<QnaStoreVO> qnalist=(List<QnaStoreVO>)request.getAttribute("qnalist");
   int listcount=((Integer)request.getAttribute("listcount")).intValue();
   int nowpage=((Integer)request.getAttribute("page")).intValue();
   int maxpage=((Integer)request.getAttribute("maxpage")).intValue();
   int startpage=((Integer)request.getAttribute("startpage")).intValue();
   int endpage=((Integer)request.getAttribute("endpage")).intValue();
   
%>

<link rel="preconnect" href="https://fonts.gstatic.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&family=Nanum+Gothic+Coding:wght@400;700&family=Poor+Story&display=swap" rel="stylesheet">
<link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script>
$(document).ready(function() {
    $('[id^=detail-]').hide();
    $('.toggle').click(function() {
        $input = $( this );
        $target = $('#'+$input.attr('data-toggle'));
        $target.slideToggle();
    });
    map.relayout();
});
</script>


<section class="product-details spad" id="cartCon">
   <div class="container">
      <div class="row">

         <div class="col-lg-6 col-md-6">
            <div class="product__details__pic">
               <div class="product__details__pic__item">
                  <img class="product__details__pic__item--large"
                     src="resources/img/store/<%=svo.getThumbnail()%>" alt="" style="width : 556px; height : 416px;">
               </div>
               <div class="product__details__pic__slider owl-carousel">
                  <img src="resources/img/product/details/thumb-1.jpg" alt="">
                  <img src="resources/img/product/details/thumb-2.jpg" alt="">
                  <img src="resources/img/product/details/thumb-3.jpg" alt="">
                  <img src="resources/img/product/details/thumb-4.jpg" alt="">
               </div>
            </div>
         </div>

         <!-- 사진옆정보 -->
         <div class="col-lg-6 col-md-6">
            <div class="product__details__text">
               <h2 style="display: inline-flex; color: #7fad39;"><%=svo.getS_name()%></h2>

               <a class="heart-icon"><button type="button" class="icon_heart_alt" id="likeBtn" name ="likeBtn"></button></a>

               <div class="product__details__rating" style="margin-bottom: 45px;">
                  <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
                     class="fa fa-star"></i> <i class="fa fa-star"></i> <i
                     class="fa fa-star-half-o"></i> <span>(<%=totalReview %> reviews)</span>
               </div>
               <div class="product__details__price"
                  style="color: black; font-size: 20px;">주소</div>
               <p><%=svo.getS_addr()%></p>
               <div class="product__details__price"
                  style="color: black; font-size: 20px;">가게소개</div>
               <p>한줄 소개글 추가</p>
               <ul id="seller_detail">
                  <li><b>운영시간</b> <span><%=svo.getS_hour()%></span></li>
                  <li><b>전화번호</b> <span><%=svo.getS_phone()%></span></li>
                  <li><b>휴무일</b> <span>2,4주 일요일</span></li>
               </ul>
            </div>
         </div>

         <!-- tab Start -->
         <div class="col-lg-12">
            <div class="product__details__tab">
               <ul class="nav nav-tabs" role="tablist">
                  <li class="nav-item"><a class="nav-link active"
                     data-toggle="tab" href="#tabs-1" role="tab" aria-selected="true">메뉴</a></li>
                  <li class="nav-item"><a class="nav-link" data-toggle="tab"
                     id="jongu" href="#tabs-2" role="tab" aria-selected="false">위치
                  </a></li>
                  <li class="nav-item"><a class="nav-link" data-toggle="tab"
                     href="#tabs-3" role="tab" aria-selected="false">후기 </a></li>
                  <li class="nav-item"><a class="nav-link" data-toggle="tab"
                     href="#tabs-4" role="tab" aria-selected="false">문의 </a></li>
               </ul>

               <div class="tab-content">

                  <div class="tab-pane active" id="tabs-1" role="tabpanel">
                     <div class="product__details__tab__desc"
                        style="padding-left: 30px; padding-right: 30px;">

                        <div class="row featured__filter">
                           <%
                              for (int i = 0; i < menu_List.size(); i++) {

                                 MenuVO mv = (MenuVO) menu_List.get(i);
                           %>
                           <div class="col-lg-3 col-md-4 col-sm-6" id="Menucontents">

                            <form id="addCart<%=i%>" action="./addCart.ct" method="post">
                            
                              <div class="featured__item">

                                 <input type="hidden" id="menu_num" name="menu_num"
                                    value="<%=mv.getMenu_num()%>">
                                 <input type="hidden" id="price" name="price"
                                    value="<%=mv.getPrice()%>">
                                 <input type="hidden" id=s_num name="s_num"
                                    value="<%=mv.getS_num()%>">
                                 <div class="featured__item__pic set-bg"
                                    data-setbg="resources/img/menu/<%=mv.getImg()%>"></div>

                                 <div class="container-fluid">
                                    <div class="row">
                                       <div class="menu_info" id="menu_info">
                                          <table class="table">
                                             <tbody>
                                                <tr>
                                                   <td><%=mv.getMenu_name()%></td>
                                                   <td><%=mv.getGrade()%>등급</td>
                                                </tr>
                                                <tr class="table">
                                                   <td><%=mv.getGram()%>g</td>
                                                   <td><%=mv.getPrice()%> 원</td>
                                                </tr>
                                                <tr class="table">
                                                   <td><input type="number" id="cartStock"
                                                      name="cartStock" min="1" max="100" value="1" /></td>
                                                   <td><input type="submit" value="장바구니에 담기" id="addCart<%=i%>"/ style="background-color : #7fad39; border : 0px; color : white; height : 27px; border-radius : 2px; font-weight : bold;"></td>
                                                </tr>
                                             </tbody>
                                          </table>
                                       </div>
                                    </div>
                                 </div>
                              </div>
                           </div>
                           </form>
                           <%
                              }
                           %>
                        </div>
                     </div>
                  </div>

                    <div class="tab-pane" id="tabs-2" role="tabpanel">
                     <div class="kakaomap"
                        style="display: flex; justify-content: center; margin-top: 70px;">
                        <div id="map" style=""></div>
                     </div>
                     <script type="text/javascript"
                        src="//dapi.kakao.com/v2/maps/sdk.js?appkey=241b4077cebf45bee1ed06d47263650b&libraries=services"></script>
                     <script>
 var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

mapContainer.style.width = '1140px';
mapContainer.style.height = '450px';

$("#jongu").click(function(){
   map.relayout();
   map.setCenter();
});

function relayout() {    
    
    // 지도를 표시하는 div 크기를 변경한 이후 지도가 정상적으로 표출되지 않을 수도 있습니다
    // 크기를 변경한 이후에는 반드시  map.relayout 함수를 호출해야 합니다 
    // window의 resize 이벤트에 의한 크기변경은 map.relayout 함수가 자동으로 호출됩니다
    map.relayout();
}

map.relayout();
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
            content: '<div style="width:150px; margin-top : 3px;text-align:center;"><a href = "https://map.kakao.com/"target="_blank" ><%=svo.getS_name()%></div>'
                   
        });
        infowindow.open(map, marker);
      
        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
     
       
        map.setCenter(coords);
        
    } 
    
     $("#jongu").click(function(){
          map.relayout();
          map.setCenter(coords);
       });

     
});  
//map.relayout();
setTimeout(function(){ map.relayout(); }, 0);
relayout();

</script>

                  </div>               <div class="tab-pane" id="tabs-3" role="tabpanel">
                     <div class="panel panel-default" id="panel-default">
                        <div class="panel-heading" id="panel-heading">
                           <span class="panel-title">후기</span>
                        </div>
                        <ul class="list-group">
                           <%for(int i=0; i<reviewList.size(); i++) {
                           ReviewVO reviewvo = (ReviewVO) reviewList.get(i);
                        %>
                           <li class="list-group-item">
                              <div class="row toggle" id="dropdown-detail-<%= i %>"
                                 data-toggle="detail-<%= i %>">

                                 <div class="col-xs-10" id="ReviewTitle">
                                    <div><%=reviewvo.getTitle() %></div>
                                    <span id="ReviewId">작성자 : <%=reviewvo.getU_id() %></span>
                                 </div>
                                 <div class="col-xs-10" id="ReviewTitle">
                                    <span id="reviewStar" style="color :#edbb0e;"> 
                                    <%if(reviewvo.getStar() == 5){ %>
                                       <span class="fa fa-star"></span>
                                       <span class="fa fa-star"></span>
                                       <span class="fa fa-star"> </span>
                                       <span class="fa fa-star"></span>
                                       <span class="fa fa-star"></span>
                                       <%}else if(reviewvo.getStar() == 4){
                                       %>
                                       <span class="fa fa-star"></span>
                                       <span class="fa fa-star"></span>
                                       <span class="fa fa-star"></span>
                                       <span class="fa fa-star"> </span>
                                       <%}else if(reviewvo.getStar() == 3){ %>
                                       <span class="fa fa-star"></span>
                                       <span class="fa fa-star"></span>
                                       <span class="fa fa-star"></span>
                                        <%}else if(reviewvo.getStar() == 2){ %>
                                       <span class="fa fa-star"></span>
                                       <span class="fa fa-star"></span>
                                       <%}else if(reviewvo.getStar() == 1){ %>
                                       <span class="fa fa-star"></span> <%} %>
                                  <span id="Insert_date">등록일: <%=reviewvo.getReview_date() %></span>
                                 </div>


                                 <div class="col-xs-2">
                                    <i class="fa fa-chevron-down pull-right"></i>
                                 </div>

                                 <div id="detail-<%= i %>">
                                    <hr>
                                    <div class="review_Container">
                                       <div class="fluid-row" id="Review_user">
                                          <div class="review_Pic">
                                             <img
                                                src="resources/img/DetailStoreImg/Review/BestReview3.png">
                                          </div>
                                          <div>
                                             <div id="reviewTextContent">
                                                리뷰내용 :
                                                <%=reviewvo.getContent() %></div>
                                          </div>
                                       </div>
                                       <hr>
                                       <!-- 사장댓글 -->
                                       <%if(reviewvo.getReview_sub_content() != null) { %>
                                       <div class="Seller_answer">
                                          ↳&nbsp;ex)
                                          <%=svo.getS_name()%>사장님 : <%=reviewvo.getReview_sub_content()%>
                                       </div>
                                       <%} else { %>
                                       <div class="Seller_answer">
                                          ↳&nbsp;답변대기중
                                       </div>
                                       <%} %>
                                    </div>
                                 </div>
                              </div>
                           </li>
                        </ul>
                        <%} %>
                     </div>
                  </div>

                  <div class="tab-pane" id="tabs-4" role="tabpanel">
                     <div class="container" id = "qnaCon">
                        <div class="container-fluid" >
                           <div class="row" style="display : flex; justify-content : center;">
                              <div class="qnaList" style="width :1136px; margin-top : 35px; margin-right : 40px;">
                                 <div class="qna_insert" style="text-align: right;">
                                    <button type="button"
                                       class="btn btn-lg btn-outline-secondary" id="storeQnaWrite"
                                       name="storeQnaWrite"
                                       style="background-color: rgb(191,191,191); color: white; margin-bottom: 20px; width: 80px; height: 35px; font-size: 14px; font-weight: bold;">글쓰기</button>
                                    <input type="hidden" id="ms_num" name="ms_num"
                                       value="<%=svo.getS_num()%>"> <input type="hidden"
                                       id="mu_id" name="mu_id" value="<%=u_id%>">
                                 </div>
                                 <table class="table">
                                    <thead id="qnaHead">

                                       <tr id="qnaHeadText">
                                          <th>번호</th>
                                          <th>제목</th>
                                          <th>작성자</th>
                                          <th>등록일</th>
                                          <th>답변상태</th>
                                       </tr>
                                    </thead>
                                    <tbody id="storeQna_content">

                                    </tbody>
                                 </table>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>

</section>
   
<!-- The Modal -->

<div id="myModal" class="modal">
   <!-- Modal content -->
   <div class="modal-content">
      <span class="close">&times;</span>
      <form name="storeQnaInsertForm">
         
            <h3>가게 문의 작성</h3>
            <ol>
            
               <div class="modal-textbox">
                    <div class="modal-textbox-qna">
                       <ts  for="ms_num" id="qna_num_f">가게번호</ts>
                      <td><input type="text"  id="s_num" name="s_num" readonly></td>
                   </div>
                   <div class="modal-textbox-qna">
                       <ts for="mu_id" id="u_id_f">회원아이디</ts>
                      <td><input type="text" id="u_id" name="u_id" readonly></td>
                   </div>
                </div>
                
                <div class="modal-textbox">
                    <div class="modal-textbox-s">
                       <ts for="title">문의제목</ts>
                      <td><input type="text" id="title" name="title" ></td>
                   </div>
                </div>
             
               <div class="modal-textbox-ff">
                    <div class="modal-textbox-sf">
                       <ts for="content">문의내용</ts>
                      <td><textarea id="content" name="content" type="text" ></textarea></td>
                   </div>
                </div>
            </ol>
         
            
            <div class="form-check-details">
               <button type="button"  id="storeQnaInsertBtn" name="storeQnaInsertBtn" class="btn btn-lg btn-block btn-success">작성</button>
               <br>
            </div>
            <!-- 
            <button type="button" id="storeQnaInsertBtn" name="storeQnaInsertBtn">작성</button>
            <input type="button" id="closeBtn" value="닫기" />
             -->
      </form>
   </div>
</div>
<!--modal END-->

<!-- The Modal -->
<div id="myModal" class="modal">
   <!-- Modal content -->
   <div class="modal-content">
      <span class="close">&times;</span>                                                               
      <form name="QnaInsertForm">
         
         <h3>가게문의 작성</h3>
         <ol>
            <div class="modal-textbox">
                 <div class="modal-textbox-s">
                   <ts for="title">제목</ts>
                   <td><input type="text" id="title" name="title"></td>
                </div>
             </div>
             
             <div class="modal-textbox">
                 <div class="modal-textbox-ss"> 
                   <ts for="content">공지내용</ts>
                   <td><textarea type="text" id="content" name="content"></textarea></td>
                </div>
             </div>
         </ol>
         

         <div class="form-checkkkk">
            
              <button type="button" id="noticeInsertBtn" name="noticeInsertBtn" class="btn btn-lg btn-block btn-success">작성</button>        
              <!--<button type="button" id="closeBtn" class="btn-j btn-lg btn-block btn-success" >닫기</button>  -->
              <!--<input type="button" id="closeBtn" value="닫기"/>  -->
              <br>
         </div>
         
      </form>
   </div>
</div>
<!-- modal END -->


<script type="text/javascript"
   src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

<script>
   // Get the modal
   var modal = document.getElementById('myModal');

   // Get the button that opens the modal
   var btn = document.getElementById('storeQnaWrite');

   // Get the <span> element that closes the modal
   var span = document.getElementsByClassName("close")[0];
   
   var s_num = $('input[name=ms_num]').val();
   var u_id = $('input[name=mu_id]').val();

   $(document).ready(function() {
      
      btn.onclick = function(event) {
         alert(s_num);
         alert(u_id);
         $('input#s_num').val(s_num);
         $('input#u_id').val(u_id);
          modal.style.display = "block";
      }
      
      
      storeQnaList();
   });
   
   $('[name=likeBtn]').click(function () {
      $.ajax({
         url : 'addLikeStore.re',
         type : 'POST',
         data : {"s_num": s_num},
         contentType : 'application/x-www-form-urlencoded;charset=utf-8',
         dataType : 'json',
         success : function(retVal) {
            if (retVal.res == "OK") {
               alert("찜 완료!");
            } else {
               alert("likestore insert Fail!!!!");
            }
         }, 
         error:function() {
            alert("likestore ajax 통신 실패!!")
         }
      });
   });

   $('[name=storeQnaInsertBtn]').click(function() { //댓글 등록 버튼 클릭시 속성이름 [] 으로 접근 가능
      
      var insertData = $('[name=storeQnaInsertForm]').serialize(); //noticeInsertForm의 내용을 가져옴
      alert("insertData = " + insertData);
      storeQnaInsert(insertData); //Insert 함수호출(아래)
   });

    function storeQnaInsert(insertData) {
      $.ajax({
         url : 'qnaStoreInsert.qs',
         type : 'POST',
         data : insertData,
         success : function(data) {
            if (data == "ok") {
               alert("good");
               modal.style.display = "none";
               storeQnaList();
            } else {
               alert("notice insert Fail!!!!");
            }
         }
      });
   } 

    function storeQnaList() {
      $.ajax({
         url : 'qnastoreListAjax.re',
         type : 'POST',
         data : {"s_num": s_num},
         contentType : 'application/x-www-form-urlencoded; charset=utf-8',
         success : function(data) {
            var a = '';
               $.each(data,function(key, value) {
                  a += '<tr><td>'+ value.qnastore_num + '</td>';
                  a += '<td>' + value.title + '</td>';
                  a += '<td>' + value.u_id + '</td>';
                  a += '<td>' + value.re_date + '</td>';
                  if (value.re_content != null) {
                     a += '<td><h6>답변완료</h6></td></tr>';
                  } else {
                     a += '<td><h6>답변대기</h6></td></tr>';
                  }
               });
                  $("#storeQna_content").html(a); //a내용을 html에 형식으로 .commentList로 넣음
            },error : function() {
               alert("ajax통신 실패(list)!!!");
            }
         });
   }

   // When the user clicks on <span> (x), close the modal
   span.onclick = function(event) {
      modal.style.display = "none";
   }

   // When the user clicks anywhere outside of the modal, close it
    window.onclick = function(event) {
      if (event.target == modal) {
         modal.style.display = "none";
      }
   }
</script>




<%@include file="../includes/footer.jsp"%>
      <!-- /.modal -->


