<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가게전체보기</title>
</head>
<body>
              <div class="EventNav">
<!-- Tab을 구성할 영역 설정-->
<div style="margin:10px;">
<!-- Tab 영역 태그는 ul이고 클래스는 nav와 nav-tabs를 설정한다. -->
<ul class="nav-tabs">
<!-- Tab 아이템이다. 태그는 li과 li > a이다. li태그에 active는 현재 선택되어 있는 탭 메뉴이다. -->
<li class="active"><a href="#home" data-toggle="tab">가격정보</a></li>
<!-- a 태그의 href는 아래의 tab-content 영역의 id를 설정하고 data-toggle 속성을 tab으로 설정한다. -->
<li><a href="#profile" data-toggle="tab">가게위치</a></li>
<li><a href="#messages" data-toggle="tab">추천리뷰</a></li>
<li><a href="#settings" data-toggle="tab">문의</a></li>
</ul>
<!-- Tab이 선택되면 내용이 보여지는 영역이다. -->
<!-- 태그는 div이고 class는 tab-content로 설정한다. -->
<div class="tab-content">
<!-- 각 탭이 선택되면 보여지는 내용이다. 태그는 div이고 클래스는 tab-pane이다. -->
<!-- active 클래스는 현재 선택되어 있는 탭 영역이다. -->
<div class="tab-pane fade in active" id="home">Home 메뉴</div>
<!-- id는 고유한 이름으로 설정하고 tab의 href와 연결되어야 한다. -->
<div class="tab-pane fade" id="profile">Profile 메뉴</div>
<!-- fade 클래스는 선택적인 사항으로 트랜지션(transition)효과가 있다.
<!-- in 클래스는 fade 클래스를 선언하여 트랜지션효과를 사용할 때 in은 active와 선택되어 있는 탭 영역의 설정이다. -->
<div class="tab-pane fade" id="messages">Messages 메뉴</div>
<div class="tab-pane fade" id="settings">Settings 메뉴</div>
</div>
</div>
<!-- </div> -->
 <div class="Pice_info"style="display: flex; flex-flow: column; justify-content: center; align-items: center;">
                     <div class="section-title">
                        <h2 style="margin-top: 30px;">가격정보</h2>
                    </div>
                    
                    	
		<img src="resources/img/price_info.png">
		<img src="resources/img/PriceInfo_Detail.png">
	
        </div>
      <%@include file="../includes/footer.jsp"%>
</body>
</html>