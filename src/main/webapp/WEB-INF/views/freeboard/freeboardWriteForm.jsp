<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script type="text/javascript"
	src="/resources/ckeditor/ckeditor.js"></script>
<title>공지사항 작성</title>
</head>
<body>
	<c:import url="../common/mainBar.jsp" />

	<br style="clear: both">

	<h1 align="center">자유게시판 등록페이지</h1>

	<br>
	<br>

	<form action="finsert.do" method="post" enctype="Multipart/form-data">
		<table align="center" border="1" cellspacing="0">
			<tr>
				<td>제목</td>
				<td><input type="text" size="50" name="title"></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><input type="text" name="memberId"
					value="${loginInfo.memberId }" readonly></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea rows="7" cols="50" id="editor1" name="bContent"></textarea></td>
			</tr>
			<script type="text/javascript">
				// Replace the <textarea id="editor1"> with a CKEditor 4
				// instance, using default configuration.
				//CKEDITOR.replace( 'editor1' );

				$(function() {
					CKEDITOR.replace('editor1', {
						filebrowserUploadUrl : "fileupload.do"
					});
				});
			</script>
			<tr>
				<td colspan="2" align="center"><input type="submit" value="등록">&nbsp;
					&nbsp; <input type="reset" value="취소"></td>
			</tr>
		</table>
	</form>




	<p align="center">
		<c:url var="home" value="/" />
		<a href="${ home }">시작페이지로 이동</a>&nbsp;
		<c:url var="flist" value="flist.do" />
		<a href="${ flist }">목록 전체보기</a>
	</p>
	<c:import url="../common/footer.jsp" />
</body>
</html>