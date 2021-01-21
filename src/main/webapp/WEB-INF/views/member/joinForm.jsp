<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="com.spring.gogidang.domain.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<%@ page import="java.util.*"%>
<%
   MemberVO vo =(MemberVO)request.getAttribute("memberVO");
%>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1">
<title>회원관리 시스템 회원가입 페이지</title>

   <link rel="shortcut icon" href="resources/cut-pig.jpg"> 
     <!-- Loding font -->
     <link href="https://fonts.googleapis.com/css?family=Montserrat:300,700" rel="stylesheet">

    <link rel="stylesheet" href="resources/css/loginstyle.css">

    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <!--사이드바 및 햄버거 아이콘 액션-->
    <style>
        input[id="menuicon"] {display:none;}
        input[id="menuicon"] + label {display:block;margin:10px 0 ;width:30px;height:20px;position:relative;cursor:pointer;}
        input[id="menuicon"] + label span {display:block;position:absolute;width:100%;height:5px;border-radius:30px;background: rgba(0, 100, 0,0.6);transition:all .35s;}
        input[id="menuicon"] + label span:nth-child(1) {top:0;}
        input[id="menuicon"] + label span:nth-child(2) {top:50%;transform:translateY(-50%);} 
        input[id="menuicon"] + label span:nth-child(3) {bottom:0;}
        input[id="menuicon"]:checked + label {z-index:2;}
        input[id="menuicon"]:checked + label span {background:rgb(62, 163, 105, 0.8);}
        input[id="menuicon"]:checked + label span:nth-child(1) {top:50%;transform:translateY(-50%) rotate(45deg);}
        input[id="menuicon"]:checked + label span:nth-child(2) {opacity:0;}
        input[id="menuicon"]:checked + label span:nth-child(3) {bottom:50%;transform:translateY(50%) rotate(-45deg);}
        div[class="sidebar"] {width:300px;height:100%;background :  rgba(0, 100, 0,0.2);position:fixed;top:0;left:-300px;z-index:1;transition:all .35s;}
        input[id="menuicon"]:checked + label + div {left:0;}

   </style>
    <!--사이드바 및 햄버거 아이콘 액션 end-->

    
    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="resources/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="resources/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="resources/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="resources/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="resources/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="resources/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="resources/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="resources/css/loginDetail.css" type="text/css">
   <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
      <script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
   <script type="text/javascript">
      
      // 8자리 숫자 정규표현식
      var birthExp = /^\d{8}$/;
      
      // email 인증여부
      // 원래 script 조작 때매 이렇게 하면 안됨..
      var emailAuthFlag = false;
      
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
                   document.getElementById('u_post').value = data.zonecode; //5자리 새우편번호 사용
                   document.getElementById('u_addr').value = Addr;
                   // 커서를 상세주소 필드로 이동한다.
                   document.getElementById('u_addr').focus();
               }
           }).open();
       }
      
      
      function check_input() {
         var str,i,ch,chk,chk_list="";
         
         if(document.joinform.u_id.value=="") {
            alert("아이디를 입력하세요!!");
            document.joinform.u_id.focus();
            return false;
         } else {
            str=document.joinform.u_id.value;
            if(str.length<4 || str.length>10){
               alert("아이디 길이를 확인해주세요 (4~10자리)!!!");
               document.joinform.u_id.focus();
               return false;
            } else {
               for(i=0;i<str.length;i++) {
                  ch=str.substring(i,i+1);
                  if(!((ch>="0" && ch<="9")||(ch>="a" && ch<="z") ||(ch>="A" && ch<="Z"))){
                     alert("특수문자가 포함, 다시입력!!!");
                     document.joinform.u_id.focus();
                     return false;
                  }
               }
            }
         }
         
         chk_list="u_id="+str+"\n";
         //아이디 입력시 체크하는 부분
         //비밀번호 체크
         if(document.joinform.u_pw.value=="") {
            alert("비밀번호를 입력하세요!!!");
            document.joinform.u_pw.focus();
            return false;
         } else {
            str=document.joinform.u_pw.value;
            if(str.length<6 || str.length>12) {
               alert("비밀번호 길이를 확인하세요(6~12자리)!!!");
               document.joinform.u_pw.focus();
               return false;
            } else{
               for(i=0;i<str.length;i++) {
                  ch=str.substring(i,i+1);
                  if(!((ch>="0" && ch<="9")||(ch>="a" && ch<="z") ||(ch>="A" && ch<="z"))) {
                  alert("특수문자가 포함되어있습니다, 다시입력해주세요!!");
                  document.joinform.u_pw.focus();
                  return false;
                  }
               }
            }
         }
         
         if(document.joinform.u_pw.value != document.joinform.u_pw2.value) {
            alert("비밀번호가 일치하지 않습니다 다시 확인해주세요!!!");
            document.joinform.u_pw2.focus();
            return false;
         }
         
         chk_list +="u_pw="+str+"\n";
         
         var u_birth = document.joinform.u_birth;
         
         if( !birthExp.test( u_birth.value ) ) {
            alert("생년월일은 숫자만 8자리 입력가능합니다");
            u_birth.value = "";
            u_birth.focus();
            return false;
         }
         
         // 이메일 인증 여부
         if( !emailAuthFlag ) {
            alert("이메일 인증을 완료해야합니다");
            return;
         }
         
         joinform.submit();
      }
      
      $(function(){
      //아이디 중복체크
          $('#u_id').blur(function(){
              $.ajax({
              type:"post",
              url:"checkid.bo",
              data:{ "u_id":$('#u_id').val()},
              success:function(data){   //data : checkSignup에서 넘겨준 결과값
                     if($.trim(data)=="YES"){
                        if($('#u_id').val()!==''){
                           alert("사용가능한 아이디입니다.");
                        }
                       }else{
                        if($('#u_id').val()!==''){
                           alert("이미 회원 가입된 아이디입니다.");
                           $('#u_id').val('');
                           $('#u_id').focus();
                        }
                     }
                  },
             }) 
           })
      });
      
      function sendMail() {
         
         var mail1 =$("input[name='u_email']").val();
         
         var mail2 = $('select[name="u_email"] option:selected').val();
         
         /* 
            jquery 선택자
            # = 태그의 id에 해당하는 html 가져옴 / 유니크한 값으로 한개의 정보만 가져옴
            . = 태그의  class에 해당하는 html 가져옴 / 중복사용이 가능하므로 배열 형식으로 선택가능
            ( 나머지 선택자들은 구굴링 )
         */
         
         // 이렇게 해야 먹음
         
         if(mail1 == "" || mail1 == null){
            alert("메일주소가 입력되지 않았습니다.");
            return;
         }else if(mail2 == "" || mail2 == null) {
            alert("메일주소를 선택해주세요");
            return;
         }
         
         var u_email = mail1+mail2;
         
         $.ajax({
            type:"post",
            url : 'checkemail.li',
            data:{
               u_email: u_email
            },
            success : function(data){
               alert(data);
               isCertification=true;
            },
            error : function () {
               alert("인증번호 전송도중 오류가 발생하였습니다");
            }
         });
         
      }
      
      // 메일 인증 function
      function checkAuthKey() {
         
         // 사용자 입력 인증키값
         var key = $("input[name='compare']").val();
         
         // null value 체크
         if( key == null || key == "" ) {
            alert("인증키를 입력해주세요");
            return;
         }
         
         $.ajax({
            type:"post",
            url : 'checkAuthKey.li',
            data:{
               key: key
            },
            success : function(data){
               
               if( data == "01" ) {
                  
                  // 인증키 일치 할때
                  alert("인증에 성공하였습니다");
                  
                  // 전역변수 아니면 cookie 로 인증 완료했는지 여부 저장해야함
                  emailAuthFlag = true;
                  
               } else {
                  // 인증키 불일치 할때
                  alert("인증키가 일치하지 않습니다");
                  emailAuthFlag = false;
               }
               
            },
            error : function () {
               alert("인증도중 오류가 발생하였습니다");
            }
         });   
      }
      
   </script>
   
