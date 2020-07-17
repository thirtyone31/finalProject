<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
 <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("detailAddress").focus();
            }
        }).open();
    }
</script>


    <style>
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
                주문 / 결제
                <br>
            </span>
           <%-- <c:if var = "checkAll();" eq 'false'>
           
           </c:if> --%>
           
<form onsubmit='return daehong()' action="orderDetailInsertInfo.do"  method="post">
							
				
            <div class="orderList table-responsive" style="text-align:center">
                <table class="table">
                    <thead>
                        <tr class="success">
                            <th style="text-align:center">상품정보</th>
                            <th style="text-align:center">상품명</th>
                            <th style="text-align:center">사이즈</th>
                            <th style="text-align:center">색상</th>
                            <th style="text-align:center">수량</th>
                            <th style="text-align:center">가격</th>
                            <th style="text-align:center">배송비</th>
                            <th style="text-align:center">가격-등급할인+배송비</th>
                        </tr>
                    </thead>

                    <tbody>
                        <tr>
                        
                            <td> <img src="/resources/images/productImg/${product.productMainName }" width="100px;" height="100px;"><br>
                            </td>
                   	         <input type="hidden" name="productNum" value="${product.productNum }">
         
                            <td><input type="hidden" name="prodcutNum" value="${product.productName }">${product.productName }</td>
                            <td>${product.productSize }</td>
                            <td>${product.productColor }</td>
                            <td><input type="hidden" name="orderQty" value="${orderQty}">${orderQty}</td>
                            <td><input type="hidden" name="productPrice" value="${product.productPrice}">${product.productPrice}원</td>
                            <td>2500원</td>
                            <!-- 이부분 토탈이라서 확인해야됨 -->
                            <td><input type="hidden" name="Price" value="${product.productPrice*orderQty+2500}">${product.productPrice*orderQty+2500}</td>
                       	<td>
                    
                       	</td>

                        </tr>
                    </tbody>
                            
                  

                </table>
            </div>
	
       

            <br>
            <div class="line"></div>

           
                <div class="userInfo">
                <br>
                    <h4>- 주문자 정보</h4><br>
                    <ul>
                    
                        <li>
                            <label for="name">수령인 </label>
                            <input type="text" id="name" name="orderName" placeholder="이름을 입력해주세요">
                        </li>
                        <li>
                            <label for="phone">휴대폰 </label>
                            <input type="text" id="phone" name="orderPhone" placeholder="휴대폰 번호를 입력해주세요"></li>
   
                        <li>
                            <label for="roadAddress">우편번호 찾기 </label>
                        <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
     </li>                   
                        <li>
                            <label for="postcode">우편번호 </label>
					  <input type="text" id="postcode" name="orderPost" placeholder="우편번호">

</li>
                        <li>
                            <label for="jibunAddress">주소 </label>
                      <input type="text" id="address" name="orderAddress" placeholder="주소"><br>
                    </li>  
                    
                        <li>
                            <label for="detailAddress">상세주소 </label>
                      <input type="text" id="detailAddress" name="orderAddressDetail" placeholder="상세주소">
               </li>
 

					   <input type="hidden" type="text" id="sample6_extraAddress" placeholder="참고항목">

                        <!-- 여기부터 기능 넣어서 바꿀께 -->
                        <li><label>========================== </label></li>
                        <li>
                            <label for="#">아이디</label>
                            <input type="text" id="" name="memberId" value="admin" placeholder="상태번호 :1"></li>
                        <li>
                            <label for="#">상태번호</label>
                            <input type="text" id="" name="statusNum" value="1" placeholder="상태번호 :1"></li>
              
                        <li>
                            <label for="#">구매번호 </label>
                            <input type="text" id="" name="purchaseNum" value="1" placeholder="구매번호:1"></li>
                        <li>
                            <label for="#">구매날짜 </label>
                            <input type="text" id="" name="" value='' placeholder="DB에서 SYSDATE처리"></li>
    					<!-- 여기까지 기능 넣어서 바꿀께 -->
                    </ul>


                </div>

                <br>
                <div class="line"></div>

               
                <br>
                    <h4>- 결제 방식</h4>
       
    <input type="radio" name="payBtn" id="acountPay">계좌입금</input>            
    <input type="radio" name="payBtn" id="kakaoPay">카카오페이</input>
    <input type="radio" name="payBtn" id="phonePay">휴대폰결제</input>



	
