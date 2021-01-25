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
<link rel="stylesheet" type="text/css" href="../css/bootstrap.css">
<style>
th, td {
	text-align: center;
}
</style>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<div class="py-5 text-center">
			<img class="d-block mx-auto mb-4"
				src="https://getbootstrap.com/docs/4.0/assets/brand/bootstrap-solid.svg"
				alt="" width="72" height="72">
			<h2>회원가입</h2>
		</div>
		<div class="col-md-12 order-md-1">
			<h4 class="mb-3">회원정보</h4>
			<br>
			<form action="join" method="post">
				<div class="mb-3">
					<label for="email">이메일</label>
					<button type="button" id="checkbtn" class="btn btn-default pull-right">중복확인</button>
					<input type="email" class="form-control" name="email" placeholder="you@example.com" required maxlength="30"/>
					<br>
					<div class="mb-3" id="checkMsg" style="display:none;">
					<input type="text" class="form-control" name="name" required/>
					</div>
				</div>
				<br>
				<div class="mb-3">
					<label for="password">비밀번호</label> 
					<input type="password" class="form-control" name="password" required/>
				</div>
				<br>
				<div class="mb-3">
					<label for="firstName">이름</label>
					 <input type="text" class="form-control" name="name" required/>
				</div>
	
				<hr class="mb-4">
				<button class="btn btn-primary btn-lg btn-block" type="submit">가입하기</button>
				<hr class="mb-4">
			</form>
		</div>

	</div>
	
	<script type="text/javascript">
		
		$("#checkbtn").on("click",function(){
			var email = $('[name=email]').val();
			$.ajax({
		        type : 'get'
		        ,url : './emailCheck'
		        ,dataType : 'json'
		        ,data :{'email' : email}
		    }).done(function(data){
		    	if(data){
		    		$('#checkMsg').html('<p style="color:red">사용불가</p>');
		    		$('#checkMsg').css('display','block');
		    	}else{
		    		$('#checkMsg').html('<p style="color:blue">사용가능</p>');
		    	}
		    })
		});
	</script>

	<script src="../js/bootstrap.js"></script>

</body>
</html>