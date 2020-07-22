<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta content="width=device-width, initial-scale=1.0" name="viewport">
		<title>장바구니</title>
		<meta content="" name="descriptison">
		<meta content="낚시, 구매, 상품" name="keywords">

		
		
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
		<style type="text/css">
			.head {
	            font-size: 30px;
	            color: lightgray;
	        }
	        .line {
	            border: 0.5px solid lightgray;
	            background: lightgray;
	        }
	        .userInfo ul li {
	            list-style: none;
	            height: 40px;
	        }
	        .userInfo label {
	            float: left;
	            width: 100px;
	        }
	        .paySystem label {
	            width: 100px;
	        }
	        .box {
	            display: none;
	        }
	        .box li {
	            list-style: none;
	        }
	        .box label {
	            width: 70px;
	        }
	        .sumAmount {
	            font-size: 30px;
	            float: right;
	        }
	        .sumAmount b {
	            color: cornflowerblue;
	            float: right;
	        }
	        .submitBtn {
	            margin-top: 70px;
	            margin-left: 40%;
	        }
		</style>
	</head>
	
	<body>
		<jsp:include page="../common/mainBar.jsp"></jsp:include>
		<section>
        	<div class="container">
        		<span class="head">
        		<br>        
                장바구니
                <br>
            	</span>
            	<!-- <form onsubmit='return daehong()' action="orderDetailInsertInfo.do"  method="post"> -->
            	<div class="orderList table-responsive" style="text-align:center">
                <table class="table">
                    <thead>
                        <tr class="success">
                        	<th style="text-align:center"><input type="button" value="전체선택" 
                        										 class="btn btn-primary" onclick="javascript:chkAll()"></th>
                            <th style="text-align:center">상품정보</th>
                            <th style="text-align:center">상품명</th>
                            <th style="text-align:center">사이즈</th>
                            <th style="text-align:center">색상</th>
                            <th style="text-align:center">수량</th>
                            <th style="text-align:center">가격</th>
                            <th style="text-align:center">할인률</th>
                            <th style="text-align:center">할인적용 금액</th>
                        </tr>
                    </thead>
                    <tbody>
                    	<c:forEach var="product" items="${pList}" varStatus="i">
                        <tr>
                        	<input type="hidden" name="productNum${i.index}" value="${product.productNum}">
                        	<td><input type="checkbox" name="chk${i.index}"></td>
                            <td><img src="/resources/images/productImg/${product.productMainName}" width="100px;" height="100px;"><br></td>
                            <td><input type="hidden" name="prodcutNum${i.index}" value="${product.productName}">${product.productName}</td>
                            <td>${product.productSize}</td>
                            <td>${product.productColor}</td>
                            <td><input type="number" id="${i.index}" name="orderQty${i.index}" min="1" max="100" step="1" value="${product.orderQty}"></td>
                            <td><input type="hidden" name="productPrice${i.index}" value="${product.productPrice}">
                            <fmt:formatNumber value="${product.productPrice}" pattern="#,###"/>원</td>
                            <td><input type="hidden" name="dcRate" value="${dcRate}">${dcRate}%</td>
                            <!-- 이부분 토탈이라서 확인해야됨 -->
                            <td id = "calcPrice${i.index}">
                            	<input 	type="hidden" name="sumPrice${i.index}" 
                    					value=<fmt:formatNumber value="${product.productPrice*((100-dcRate)/100)*product.orderQty}" type="number"/>>
                    			<fmt:formatNumber value="${product.productPrice*((100-dcRate)/100)*product.orderQty}" type="number"/>원
                    		</td>
                        </tr>
                        </c:forEach>
                    </tbody>
                    <tfoot>
                    	<tr>
                    		<td><input type="button" value="선택삭제" class="btn btn-danger" onclick="javascript:chkDel()"></td>
                    		<td colspan="5" align = "right">배송비 : </td>
                    		<td align="center">2500원</td>
                    		<td align="center">총액 : </td>
                    		<td id = "totalPrice" align="center"></td>
                    	</tr>
                    </tfoot>
                </table>
            	</div>
            	<!-- </form> -->
        	</div>
        </section>
		<a href="#" class="back-to-top"><i class="icofont-simple-up"></i></a>	
		<jsp:include page="../common/footer.jsp"></jsp:include>
		<script type="text/javascript">
			var flag="true";
			function chkAll(){
				if(flag == "true"){
					for(var i=0; i<$("input[name^='chk']").length; i++){
						$("input[name^='chk']")[i].checked = true;
					}
					flag = "false";
				}else{
					for(var i=0; i<$("input[name^='chk']").length; i++){
						$("input[name^='chk']")[i].checked = false;
					}
					flag = "true";
				}
			}
			
			function chkDel(){
				var list = new Array();
				for(var i=$("input[name^='chk']").length-1; i>=0; i--){
					if($("input[name^='chk']")[i].checked){
						list.push(parseInt($("input[name='productNum"+$("input[name^='chk']")[i].name.replace("chk", "")+"']").val()));
						$($("input[name^='chk']")[i]).parent().parent().remove();
					}
				}
				calcTotalPrice();
				
				$.ajaxSettings.traditional = true;
				
				$.ajax({
					url : "delCart.do",
					type : "POST",
					data : {"pNumList" : list},
					success : function(data) {
						
					},
					error : function() {
						console.log("실패");
					}
				});  
			}
			
			function calcTotalPrice(){
				var regexp = /\B(?=(\d{3})+(?!\d))/g;
				var sum = 0;
				for(var i = 0; i < $("input[name^='sumPrice']").length; i++){
					sum =  sum + parseInt($($("input[name^='sumPrice']")[i]).val().replace(",", ""));
				}
				sum += 2500;
				$("#totalPrice").html(sum.toString().replace(regexp, ',') + "원");
			}
			
			$( document ).ready(function() {
				calcTotalPrice();
			});
			
			$("input[name^='orderQty']").on("change", function () {
				var id = $(this)[0].id;
				var qty = $(this).val();
				var price = $("input[name='productPrice"+id+"'").val();
				var dcRate = ${dcRate};
				var calPrice = parseInt(price*((100-dcRate)/100)*qty);
				var txt = "";
				var regexp = /\B(?=(\d{3})+(?!\d))/g;
				
				txt += "<input type='hidden' name='sumPrice"+id+"'" + " value='"+calPrice+"'>";
				txt += calPrice.toString().replace(regexp, ',') + "원";
				$("#calcPrice"+id).html(txt);
				calcTotalPrice();
			});
		</script>
	</body>
</html>