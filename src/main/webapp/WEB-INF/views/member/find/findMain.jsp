<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<jsp:include page="/WEB-INF/views/member/include/include.jsp"/>
<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Mamba Bootstrap Template - Index</title>
  <meta content="" name="descriptison">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="assets/img/favicon.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,600,600i,700,700i,900" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/icofont/icofont.min.css" rel="stylesheet">
  <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="assets/vendor/animate.css/animate.min.css" rel="stylesheet">
  <link href="assets/vendor/venobox/venobox.css" rel="stylesheet">
  <link href="assets/vendor/owl.carousel/assets/owl.carousel.min.css" rel="stylesheet">
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

 

    <!-- ======= Contact Us Section ======= -->
    <section id="contact" class="contact">
        
      <div class="container">

        <div class="section-title">
          <h2>Contact Us</h2>
          </div>

			<div class="col-lg-3 d-flex align-items-stretch" data-aos-delay="100">
            <div class="info-box" id="findBox">
				<!-- <i class="bx bx-envelope"></i> -->
				<h3>아이디 찾기</h3>
				<input type="radio" name="findType" id="findType" value="phone" checked/>전화번호&nbsp;
				<input type="radio" name="findType" id="findType" value="email"/>이메일&nbsp;
				<input type="radio" name="findType" id="findType" value="birth"/>생년월일
				</br>
				<div id="findIdForm">
	            	전화번호 : <input type="text" id="mphono" name="mphono" maxlength="11" placeholder="-제외하고 입력해주세요."/><br/><br/>
				</div>
            	<input type="button" onclick="javascript:findId();" value="아이디찾기"/>
            </div>
            <div class="info-box" id="findId" style="display:none;">
				<h3>아이디</h3>
            	<p id="foundId"></p></br></br>
            	<input type="button" onclick="#" value="다시찾기"/>
            	<input type="button" onclick="#" value="로그인"/>
            </div>
          </div>

          <div class="col-lg-3 d-flex align-items-stretch" data-aos-delay="200">
            <div class="info-box ">
              <i class="bx bx-phone-call"></i>
              <h3>비밀번호 찾기</h3>
              <p>+1 5589 55488 55<br>+1 6678 254445 41</p>
            </div>
          </div>
          <!-- <div class="col-lg-3 d-flex align-items-stretch" data-aos="fade-up" data-aos-delay="100" style="float: left;">
            <div class="info-box">
				<i class="bx bx-envelope"></i>
				<h3>아이디 찾기</h3>
            	전화번호 : <input type="text" id="mphono" name="mphono" maxlength="11" placeholder="-제외하고 입력해주세요."/><br/><br/>
            	<input type="button" onclick="javascript:findId();" value="아이디찾기"/>
            </div>
          </div>
          
          <div class="col-lg-3 d-flex align-items-stretch" data-aos="fade-up" data-aos-delay="100" style="float: left;" id="findId">
            <div class="info-box">
				<i class="bx bx-envelope"></i>
				<h3>아이디</h3>
            	<p>dfdf</p>
            </div>
          </div>

          <div class="col-lg-3 d-flex align-items-stretch" data-aos="fade-up" data-aos-delay="200" style="float: left;">
            <div class="info-box ">
              <i class="bx bx-phone-call"></i>
              <h3>비밀번호 찾기</h3>
              <p>+1 5589 55488 55<br>+1 6678 254445 41</p>
            </div>
          </div> -->
		</div>
    </section>
         
  

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
	
	<script type="text/javascript">
		
		function findId(){
			var findType = $("input[name=findType]:checked").val();
			var phone = $('#mphono').val();
			var email = $('#email').val();
			var birth = $('#birth').val();
			var key = '';
			console.log(findType);
			if(findType == 'phone'){
				if(phone == null || phone == ''){
					alert('전화번호를 입력해주세요.');
					return false;
				} else {
					key = phone;
				}
			}
			if(findType == 'email'){
				if(email == null || email == ''){
					alert('이메일을 입력해주세요.');
					return false;
				} else {
					key = email;
				}
				
			}
			if(findType == 'birth'){
				if(birth == null || birth == ''){
					alert('생년월일을 입력해주세요.');
					return false;
				} else {
					key = birth;
				}
			}
			
			$.ajax({
				url : '/findId.me', //request 보낼 서버의 경로
				type : 'post', // 메소드(get, post, put 등)
				data : {
					'findType' : findType,
					'key' : key
				}, //보낼 데이터
				//dataType:"json",
				//contentType: "application/json; charset=utf-8",
				success : function(data) {
					console.log(data);
					if(data != ''){
						$('#foundId').html(data);
						$('#findBox').hide();
						$('#findId').show();
					}
				},
				error : function(err) {
					console.log(err);
					alert('통신이 원활하지 않습니다.\n잠시후 다시 이용해 주세요.');
				}
			});
		}
	
		$("input:radio[name=findType]").click(function(){
			 
	        if($("input[name=findType]:checked").val() == "phone"){
	            $('#findIdForm').html('전화번호 : <input type="text" id="mphono" name="key" maxlength="11" placeholder="-제외하고 입력해주세요."/><br/><br/>');
	        }else if($("input[name=findType]:checked").val() == "email"){
	            $('#findIdForm').html('이메일 : <input type="text" id="email" name="key" placeholder="이메일을 입력해주세요."/><br/><br/>');
	        }else if($("input[name=findType]:checked").val() == "birth"){
	            $('#findIdForm').html('생년월일 : <input type="text" id="birth" name="key" maxlength="8" placeholder="20201212"/><br/><br/>');
	        }
	    });
	</script>
	
	
</body>

</html>