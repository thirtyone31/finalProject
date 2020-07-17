<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>템플릿</title>
<link rel="icon" type="image/x-icon" href="assets/img/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.13.0/js/all.js"
	crossorigin="anonymous"></script>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css" />
<link
	href="https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic"
	rel="stylesheet" type="text/css" />
<link
	href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700"
	rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="resources/css/styles.css" rel="stylesheet" />
<meta charset="UTF-8">
<title>Summernote</title>
 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
<meta charset="utf-8">
<title>A Simple Page with CKEditor 4</title>
<!-- Make sure the path to CKEditor is correct. -->
<script src="//cdn.ckeditor.com/4.14.1/full/ckeditor.js"></script>
<script src="../ckeditor.js"></script>
</head>

<body id="page-top">
	
	<br>
	<br>
	<!-- 메인 콘텐츠-->
	<section class="page-section bg-light" id="portfolio">
		<div class="container">
			<!--메인 콘텐츠 위치-->
			<div class="row">
				<!--아이콘 위치-->
				<div class="col-1">
					<span class="h2"> <!--아이콘 코드 넣는곳--> <svg
							class="bi bi-pencil-square" width="1em" height="1em"
							viewBox="0 0 16 16" fill="currentColor"
							xmlns="http://www.w3.org/2000/svg">
                            <path
								d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456l-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z" />
                            <path fill-rule="evenodd"
								d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z" />
                        </svg>
					</span>
				</div>
				<!--제목 위치-->
				<div class="col-11">
					<span class="h2">고객센터 글 작성</span>
				</div>
			</div>
			<hr>
			<br>
			<!--콘텐츠 페이지 내용 위치-->
			<div>


				
				<br>
				<form action="nupdate.do" method="post" >
				<div class="select" width="200px">
					<select class="custom-select mr-sm-2" id="inlineFormCustomSelect" name="nCategory"
						style="width: 110px; height: 35px;" <c:if test="${loginUser.userId != notice.nWriter}">disabled</c:if> >
						<%-- ${loginUser.userId == 'admin'}유저가 관리자인지 비교하고 맞으면 disabled를 실행한다  --%>
						<option value="1" <c:if test="${notice.nCategory == 1 }">selected</c:if>  >건의사항</option>
						<option value="2" <c:if test="${notice.nCategory == 2 }">selected</c:if>>신고</option>
						<option value="3" <c:if test="${notice.nCategory == 3 }">selected</c:if>>질문하기</option>

					</select>
				</div>
				<div class="select" width="200px">
					<select class="custom-select mr-sm-2" id="inlineFormCustomSelect" name="prgress"
						style="width: 110px; height: 35px;" <c:if test="${loginUser.userId != 'admin'}">disabled</c:if> >
						<%-- ${loginUser.userId == 'admin'}유저가 관리자인지 비교하고 맞으면 disabled를 실행한다  --%>
						<option value="1" <c:if test="${notice.prgress == 1 }">selected</c:if>  >진행상황</option>
						<option value="2" <c:if test="${notice.prgress == 2 }">selected</c:if>>처리중</option>
						<option value="3" <c:if test="${notice.prgress == 3 }">selected</c:if>>완료</option>

					</select>
				</div>
					<input type="hidden" name="nId" value="${notice.nId}"> 
				
					<div class="form-group">
						<input type="text" name="nWriter" value="${loginUser.userId }" readonly>
							
					</div>
					<div class="form-group">
						<input type="text" name="nTitle" class="form-control" value="${notice.nTitle}"
							id="exampleFormControlInput1" placeholder="글 제목이 표시되는 부분입니다.">
					</div>
					<div class="form-group">
						<input type="file" id="Image" name="uploadFile">
						<c:set var="nContent" value="${fn:replace(notice.nContent,'<br>','')}"/>
						<textarea name="nContent" id="editor1" rows="10" cols="80">
             			  ${nContent} 
           				 </textarea>

						<script>
						$(function(){
							CKEDITOR.replace('editor1',{
								filebrowserUploadUrl: '${pageContext.request.contextPath}/fileupload.do'
							});
						});
						</script>
					</div>
					<input type="submit" value="수정">
					
				</form>
				<p align="center">
		<c:url var="home" value="home.do" />
		<a href="${ home }">Home</a>&nbsp;
		<c:url var="nlist" value="nlist.do" />
		<a href="${ nlist }">목록</a>
		<!-- web에서 패킷이 전송될 때 그 패킷의 구조를 보면
		header와 body로 나누어져 있습니다.
		header에 다양한 정보가 포함되어있는데 예를 들어 user-agent(브라우저)
		referer(이전 페이지) 들이 있습니다 -->
		<c:url var="back" value="${header.referer} " />
		<a href="${back}">이전</a>
	</p>
			</div>




			<br>
		</div>
		<div>

			<br>
		</div>
		</div>
	</section>

	<!-- Footer-->
	<footer>
		<div class="text-center">
			<ul class="nav list-group-horizontal justify-content-center">
				<li class="nav-item"><a class="nav-link active" href="#"
					style="color: black;">이용약관</a></li>
				<li class="nav-item"><a class="nav-link active" href="#"
					style="color: black;">개인정보처리방침</a></li>
				<li class="nav-item"><a class="nav-link active" href="#"
					style="color: black;">책임의 한계와 법적고지</a></li>
				<li class="nav-item"><a class="nav-link active" href="#"
					style="color: black;">회원정보 고객센터</a></li>
			</ul>
			<span class="align-middle">스펀딩 Copyright 스펀딩 corp.All Rights
				Reserved.</span>

		</div>
	</footer>


	<!-- Bootstrap core JS-->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js"></script>
	<!-- Third party plugin JS-->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
	<!-- Contact form JS-->
	<script src="assets/mail/jqBootstrapValidation.js"></script>
	<script src="assets/mail/contact_me.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
</body>
</html>