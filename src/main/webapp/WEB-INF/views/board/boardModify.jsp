<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
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
	<div class="container">
		<c:forEach var="boardDetail" items="${detail}">
		<script>
			console.log('${boardDetail.name}');
		</script>
		<form action='modify/check?${_csrf.parameterName}=${_csrf.token}' method="post">
			<div class="form-group">
				<label for="exampleFormControlInput1">제목</label> <input type="text"
					class="form-control" id="exampleFormControlInput1" name="title"
					value="${boardDetail.title }">
			</div>
			<div class="form-group">
				<label for="exampleFormControlInput1">작성자</label> <input type="text"
					class="form-control" id="exampleFormControlInput1" name="name"
					value="${boardDetail.name }" readonly>
			</div>
			<div class="form-group">
				<label for="exampleFormControlTextarea1">내용</label>
				<textarea class="form-control" 
					rows="10" name="content">${boardDetail.content }</textarea>
			</div>
			<input type="hidden" name="seq" value="${boardDetail.seq }">
			<button type="submit" class="btn btn-info pull-right">수정하기</button>
		</form>
		</c:forEach>
	</div>
</body>
</html>