</head>
<body>
<header class="header">
        <div class="header__top">
            <div class="container">
                <div class="row">
                    
                    <div class="col-lg-6 col-md-6"> </div>
                    <div class="col-md-6">
                        <div class="header__top__right">
                           <div class="header__top__right__auth">
                                <aa><a href="./loginForm.me">로그인 </a></aa>
                                <aa><a href="./joinForm.me"> 회원가입 </a></aa>
                            </div>
                            <!--로그인후 모드-->
                            <!--<div class="header__top__right__auth">
                                <a href="#"><i class="fa fa-user">맛나식육</i> </a>
                                <aa>사장님 !</aa>
                            </div>
                            -->
                        </div>
                    </div>
                   
                </div>
                
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col1"></div>
                <!--메인페이지 이미지 1400*380-->
                <div class="header__logo">
                    <a href="./index.html"><img src="resources/img/mainlogo.png" alt=""></a>
                </div>
                <div class="col1"></div>
            </div>
        <div>
        <div class="row">
                <div class="col-menu">
                </div>
            </div>
        </div>
        <div class="hero__search"> <!--기존의 hero서치바를 head로 옮김-->
            <div class="sidebar-icon"> 
                <input type="checkbox" id="menuicon">
                    <label for="menuicon">
                        <span></span>
                        <span></span>
                        <span></span>
                    </label>
                    <div class="sidebar">
                        <!--<div class="navibar">-->
                            <div class="sidebar__item">
                                <h4><ul><a href="#">&nbsp;</a></ul></h4>
                            </div>
                            <div class="sidebar__item">
                            <!--style="color: black"-->
                                <h4><ul><a href="#" >가게 검색</a></ul></h4>
                            </div>
                            <div class="sidebar__item">
                                <h4><ul><a href="#">후기 검색</a></ul></h4>
                            </div>
                            <div class="sidebar__item">
                                <h4><ul><a href="">마이 페이지</a></ul></h4>
                            </div>
                            <div class="sidebar__item">
                                <h4><ul><a href="#">예약 현황</a></ul></h4>
                            </div>
                            <!--사장님 모드-->
                            <!--
                            <div class="sidebar__item">
                                <h4><ul><a href="#">예약 관리</a></ul></h4>
                            </div>
                            -->
                            <!--사장님 모드 end-->
                               <!-- 사장님 메뉴
                                <ul><a href="#">가게 검색</a></ul>
                                <ul><a href="#">후기 검색</a></ul>
                                <ul><a href="#">마이 페이지</a></ul>
                                <ul><a href="#">가게 승인관리</a></ul>
                               -->
                           
                        <!--</div>-->
                </div>
            </div>   
            <div class="hero__search__form">
                <form action="#">
                    <div class="hero__search__categories">
                        지역
                        <span class="arrow_carrot-down"></span>
                    </div>
                    <input type="text" placeholder="식당검색하기 GO" >
                    <button type="submit" class="site-btn ">검색</button>
                </form>
            </div>
        </div>
    </header>