<!-- 결제 script -->
    <script type="text/javascript">
      $(document).ready(function () {
    	  
        $('#acountPay').click(function (){
      	alert("acountPay");
         });
        $('#kakaoPay').click(function (){
         });
        $('#phonePay').click(function (){
         });
      });
      
    </script>
    
       <script>
       function (){
           var IMP = window.IMP;
           IMP.init('imp83138778');
           IMP.request_pay({
               pg : 'html5_inicis',
               pay_method : 'vbank',
               merchant_uid : 'merchant_' + new Date().getTime(),
               name : "dd",
               amount : 1000,
               buyer_email : "구매자이메일",
               buyer_name : "구매자이름",
               buyer_tel : "구매자휴대번호",
               buyer_addr : "구매자주소"
           
              
           }, function(rsp) {
               if ( rsp.success ) {
               	 var msg = '결제완료';
                   $(document).ready(function(){
                     $("#btn").trigger("click");
                   	 
                   });
                   
      
                   
               } else {
                   var msg = '결제에 실패하였습니다.';
                   msg += '에러내용 : ' + rsp.error_msg;
               }
               alert(msg);
           });
        
        });
       
       ///////////////////////////////////////////////////////////////////////////////////////
       function (){
            var IMP = window.IMP;
            IMP.init('imp37897171');
            IMP.request_pay({
                pg : 'html5_inicis',
                pay_method : 'vbank',
                merchant_uid : 'merchant_' + new Date().getTime(),
                name : "dd",
                amount : 1000,
                buyer_email : "구매자이메일",
                buyer_name : "구매자이름",
                buyer_tel : "구매자휴대번호",
                buyer_addr : "구매자주소"
            
               
            }, function(rsp) {
                if ( rsp.success ) {
                    var msg = '결제가 완료되었습니다.';
                    msg += '고유ID : ' + rsp.imp_uid;
                    msg += '상점 거래ID : ' + rsp.merchant_uid;
                    msg += '결제 금액 : ' + rsp.paid_amount;
                    msg += '카드 승인번호 : ' + rsp.apply_num;
                    
                    location.href=""
                    
                    
                    
                    
                } else {
                    var msg = '결제에 실패하였습니다.';
                    msg += '에러내용 : ' + rsp.error_msg;
                }
                alert(msg);
            });
         
         });
       
       </script>
       
  <script>
<!-- 입력값 유효성체크 -->
function daehong(){
	 var name = document.getElementById("name");
	var phone = document.getElementById("phone");
	var address = document.getElementById("detailAddress");

 	if(name.value==""){
		alert("수령인 입력하세요");
		return false;
	}else if(phone.value==""){
		alert("휴대폰번호를 입력해주세요");
		return false;
	} else if(address.value==""){
		alert("주소를 입력해주세요");
		return false;
	}
}
</script>
       
                
 <script>

                   
                    
                   function phone(){
                   IMP.init('imp37897171');

                   IMP.request_pay({
                	   
                       pg : 'inicis', // version 1.1.0부터 지원.
                       pay_method : 'card',
                       merchant_uid : 'merchant_' + new Date().getTime(),
                       name : '주문명:결제테스트',
                       amount : 14000, //판매 가격
                       buyer_email : 'iamport@siot.do',
                       buyer_name : '구매자이름',
                       buyer_tel : '010-1234-5678',
                       buyer_addr : '서울특별시 강남구 삼성동',
                       buyer_postcode : '123-456'
                   }, function(rsp) {
                       if ( rsp.success ) {
                           var msg = '결제가 완료되었습니다.';
                           msg += '고유ID : ' + rsp.imp_uid;
                           msg += '상점 거래ID : ' + rsp.merchant_uid;
                           msg += '결제 금액 : ' + rsp.paid_amount;
                           msg += '카드 승인번호 : ' + rsp.apply_num;
                       } else {
                           var msg = '결제에 실패하였습니다.';
                           msg += '에러내용 : ' + rsp.error_msg;
                       }
                       alert(msg);
                   });
                   }
                  </script>
              
				
                <input id="btn" type="submit" class="btn btn-info btn-lg submitBtn" value="이거 결제하면 자동으로 진행되서 나중에
                숨길거임">


                  
				
            </form>

        </div>



        <br><br><br>

    </section>
   
     

       
       
        <br><br><br>

    
	<!-- End Our Portfolio Section --> </main>
	<!-- End #main -->

	<!-- ======= Footer ======= -->

	<!-- End Footer -->

	<a href="#" class="back-to-top"><i class="icofont-simple-up"></i></a>

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
	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>