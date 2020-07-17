<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>어부바 메인페이지</title>
<meta content="" name="descriptison">
<meta content="낚시, 구매, 상품" name="keywords">


<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,600,600i,700,700i,900"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="assets/vendor/icofont/icofont.min.css" rel="stylesheet">
<link href="assets/vendor/boxicons/css/boxicons.min.css"
	rel="stylesheet">
<link href="assets/vendor/animate.css/animate.min.css" rel="stylesheet">
<link href="assets/vendor/venobox/venobox.css" rel="stylesheet">
<link href="assets/vendor/owl.carousel/assets/owl.carousel.min.css"
	rel="stylesheet">
<link href="assets/vendor/aos/aos.css" rel="stylesheet">

<!-- Template Main CSS File -->
<link href="assets/css/style.css" rel="stylesheet">

<!-- =======================================================
  * Template Name: Mamba - v2.3.0
  * Template URL: https://bootstrapmade.com/mamba-one-page-bootstrap-template-free/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>

<body>

	<!-- ======= Header ======= -->
	<header id="header">
		<div class="container">

			<div class="logo float-left">
				<h1 class="text-light">
					<a href="/"><span>어부바 ${loginInfo.memberName }</span></a>
				</h1>
				<!-- Uncomment below if you prefer to use an image logo -->
				<!-- <a href="index.html"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->
			</div>
			<c:url var="nlist" value="nlist.do"/>
			
			<nav class="nav-menu float-right d-none d-lg-block">
				<ul>
					<li class="active"><a href="index.html">홈</a></li>
					<li class="drop-down"><a href="">낚시용품</a>
						<ul>
							<li><a href="#">Drop Down 1</a></li>
							<li class="drop-down"><a href="#">Drop Down 2</a>
								<ul>
									<li><a href="#">Deep Drop Down 1</a></li>
									<li><a href="#">Deep Drop Down 2</a></li>
									<li><a href="#">Deep Drop Down 3</a></li>
									<li><a href="#">Deep Drop Down 4</a></li>
									<li><a href="#">Deep Drop Down 5</a></li>
								</ul></li>
							<li><a href="#">Drop Down 3</a></li>
							<li><a href="#">Drop Down 4</a></li>
							<li><a href="#">Drop Down 5</a></li>
						</ul></li>

					<li><a href="#services">커뮤니티</a></li>
					<li><a href="#portfolio">자유게시판</a></li>			
					<li><a href="${nlist }">고객센터</a></li>
					
					<c:if test="${ !empty sessionScope.loginInfo }">
						<li class="drop-down"><a href="">마이페이지</a>
							<ul>
								<li><a href="myWriteList.do">내가 쓴 게시물</a></li>
								<li><a href="myOrderList.do">구매내역</a></li>
								<li><a href="#">장바구니</a></li>
								<li><a href="#">관심상품</a></li>
							</ul>
						</li>
					</c:if>
					<c:if test="${ empty sessionScope.loginInfo }">
						<li><a href="#" onclick="open_pop();">로그인/회원가입</a></li>
					</c:if>
					<c:url var="logout" value="logout.me"></c:url>
					<c:if test="${ !empty sessionScope.loginInfo }">
						<li><a href=${logout }>${loginInfo.memberName }님/로그아웃</a></li>
					</c:if>

				</ul>
			</nav>
			<!-- .nav-menu -->

			<script type="text/javascript">
      function open_pop() {
           var width = 350, height = 600;
           var popupX = (document.body.offsetWidth / 2) - (width / 2);
           //&nbsp;만들 팝업창 좌우 크기의 1/2 만큼 보정값으로 빼주었음

           var popupY= (window.screen.height / 2) - (height / 2);
           //&nbsp;만들 팝업창 상하 크기의 1/2 만큼 보정값으로 빼주었음
              
           var url = "loginMain.me";
           var option = "width = " + width + ", height = " + height +", "
                       + "top = "+ popupY + ", left = " + popupX + ", location = no, resizable=no";
           var title = "login";
           console.log(url);
           window.open(url, title, option);
      }
      </script>


		</div>
	</header>
	<!-- End Header -->