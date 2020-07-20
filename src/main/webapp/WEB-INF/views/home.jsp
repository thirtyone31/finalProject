<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<style type="text/css">

/* .fixed-area {
	position: fixed;
	z-index: 1000;
} */
</style>
</head>

<body>

	<jsp:include page="common/mainBar.jsp"></jsp:include>
	
	<!-- ======= Hero Section ======= -->
	<section id="hero">
		<div class="hero-container">
			<div id="heroCarousel" class="carousel slide carousel-fade"
				data-ride="carousel">

				<ol class="carousel-indicators" id="hero-carousel-indicators"></ol>

				<div class="carousel-inner" role="listbox">

					<!-- Slide 1 -->
					<div class="carousel-item active"
						style="background-image: url('assets/img/slide/slide-1.jpg');">
						<div class="carousel-container">
							<div class="carousel-content container">
								<h2 class="animate__animated animate__fadeInDown">
									제목제목제목제목제목 <span></span>
								</h2>
								<p class="animate__animated animate__fadeInUp">소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글
								</p>
								<a href="#about"
									class="btn-get-started animate__animated animate__fadeInUp scrollto">더보기</a>
							</div>
						</div>
					</div>

					<!-- Slide 2 -->
					<div class="carousel-item"
						style="background-image: url('assets/img/slide/slide-2.jpg');">
						<div class="carousel-container">
							<div class="carousel-content container">
								<h2 class="animate__animated animate__fadeInDown">제목제목제목제목제목</h2>
								<p class="animate__animated animate__fadeInUp">소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글</p>
								<a href="#about"
									class="btn-get-started animate__animated animate__fadeInUp scrollto">더보기</a>
							</div>
						</div>
					</div>

					<!-- Slide 3 -->
					<div class="carousel-item"
						style="background-image: url('assets/img/slide/slide-3.jpg');">
						<div class="carousel-container">
							<div class="carousel-content container">
								<h2 class="animate__animated animate__fadeInDown">제목제목제목제목제목</h2>
								<p class="animate__animated animate__fadeInUp">소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글</p>
								<a href="#about"
									class="btn-get-started animate__animated animate__fadeInUp scrollto">쇼핑하러가기</a>
							</div>
						</div>
					</div>

				</div>

				<a class="carousel-control-prev" href="#heroCarousel" role="button"
					data-slide="prev"> <span
					class="carousel-control-prev-icon icofont-rounded-left"
					aria-hidden="true"></span> <span class="sr-only">Previous</span>
				</a> <a class="carousel-control-next" href="#heroCarousel" role="button"
					data-slide="next"> <span
					class="carousel-control-next-icon icofont-rounded-right"
					aria-hidden="true"></span> <span class="sr-only">Next</span>
				</a>

			</div>
		</div>
	</section>
	<!-- End Hero -->

	<main id="main"> <!-- ======= Our Portfolio Section ======= -->
	<section id="portfolio" class="portfolio section-bg">
		<div class="container" data-aos="fade-up" data-aos-delay="100">

			<div class="section-title">
				<h2>낚시용품</h2>
				<p>빠르게 만나보는 낚시용품</p>
			</div>

			<div class="row">
				<div class="col-lg-12">
					<ul id="portfolio-flters">
						<li data-filter="*" class="filter-active">전체보기</li>
						<li data-filter=".filter-fishingRod">낚시대</li>
						<li data-filter=".filter-card">가방/아이스박스</li>
						<li data-filter=".filter-web">의류</li>
						<li data-filter=".filter-web">채비</li>
						<li data-filter=".filter-line">라인</li>
					</ul>
				</div>
			</div>

			<div class="row portfolio-container">

				<div class="col-lg-4 col-md-6 portfolio-item filter-app">
					<div class="portfolio-wrap">
						<img src="assets/img/portfolio/portfolio-1.jpg" class="img-fluid"
							alt="">
						<div class="portfolio-info">
							<h4>App 1</h4>
							<p>App</p>
							<div class="portfolio-links">
								<a href="assets/img/portfolio/portfolio-1.jpg"
									data-gall="portfolioGallery" class="venobox" title="App 1"><i
									class="icofont-eye"></i></a> <a href="portfolio-details.html"
									title="More Details"><i class="icofont-external-link"></i></a>
							</div>
						</div>
					</div>
				</div>

				<div class="col-lg-4 col-md-6 portfolio-item filter-web">
					<div class="portfolio-wrap">
						<img src="assets/img/portfolio/portfolio-2.jpg" class="img-fluid"
							alt="">
						<div class="portfolio-info">
							<h4>Web 3</h4>
							<p>Web</p>
							<div class="portfolio-links">
								<a href="assets/img/portfolio/portfolio-2.jpg"
									data-gall="portfolioGallery" class="venobox" title="Web 3"><i
									class="icofont-eye"></i></a> <a href="portfolio-details.html"
									title="More Details"><i class="icofont-external-link"></i></a>
							</div>
						</div>
					</div>
				</div>

				<div class="col-lg-4 col-md-6 portfolio-item filter-app">
					<div class="portfolio-wrap">
						<img src="assets/img/portfolio/portfolio-3.jpg" class="img-fluid"
							alt="">
						<div class="portfolio-info">
							<h4>App 2</h4>
							<p>App</p>
							<div class="portfolio-links">
								<a href="assets/img/portfolio/portfolio-3.jpg"
									data-gall="portfolioGallery" class="venobox" title="App 2"><i
									class="icofont-eye"></i></a> <a href="portfolio-details.html"
									title="More Details"><i class="icofont-external-link"></i></a>
							</div>
						</div>
					</div>
				</div>

				<div class="col-lg-4 col-md-6 portfolio-item filter-card">
					<div class="portfolio-wrap">
						<img src="assets/img/portfolio/portfolio-4.jpg" class="img-fluid"
							alt="">
						<div class="portfolio-info">
							<h4>Card 2</h4>
							<p>Card</p>
							<div class="portfolio-links">
								<a href="assets/img/portfolio/portfolio-4.jpg"
									data-gall="portfolioGallery" class="venobox" title="Card 2"><i
									class="icofont-eye"></i></a> <a href="portfolio-details.html"
									title="More Details"><i class="icofont-external-link"></i></a>
							</div>
						</div>
					</div>
				</div>

				<div class="col-lg-4 col-md-6 portfolio-item filter-web">
					<div class="portfolio-wrap">
						<img src="assets/img/portfolio/portfolio-5.jpg" class="img-fluid"
							alt="">
						<div class="portfolio-info">
							<h4>Web 2</h4>
							<p>Web</p>
							<div class="portfolio-links">
								<a href="assets/img/portfolio/portfolio-5.jpg"
									data-gall="portfolioGallery" class="venobox" title="Web 2"><i
									class="icofont-eye"></i></a> <a href="portfolio-details.html"
									title="More Details"><i class="icofont-external-link"></i></a>
							</div>
						</div>
					</div>
				</div>

				<div class="col-lg-4 col-md-6 portfolio-item filter-app">
					<div class="portfolio-wrap">
						<img src="assets/img/portfolio/portfolio-6.jpg" class="img-fluid"
							alt="">
						<div class="portfolio-info">
							<h4>App 3</h4>
							<p>App</p>
							<div class="portfolio-links">
								<a href="assets/img/portfolio/portfolio-6.jpg"
									data-gall="portfolioGallery" class="venobox" title="App 3"><i
									class="icofont-eye"></i></a> <a href="portfolio-details.html"
									title="More Details"><i class="icofont-external-link"></i></a>
							</div>
						</div>
					</div>
				</div>

				<div class="col-lg-4 col-md-6 portfolio-item filter-card">
					<div class="portfolio-wrap">
						<img src="assets/img/portfolio/portfolio-7.jpg" class="img-fluid"
							alt="">
						<div class="portfolio-info">
							<h4>Card 1</h4>
							<p>Card</p>
							<div class="portfolio-links">
								<a href="assets/img/portfolio/portfolio-7.jpg"
									data-gall="portfolioGallery" class="venobox" title="Card 1"><i
									class="icofont-eye"></i></a> <a href="portfolio-details.html"
									title="More Details"><i class="icofont-external-link"></i></a>
							</div>
						</div>
					</div>
				</div>

				<div class="col-lg-4 col-md-6 portfolio-item filter-card">
					<div class="portfolio-wrap">
						<img src="assets/img/portfolio/portfolio-8.jpg" class="img-fluid"
							alt="">
						<div class="portfolio-info">
							<h4>Card 3</h4>
							<p>Card</p>
							<div class="portfolio-links">
								<a href="assets/img/portfolio/portfolio-8.jpg"
									data-gall="portfolioGallery" class="venobox" title="Card 3"><i
									class="icofont-eye"></i></a> <a href="portfolio-details.html"
									title="More Details"><i class="icofont-external-link"></i></a>
							</div>
						</div>
					</div>
				</div>

				<div class="col-lg-4 col-md-6 portfolio-item filter-web">
					<div class="portfolio-wrap">
						<img src="assets/img/portfolio/portfolio-9.jpg" class="img-fluid"
							alt="">
						<div class="portfolio-info">
							<h4>Web 3</h4>
							<p>Web</p>
							<div class="portfolio-links">
								<a href="assets/img/portfolio/portfolio-9.jpg"
									data-gall="portfolioGallery" class="venobox" title="Web 3"><i
									class="icofont-eye"></i></a> <a href="portfolio-details.html"
									title="More Details"><i class="icofont-external-link"></i></a>
							</div>
						</div>
					</div>
				</div>

			</div>

		</div>
	</section>
	<!-- End Our Portfolio Section -->
	<!-- ======= Counts Section ======= -->
	<section class="counts section-bg">
		<div class="container">

			<div class="row">

				<div class="col-lg-3 col-md-6 text-center" data-aos="fade-up">
					<div class="count-box">
						<i class="icofont-simple-smile" style="color: #20b38e;"></i> <span
							data-toggle="counter-up">232</span>
						<p>어부바인</p>
					</div>
				</div>

				<div class="col-lg-3 col-md-6 text-center" data-aos="fade-up"
					data-aos-delay="200">
					<div class="count-box">
						<i class="icofont-document-folder" style="color: #c042ff;"></i> <span
							data-toggle="counter-up">521</span>
						<p>전국 낚시터</p>
					</div>
				</div>

				<div class="col-lg-3 col-md-6 text-center" data-aos="fade-up"
					data-aos-delay="400">
					<div class="count-box">
						<i class="icofont-live-support" style="color: #46d1ff;"></i> <span
							data-toggle="counter-up">1,463</span>
						<p>낚시용품점</p>
					</div>
				</div>

				<div class="col-lg-3 col-md-6 text-center" data-aos="fade-up"
					data-aos-delay="600">
					<div class="count-box">
						<i class="icofont-users-alt-5" style="color: #ffb459;"></i> <span
							data-toggle="counter-up">88,484</span>
						<p>낚시인</p>
					</div>
				</div>

			</div>
			<!-- <div class="row">
				<iframe class="fixed-area" src="map.do" width="100%" height="500px"></iframe>
			</div> -->
		</div>
	</section>
	<!-- End Counts Section -->
	</main>
	<!-- End #main -->

	<jsp:include page="common/footer.jsp"></jsp:include>

</body>
</html>