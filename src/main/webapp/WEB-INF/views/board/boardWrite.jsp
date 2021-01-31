<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../common/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../css/bootstrap.css">
<style>
textarea {
	width: 500px;
	resize: none;
}

fr-element fr-view {
	width: 500px;
	height: 500px;
}
</style>
<title>Insert title here</title>
</head>
<body>
	<!-- spring security session property -->
	<sec:authentication property="principal" var="user"/>
	
	<div class="container">
		<!-- spring security 사용시 파일 업로드 할때 action 에 토큰값 안보내주면 무한로그인창 ${_csrf.parameterName}=${_csrf.token} -->
		<form action='./insert?${_csrf.parameterName}=${_csrf.token}' method="post" enctype="multipart/form-data">
			<div class="form-group">
				<label for="exampleFormControlInput1">제목</label> <input type="text"
					class="form-control" id="exampleFormControlInput1" name="title">
			</div>
			<div class="form-group">
				<label for="exampleFormControlInput1">작성자</label> <input type="text"
					class="form-control" id="exampleFormControlInput1" value=" ${user.name}" readonly>
			</div>
			<div class="form-group">
				<label for="exampleFormControlTextarea1">내용</label>
				<textarea class="form-control" rows="20" name="content" wrap="hard"></textarea>
				<input type="file" name="file1">
			</div>
			<input type="hidden" name="m_id" value="${user.code }">
			<button type="submit" class="btn btn-info pull-right">작성완료</button>
		</form>
	</div>
</body>
</html>