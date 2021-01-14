<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

	<nav class="navbar navbar-default">
		<div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">테스트 게시판</a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<form class="navbar-form navbar-left" role="search">
					<div class="form-group">
						<input type="text" class="form-control" placeholder="Search">
					</div>
					<button type="submit" class="btn btn-default">Submit</button>
				</form>
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-expanded="false">메뉴
							<span class="caret"></span>
					</a>
							<ul class="dropdown-menu" role="menu">
							<c:if test="${sessionScope.member == null}">
								<li><a href="/strap/member/login">로그인</a></li>
								<li><a href="/strap/member/join">회원가입</a></li>
							</c:if>
								<li><a href="#">메인</a></li>
								<c:if test="${sessionScope.member != null }">
								<li><a href="/strap/member/logout">로그아웃</a></li>
								</c:if>
						</ul>
						</li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>
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
						<td width="5%">${boardList.seq }</td>
						<td width="65%"><a href='detail?seq=${boardList.seq }'>${boardList.title}</a></td>
						<td width="15%">${boardList.name}</td>
						<td width="20%"><fmt:formatDate value="${boardList.reg_date}"
								pattern="yyyy/ MM/ dd" /></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<c:if test="${sessionScope.member != null }">
		<a href="write" class="btn btn-default pull-right">작성</a>
		</c:if>

		<div class="text-center">
			<c:forEach var="pNo" begin="1" end="${page.pageCnt }">
			<ul class="pagination">
				<li><a href="list?pageNo=${pNo }">${pNo}</a></li>
			</ul>
			</c:forEach>
		</div>
		
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="../js/bootstrap.js"></script>

</body>
</html>