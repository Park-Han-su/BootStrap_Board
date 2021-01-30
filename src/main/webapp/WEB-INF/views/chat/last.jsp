<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp" %>    
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
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
<script th:inline = "javascript">

	var webSocket;
	var nickname;
	document.getElementById("name").addEventListener("click", function() {
		nickname = document.getElementById("nickname").value;
		document.getElementById("nickname").style.display = "none";
		document.getElementById("name").style.display = "none";
		connect();
	})
	document.getElementById("send").addEventListener("click", function() {
		send();
	})
	function connect() {
		webSocket = new WebSocket("ws://localhost:8080/strap/chat");
		webSocket.onopen = onOpen;
		webSocket.onclose = onClose;
		webSocket.onmessage = onMessage;
	}
	function disconnect() {
		webSocket.send(nickname + "님이 퇴장하셨습니다");
		webSocket.close();
	}
	function send() {
		msg = document.getElementById("message").value;
		webSocket.send(nickname + " : " + msg);
		document.getElementById("message").value = "";
	}
	function onOpen() {
		webSocket.send(nickname + "님이 입장하셨습니다.");
	}
	function onMessage(e) {
		data = e.data;
		chatroom = document.getElementById("chatroom");
		chatroom.innerHTML = chatroom.innerHTML + "<br>" + data;
	}
	function onClose() {

	}
</script>
</html>