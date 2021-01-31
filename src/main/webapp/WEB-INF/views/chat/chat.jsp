<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ include file="../common/header.jsp" %>    
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset = UTF-8" />
    <title></title>
    <link rel="stylesheet" href="css/bootstrap.css">
</head>
<body>
<div class="container">
    <div class="alert alert-success" id="successMessage" style="display : none">
        <strong>메세지 전송에 성공했습니다.</strong>
    </div>
    <div class="alert alert-danger" id="failMessage" style="display : none">
        <strong>메세지 전송에 실패했습니다. 확인 후 다시 시도해 주세요.</strong>
    </div>
    <div class="container bootstrap snippet">
        <div class="row">
            <div class="col-xs-12">
                <div class="portlet portlet-default">
                    <div class="portlet-title">
                        <h4><i class="fa fa-circle text-green">채팅방</i></h4>
                        <hr>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div id="chat" class="panel-collapse collapse in">
                    <div id = "space" class="portlet-body chat-widget" style="overflow-y : auto; width:auto; height:500px;">
                    </div>
                    <div class="portlet-footer">
                        <div class="row">
                            <div class="form-group col-xs-4">
                            </div>
                        </div>
                        <div class="row" style="height:90px">
                            <div class="form-group col-xs-10">
                                <textarea style="height:80px;" id="message" class="form-control" placeholder="메세지를 입력하세요." maxlength="100"></textarea>
                            </div>
                            <div class="form-group col-xs-2">
                                <button type="button" class="btn btn-default pull-right" onclick="send()">전송</button>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>
<script>
	
	window.onload = connect();
	
	<!-- spring security session property -->
	<sec:authentication property="principal" var="user"/>
			var webSocket;
	function connect(){
		wsUri = "ws://localhost:8080/strap";
	    webSocket = new WebSocket(wsUri+"/chat/websocket");
	    webSocket.onopen = onOpen;
	    webSocket.onclose = onClose;
	    webSocket.onmessage = onMessage;
	}
	function disconnect(){
		<sec:authorize access="isAuthenticated() and !isAnonymous()">
			var nickname = '${user.name}';
		    webSocket.send(nickname + "님이 퇴장하셨습니다");
		    webSocket.close();
		    console.log('퇴장');
		</sec:authorize>
	}
	function send(){
		<sec:authorize access="isAuthenticated() and !isAnonymous()">
			var nickname = '${user.name}';
		    var msg = $('#message').val();
		    console.log(msg)
		    webSocket.send(nickname+":" + msg);
		    $('#message').val('');
		</sec:authorize>
	}
	function onOpen(){
		<sec:authorize access="isAuthenticated() and !isAnonymous()">
			var nickname = '${user.name}';
	    webSocket.send(nickname+ "님이 입장하셨습니다.");
		</sec:authorize>
	}
	function onMessage(e){
	    data = e.data;
	    chatroom = document.getElementById("space");
	    chatroom.innerHTML = chatroom.innerHTML + "<br>" + data;
	}
	function onClose(){
		console.log('퇴장');
	}
</script>

</html>