<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.th,td{
font-size: 16px;
}
.pagination-lg{
font-size: 16px;
}

</style>
<body>
 <!--네비게이션바 사용 시작-->
<%@include file="../includes/header.jsp"%>
        <div class="container">
            <div class="hero__item__box2"></div>
                    <div class="EventNav">
                        <ul>
                            <li><a href="event.jsp">이벤트</a></li>
                            <li><a href="qna.jsp">문의</a>
                            <li><a href="notice.jsp">공지사항</a></li>
                        </ul>
                    </div>   
            </div>   
            
             
            <div class="section-title" style="margin-top : 70px;">
                        <h2 style="margin-top: 30px;">문의 상세보기</h2>
                     </div>
            
  <div class="container-fluid">
   <div class="row">
      <div class="col-md-12 cc_cursor">
         <form role="form">
            <div class="form-group">
                
               <label for="qna_title">
                  제목
               </label>
               <input type="qna_title" class="form-control" id="qna_title1" />
            </div>
            <div class="form-group">
                
               <label for="qna_insert_content">
                   내용
               </label>
               <input type="qna_insert_content" class="form-control" id="qna_insert_content1"/ style="height: 500px;">
            </div>
      </div>
   </div>
</div>
   
            <div class="col-md-2">
            </div>
        

<%@include file="../includes/footer.jsp"%>

</body>
</html>