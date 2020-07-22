<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>관심상품</title>
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
	<script src='https://kit.fontawesome.com/a076d05399.js'></script>
	<style type="text/css">
		.portfolio-links{
			display: flex;
			flex-direction: row;
		}
	</style>
</head>
<body>
	<jsp:include page="../common/mainBar.jsp"></jsp:include>
	<section id="portfolio" class="portfolio section-bg">
		<div class="container" data-aos="fade-up" data-aos-delay="100">
			<div class="row portfolio-container">
				<c:forEach var="Product" items="${pList}" varStatus="i">
					<div class="col-lg-4 col-md-6 portfolio-item filter-app">
						<div class="portfolio-wrap">
							<img src="/resources/images/productImg/${Product.productMainName}" class="img-fluid" width="350px">
							<div class="portfolio-info">
								<h4>상품명 : ${Product.productName }</h4>
								<p>가격 : <fmt:setLocale value="ko_KR"/><fmt:formatNumber type="currency" value="${Product.productPrice}"/></p>
								<p>조회수 : ${Product.productShowCnt}</p>
								<p id="fCnt${Product.productNum}">좋아요 : ${Product.fCnt}</p>
								<div class="portfolio-links">
									<a href="/resources/images/productImg/${Product.productMainName}"
										data-gall="portfolioGallery" class="venobox">
										<i class="icofont-eye"></i></a> 
									<a href="ProductDetailView.do?pNum=${Product.productNum}" title="More Details">
										<i class="icofont-external-link"></i></a>
									<a href="javascript:chg(${Product.productNum})">
										<i class='fas fa-star' style='font-size:20px' id="icon${Product.productNum}"></i></a>
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
					<c:url var="before" value="myFavoriteList.do">
						<c:param name="page" value="${pi.currentPage - 1 }" />
					</c:url>
					<a href="${before }">[이전]</a> &nbsp;
				</c:if> <!-- 페이지 --> <c:forEach var="p" begin="${pi.startPage }"
					end="${pi.endPage }">
					<c:if test="${p eq currentPage }">
						<font color="red" size="4"><b>[${p }]</b></font>
					</c:if>
					<c:if test="${p ne currentPage }">
						<c:url var="pagenation" value="myFavoriteList.do">
							<c:param name="page" value="${p }" />
						</c:url>
						<a href="${pagenation }">${p }</a> &nbsp;
					</c:if>
				</c:forEach> <!-- [다음] --> <c:if test="${pi.currentPage >= pi.maxPage }">
					[다음] &nbsp;
				</c:if> <c:if test="${pi. currentPage < pi.maxPage }">
					<c:url var="after" value="myFavoriteList.do">
						<c:param name="page" value="${pi.currentPage + 1 }" />
					</c:url>
					<a href="${after }">[다음]</a> &nbsp;
				</c:if></div>
		</div>
	</section>
	<jsp:include page="../common/footer.jsp"></jsp:include>
	<script type="text/javascript">
		function chg(num) {			
			var url = "";
			if($("#icon"+num)[0].className == "fas fa-star"){
				url = "/deleteFavorite.do?page=${pi.currentPage}&pNum="+num;
			}else if($("#icon"+num)[0].className == "far fa-star"){
				url = "/insertFavorite.do?page=${pi.currentPage}&pNum="+num;
			}
			
			$.ajax({
				url : url,
				type : "get",
				success : function(data) {
					$("#icon"+num)[0].className = data.src;
					$("#fCnt"+num)[0].innerHTML = "좋아요 : " + data.cnt;
				},
				error : function() {
					console.log("실패");
				}
			}); 
		}
	</script>
</body>
</html>