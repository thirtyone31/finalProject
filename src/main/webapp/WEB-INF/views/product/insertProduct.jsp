<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품등록</title>
</head>
<body>
	<h1 align="center">상품등록</h1>

	<br>
	<br>


	<form action="insertProduct.do" method="post" enctype="Multipart/form-data">
		<table align="center" border="1" cellspacing="0">
			<tr>
				<td>카테고리</td>
				<td><select name="categoryNum">
						<option value="1" selected>낚시대</option>
						<option value="2">릴</option>
						<option value="3">가방</option>
						<option value="4">채비</option>
						<option value="5">라인</option>
						
				</select></td>
			</tr>


			<tr>
				<td>상품이름</td>

				<td><input type="text" name="productName"></td>
			</tr>
			<tr>
				<td>상품재고</td>
				<td><input type="text" name="productStock"></td>
			<tr>
				<td>상품가격</td>
				<td><input type="text" name="productPrice"></td>
			</tr>
			<tr>
				<td>상품사이즈</td>
				<td><input type="text" name="productSize"></td>
			</tr>
			<tr>
				<td>상품색상</td>
				<td><input type="text" name="productColor"></td>
			</tr>
			<tr>
				<td>상품정보</td>
				<td><input type="file" name="uploadFileInfo"></td>
			</tr>
			<tr>
				<td>첨부파일</td>
				<td><input type="file" name=uploadFile> 
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" value="등록">&nbsp;
					&nbsp; </td>
				<a href="listAdminProduct.do">클릭하세요</a>	
			</tr>
		</table>
	</form>




	<!-- 게시물 검색하기 -->



	<p align="center">
		<c:url var="home" value="" />
		<a href="productMain.do">HOME</a>&nbsp;

	

		<!-- web에서 패킷이 전송될때 그 패킷의 구조를 보면 header와 body로 나뉘어져있다.
		header에 다양한 정보가 포함되어 있는데 예를 들어 uesr-agent(브라우저) referer(이전페이지)들이 있습니다. -->

		<c:url var="back" value="${header.referer }" />
		<a href="${back }">이전</a>
	</p>

</body>
</html>