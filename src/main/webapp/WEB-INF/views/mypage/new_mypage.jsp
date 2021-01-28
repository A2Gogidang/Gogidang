<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.spring.gogidang.domain.*"%>

<%
	ArrayList<StoreVO> storeList = (ArrayList<StoreVO>) request.getAttribute("storeList");
%>
<%@include file="../includes/header.jsp"%>


<!-- Product Section Begin -->
<section class="product spad">
	<div class="container">
		<div class="row">
			<div class="col-lg-3 col-md-5">
				<div class="sidebar">
					<div class="sidebar__item">
						<h4>관리자 페이지</h4>
						<ul>
							<li><a href="storeWait.st">대기중인 가게 승인</a></li>
							<li><a href="noticelist.no">공지사항 관리</a></li>
							<li><a href="qnalist.qn">문의 관리</a></li>
							<li><a href="eventList.ev">이벤트 관리</a></li>
						</ul>
					</div>
				</div>
			</div>
			<!-- content Start -->
			<div>
				<h3>대기중인 가게 승인</h3>
				<br>
				<center>
					<table border=1 width=850>
						<tr align=center>
							<td colspan=3>가게 대기 리스트</td>
						</tr>
						<tr align=center>
							<td>가게 번호</td>
							<td>가게 이름</td>
							<td>상세보기</td>
						</tr>
						<%
							if (storeList.size() > 0) {
								for (int i = 0; i < storeList.size(); i++) {
									StoreVO vo = (StoreVO) storeList.get(i);
						%>
						<tr align=center>
							<td><%=vo.getS_num()%></td>
							<td><%=vo.getS_name()%></td>
							<td><input type="button" data-toggle="modal"
								data-target="#myModal" value="상세보기"></td>
						</tr>
						<%
							}
							}
						%>
						</tr>
					</table>
				</center>
			</div>
			<!-- content End -->
		</div>
	</div>
</section>
<!-- Product Section End -->

<!-- Modal Start -->
<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">Modal title</h4>
			</div>
			<div class="modal-body">
				<div class="form-group">
					<label>가게메인사진</label> <input class="form-control" name='thumbnail'
						value=''>
				</div>
				<div class="form-group">
					<label>사업자등록번호</label> <input class="form-control" name='s_num'
						value=''>
				</div>
				<div class="form-group">
					<label>가게이름</label> <input class="form-control" name='s_name'
						value=''>
				</div>
				<div class="form-group">
					<label>가게주소</label> <input class="form-control" name='s_addr'
						value=''>
				</div>
				<div class="form-group">
					<label>가게전화번호</label> <input class="form-control" name='s_phone'
						value=''>
				</div>
				<div class="form-group">
					<label>가게운영시간</label> <input class="form-control" name='s_hour'
						value=''>
				</div>
				<div class="form-group">
					<label>사업자등록사진</label> <input class="form-control" name='s_img'
						value=''>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">거절</button>
				<button type="button" class="btn btn-primary">승인</button>
			</div>
		</div>
	</div>
</div>
<!-- Modal End -->

<script>
		var modal = $(".modal");
		var modalInputThumbnail = modal.find("input[name='thumbnail']");
		var modalInputSnum = modal.find("input[name='s_num']");
		var modalInputSname = modal.find("input[name='s_name']");
		var modalInputSaddr = modal.find("input[name='s_addr']");
		var modalInputSphone = modal.find("input[name='s_phone']");
		var modalInputShour = modal.find("input[name='s_hour']");
		var modalInputSimg = modal.find("input[name='s_img']");
		
	   	function modalFunc() {
	
	        var s_num = $(this).data("s_num");
	        alert("s_num=" + s_num);
	        
	        waitStoreModal.get(s_num, function(res) {
	           console.log(res);
	           alert("s_num : " + res.s_num);
	           modalInputThumbnail.val(res.thumbnail);
	           modalInputSnum.val(res.s_num);
	           modalInputSname.val(res.s_name);
	           modalInputSaddr.val(res.s_addr);
	           modalInputSphone.val(res.s_phone);
	           modalInputShour.val(res.s_hour);
	           modalInputSimg.val(res.s_img);

	           modalInputQna_date.val(qnaService.displayTime(res.qna_date)).attr("readonly","readonly");
	           modal.data("qs_num",res.qs_num);
	           
	           console.log(qs_num);
	           
	           modal.find("button[id !='modalCloseBtn']").hide();
	           modalModBtn.show();
	           modalRemoveBtn.show();
	           
	           $(".modal").modal("show");
	        });
	     });
	
		var waitStoreModal = (function(){
			function get(s_num, callback, error) {
				$.getJSON("/get/" + s_num + ".st", funtion(result) {
					if(callback) {
						callback(result);
					} else {
						alert("error");
					}
				}).fail(function(xhrm status, err) {
					if(error) {
						error();
					}
				});
			}
		}
	</script>

<%@include file="../includes/footer.jsp"%>