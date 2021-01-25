<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/bootstrap.css">
<style>
body {
	padding-top: 70px;
	padding-bottom: 30px;
}
.board_title {
	font-weight : 700;
	font-size : 22pt;
	margin : 10pt;
}
.board_info_box {
	color : #6B6B6B;
	margin : 10pt;
}
.board_author {
	font-size : 10pt;
	margin-right : 10pt;
}
.board_date {
	font-size : 10pt;
}
.board_content {
	color : #444343;
	font-size : 12pt;
	margin : 10pt;
}
.board_tag {
	font-size : 11pt;
	margin : 10pt;
	padding-bottom : 10pt;
}
</style>
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
</head>
<body>
		<article>
		<c:forEach var="boardContent" items="${boardContent }">
			<div class="container" role="main">
				<h2>board Content</h2>
				<div class="bg-white rounded shadow-sm">
					<div class="board_title"><c:out value="${boardContent.title}"/></div>
					<div class="board_info_box">
						<span class="board_author"><c:out value="${boardContent.seq}"/>
						<input type="hidden" id="b_seq" value='<c:out value="${boardContent.seq}"></c:out>'></span>
						<span class="board_date"><c:out value="${boardContent.reg_date}"/></span>
					</div>
					<div class="board_content">${boardContent.content}</div>
				</div>
	
				<div style="margin-top : 20px">
					<button type="button" class="btn btn-sm btn-primary" id="btnUpdate">수정</button>
					<button type="button" class="btn btn-sm btn-primary" id="btnDelete">삭제</button>
					<button type="button" class="btn btn-sm btn-primary" id="btnList">목록</button>
				</div>
				
				<div class="commentform">
					<textarea class="form-control" rows="5" id="comment"></textarea>
					<button type="button" class="btn btn-sm btn-primary" id="commentSubmit">저장</button>
					<div class="commentList"></div>
				</div>
				
			</div>
		</c:forEach>
	</article>
	
	<script>
		$('#commentSubmit').on('click',function(event){
			var url = './readComment';
			var b_seq = $('#b_seq').val();
			$.ajax({
				tpye : 'get'
				,url : url
				,dataType : "json"
				,data : {
					"b_seq" : b_seq
				}
			}).done(function(data){
				var a = '';
				$.each(data,function(key,value){
					a += '<div class="commentArea">';
					a += '<div class="commentContent"> 내용 : ' + value.comment;
					a += '<a onclick="commentUpdate('+value.seq+',\''+value.comment+'\');"> 수정 </a>';
					a += '</div></div>';
				})
				$(".commentList").html(a);
			})
		})
		
		function commentUpdate(seq,comment){
			alert("업데이트")
			var a = "";
			a += '<textarea>여기다가 글쓰자</textarea>';
			$(".commentArea").html(a);
		}
	</script>
	
</body>
</html>