<%@page import="org.kh.fin.mypage.domain.Bucket"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE HTML>
<html data-brackets-id='1210'>
	<head data-brackets-id='1211'>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Shop &mdash; Free Website Template, Free HTML5 Template by gettemplates.co</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="Free HTML5 Website Template by gettemplates.co" />
	<meta name="keywords" content="free website templates, free html5, free template, free bootstrap, free website template, html5, css3, mobile first, responsive" />
	<meta name="author" content="gettemplates.co" />

<style type="text/css">
.noneBorder{
border:none;
border-right:0px;
border-top:0px;
 boder-left:0px; 
 boder-bottom:0px;

}

</style>
	
	<meta data-brackets-id='1212' charset="utf-8">
	<meta data-brackets-id='1213' http-equiv="X-UA-Compatible" content="IE=edge">
	<title data-brackets-id='1214'>Shop &mdash; Free Website Template, Free HTML5 Template by gettemplates.co</title>
	<meta data-brackets-id='1215' name="viewport" content="width=device-width, initial-scale=1">
	<meta data-brackets-id='1216' name="description" content="Free HTML5 Website Template by gettemplates.co" />
	<meta data-brackets-id='1217' name="keywords" content="free website templates, free html5, free template, free bootstrap, free website template, html5, css3, mobile first, responsive" />
	<meta data-brackets-id='1218' name="author" content="gettemplates.co" />

	<!-- 
	//////////////////////////////////////////////////////

	FREE HTML5 TEMPLATE 
	DESIGNED & DEVELOPED by FreeHTML5.co
		
	Website: 		http://freehtml5.co/
	Email: 			info@freehtml5.co
	Twitter: 		http://twitter.com/fh5co
	Facebook: 		https://www.facebook.com/fh5co

	//////////////////////////////////////////////////////
	 -->

  	<!-- Facebook and Twitter integration -->
	<meta data-brackets-id='1219' property="og:title" content=""/>
	<meta data-brackets-id='1220' property="og:image" content=""/>
	<meta data-brackets-id='1221' property="og:url" content=""/>
	<meta data-brackets-id='1222' property="og:site_name" content=""/>
	<meta data-brackets-id='1223' property="og:description" content=""/>
	<meta data-brackets-id='1224' name="twitter:title" content="" />
	<meta data-brackets-id='1225' name="twitter:image" content="" />
	<meta data-brackets-id='1226' name="twitter:url" content="" />
	<meta data-brackets-id='1227' name="twitter:card" content="" />

	<!-- <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet"> -->
	<!-- <link href="https://fonts.googleapis.com/css?family=Playfair+Display:400,400i" rel="stylesheet"> -->
	
	<!-- Animate.css -->
	<link data-brackets-id='1228' rel="stylesheet" href="resources/hongs/css/animate.css">
	<!-- Icomoon Icon Fonts-->
	<link data-brackets-id='1229' rel="stylesheet" href="resources/hongs/css/icomoon.css">
	<!-- Bootstrap  -->
	<link data-brackets-id='1230' rel="stylesheet" href="resources/hongs/css/bootstrap.css">

	<!-- Flexslider  -->
	<link data-brackets-id='1231' rel="stylesheet" href="resources/hongs/css/flexslider.css">

	<!-- Owl Carousel  -->
	<link data-brackets-id='1232' rel="stylesheet" href="resources/hongs/css/owl.carousel.min.css">
	<link data-brackets-id='1233' rel="stylesheet" href="resources/hongs/css/owl.theme.default.min.css">

	<!-- Theme style  -->
	<link data-brackets-id='1234' rel="stylesheet" href="resources/hongs/css/style.css">

	<!-- Modernizr JS -->
	<script data-brackets-id='1235' src="resources/hongs/js/modernizr-2.6.2.min.js"></script>
	<!-- FOR IE9 below -->
	<!--[if lt IE 9]>
	<script src="js/respond.min.js"></script>
	<![endif]-->

	</head>
	<jsp:include page="../common/mainBar.jsp"></jsp:include>
	<body data-brackets-id='1236'>
		
	<div data-brackets-id='1237' class="fh5co-loader"></div>
	



	
	<div data-brackets-id='1290' id="fh5co-product">
		<div data-brackets-id='1291' class="container">
			<div data-brackets-id='1292' class="row">
				<div data-brackets-id='1293' class="col-md-10 col-md-offset-1 animate-box">
			
					<div class="row" id="topcontent" class="portfolio section-bg">
			<div class="col-md-6" id="imgcontent" >
			<div  style="height: 250px; width: 300px">
				<img src="/resources/images/productImg/${p.productMainName }" style="width:100%";>
				
			</div>
			</div>
			
		
			<div class="col-md-6" id="productContent">
				<form action="buyInfoProduct.do" method="post">
					<table class="table" class="portfolio section-bg">
						<tr>
							<c:set var="category" value="${p.categoryNum }" />
							<c:choose>
								<c:when test="${category eq '1'}">
									<td>낚시대</td>
									<td></td>
								</c:when>
								<c:when test="${category eq '2'}">
									<td>릴</td>
									<td></td>
								</c:when>
								<c:when test="${category eq '3'}">
									<td>채비</td>
									<td></td>
								</c:when>
								<c:when test="${category eq '4'}">
									<td>라인</td>
									<td></td>
								</c:when>
								<c:when test="${category eq '5'}">
									<td>가방</td>
									<td></td>
								</c:when>
							</c:choose>
					</tr>
			
				<tr>
				
						<td>상품번호 :</td>
							
							<td><input class="noneBorder" type="text" name="productNum"
								value="${p.productNum }" readonly="readonly"></td>

						</tr>
						<tr>
							<td>상품이름 : </td>

							<td><input class="noneBorder" type="text" name="productName"
								value="${p.productName }"readonly="readonly"></td>

						</tr>
						<tr>
							<td>상품사이즈 : </td>
							<td><input  class="noneBorder" type="text" name="productSIze"
								value="${p.productSize }"readonly="readonly"></td>
						</tr>
						<tr>
							<td>상품색상 : </td>
							<td><input  class="noneBorder" type="text" name="productColor"
								value="${p.productColor }"readonly="readonly"></td>
					
							
						</tr>
						<tr>
							<td>상품가격 : </td>
								<td><input class="noneBorder" type="text" name="productPrice"
								value="${p.productPrice }"readonly="readonly"></td>
						</tr>
						<tr>
						<td>수량 : </td>
							<td><input class="noneBorder" type="number" name="orderQty"
								min="1" max="100" step="1" value="1"></td>
						</tr>
						<tr>
							
							
							<td colspan="2" align="center">
							<br>
							<button data-brackets-id='1405' type="submit" value="submit" class="btn btn-default btn-block">구매하기</button>
							<br>
							<button data-brackets-id='1405' type="button" onclick="javascript:addCart(${p.productNum})" class="btn btn-default btn-block">장바구니</button>
							</td>
						</tr>
		<%-- 	<c:param name="pNum" value="${p.productNum }"/> --%>		
		<%-- 		<c:param name="oQty" value="orderNum"/> --%>
				
						
				</table>
				</form>

			</div>
		</div>
			
							
				</div>
			</div>
			
			<br><br><br><br>
			<div data-brackets-id='1321' class="row">
				<div data-brackets-id='1322' class="col-md-10 col-md-offset-1">
					<div data-brackets-id='1323' class="fh5co-tabs animate-box">
						<ul data-brackets-id='1324' class="fh5co-tab-nav">
							<li data-brackets-id='1325' class="active"><a data-brackets-id='1326' href="#" data-tab="1"><span data-brackets-id='1327' class="icon visible-xs"><i data-brackets-id='1328' class="icon-file"></i></span><span data-brackets-id='1329' class="hidden-xs">상품 상세</span></a></li>
							<li data-brackets-id='1330'><a data-brackets-id='1331' href="#" data-tab="2"><span data-brackets-id='1332' class="icon visible-xs"><i data-brackets-id='1333' class="icon-bar-graph"></i></span><span data-brackets-id='1334' class="hidden-xs">구매 후기</span></a></li>
							<li data-brackets-id='1335'><a data-brackets-id='1336' href="#" data-tab="3"><span data-brackets-id='1337' class="icon visible-xs"><i data-brackets-id='1338' class="icon-star"></i></span><span data-brackets-id='1339' class="hidden-xs">구매정보 &amp; 고객센터</span></a></li>
						</ul>

						<!-- Tabs -->
						<div data-brackets-id='1340' class="fh5co-tab-content-wrap">

							<div data-brackets-id='1341' class="fh5co-tab-content tab-content active" data-tab-content="1">
								<div data-brackets-id='1342' class="col-md-10 col-md-offset-1">
	
	
	<img src="/resources/images/productInfo/${p.productInfo }" style="width:100%";>
	
	
	
	
	
								</div>
							</div>

							<div data-brackets-id='1354' class="fh5co-tab-content tab-content" data-tab-content="2">
								<div data-brackets-id='1355' class="col-md-10 col-md-offset-1">
								
									
									<h3 data-brackets-id='1356'>Product Specification</h3>
									<ul data-brackets-id='1357'>
										<li data-brackets-id='1358'>Paragraph placeat quis fugiat provident veritatis quia iure a debitis adipisci dignissimos consectetur magni quas eius</li>
										<li data-brackets-id='1359'>adipisci dignissimos consectetur magni quas eius nobis reprehenderit soluta eligendi</li>
										<li data-brackets-id='1360'>Veritatis tenetur odio delectus quibusdam officiis est.</li>
										<li data-brackets-id='1361'>Magni quas eius nobis reprehenderit soluta eligendi quo reiciendis fugit? Veritatis tenetur odio delectus quibusdam officiis est.</li>
									</ul>
									<ul data-brackets-id='1362'>
										<li data-brackets-id='1363'>Paragraph placeat quis fugiat provident veritatis quia iure a debitis adipisci dignissimos consectetur magni quas eius</li>
										<li data-brackets-id='1364'>adipisci dignissimos consectetur magni quas eius nobis reprehenderit soluta eligendi</li>
										<li data-brackets-id='1365'>Veritatis tenetur odio delectus quibusdam officiis est.</li>
										<li data-brackets-id='1366'>Magni quas eius nobis reprehenderit soluta eligendi quo reiciendis fugit? Veritatis tenetur odio delectus quibusdam officiis est.</li>
									</ul>
								</div>
							</div>

							<div data-brackets-id='1367' class="fh5co-tab-content tab-content" data-tab-content="3">
								<div data-brackets-id='1368' class="col-md-10 col-md-offset-1">
									<h3 data-brackets-id='1369'>배송정보</h3>
									<div data-brackets-id='1370' class="feed">
										<div data-brackets-id='1371'>
											<blockquote data-brackets-id='1372'>
												<p data-brackets-id='1373'>* 배송안내 *
												<br>
												
  배송방법 : 로젠택배 ( 전화 : 1588-1255 ) <br>
  배송비용 : 2,500원  10만원이상 무료<br>
  배송기간 : 평일 익일배송 (단 당일 오후 16 시 입금 및 결재분에 한함)<br>

