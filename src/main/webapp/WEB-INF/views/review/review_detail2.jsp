<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.spring.gogidang.domain.*" %>
<%@include file="../includes/header_simple.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>


<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/review_import.css"
	type="text/css">
	

<div class="section-title product__discount__title" style="display : flex; justify-content : center; aligin-items : center; margin-top : 10px;">
								<h2>리뷰작성</h2>
							</div>

<div class="container-fluid" style="padding-right : 400px; padding-left : 400px;">
	<div class="row" style="display : flex; aligin-items : center; justify-content : center;">
		<div class="col-md-12">
				<div class="modal-textbox-s" style="display : flex; justify-content : center; aligin-items : center; margin-top : 50px; margin-bottom : 30px;">
				    	<ts for="star">별점</ts>
				    	<td>
				    		<input type="radio" id="star" name="star" value="1" style="width:40px;">1
				    		<input type="radio" id="star" name="star" value="2" style="width:40px;">2
				    		<input type="radio" id="star" name="star" value="3" style="width:40px;">3
				    		<input type="radio" id="star" name="star" value="4" style="width:40px;">4
				    		<input type="radio" id="star" name="star" value="5" style="width:40px;">5
			    		</td>
				    </div>
			    </div>
			
			<form role="form">
			
			<div class="form-group">
					 
					<label for="pic">
						사진
					</label>
					<input type="pic" class="form-control" id="pic" />
				</div>
				
				<div class="form-group">
					 
					<label for="exampleInputFile">
						파일첨부
					</label>
					<input type="file" class="form-control-file cc_cursor" id="exampleInputFile" />
					<p class="help-block">
						리뷰사진을 올려주세요.
					</p>
				</div>
			
				<div class="form-group">
					 
					<label for="title">
						제목
					</label>
					<input type="title" class="form-control" id="title" />
				</div>
				
					
					<div class="form-group">
					 
					<label for="content">
						내용
					</label>
					<textarea type="content" class="form-control" id="content" style="height : 250px;"></textarea>
				</div>
				<button type="submit" class="btn btn-primary"style="background-color : #7fad39; border : 0px;" >
					작성
				</button>
			</form>
		</div>
	</div>

		<%@include file="../includes/footer.jsp"%>