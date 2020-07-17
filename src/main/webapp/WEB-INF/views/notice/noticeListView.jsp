 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
    <head>
    <meta charset="utf-8" />
   <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" /> 
    <title>템플릿</title>
   <link rel="icon" type="image/x-icon" href="assets/img/favicon.ico" />
    Font Awesome icons (free version) -
    <script src="https://use.fontawesome.com/releases/v5.13.0/js/all.js" crossorigin="anonymous"></script>
    <!-- Google fonts-->
   <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
</head>

<body id="page-top">
    <!-- 상단바-->
   
    <br><br>
    <!-- 메인 콘텐츠-->
    <section class="page-section bg-light" id="portfolio">
        <div class="container">
            <!--메인 콘텐츠 위치-->
            <div class="row">
               
                <!--제목 위치-->
                <div class="col-11 col-md-9">
                    <span class="h2">고객센터</span>
                    
                </div>
                <!--글쓰기 버튼-->
                <div class="col-md-2 d-flex justify-content-end">
   	 				<c:if test="${!empty loginUser }">
   	 				<c:url var="writer" value="nWriterView.do"/>
     				<a href="${writer }" type="button" >글 작성</a>&nbsp;&nbsp;&nbsp;&nbsp;
     				</c:if>
      				<c:url var="home" value="home.do"/>
      				<a href="${home }" type="button" >시작페이지로 이동</a>&nbsp;&nbsp;&nbsp;
     				<c:url var="nlist" value="nlist.do"/>
      				<a href="${nlist }" type="button" >목록 전체보기</a>
  				</div>
                
                   
                
            </div>
            <hr>
            <br>
            <!--콘텐츠 페이지 내용 위치-->
            <div>
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th scope="col">글번호</th>
                            <th scope="col">제목</th>
                            <th scope="col">회원아이디</th>
                            <th scope="col">작성일</th>
                            
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="n" items="${list }">
         <tr>
         <td >${n.nId }</td>
         <!-- 로그인 상태에서만 상세보기 가능 -->
         <!-- 로그인 상태가 아닌 경우 공지사항 제목만 출력 -->
         <td>
            <c:if test="${ !empty loginUser }">
               <c:url var="ndetail" value="ndetail.do">
                  <c:param name="nId" value="${n.nId }"/> <!-- 쿼리스트링(물음표 뒤에 오는것) -->
                   		<!-- 무슨역할을 하는지 궁금 -->
               </c:url>
               <a href="${ndetail }">${n.nTitle }</a>
            </c:if>
            <c:if test="${empty loginUser }">
               ${n.nTitle }            
            </c:if>
         </td>
         <td >${n.nWriter }</td>
         <td >${n.nCreateDate }</td>
        
      </tr>
      </c:forEach>
      
      
      <!-- 페이징 처리 -->
		<tr align="center" height="20">
			<td colspan="6">
				<!-- [이전] -->
		<c:if test="${pi.currentPage <= 1 }">
			[이전] &nbsp;
		</c:if>
		<c:if test="${pi. currentPage > 1 }">
			<c:url var="before" value="nlist.do">
				<c:param name="page" value="${pi.currentPage - 1 }" />
			</c:url>
			<a href="${before }">[이전]</a> &nbsp;
		</c:if>
		
		<!-- 페이지 -->
		<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
			<c:if test="${p eq pi.currentPage }">
				<font color="red" size="4"><b>[${p }]</b></font>
			</c:if>
			<c:if test="${p ne pi.currentPage }">
				<c:url var="pagination" value="nlist.do">
					<c:param name="page" value="${p }" />
				</c:url>
				<a href="${pagination }">${p }</a> &nbsp;
			</c:if>
		</c:forEach>

		
		
		
	<!-- [다음] -->
<c:if test="${pi.currentPage >= pi.maxPage }">
	[다음] &nbsp;
</c:if>
<c:if test="${pi. currentPage < pi.maxPage }">
	<c:url var="after" value="nlist.do">
		<c:param name="page" value="${pi.currentPage + 1 }" />
	</c:url>
	<a href="${after }">[다음]</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</c:if>


<!-- 게시물 검색하기 -->
     <div id="searchArea" align="center">
   <form action="nsearch.do" name="searchForm" method="get">
      <select id="searchCondition" name="searchCondition">
         <option value="all" <c:if test="${search.searchCondition == 'all' }">selected</c:if>>전체</option>
         <option value="writer" <c:if test="${search.searchCondition == 'writer' }">selected</c:if>>작성자</option>
         <option value="title" <c:if test="${search.searchCondition == 'title' }">selected</c:if>>제목</option>
         <option value="content" <c:if test="${search.searchCondition == 'content' }">selected</c:if>>내용</option>
      </select>
      <input type="search" name="searchValue" value="${search.searchValue }">
      <button>검색</button><br>
   </form>
</div>

			
			
			</td>
		</tr>
                    </tbody>
                </table>
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
            <span class="align-middle">스펀딩 Copyright 스펀딩 corp.All Rights Reserved.</span>

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