* 기 타 *<br>
  제주도, 울릉도 등의 도서 산간 지역은 추가운임이 발생할 수 있으며 평일기준 1~2일의 지연 배송이 발생될 수 있습니다.
  고객님께서 주문하신 상품은 입금 확인 후 배송해 드립니다. 상품종류에 따라서 배송이 다소 지연될 수 있습니다.
</p>
											</blockquote>
											
												<blockquote data-brackets-id='1372'>
												<p data-brackets-id='1373'>* 교환 / 반품 안내 *

												<br>
												
  교환 및 반품이 가능한 경우<br>
  1. 상품을 공급받으신 날로부터 7일 이내 단, 포장을 개봉하였거나 포장이 훼손되어 상품의 가치가 상실된 경우에는 교환/반품이 불가능합니다.<br>
  2. 제품 하자에 의한 교환 및 반품의 경우에는 반송 즉시 교환 및 환불 가능합니다.<br>
  3. 상품을 공급 받으신 날로부터 7일 이내에 교환 및 반품을 하실 수 있습니다.<br>
  4. 기타 자세한 문의는 전화 주시거나 홈페이지 게시판 질문하고 받기에 글을 올려주시면 친절히 안내해 드리겠습니다.<br>

* 교환 및 반품이 불가능한 경우 *<br>
 1. 상품을 공급 받으신 날로부터 7일이 지난 경우 교환 및 반품이 불가능합니다.<br>
 2. 소모성 제품으로 1회 이상 사용하여 상품의 가치가 감소 된 경우 반품/교환/환불이 불가능합니다.<br>
 3. 고객님의 책임 있는 사유로 상품등이 멸실 훼손된 경우<br>