<form name="joinform" action="./joinProcess.me" method="post">
<!-- <center> -->
<table border=1 align="center">
   <tr>
      <td colspan="2" align=center>
         <b><font size=5>회원가입 페이지</font></b>
      </td>
   </tr>
   <tr><td>아이디 : </td><td><input type="text" id="u_id" name="u_id" style="width:250px;" placeholder="숫자와 영어를 포함 4~10자리내로 입력해주세요." /></td></tr>
   <tr><td>비밀번호 : </td><td><input type="password" name="u_pw" placeholder="숫자와 영어를 포함 6~12자리내로 입력해주세요."/></td></tr>
   <tr><td>비밀번호 확인 : </td><td><input type="password" name="u_pw2" placeholder="숫자와 영어를 포함 6~12자리내로 입력해주세요."/></td></tr>
   <tr><td>이름 : </td><td><input type="text" name="u_name"/></td></tr>
   <tr><td>닉네임 : </td><td><input type="text" name="u_nick"/></td></tr>
   <tr><td>생년월일 : </td><td><input type="text" name="u_birth" placeholder="19990120"/></td></tr>
   <tr><td>주소 : </td>
      <td><input type="text" id="u_post" name="u_post" placeholder="우편번호">
         <input type="button" onclick="execDaumPostcode()" value="우편번호찾기"><br>
         <input type="text" id="u_addr" name="u_addr" placeholder="주소">
         <input type="text" id="u_addr" name="u_addr" placeholder="상세주소"></td></tr>
   <tr><td>이메일 : </td><td><input type="text" name="u_email"/>@
   <select name="u_email">
   <option value="">메일주소선택</option>
   <option value="@naver.com">naver.com</option>
   <option value="@hanmail.net">hanmail.net</option>
   <option value="@daum.net">daum.net</option>
   <option value="@gmail.com">gmail.com</option>
   <option value="@nate.net">nate.net</option>
   </select>
   <input type="button" onclick="sendMail()" value="이메일 인증하기">
   <br>
   <input type="text" name="compare"><input type="button" onclick="checkAuthKey()" value="인증확인"/>
   <tr><td>전화번호 : </td><td><input type="text" name="u_phone"/></td></tr>
   <tr>
      <!--  <td>약관동의 : </td>
      <td>
         <input type="radio" name="u_agree" value="1" checked/>동의
         <input type="radio" name="u_agree" value="0"/>비동의
      </td>
   </tr>-->
      <tr>
      <td>판매자식별 : </td>
      <td>
         <input type="radio" name="seller_key" value="1" checked/>판매자
         <input type="radio" name="seller_key" value="0"/>일반
      </td>
   </tr>
   <tr>
      <td colspan="2" align=center>
         <a href="#" onclick="check_input()">회원가입</a>&nbsp;&nbsp;
         <a href="javascript:joinform.reset()">다시작성</a>
      </td>
   </tr>
