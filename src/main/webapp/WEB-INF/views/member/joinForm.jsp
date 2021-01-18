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
	   
		var birthExp = /^\d{8}$/;
	
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
		
		joinform.submit();
	}
	
	$(function(){
		//아이디 중복체크
		    $('#u_id').blur(function(){
		        $.ajax({
			     type:"post",
			     url:"checkid.bo",
			     data:{ "u_id":$('#u_id').val()},
			     success:function(data){	//data : checkSignup에서 넘겨준 결과값
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
	</script>
	
</head>
<body>
<form name="joinform" action="./joinProcess.me" method="post">
<center>
<table border=1>
	<tr>
		<td colspan="2" align=center>
			<b><font size=5>회원가입 페이지</font></b>
		</td>
	</tr>
	<tr><td>아이디 : </td><td><input type="text" id="u_id" name="u_id" placeholder="숫자와 영어를 포함한 4~10자리내로 입력해주세요." /></td></tr>
	<tr><td>비밀번호 : </td><td><input type="password" name="u_pw" placeholder="숫자와 영어를 포함한 6~12자리내로 입력해주세요."/></td></tr>
	<tr><td>비밀번호 확인 : </td><td><input type="password" name="u_pw2" placeholder="숫자와 영어를 포함한 6~12자리내로 입력해주세요."/></td></tr>
	<tr><td>이름 : </td><td><input type="text" name="u_name"/></td></tr>
	<tr><td>닉네임 : </td><td><input type="text" name="u_nick"/></td></tr>
	<tr><td>생년월일 : </td><td><input type="text" name="u_birth"/></td></tr>
	<tr><td>주소 : </td>
		<td><input type="text" id="u_post" name="u_post" placeholder="우편번호">
			<input type="button" onclick="execDaumPostcode()" value="우편번호찾기"><br>
			<input type="text" id="u_addr" name="u_addr" placeholder="주소">
			<input type="text" id="u_addr" name="u_addr" placeholder="상세주소"></td></tr>
	<tr><td>이메일 : </td><td><input type="text" name="u_email"/></td></tr>
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
</center>
</form>
</body>
</html>