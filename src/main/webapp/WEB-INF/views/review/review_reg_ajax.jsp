<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.spring.gogidang.domain.*" %>

<%
	MemberVO mvo = (MemberVO) session.getAttribute("MemberVO");
	StoreVO svo = (StoreVO) request.getAttribute("svo");
	ReviewVO rvo = (ReviewVO) request.getAttribute("rvo");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1><%=mvo.getU_id() %></h1>
	
	<form id="review_reg_photo_form" method="post">
		<table id="photo">
			<tr>
				<td>사진추가</td>
				<td><input type='file' name='uploadFile' multiple></td>
			</tr>
			<tr>
				<td><button id='uploadBtn'>사진등록완료</button></td>
			</tr>
		</table>
	</form>
	
	
	
	<form name="review_form" action="./reviewReg.re" method="post" enctype="multipart/form-data">
		<table border=1 id='review_reg'>
              <tr>
                  <td colspan="3" align=center>
                    <b><font size=3><%=svo.getS_name() %>가게 후기등록 페이지</font></b>
                    <input type="hidden" name="s_name" value="<%=svo.getS_name() %>">
                    <input type="hidden" name="u_id" value="<%=mvo.getU_id() %>">
                	<input type="hidden" name="s_num" value="<%=svo.getS_num() %>">
                	<input type="hidden" name="nickname" value="<%=mvo.getU_nick()%>">
                </td>
            </tr>
            <tr>
                <td>리뷰제목 : </td>
                <td colspan="2" align=center><input type="text" name="title"></td>
            </tr>
            <tr>
                <td>리뷰내용 : </td>
                <td colspan="2" align=center><input type="text" name="content"></td>
            </tr>
            <tr>
                <td>별점 : </td>
	            <td colspan="2" align=center>
					<input type="radio" name="star" value="1"/>1점
					<input type="radio" name="star" value="2"/>2점
					<input type="radio" name="star" value="3"/>3점
					<input type="radio" name="star" value="4"/>4점
					<input type="radio" name="star" value="5"/>5점
				</td>
            </tr>
            <tr>
            	<td colspan="3" align=center>
            		<a href="javascript:review_form.submit()">저장</a>
           		</td>
            </tr>
        </table>
    </form>
	
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"
		integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
		crossorigin="anonymous">
	</script>

	<script>
		
		var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
		var maxSize = 5242880;
		
		function checkExtension(fileName, fileSize) {
			
			if(fileSize >= maxSize) {
				alert("파일 사이즈 초과");
				return false;
			}
			
			if(regex.test(fileName)) {
				alert("해당 종류의 파일은 업로드할 수 없습니다.");
				return false;
			}
			return true;
		}
		
		$("#uploadBtn").on("click", function(e) {
			// jQuery를 이용하는 경우 파일업로드사용객체
			// formData에 가상의 form테그 파라미터를 담아서 전송
			var formData = new FormData(); 
			var inputFile = $("input[name='uploadFile']");
			var files = inputFile[0].files;
			console.log(files);
			
			for(var i=0; i<files.length; i++) {
				
				if(!checkExtension(files[i].name, files[i].size)) {
					return false;
				}
				
				formData.append("uploadFile", files[i]);
			} //for
			
			$.ajax({
				url : './uploadAjaxAction.up',
				processData : false,
				contentType : false,
				data : formData,
				type : 'POST',
				dataType : 'json',
				success : function(result) {
 					alert("frist success");
 					
					$.each(result, function(index, item){
						alert("success");
						alert(item["fileName"]);
					});
/* 					var output = '';
					output += '<tr>';
					output += '<td><input type="hidden" name="uuid" value="' + result.fileName + '"></td>';
					output += '</tr>';
					$('#review_reg').append(output);
					
					alert(result.fileName); */
				}, error:function() {
					alert("ajax통신 실패");
				}
			}); //$.ajax
		}); // uploadBtn

	</script>  
</body>
</html>