</table>
<!-- </center> -->
</form>
   <footer class="footer spad" style="margin-top: 100px;">
        <div class="container">
            <div class="row1">
                <div class="col-lg-3 col-md-6 col-sm-6">
                    <div class="footer__about">
                        <div class="footer__about__logo">
                            <!--logo크기 120*50-->
                            <a href="./index.html"><img src="resources/img/bottom-logo-test1.jpg" alt=""></a>
                        </div>
                  <ul>
                            <li>법인명(상호) : 주식회사 고기당 </li>
                            <li>사업자등록번호 000-00-0000</li>
                            <li>통신판매업: 제2020-서울종로-00000&nbsp;</li>
                            <li>&nbsp;대표이사 : 정수빈</li>
                            <li>개인정보 보호 책임자 : 임도형, 고종우</li>
                            
                        </ul>
                    </div>
                </div>
                <div class="vertical-line">
                    &nbsp;
                    &nbsp;
                    &nbsp;
                </div>
                <!--<div class="col-lg-4 col-md-6 col-sm-6 offset-lg-1">
                    <div class="footer__widget">
                        <h6>Links</h6>
                        <ul>
                            <li>입점문의 : <a href="#">입점문의하기</a></li>
                            <li><a href="#">About Our Shop</a></li>
                            <li><a href="#">Secure Shopping</a></li>
                            <li><a href="#">Delivery infomation</a></li>
                            <li><a href="#">Privacy Policy</a></li>
                            <li><a href="#">Our Sitemap</a></li>
                        </ul>
                        <ul>
                            <li><a href="#">Who We Are</a></li>
                            <li><a href="#">Our Services</a></li>
                            <li><a href="#">Projects</a></li>
                            <li><a href="#">Contact</a></li>
                            <li><a href="#">Innovation</a></li>
                            <li><a href="#">Testimonials</a></li>
                        </ul>
                    </div>
                </div>
                -->
                <div class="col-lg-3 col-md-6 col-sm-6">
                    <div class="footer__widget">
                        <h6></h6>
                        <h6>&lt; 입점 문의 하기 &gt;</h6>
                        <h6>함께 하실 탁월한 사장님들을 기다립니다.</h6>
                        <p><a href="#"> &gt;&gt; 지금 바로 입점 신청하기 &lt;&lt; </a></p>
                        <!--
                        <form action="#">
                            <input type="text" placeholder="Enter your mail">
                            <button type="submit" class="site-btn">Subscribe</button>
                        </form>
                        -->
                        <div class="footer__widget__social">
                            <a href="#"><i class="fa fa-facebook"></i></a>
                            <a href="#"><i class="fa fa-instagram"></i></a>
                            <a href="#"><i class="fa fa-twitter"></i></a>
                            <a href="#"><i class="fa fa-pinterest"></i></a>
                        </div>
                    </div>
                </div>
            </div> <!--row1 end-->
            <div class="row">
                <div class="col-lg-12">
                    <div class="footer__copyright">
                        <div class="footer__copyright__text"><p>
                        <!--<div class="footer__copyright__payment"><img src="img/payment-item.png" alt=""></div>-->
                    </div>
                </div>
            </div>
            </div>
        </div>
    </footer> 
</body>
</html>