<p><%@ page contentType="text/html; charset=utf-8"
		pageEncoding="utf-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<!DOCTYPE html>
	<html>
<head>
<meta charset="utf-8">
<title>Websocket Client</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script type="text/javascript">
	$(function() {
		var url = window.location.host;//웹브라우저의 주소창의 포트까지 가져옴
		var pathname = window.location.pathname; /* '/'부터 오른쪽에 있는 모든 경로*/
		var appCtx = pathname.substring(0, pathname.indexOf("/", 2));
		var root = url + appCtx;

		//alert(root);
		var ws = new WebSocket("ws://70.12.113.171:8000/mine/replyEcho");
		//var ws = new WebSocket("ws://"+root+"/replyEcho");

		ws.onopen = function() {
			$('#chatStatus').text('입찰 시작');

			$('input[name=chatInput]').on('keydown', function(evt) {
				if (evt.keyCode == 13) {
					var msg = $('input[name=chatInput]').val();
					ws.send(msg); //입찰가격 보내기
					$('input[name=chatInput]').val(''); //입력창 초기화
				}
			});
		};
		var eventDataByJson = null; //제이슨 객체
		ws.onmessage = function(event) {
			//$('#bidValue').text(event.data+'\n');  //최고가
			eventDataByJson = JSON.parse(event.data); //제이슨 객체 반환
			$('#bidValue').text(eventDataByJson.price + '\n');
			$('textarea').eq(0).prepend(
					'입찰자 ' + eventDataByJson.name + '\t입찰시간 '
							+ eventDataByJson.date + '\t입찰가 '
							+ eventDataByJson.price + '\n');
		};
		ws.onclose = function(event) {
			$('#chatStatus').text('Info: connection closed.');
		};
	});
</script>
</head>
<body>
	<p>
	<div id='chatStatus'></div>
	<div id='bidValue'></div>
	<textarea name="chatMsg" rows="20" cols="80"></textarea>
	<p>
		메시지 입력 : <input type="number" name="chatInput" min=>
</body>
	</html>
</p>