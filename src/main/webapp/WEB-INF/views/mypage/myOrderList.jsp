<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>내 구매 내역</title>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
		integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
		integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
		crossorigin="anonymous"></script>
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
</head>
<body>
	<jsp:include page="../common/mainBar.jsp"></jsp:include>
	<section id="portfolio" class="portfolio section-bg">
		<div class="container" data-aos="fade-up" data-aos-delay="100">
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
				<c:forEach var="orderInfo" items="${oList}" varStatus="i">
					<div class="col-lg-4 col-md-6 portfolio-item filter-app">
						<div class="portfolio-wrap">
							<img src="${orderInfo.thumbNailFile}" class="img-fluid"	width="350px">
							<div class="portfolio-info">
								<h4>${orderInfo.productName}</h4>
								<p>${orderInfo.statusName}</p>
								<p><fmt:setLocale value="ko_KR"/><fmt:formatNumber type="currency" value="${orderInfo.totalPrice}"/></p>
								<div class="portfolio-links">
									<a href="${orderInfo.thumbNailFile}"
										data-gall="portfolioGallery" class="venobox" title="App 1"><i
										class="icofont-eye"></i></a> <a href="portfolio-details.html"
										title="More Details"><i class="icofont-external-link"></i></a>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
			<div align="center">
				<c:if test="${pi.currentPage <= 1 }">
					[이전] &nbsp;
				</c:if> <c:if test="${pi. currentPage > 1 }">
					<c:url var="before" value="myOrderList.do">
						<c:param name="page" value="${pi.currentPage - 1 }" />
					</c:url>
					<a href="${before }">[이전]</a> &nbsp;
				</c:if> <!-- 페이지 --> <c:forEach var="p" begin="${pi.startPage }"
					end="${pi.endPage }">
					<c:if test="${p eq currentPage }">
						<font color="red" size="4"><b>[${p }]</b></font>
					</c:if>
					<c:if test="${p ne currentPage }">
						<c:url var="pagenation" value="myOrderList.do">
							<c:param name="page" value="${p }" />
						</c:url>
						<a href="${pagenation }">${p }</a> &nbsp;
					</c:if>
				</c:forEach> <!-- [다음] --> <c:if test="${pi.currentPage >= pi.maxPage }">
					[다음] &nbsp;
				</c:if> <c:if test="${pi. currentPage < pi.maxPage }">
					<c:url var="after" value="myOrderList.do">
						<c:param name="page" value="${pi.currentPage + 1 }" />
					</c:url>
					<a href="${after }">[다음]</a> &nbsp;
				</c:if></div>
		</div>
	</section>
	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>