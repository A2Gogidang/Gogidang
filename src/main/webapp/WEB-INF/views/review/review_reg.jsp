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
<title>리뷰작성</title>
<script>

$(document).ready(function(e){

  var formObj = $("form[role='form']");
  
  $("button[type='submit']").on("click", function(e){
    
    e.preventDefault();
    
    console.log("submit clicked");
    
    var str = "";
    
    $(".uploadResult ul li").each(function(i, obj){
      
      var jobj = $(obj);
      
      console.dir(jobj);
      console.log("-------------------------");
      console.log(jobj.data("filename"));
      
      
      str += "<input type='hidden' name='attachList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
      str += "<input type='hidden' name='attachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
      str += "<input type='hidden' name='attachList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
      str += "<input type='hidden' name='attachList["+i+"].fileType' value='"+ jobj.data("type")+"'>";
      
    });
    
    console.log(str);
    
    formObj.append(str).submit();
    
  });

  
  var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
  var maxSize = 5242880; //5MB
  
  function checkExtension(fileName, fileSize){
    
    if(fileSize >= maxSize){
      alert("파일 사이즈 초과");
      return false;
    }
    
    if(regex.test(fileName)){
      alert("해당 종류의 파일은 업로드할 수 없습니다.");
      return false;
    }
    return true;
  }
  
  $("input[type='file']").change(function(e){

    var formData = new FormData();
    
    var inputFile = $("input[name='uploadFile']");
    
    var files = inputFile[0].files;
    
    for(var i = 0; i < files.length; i++){

      if(!checkExtension(files[i].name, files[i].size) ){
        return false;
      }
      formData.append("uploadFile", files[i]);
      
    }
    
    $.ajax({
      url: '/uploadAjaxAction',
      processData: false, 
      contentType: false,data: 
      formData,type: 'POST',
      dataType:'json',
        success: function(result){
          console.log(result); 
		  showUploadResult(result); //업로드 결과 처리 함수 

      }
    }); //$.ajax
    
  });  
  
  function showUploadResult(uploadResultArr){
	    
    if(!uploadResultArr || uploadResultArr.length == 0){ return; }
    
    var uploadUL = $(".uploadResult ul");
    
    var str ="";
    
    $(uploadResultArr).each(function(i, obj){
    	
		if(obj.image){
			var fileCallPath =  encodeURIComponent( obj.uploadPath+ "/s_"+obj.uuid +"_"+obj.fileName);
			str += "<li data-path='"+obj.uploadPath+"'";
			str +=" data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'"
			str +" ><div>";
			str += "<span> "+ obj.fileName+"</span>";
			str += "<button type='button' data-file=\'"+fileCallPath+"\' "
			str += "data-type='image' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
			str += "<img src='/display?fileName="+fileCallPath+"'>";
			str += "</div>";
			str +"</li>";
		}else{
			var fileCallPath =  encodeURIComponent( obj.uploadPath+"/"+ obj.uuid +"_"+obj.fileName);			      
		    var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
		      
			str += "<li "
			str += "data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"' ><div>";
			str += "<span> "+ obj.fileName+"</span>";
			str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' " 
			str += "class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
			str += "<img src='/resources/img/attach.png'></a>";
			str += "</div>";
			str +"</li>";
		}

    });
    
    uploadUL.append(str);
  }

  $(".uploadResult").on("click", "button", function(e){
	    
    console.log("delete file");
      
    var targetFile = $(this).data("file");
    var type = $(this).data("type");
    
    var targetLi = $(this).closest("li");
    
    $.ajax({
      url: '/deleteFile',
      data: {fileName: targetFile, type:type},
      dataType:'text',
      type: 'POST',
        success: function(result){
           alert(result);
           
           targetLi.remove();
         }
    }); //$.ajax
   });
});
</script>
</head>
<body>
	<h1><%=mvo.getU_id() %></h1>
	<form name="review_form" action="./reviewReg.re" method="post" enctype="multipart/form-data">
            <table border=1>
                <tr>
                    <td colspan="2" align=center>
                        <b><font size=3><%=svo.getS_name() %>가게 후기등록 페이지</font></b>
                        <input type="hidden" name="s_name" value="<%=svo.getS_name() %>">
                        <input type="hidden" name="u_id" value="<%=mvo.getU_id() %>">
                    	<input type="hidden" name="s_num" value="<%=svo.getS_num() %>">
                    	<input type="hidden" name="nickname" value="<%=mvo.getU_nick()%>">
                    </td>
                </tr>
                <tr>
                    <td>리뷰제목 : </td>
                    <td><input type="text" name="title"></td>
                </tr>
                <tr>
                    <td>리뷰내용 : </td>
                    <td><input type="text" name="content"></td>
                </tr>
                <tr>
                    <td>별점 : </td>
                    <td>
						<input type="radio" name="star" value="1"/>1점
						<input type="radio" name="star" value="2"/>2점
						<input type="radio" name="star" value="3"/>3점
						<input type="radio" name="star" value="4"/>4점
						<input type="radio" name="star" value="5"/>5점
					</td>
                </tr>
                <tr>
                    <td colspan="2" align=center>
                        <a href="javascript:review_form.submit()">리뷰등록</a>
                        <button onclick="submit()">submit</button>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align=center>
                        <a href="./reviewList.re">리뷰리스트보기</a>
                    </td>
                </tr>
                
             <div class="row">
				  <div class="col-lg-12">
				    <div class="panel panel-default">
				
				      <div class="panel-heading">File Attach</div>
				      <!-- /.panel-heading -->
				      <div class="panel-body">
				        <div class="form-group uploadDiv">
				            <input type="file" name='uploadFile' multiple>
				        </div>
				        
				        <div class='uploadResult'> 
				          <ul>
				          
				          </ul>
				        </div>
				      </div>
				      <!--  end panel-body -->
				    </div>
				    <!--  end panel-body -->
				  </div>
				  <!-- end panel -->
			</div>
			<!-- /.row -->

            </table>
        </form>
</body>
</html>