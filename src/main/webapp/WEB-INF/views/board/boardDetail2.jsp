<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../common/header.jsp"%>
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

th, td {
	text-align: center;
}

#detailTitle, #detailHead {
	text-align: center;
}

.comment.empty{
	text-align: center;
}

#detailContent {
	text-align: left;
}
</style>
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<table class="table table-bordered">
			<c:forEach var="boardDetail" items="${detail }">
				<tr>
					<th colspan="2" id="detailTitle">
						<c:out value=" ${boardDetail.title}"></c:out>
						<input type="hidden" id="b_seq" value='<c:out value="${boardDetail.seq }"></c:out>'>
				</tr>
				<tr>
					<td width="50%"> 작성자 : <c:out value="${boardDetail.name }"></c:out>
						<input type="hidden" id="m_id" value='<c:out value="${sessionScope.member.id }"></c:out>'>
					</td>
					<td> 
						<fmt:formatDate value="${boardDetail.reg_date}" pattern="yyyy/ MM/ dd" />
					</td>
				</tr>
			</c:forEach>
		</table>
		<table class="table table-bordered">
			<c:forEach var="boardDetail" items="${detail }">
				<tr>
					<td colspan='3' id="detailContent" style="white-space: pre;"><c:out value="${boardDetail.content}" />
						<c:if test="${boardDetail.file1SName ne null}">
							<img width="200" height="200" src="../resources/upload/${boardDetail.file1SName} "alt="${boardDetail.file1Name }" class="img-circle pull-right">
						</c:if>
					</td>
				</tr>
				<c:if test="${null ne boardDetail.file1Name }">
					<tr>
						<td colspan='3'><a
							href="download?file1Name=${boardDetail.file1Name }&file1SName=${boardDetail.file1SName }"
							id='download' onclick="loginCheck()">${boardDetail.file1Name }</a></td>
					</tr>
				</c:if>
			</c:forEach>
			<tr>
				<td>
					<textarea class="form-control" rows="5" id="comment"></textarea>
					<div class="dbComment">
						<div class="modifyComment"></div>
					</div>
					<button type="button" id="addComment" class="btn btn-primary btn-block">저장</button>
				</td>
			</tr>
		</table>
		<c:forEach var="boardDetail" items="${detail }">
			<c:if
				test="${sessionScope.member.id == boardDetail.m_id or sessionScope.member.id == 1 }">
				<form action='detail/delete?seq=${boardDetail.seq}' method="post">
					<input class="btn btn-default pull-right" type="submit" value="삭제">
				</form>
				<form action='modify?seq=${boardDetail.seq}' method="post">
					<input class="btn btn-default pull-left" type="submit" value="수정">
				</form>
			</c:if>
		</c:forEach>
	</div>
	<c:if test="${sessionScope.member.id eq null }">
		<script>
					function loginCheck() {
						alert('로그인후 이용 가능합니다.');
					}
		</script>
	</c:if>
	<script>
		window.onload = test();
		document.getElementById('addComment').addEventListener('click',function(){
			if(${sessionScope.member == null}){
				alert('로그인후 이용 가능합니다.')
			}else if($('#comment').val() == '' ){
				alert('내용을 입력해주세요')
			}else{
				var url = './insertComment'
	 			$.ajax({
					async : true,
					method: "post",
					url: url,
					data: JSON.stringify({
							m_id: $('#m_id').val()
							,b_seq: $('#b_seq').val()
							,comment:$('#comment').val()
						}),
						contentType : 'application/json'
					}).done(function(){
						alert('등록완료')
						$('#comment').val('');
						test();
						
					})
			}
		});
		
		/* read ajax 댓글 등록시 db에서 가져온 값이 중복으로 출력되는 문제 해결해야됨*/
		function test(){
			var url = './readComment'
			var b_seq = $('#b_seq').val();
			$.ajax({
				type : "get"
				,url : url
				,dataType : "json"
				,data: {
					"b_seq" : b_seq
				}
			}).done(function(data){
				var a =''; 
				$.each(data,function(test,data){
			        a += '<div class="commentArea" style="border-bottom:1px solid darkgray; margin-bottom: 15px; text-align:left;">';
			        a += '<div class="commentInfo'+data.seq+'">'+' 작성자 : '+data.m_id+'<br>';
			        a += '<div class="commentContent'+data.seq+'"> <p> 내용 : '+data.comment +'</p>';
			        a += '<a onclick="commentUpdate('+data.seq+',\''+data.comment+'\');"> 수정 </a>';
			        a += '<a onclick="commentDelete('+data.seq+');"> 삭제 </a> </div>'+'<br>';
			        a += '</div></div>';
				})
				$(".dbComment").html(a);
			}).fail(function(){
				
			});
		}
		
		function commentUpdate(seq,comment){
			alert('check');
			var a ='<textarea rows="5" cols="5">여기다가 글쓰자</textarea>';
			$('.modifyComment').html(a);
		}
		
	</script>
	
<!-- 				var url = './modifyComment'
	 			$.ajax({
					async : true,
					method: "post",
					url: url,
					data: JSON.stringify({
						 seq 
						,comment
						}),
					contentType : 'application/json'
	 			}).done(function(){
	 				console.log(url)
	 				alert('수정완료')
	 			}) -->
</body>
</html>