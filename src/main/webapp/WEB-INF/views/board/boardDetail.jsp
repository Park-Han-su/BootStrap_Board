<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ include file="../common/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta id="_csrf" name="_csrf" content="${_csrf.token}" /> 
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}" />
<link rel="stylesheet" href="../css/bootstrap.css">
<style>
textarea {
	width: 500px;
	resize: none;
}

#detailTitle, #detailHead {
	text-align: center;
}

</style>
<title>Insert title here</title>
</head>
<body>
	<!-- spring security session property -->
	<sec:authentication property="principal" var="user"/>
	권한체크 : ${user.authorities }

	<!-- 게시판 상세보기 -->
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
 				<c:if test="${boardDetail.file1Name ne null}">
					<tr>
						<td colspan='3'><a
							href="download?file1Name=${boardDetail.file1Name }&file1SName=${boardDetail.file1SName }"
							id='download' onclick="loginCheck()">${boardDetail.file1Name }</a></td>
					</tr>
				</c:if>
				<sec:authorize access="isAuthenticated() and !isAnonymous()">
					<sec:authorize access="hasAnyRole('ROLE_USER','ROLE_ADMIN')">
						console.log('${user.authorities == ROLL_USER }')
						<c:if test="${user.code == boardDetail.m_id}&&${user.authorities == ROLL_ADMIN }">
							<tr>
								<td>
									<form
										action='modify?seq=${boardDetail.seq}&${_csrf.parameterName}=${_csrf.token}'
										method="post">
										<input class="btn btn-default pull-left" type="submit"
											value="수정">
									</form> <script>
									</script>
									<form
										action='detail/delete?seq=${boardDetail.seq}&${_csrf.parameterName}=${_csrf.token}'
										onsubmit="return confirm('정말 삭제 하시겠습니까?')" method="post">
										<input class="btn btn-default pull-left" type="submit"
											value="삭제">
									</form>
								</td>
							</tr>
						</c:if>
					</sec:authorize>
				</sec:authorize>
			</c:forEach>
		</table>
		
		<!-- 댓글 Form -->
		<table class="table table-bordered">
			<tr>
				<td>
					<div class="commentForm">
						<div class="commentList"></div>
						<textarea class="form-control" rows="5" id="comment" placeholder="댓글을 입력하세요"></textarea>
						<button type="button" id="addComment" class="btn btn-primary btn-block">저장</button>
					</div>
				</td>
			</tr>
		</table>
		
	</div>
	
	<script>
		
		var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content");
		
		window.onload = readComment();
		<sec:authorize access="isAuthenticated() and !isAnonymous()">
		var userCode = '${user.code}';
		var m_name = '${user.name}';
		</sec:authorize>
		
		document.getElementById('addComment').addEventListener('click',function(){
			if(userCode == null){
				alert('로그인후 이용 가능합니다.')
			}else if($('#comment').val() == '' ){
				alert('내용을 입력해주세요')
			}else{
				var url = './insertComment'
	 			$.ajax({
					async : true
					,method: "post"
					,beforeSend: function(xhr){
						xhr.setRequestHeader(header, token);
					    }
					,url: url
					,data: JSON.stringify({
							m_id: userCode
							,b_seq: $('#b_seq').val()
							,comment:$('#comment').val()
							,m_name: m_name
						}),
						contentType : 'application/json'
					}).done(function(){
						alert('등록완료')
						$('#comment').val('');
						readComment();
					})
			}
		});
		
		
		//댓글 get
		function readComment(){
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
				$.each(data,function(idx,data){
			        a += '<div class="commentArea" style="border-bottom:1px solid darkgray; margin-bottom: 15px; text-align:left;">';
			        a += '<div class="commentInfo'+data.seq+'">'+' 작성자 : '+data.m_name+'<br>';
			        a += '<input type="hidden" id=commentSeq value="'+data.seq+'">';
			        a += '<div class="commentContent'+data.seq+'"> <p id="commentContent"> '+data.comment +'</p>';
			        a += '<p>'+data.reg_date+'</p>'
			        <sec:authorize access="isAuthenticated() and !isAnonymous()">
			        var userCode = '${user.code}';
			        if(data.m_id == userCode){
			        a += '<a id="modify" onclick="commentUpdate('+data.seq+',\''+data.comment+'\');"> 수정 </a>';
			        a += '<a onclick="commentDelete('+data.seq+');"> 삭제 </a> '+'<br>';
			        }
					</sec:authorize>
			        a += '</div></div></div>';
				})
				$(".commentList").html(a);
			}).fail(function(){
				
			});
		}
		
		//댓글 수정
		function commentUpdate(seq,comment){
		    var a ='';
		    
		    a += '<div class="input-group">';
		    a += '<input type="text" class="form-control" name="Modifycomment'+seq+'" value="'+comment+'"/>';
		    a += '<span class="input-group-btn"><button class="btn btn-default" type="button" onclick="commentUpdateProc('+seq+');">수정</button> </span>';
		    a += '</div>';
		    
		    $('.commentContent'+seq).html(a);
		   
		}

		//댓글 수정
		function commentUpdateProc(seq){
		    var modifyComment = $('[name=Modifycomment'+seq+']').val();
		    $.ajax({
		        type : "post"
		        ,url : './modifyComment'
		        ,datatype : 'json'
		        ,data : {'comment' : modifyComment
		        		, 'seq' : seq}
		    	,beforeSend: function(xhr){
	    		xhr.setRequestHeader(header, token);
	    		}
		    }).done(function(data){
		    	alert('수정완료')
		    	if(data==1) readComment();
		    }).fail(function(){
		    	alert('수정실패')
		    })
		}
		
		//댓글 삭제 
		function commentDelete(seq){
			var check = confirm("정말 삭제 하시겠습니까?");
			if(check == true){
			    $.ajax({
			        type : 'post'
			        ,url : './deleteComment'
			        ,data :{'seq' :seq}
			    	,beforeSend: function(xhr){
			    		xhr.setRequestHeader(header, token);
			    	}
			    }).done(function(data){
			    	if(data==1) readComment();
			    }) .fail(function(err){
			    	alert('삭제실패')
			    });
			}else{
				readComment();
			}
		}

</script>
</body>
</html>		