<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
    <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>템플릿</title>
    <script src="https://use.fontawesome.com/releases/v5.13.0/js/all.js" crossorigin="anonymous"></script>
    <!-- Google fonts-->
   <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
</head>

<body id="page-top">
   
    <br><br>
    <!-- 메인 콘텐츠-->
    <section class="page-section bg-light" id="portfolio">
        <div class="container">
            <!--메인 콘텐츠 위치-->
            <div class="row">
                
               
                <!--제목 위치-->
                <div class="col-10">
                    <span class="h2">회원정보수정</span>
                </div>
            </div>
            <hr>
            <br>
            <!--콘텐츠 페이지 내용 위치-->
            <div>
                <form action="mupdate.do" method="post" id="info">

                        <table>
                            <tr>
                                <td>아이디</td>
                                <td><input type="text" class="form-control" id="id" size="30" placeholder="${loginUser.userId }" style="margin:10px">
                                </td>
                            </tr>
                            <tr>
                                <td>비밀번호</td>
                                <td><input type="password" class="form-control" id="id" size="30" placeholder="비밀번호를 입력하세요" style="margin:10px">
                                </td>
                            </tr>
                            <tr>
                                <td>비밀번호 확인</td>
                                <td><input type="text" class="form-control" id="id" size="30" placeholder="비밀번호 확인" style="margin:10px">
                                </td>
                            </tr>
                            <tr>
                                <td>이름</td>
                                <td><input type="text" class="form-control" id="id" size="30" placeholder="${loginUser.userName }" style="margin:10px">
                                </td>


                            </tr>
                            

                            <tr>
                                <td>성별</td>
                                <td>
                                    <div class="form-check form-check-inline">
                                        <input type="radio" class="form-check-input" name="gender" id="genderM" size="30" value="M">
                                        <label class="form-check-label" for="genderM">
                                            남
                                        </label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input type="radio" class="form-check-input" name="gender" id="genderF" size="30" value="W">
                                        <label class="form-check-label" for="genderF">
                                            여
                                        </label>
                                    
                                    </div>

                                </td>
                            </tr>
                            <tr>
                                <td>휴대전화</td>
                                <td><input type="text" class="form-control" id="id" size="30" placeholder="${loginUser.phone }" style="margin:10px">
                                </td>


                            </tr>

                            <tr>
                                <td>이메일</td>
                                <td><input type="email" class="form-control" id="id" size="30" placeholder="${loginUser.email }" style="margin:10px">
                                </td>
                            </tr>
							<tr>
                                <td>주소</td>
                                <td><input type="email" class="form-control" id="id" size="30" placeholder="${loginUser.address }" style="margin:10px">
                                </td>
                            </tr>

                            
                            <br>

                            <tr>
                                <td>
                                    <button type="submit" class="btn btn-secondary">
                                        취소하기
                                    </button>
                                </td>
                                <td>
                                    <button type="submit" class="btn btn-primary">
                                        등록하기
                                    </button>
                                </td>

                            </tr>

                        </table>
                    </form>
                <br>
            </div>
        </div>
    </section>

    <!-- Footer-->
    <footer>
        <div class="text-center">
            <ul class="nav list-group-horizontal justify-content-center">
                <li class="nav-item"><a class="nav-link active" href="#" style="color: black;">이용약관</a></li>
                <li class="nav-item"><a class="nav-link active" href="#" style="color: black;">개인정보처리방침</a></li>
                <li class="nav-item"> <a class="nav-link active" href="#" style="color: black;">책임의 한계와 법적고지</a></li>
                <li class="nav-item"><a class="nav-link active" href="#" style="color: black;">회원정보 고객센터</a></li>
            </ul>
            <span class="align-middle"></span>

        </div>
    </footer>


    <!-- Bootstrap core JS-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js"></script>
    <!-- Third party plugin JS-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
    <!-- Contact form JS-->
    <script src="assets/mail/jqBootstrapValidation.js"></script>
    <script src="assets/mail/contact_me.js"></script>
    <!-- Core theme JS-->
    <script src="js/scripts.js"></script>
</body></html>