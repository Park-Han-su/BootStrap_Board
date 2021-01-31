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
th, td {
	text-align: center;
}
</style>
<title>Insert title here</title>
</head>
<body>
	<!-- 전체 리스트 출력 -->
	<div class="container">
		<table class="table table-hover">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>날짜</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="boardList" items="${boardList}">
					<tr>
						<td width="15%">${boardList.seq }</td>
						<td width="55%"><a href='detail?seq=${boardList.seq }'>${boardList.title}</a></td>
						<td width="15%">${boardList.name}</td>
						<td width="20%"><fmt:formatDate value="${boardList.reg_date}"
								pattern="yyyy/ MM/ dd/ HH:MM"/></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
		<sec:authorize access="isAuthenticated()">
			<a href="write" class="btn btn-default pull-right">작성</a>
		</sec:authorize>

		<!-- 페이징 -->
		<div class="text-center">
			<c:if test="${page.pageNo > 1 }">
				<ul class="pagination">
					<li class="page-item"><a class="page-link" href="list?pageNo=${page.pageNo-1 }">Previous</a></li>
				</ul>
			</c:if>
			<c:forEach var="pNo" begin="1" end="${page.pageCnt }">
			<ul class="pagination">
				<li class="page-item"><a class="page-link" href="list?pageNo=${pNo }">${pNo}</a></li>
			</ul>
			</c:forEach>
			<c:if test="${page.pageNo < page.pageCnt }">
				<ul class="pagination">
					<li class="page-item"><a class="page-link" href="list?pageNo=${page.pageNo+1 }">Next</a></li>
				</ul>
			</c:if>
		</div>
	</div>
</body>
</html>