<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@include file="../includes/header.jsp"%>

<%
	StoreVO storeVO = (StoreVO)session.getAttribute("StoreVO");
%>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>

<script>
	function execDaumPostcode() {
	  new daum.Postcode({
	      oncomplete: function(data) {
	          // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	          // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	          // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	          var Addr = ''; // 최종 주소 변수
	          var extraAddr = ''; // 조합형 주소 변수
	          // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	          if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	              Addr = data.roadAddress;
	          } else { // 사용자가 지번 주소를 선택했을 경우(J)
	              Addr = data.jibunAddress;
	          }
	          // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
	          if(data.userSelectedType === 'R'){
	              //법정동명이 있을 경우 추가한다.
	              if(data.bname !== ''){
	                  extraAddr += data.bname;
	              }
	              // 건물명이 있을 경우 추가한다.
	              if(data.buildingName !== ''){
	                  extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	              }
	              // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
	              Addr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
	          }
	          // 우편번호와 주소 정보를 해당 필드에 넣는다.
	          document.getElementById('s_post').value = data.zonecode; //5자리 새우편번호 사용
	          document.getElementById('s_addr').value = Addr;
	          // 커서를 상세주소 필드로 이동한다.
	          document.getElementById('s_addr1').focus();
	      }
	  }).open();
	}

	var str,i,ch ="";
	
	function check_input() {
		
		if(document.storeform.s_num.value=="") {
	        alert("사업자 등록번호를 입력하세요!!!");
	        document.storeform.s_num.focus();
	        return false;
	     } else {
	        str=document.storeform.s_num.value;
	        if(str.length<6 || str.length>12) {
	           alert("사업자 등록번호를 확인하세요(9자리)!!!");
	           document.storeform.s_num.focus();
	           return false;
	        } else{
	           for(i=0;i<str.length;i++) {
	              ch=str.substring(i,i+1);
	              if(!((ch>="0" && ch<="9")||(ch>="a" && ch<="z") ||(ch>="A" && ch<="z"))) {
	              alert("특수문자가 포함되어있습니다, 다시입력해주세요!!");
	              document.storeform.s_num.focus();
	              return false;
	              }
	           }
	        }
	     }
		
		if(document.storeform.s_name.value=="") {
	        alert("가게 이름을 입력하세요!!!");
	        document.storeform.s_name.focus();
	        return false;
	     }
		
		if(document.storeform.s_addr1.value=="") {
	        alert( "상세 주소를 입력하세요!!!");
	        document.storeform.s_addr1.focus();
	        return false;
	     }
		
		if(document.storeform.s_phone.value=="") {
	        alert( "전화번호를 입력하세요!!!");
	        document.storeform.s_phone.focus();
	        return false;
	     }
		
		
		storeform.submit();	
	}
	