* 환불안내 *<br>
 1. 환불시 반품 확인 여부를 확인한 후 3영업일 이내에 결재 금액을 환불해 드립니다.<br>
 2. 신용카드로 결재하신 경우는 신용카드 승인을 취소하여 결재 대금이 청구 되지 않게 합니다.<br>
   (단, 신용카드 결재일자에 맞추어 대금이 청구 될수 있으며 이 경우 익월 신용카드 대금청구시 카드사에서 환급처리 됩니다.)<br>

   
   			   
											</blockquote>
										<blockquote data-brackets-id='1372'>
									<button data-brackets-id='1405' type="submit" value="submit" 
   							class="btn btn-default btn-block" style="font-size: xx-large">고객센터로 가기</button>		

   			   
											</blockquote>
										</div>
				
									</div>
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>	
	<div data-brackets-id='1470' class="gototop js-top">
		<a data-brackets-id='1471' href="#" class="js-gotop"><i data-brackets-id='1472' class="icon-arrow-up"></i></a>
	</div>
		<!-- Vendor JS Files -->
	<script src="assets/vendor/jquery/jquery.min.js"></script>
	<script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="assets/vendor/jquery.easing/jquery.easing.min.js"></script>
	<script src="assets/vendor/php-email-form/validate.js"></script>
	<script src="assets/vendor/jquery-sticky/jquery.sticky.js"></script>
	<script src="assets/vendor/venobox/venobox.min.js"></script>
	<script src="assets/vendor/waypoints/jquery.waypoints.min.js"></script>
	<script src="assets/vendor/counterup/counterup.min.js"></script>
	<script src="assets/vendor/owl.carousel/owl.carousel.min.js"></script>
	<script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
	<script src="assets/vendor/aos/aos.js"></script>

	<!-- Template Main JS File -->
	<script src="assets/js/main.js"></script>
	<!-- jQuery -->
	<script data-brackets-id='1473' src="resources/hongs/js/jquery.min.js"></script>
	<!-- jQuery Easing -->
	<script data-brackets-id='1474' src="resources/hongs/js/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script data-brackets-id='1475' src="resources/hongs/js/bootstrap.min.js"></script>
	<!-- Waypoints -->
	<script data-brackets-id='1476' src="resources/hongs/js/jquery.waypoints.min.js"></script>
	<!-- Carousel -->
	<script data-brackets-id='1477' src="resources/hongs/js/owl.carousel.min.js"></script>
	<!-- countTo -->
	<script data-brackets-id='1478' src="resources/hongs/js/jquery.countTo.js"></script>
	<!-- Flexslider -->
	<script data-brackets-id='1479' src="resources/hongs/js/jquery.flexslider-min.js"></script>
	<!-- Main -->
	<script data-brackets-id='1480' src="resources/hongs/js/main.js"></script>
	<jsp:include page="../common/footer.jsp"></jsp:include>
	<script type="text/javascript">
		function addCart(num) {
			if($("input[name=orderQty]").val() < 1){
				alert("장바구니에는 1개 이상만 담을 수 있습니다.");
				return;
			}else{
				var url = "/insertCart.do?pNum="+num+"&cnt="+parseInt($("input[name=orderQty]").val());							
				$.ajax({
					url : url,
					type : "get",
					success : function(data) {
						if(data=="fail"){
							alert("이미 등록된 제품입니다.");
						}
						if(data=="success"){
							alert("등록 완료");
						}
						
						console.log(data);
					},
					error : function() {
						console.log("실패");
					}
				}); 
			}
			
		}
	</script>
	</body>
</html>

