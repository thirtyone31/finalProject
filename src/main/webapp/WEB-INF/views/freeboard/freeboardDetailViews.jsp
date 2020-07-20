<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항 </title>
 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
  <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
   <!-- <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script> -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
</head>
<body>
   <section class="page-section bg-light" id="portfolio">
   
   <br style="clear:both">
   <c:import url="../common/menuBar.jsp" />
   <h1 align="center">${freeboard.boardNo }번 상세 보기</h1>
   
   <br><br>
   
   

            
   <br><br>
   <table align="center" width="450" border="1" cellspacing="0" class="table">
   <tr >
      <td width="80">번호</td>
      <td>${freeboard.boardNo }</td>
   </tr>
   <tr >
      <td>제목</td>
      <td>${freeboard.title }</td>
   </tr>
   <tr >
      <td>작성자</td>
      <td>${freeboard.memberId }</td>
   </tr>
   <tr >
      <td>작성날짜</td>
      <td>${freeboard.cdt }</td>
   </tr>
   <tr height="300">
      <td>내용</td>
      <td>${freeboard.bContent }</td>
   </tr>
   
                  
   <c:if test="${loginUser.memberId eq freeboard.memberId or loginUser.memberId == 'admin'}">
   <tr>
      <td colspan="2" align="center">
      <c:url var="fupdate" value="fupdateView.do">
         <c:param name="boardNo" value="${freeboard.boardNo}"/>
         <!-- 쿼리스트링을 보내주어야 컨트롤러의 메소드의 매개변수 파라미터가 받아서 처리가능 -->
      </c:url>
         <c:url var="fdelete" value="fdelete.do">
            <c:param name="boardNo" value="${freeboard.boardNo }"/>
         </c:url>
      <a href="${fupdate}">수정페이지로 이동</a>&nbsp; &nbsp;
      <a href="${fdelete}">삭제하기</a>
      </td>
   </tr>
   </c:if>
</table>


<!-- 댓글 목록  -->
	<table id="ctb" align="center" width="1000" border="1" cellspacing="0">
		<thead>
			<tr>
				<td colspan="4"><b id="cCount"></b></td>
			</tr>
		</thead>
		<tbody></tbody>
	</table>

<!-- 댓글 등록  -->
	<table align="center" width="1000" border="1" cellspacing="0">
		<tr>
			<td><textarea cols="125" rows="3" id="cContent"></textarea></td>
			<td>
				<button id="cSubmit">등록하기</button>
			</td>
		</tr>
	</table>

	<script>
		$(function() {
			// 초기 페이지 로딩 시 댓글 불러오기
			getReplyList();
			// ajax polling
			// 타 회원이 댓글들을 작성했을 수 있으니 지속적으로 댓글 불러오기
			setInterval(function() {
				getReplyList();
			}, 1000000);

			// 댓글 등록 ajax
			$("#cSubmit").on("click", function () {
				
				var cContent = $("#cContent").val(); // 댓글의 내용
				var boardNo = ${freeboard.boardNo}; // 어느 게시글의 댓글인지 알려줌
				
				$.ajax({
					url : "cinsert.do",
					data : {cContent:cContent, boardNo:boardNo},
					type : "post",
					success : function(data) { // data를 String으로 받아옴, 이전에는 json
						if(data == "success") { 
							getReplyList();
							$("#cContent").val("");
						}
					}
				});
			});
			

		});

		// 댓글 리스트 불러오는 ajax 함수
		function getReplyList() {
			var boardNo = ${freeboard.boardNo};
			$.ajax({
						url : "clist.do",
						data : {
							boardNo : boardNo
						},
						dataType : "json",
						type : "post",
						success : function(data) { // 응답이 오는 데이터는 JSON형태
							$tableBody = $("#ctb tbody");
							$tableBody.html("");

							var $tr;
							var $cWriter;
							var $cContent;
							var $cChoice;
							var $cCreateDate;

							$("#cCount").text("댓글 (" + data.length + ")");
							if (data.length > 0) {
								for ( var i in data) {
									/* console.log(data[i].commentNum); */
									$tr = $("<tr>"); // 자동으로 닫힘
									 $y=$("<td id='inputComment("+data[i].commentNum+")'style='display:none' >").html("<input type='text' id='inComment("+data[i].commentNum+")'  placeholder="+decodeURIComponent(data[i].cContent.replace(/\+/g, ""))+"><button onclick='cUpdate("+data[i].commentNum+")'>확인</button><button onclick='cCancel("+data[i].commentNum+")'>취소</button>");
									$cWriter = $("<td width='100'>").text(
											data[i].memberId);
									$cContent = $("<td id='mainComment("+data[i].commentNum+")'>").text(
											decodeURIComponent(data[i].cContent
													.replace(/\+/g, " ")));
									/* $y=$("<input type='text' placeholder="+decodeURIComponent(data[i].cContent)+">"); */
									$cChoice = $("<td width='100'>").html("<button onclick='cDelete("+data[i].commentNum+")' >삭제</button><button onclick='cUpdatelist("+data[i].commentNum+")'>수정</button>");
									$cCreateDate = $("<td width='100'>").text(
											data[i].cdt);

									$tr.append($cWriter);
									$tr.append($cContent);
									$tr.append($y);
									if('${loginUser.memberId}' == data[i].memberId){
 										$tr.append($cChoice);
 										}else {
 										} 	
									$tr.append($cCreateDate);
									$tableBody.append($tr);
								}
							} else {
								$tr = $("<tr>");
								$cContent = $("<td colspan='3'>").text(
										"등록된 댓글이 없습니다.");

								$tr.append($cContent);
								$tableBody.append($tr);
							}
						}
					});
		}
		
		//댓글 삭제
		 function cDelete(num) {
			$.ajax({
				url : "cdelete.do",
				data : {commentNum:num},
				type : "get",
				success : function(data) { // data를 String으로 받아옴, 이전에는 json
					if(data == "success") {
						location.reload(true);
					}
				}		
			});
		} 
		//댓글 수정 목록
		 function cUpdatelist(num) {
			console.log(num);
			 document.getElementById("inputComment("+num+")").style.display="block";
			 document.getElementById("mainComment("+num+")").style.display="none";
		}
		
		//댓글 수정 목록 취소
		 function cCancel(num) {
			 document.getElementById("inputComment("+num+")").style.display="none";
			 document.getElementById("mainComment("+num+")").style.display="block";
		}
		
		//댓글 수정 확인
		function cUpdate(num){
			var comm = document.getElementById("inComment("+num+")").value;
				console.log(comm);
				
				$.ajax({
					url : "cupdate.do",
					data : {cContent:comm, commentNum:num},
					type : "post",
					success : function(data) { // data를 String으로 받아옴, 이전에는 json
						if(data == "success") {
							getReplyList();
							
						}
					}		
				});
		}
		
	</script>

   

   
   <p align="center">
      <c:url var="home" value="/" />
      <a href="${home}">시작페이지로 이동</a>&nbsp;
      <c:url var="flist" value="flist.do" />
      <a href="${flist}">목록 전체보기</a>
   </p>
   <br><br><br><br><br><br><br><br><br><br>
    </section>
</body>
</html>