</script>

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
	}else { 
		
		if(storeVO == null || storeVO.getConfirm() == 0 || storeVO.getS_num() == 0 ){
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
%>
	</section>
	
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
<!--네비게이션바 사용 end-->


<form id="storeform" action="./storeInsert.st" method="post" enctype="multipart/form-data">
	<input type="hidden" name = "u_id" value=<%=memberVO.getU_id() %>>
	<center>
		<table border=1>
			<tr>
				<td colspan="2" align=center>
					<b><font size=5>가게등록 페이지</font></b>
				</td>
			</tr>
			
			<tr>
				<td>메인사진 : </td> 
			<%if( storeVO == null || storeVO.getThumbnail() == null || storeVO.getThumbnail() == ""){ %>
				<td><input id="thumbnail" name="file" type="file" multiple="multiple"/></td>
			<%}else{ %>	
				<td><img src="resources/img/store/<%=storeVO.getThumbnail() %>" width="100px" height="100px" /></td>
			<%} %>
			</tr>
			
			<tr>
				<td>사업자등록번호  : </td>
			<%if( storeVO == null || storeVO.getS_num() == 0){ %>
				<td><input type="text" name="s_num" /></td>
			<%}else{ %>
				<td><span type="text" name="s_num"  value="<%=storeVO.getS_num() %>"/><%=storeVO.getS_num() %></td>
			<%} %>
			</tr>
			
			<tr>
				<td>사업자등록증  : </td>
			<%if( storeVO == null|| storeVO.getS_img() == null || storeVO.getS_img() == ""){ %>
				<td><input id="s_img" name="file" type="file" multiple="multiple"/></td>
			<%}else{ %>
				<td><img src="resources/img/store/<%=storeVO.getS_img() %>"  width="100px" height="100px" /></td>
			<%} %>
			</tr>	
			<tr>
				<td>가게이름 </td>
			<%if( storeVO == null|| storeVO.getS_name() == null || storeVO.getS_name() == ""){ %>
				<td><input name="s_name" type="text"/></td>
			<%}else{ %>
				<td><span type="text" name="s_name" value="<%=storeVO.getS_name() %>"/><%=storeVO.getS_name()%></td>
			<%} %>
			</tr>
			
			<tr>
				<td>가게주소  : </td>
			<%if( storeVO == null|| storeVO.getS_addr() == null || storeVO.getS_addr() == ""){ %>
				<tr>
					<td>주소 : </td>
		      		<td><input type="text" id="u_post" name="u_post" placeholder="우편번호">
		         		<input type="button" onclick="execDaumPostcode()" value="우편번호찾기"><br>
		         		<input type="text" id="u_addr" name="s_addr" placeholder="주소">
		         		<input type="text" id="u_addr" name="s_addr" placeholder="상세주소">
	         		</td>
         		</tr>
			<%}else{ %>
				<td><span type="text" name="s_addr" value="<%=storeVO.getS_addr() %>"/><%=storeVO.getS_addr() %></td>
			<%} %>
			</tr>
			
			<tr>
				<td>가게전화번호  : </td>
			<%if( storeVO == null|| storeVO.getS_phone() == null || storeVO.getS_phone() == ""){ %>
				<td><input name="s_phone" type="text"/></td>
			<%}else{ %>
				<td><span type="text" name="s_phone" value="<%=storeVO.getS_phone() %>"/><%=storeVO.getS_phone() %></td>
			<%} %>
			</tr>
			
	<tr>
	<%if( storeVO == null|| storeVO.getS_hour() == null || storeVO.getS_hour() == ""){ %>
		<td>운영시간 : </td>
		<td>
			<select name="s_hour">
				<option value="">오픈시간</option>
				<option value="08:00">08:00</option>
				<option value="09:00">09:00</option>
				<option value="10:00">10:00</option>
				<option value="11:00">11:00</option>
				<option value="12:00">12:00</option>
				<option value="13:00">13:00</option>
				<option value="14:00">14:00</option>
				<option value="15:00">15:00</option>
			</select>
			
			<select name="s_hour">
				<option value="">마감시간</option>
				<option value="15:00">15:00</option>
				<option value="16:00">16:00</option>
				<option value="17:00">17:00</option>
				<option value="18:00">18:00</option>
				<option value="19:00">19:00</option>
				<option value="20:00">20:00</option>
				<option value="21:00">21:00</option>
				<option value="22:00">22:00</option>
				<option value="23:00">23:00</option>
			</select>
		</td>
	<%}else{ %>
		<td><span type="text" name="s_hour" size=30 value="<%=storeVO.getS_hour() %>"/><%=storeVO.getS_hour() %></td>
	<%} %>
	</tr>
			
	<tr>
		<td>배달가능여부  : </td>
		<td>
			<input type="radio" name="delibery" value="0" checked/>불가능
			<input type="radio" name="delibery" value="1"/>가능
		</td>
	</tr>
			
	<tr>
		<%if( storeVO == null || storeVO.getS_num() == 0){ %>
				<!-- onclick 두개 -->
				<input type="button" value="작성" onclick="fnAction('./storeInsert.st') check_input()" multiple />
				<a href="javascript:storeform.reset()">다시작성</a>
		<%}else{ %>
				<a href="./storeUpdateForm.st">수정</a>
		<%}%>
	</tr>	
</table>

			<div class="select_img">
				<img id="out_thumbnail" src="" />
				<img id="out_s_img" src="" />
			</div>
	</center>
</form>
<script>
	function fnAction(url) {
		var frm = document.getElementById("storeform");
		frm.action = url;
		frm.submit();
	}
	
	$("#thumbnail").change(function () {
		var reader = new FileReader;
		reader.onload = function(data) {
			$(".select_img>#out_thumbnail").attr("src", data.target.result).width(500);
		}
		reader.readAsDataURL(this.files[0]);
	});
	
	$("#s_img").change(function () {
		var reader = new FileReader;
		reader.onload = function(data) {
			$(".select_img>#out_s_img").attr("src", data.target.result).width(500);
		}
		reader.readAsDataURL(this.files[0]);
	});
</script>
<%@include file="../includes/footer.jsp"%>