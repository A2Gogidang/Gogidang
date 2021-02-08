<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.spring.gogidang.domain.*"%>
<%@ page import="java.util.ArrayList"%>
<%@include file="../includes/header_simple.jsp"%>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/loginstyle.css"
	type="text/css">


<div class="container" id="login">
	<div class="row justify-content-center">
		<div class="col-lg-8">
			<div class="login">

				<h1>Login</h1>

				<!-- Login form -->
				<form name="loginForm" action="./login.me" method="post">
					<div class="form-group">
						<input type="text" class="form-control" name="u_id"
							aria-describedby="id" placeholder="Enter id">
					</div>
					<div class="form-group">
						<input type="password" class="form-control" name="u_pw"
							placeholder="Password">
					</div>
					<br>
					<div class="form-checkkk">

						<button type="submit" class="btn btn-lg btn-block btn-success">로그인</button>
						<button type="button" class="btn-j btn-lg btn-block btn-success"
							onClick="location.href='./joinForm.me'">회원가입</button>
						<br>
					</div>
				</form>
				<!-- End Login form -->

			</div>
		</div>
	</div>
</div>

<%@include file="../includes/footer.jsp"%>
