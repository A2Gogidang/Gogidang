<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.spring.gogidang.domain.*"%>
 <%@include file="../includes/header_simple.jsp"%>


   
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/store_reviewStyle.css"
	type="text/css">
<%
	ArrayList<SRReviewVO> srReviewList = (ArrayList<SRReviewVO>) request.getAttribute("srReviewList");
	MemberVO memberVO = (MemberVO) session.getAttribute("memberVO");
%>




<!-- Product Section Begin -->
<section class="product spad">
	<div class="container">
		<div class="row">
			<div class="col-lg-3 col-md-5">
				<div class="sidebar">
					<div class="sidebar__item">
						<h4>판매자 마이페이지</h4>
						<ul>
							<li><a href="./updateList.me">내정보</a></li>
							<li><a href="./storeRegForm.st">가게 정보</a></li>
							<li><a href="./menuRegForm.mn">메뉴 등록</a></li>
							<li><a href="./storeNoticeList.no">문의 관리</a></li>
							<li><a href="./storereviewList.bo">리뷰 관리</a></li>
						</ul>
					</div>
				</div>
			</div>
			<!-- ---------------------------------------------------시작----------------------------------------------------- -->
			<div class="reviewboard">
				<div class="section-title product__discount__title">
					<h2>리뷰 관리</h2>
				</div>
				<div class="container">
					<table class="table table-hover">
						<thead>
							<tr align=center>
								<th>번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>별점</th>
								<th>등록일</th>
								<th>답변 상태</th>
							</tr>
						</thead>
						<tbody class="text-center">
							<%
								for (int i = 0; i < srReviewList.size(); i++) {

									SRReviewVO srReviewvo = (SRReviewVO) srReviewList.get(i);
							%>
							<tr align=center>
								<td><%=i + 1%></td>
								<td><a
									href="storereviewInfo.bo?review_num=<%=srReviewvo.getReview_num()%>"><%=srReviewvo.getTitle()%></a>
								</td>
								<td><%=srReviewvo.getU_id()%></td>
								<td><%=srReviewvo.getStar()%></td>
								<td><%=srReviewvo.getReview_date()%></td>

								<%
									if (srReviewvo.getRe_content() == null || srReviewvo.getRe_content() == "") {
								%>
								<td>
				<button id='addReplyBtn' class='btn btn-primary btn-xs pull-right'>리뷰문의 등록</button>
								</td>

								<%
									} else {
								%>
								<td>답변 완료</td>
								<%
									}
								%>

								<%
									}
								%>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<!-- ----------------------------------------------------끝---------------------------------------------------- -->
		</div>
	</div>
	
	
</section>
      <!-- Modal -->

      <div class="modal fade" id="myModal" tabindex="-1" role="dialog"
        aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal"
                aria-hidden="true">&times;</button>
              <h4 class="modal-title" id="myModalLabel">리뷰 답변 페이지</h4>
            </div>
            <div class="modal-body">
        
              <div class="form-group">
                <label>번호</label> 
                <input class="form-control" name='review_num' value= >
              </div>      
              <div class="form-group">
                <label>제목</label> 
                <input class="form-control" name='title' value=''>
              </div>
              <div class="form-group">
                <label>작성자</label> 
                <input class="form-control" name='u_id' value=''>
              </div>
                            <div class="form-group">
                <label>별점</label> 
                <input class="form-control" name='star' value=''>
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
<!-- Product Section End -->

	<script type="text/javascript" src="./resources/js/review-reply.js"></script>
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
      
  // showList(1);
   /*    
      function showList(page) {
    	  console.log("show List" +page);
    	  reviewService.getList({s_num:s_numValue,page: page || 1}, function(qnastoreCnt,list){
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
      } //end showList */

      var modal = $(".modal");
      var modalInputContent = modal.find("input[name='re_content']");
      var modalInputU_id = modal.find("input[name='u_id']");
      var modalInputQna_date = modal.find("input[name='re_date']");
      
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
      var srreview;
      modalRegisterBtn.on("click",function(e){
    	 
    	  srreview = {
  			  re_content: modalInputContent.val(),
  			  u_id: modalInputU_id.val()
  			  
  	  	};
  	reviewService.add(srreview, function(result) {
  		  
  		  alert("추가되었습니다"+result);
  		  
  		  modal.find("input").val("");
  		  modal.modal("hide");
  		  
  		  //showList(1);
  		  showList(1);
});

  	});
  	
/*   	//댓글 조회 클릭 이벤트 처리
  	$(".chat").on("click","li",function(e){

  		var qs_num = $(this).data("qs_num");
  		alert("qs_num=" + qs_num);
  		
  		reviewService.get(qs_num,function(res) {
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
  		
  		reviewService.update(content, function(result) {
  			alert(result);
  			modal.modal("hide");
  			showList(pageNum);
  		});
  		
  	});
  	
  	modalRemoveBtn.on("click",function(e) {
  		var qs_num = modal.data("qs_num");
  		
  		reviewService.remove(qs_num, function(result) {
  			alert(result);
  			modal.modal("hide");
  			showList(pageNum);
  		});
  	});
  	 */
  
  	
});	
  	

</script>

<!-- Footer Section Begin -->
<%@include file="../includes/footer.jsp"%>
	