
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@include file="../includes/header.jsp"%>
<%@ page import="com.spring.gogidang.domain.*"%>
<%
	MemberVO memberVO = (MemberVO) session.getAttribute("memberVO");
	QnaVO qna = (QnaVO)request.getAttribute("qna");
%>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/qna_view.css"
	type="text/css">
<!DOCTYPE html>

<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
	<script language="javascript">
	
	function addboard(){
		qnaform.submit();
	}
	</script>
</head>
<body><section class="product spad">
	<div class="container">
		<div class="row">
			<div class="qnaboards">
				<div class="col-lg-3" id="nav-bar">
		            <div class="hero__categories">
		                  <div class="hero__categories__all">
		                  	<span>문의 게시판</span>
		                  	</div>
								<ul>
									<li><a href="eventList.ev">이벤트</a></li>
									<li><a href="noticelist.no">공지사항</a></li>
									<li><a href="qnalist.qn">문의</a></li>
									<!--<li><a href="#">Fastfood</a></li>
			                            <li><a href="#">Fresh Onion</a></li>
			                            <li><a href="#">Papayaya & Crisps</a></li>
			                             <li><a href="#">Oatmeal</a></li>
			                            <li><a href="#">Fresh Bananas</a></li> -->
								</ul>
						</div>
					</div>
				<div class="col-lg-9">
					<div class="section-title product__discount__title">
						<h2>문의 게시판</h2>
					</div>
					
					<form action="./qnawrite.qn" method="post" name="qnaform">
							<input type="hidden" name="u_id" value="<%=memberVO.getU_id() %>">
							<div class="qnaboardsl">
									<div class="id_input_box">
										<ts>
											글쓴이
										</ts>
										<td>
											<%=memberVO.getU_id() %>
										</td>
									</div>
									<div class="id_input_box_t">
										<ts>
											제 목
										</ts>
										<td>
										<input name="title" type="text" size="50" value="<%=qna.getTitle()%>" readonly/>
										</td>
									</div>	
									<div class="id_input_box">
										<ts>
											내 용
										</ts>
										<td>
										<textarea readonly><%=qna.getContent()%></textarea>
										</td>
										</div>
									</div>
									<div class="join_btns">
										<%if(memberVO.getU_id()!=null && memberVO.getU_id().equals("admin")){%>
									<div class="join_btn">
                     				<button type="submit"  class="btn-jj btn-lg btn-block btn-success" onclick="location.href='./qnareplyform.qn?qna_num=<%=qna.getQna_num()%>'" multiple>답변</button>
                     				</div>
                     				<%}else{ %>
								<div class="join_btn">
                                    <button type="button" class="btn-jj btn-lg btn-block btn-success" onClick="history.go(-1)">목록</button>
                              </div>
                              <%} %>
                              </div>	
								</form>
								</div>
								
								<!-- <div class="qnawbtn">
									<div class="id_input_box_b">
											<button type="submit" class="btn-jj btn-lg btn-block btn-success" onclick='addboard()'>등록</button>
											<button type="reset" class="btn-j btn-lg btn-block btn-success" onclick='history.go(-1)'>뒤로</button>
									</div>
								</div>	 -->
							</div>
						</div>
					</div>
				
			</section>
			

<!-- 게시판 등록 -->
<%@include file="../includes/footer.jsp"%>