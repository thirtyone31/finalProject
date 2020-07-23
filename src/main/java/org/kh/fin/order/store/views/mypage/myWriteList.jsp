<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>내가 쓴 게시물</title>
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
<style type="text/css">
td {
	vertical-align: middle;
}
</style>
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
			<table align="center" id="tb" class="table table-hover">
				<thead>
					<tr>
						<th>카테고리</th>
						<th>썸네일</th>
						<th width="300">제목</th>
						<th>내용</th>
						<th>작성일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="wBoard" items="${wList}" varStatus="i">
						<tr>
							<td align="center"><c:choose>
									<c:when test="${wBoard.grpNum eq 1}">${wBoard.categoryName}</c:when>
									<c:when test="${wBoard.grpNum eq 2}">자유게시판</c:when>
									<c:when test="${wBoard.grpNum eq 3}">${wBoard.categoryName}</c:when>
								</c:choose></td>
							<td align="center"><c:if
									test="${!empty wBoard.thumbNailFile}">
									<img alt="" src="${wBoard.thumbNailFile}">
								</c:if> <c:if test="${empty wBoard.thumbNailFile}">
									<img alt="" src="/resources/images/common/thumbnail.svg">
								</c:if></td>
							<td align="left"><c:choose>
									<c:when test="${wBoard.grpNum eq 1}">${wBoard.title}</c:when>
									<c:when test="${wBoard.grpNum eq 2}">
										<c:url var="fdetail" value="fdetail.do">
											<c:param name="boardNo" value="${wBoard.boardNum}" />
										</c:url>
										<a href="${fdetail}">${wBoard.title}</a>
									</c:when>
									<c:when test="${wBoard.grpNum eq 3}">
										<c:url var="ndetail" value="ndetail.do">
											<c:param name="boardNo" value="${wBoard.boardNum}" />
										</c:url>
										<a href="${ndetail}">${wBoard.title}</a>
									</c:when>
								</c:choose>
							<td align="center">${wBoard.content}</td>
							<td align="center">${wBoard.cdt}</td>
						</tr>
					</c:forEach>
				</tbody>
				<!-- 페이징 처리 -->
				<tr align="center" height="20">
					<td colspan="6">
						<!-- [이전] --> <c:if test="${pi.currentPage <= 1 }">
					[이전] &nbsp;
				</c:if> <c:if test="${pi. currentPage > 1 }">
							<c:url var="before" value="myWriteList.do">
								<c:param name="page" value="${pi.currentPage - 1 }" />
							</c:url>
							<a href="${before }">[이전]</a> &nbsp;
				</c:if> <!-- 페이지 --> <c:forEach var="p" begin="${pi.startPage }"
							end="${pi.endPage }">
							<c:if test="${p eq currentPage }">
								<font color="red" size="4"><b>[${p }]</b></font>
							</c:if>
							<c:if test="${p ne currentPage }">
								<c:url var="pagenation" value="myWriteList.do">
									<c:param name="page" value="${p }" />
								</c:url>
								<a href="${pagenation }">${p }</a> &nbsp;
					</c:if>
						</c:forEach> <!-- [다음] --> <c:if test="${pi.currentPage >= pi.maxPage }">
					[다음] &nbsp;
				</c:if> <c:if test="${pi. currentPage < pi.maxPage }">
							<c:url var="after" value="myWriteList.do">
								<c:param name="page" value="${pi.currentPage + 1 }" />
							</c:url>
							<a href="${after }">[다음]</a> &nbsp;
				</c:if>
					</td>
				</tr>
			</table>
		</div>
	</section>
	<jsp:include page="../common/footer.jsp"></jsp:include>

</body>
</html>