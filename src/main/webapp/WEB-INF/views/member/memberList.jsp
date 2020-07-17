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
   <link rel="icon" type="image/x-icon" href="assets/img/favicon.ico" />
   
    <script src="https://use.fontawesome.com/releases/v5.13.0/js/all.js" crossorigin="anonymous"></script>
    <!-- Google fonts-->
   <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>


<style type="text/css">

#paginaion{
 text-align:center;
}


</style>
    
</head>

<body id="page-top">
    <!-- 상단바-->
    
    <br><br>
    <!-- 메인 콘텐츠-->
    <section class="page-section bg-light" id="portfolio">
        <div class="container">
            <!--메인 콘텐츠 위치-->
            <div class="row">
                <!--아이콘 위치-->
                <div class="col-1">
                    <span class="h2">
                    </span>
                </div>
                <!--제목 위치-->
                <div class="col-11">
                    <span class="h2">블랙리스트</span>
                </div>
            </div>
            <hr>
            <br>
            <!--콘텐츠 페이지 내용 위치-->
            <div>
                
                
                <table class="table table-hover">
                    
                        <tr>
                            <th scope="col">회원아이디</th>
                            <th scope="col">등록여부</th>
                            <th scope="col">등록일</th>
                            <th scope="col">블랙리스트</th>
                        </tr>
                    
                    <c:forEach var="list" items="${list }">
                        <tr>
                            <th>${list.userId }</th>
                            <td>${list.mStatus }</td>
                            <td>${list.updateDate}</td>
                            <td>
                            <button type="button" class="btn btn-primary" onclick="location.href='black.do?userId=${list.userId }'">등록</button>
                            <button type="button" class="btn btn-primary" onclick="location.href='out.do?userId=${list.userId }'">해제</button>
                            </td>
                        </tr>
                    </c:forEach>
                
				
                <br>
				
		
			
			
			<tr align="center" height="20" class="paginaion">
			<td colspan="6">
				<!-- [이전] -->
		<c:if test="${pi.currentPage <= 1 }">
			[이전] &nbsp;
		</c:if>
		<c:if test="${pi.currentPage > 1 }">
			<c:url var="before" value="mlistView.do">
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
				<c:url var="pagination" value="mlistView.do">
					<c:param name="page" value="${p }" />
				</c:url>
				<a href="${pagination }">${p }</a> &nbsp;
			</c:if>
		</c:forEach>

		
		
		
	<!-- [다음] -->
<c:if test="${pi.currentPage >= pi.maxPage }">
	[다음] &nbsp;
</c:if>
<c:if test="${pi.currentPage < pi.maxPage }">
	<c:url var="after" value="mlistView.do">
		<c:param name="page" value="${pi.currentPage + 1 }" />
		<!-- pi.currentPage + 1 가지고와서 url로 after로 지정해서 밑에서 끌어다
		쓰겠다 -->
	</c:url>
	<a href="${after }">[다음]</a> &nbsp;
	<!-- mlist.kh?page=${pi.currentPage + 1 } -->
</c:if>

<!-- 검색  -->
<div id="searchArea" align="center">
   			<form action="msearch.do" name="searchForm" method="get">
     			 <select id="searchCondition" name="searchCondition">
         			<option value="all" <c:if test="${search.searchCondition == 'all' }">selected</c:if>>전체</option>
         			<option value="userid" <c:if test="${search.searchCondition == 'userid' }">selected</c:if>>작성자</option>
         			<option value="mStatus" <c:if test="${search.searchCondition == 'mStatus' }">selected</c:if>>상태</option>
      			</select>
      		<input type="search" name="searchValue" value="${search.searchValue }">
      		<button>검색</button><br>
  			 </form>
			</div>

			
			</td>
		</tr>

            </div>
            <br>
        </div>
        </table>
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