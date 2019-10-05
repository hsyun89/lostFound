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
	<script src="http://cdn.sockjs.org/sockjs-0.3.4.js"></script>
<script type="text/javascript">
	$(function() {
		var url = window.location.host;//웹브라우저의 주소창의 포트까지 가져옴
		var pathname = window.location.pathname; /* '/'부터 오른쪽에 있는 모든 경로*/
		var appCtx = pathname.substring(0, pathname.indexOf("/", 2));
		var root = url + appCtx;
		//alert(root);
		var ws = new WebSocket("ws://70.12.113.171:8000/mine/replyEcho");
		//var ws = new WebSocket("ws://"+root+"/replyEcho");

		////////////////////////////////아이디/////////////////////////////////////
/* 		var name;
		window.onload = function() {
			while (true) {
				name = prompt("로그인 세션값(아이디)입력");
				if (name != null && name != "") {
										document.getElementsByTagName("h1")[0].innerHTML +=
					 "난 "+name+"임!!"; 
					break;
				}
			}
		} */

		////////////////////////////////소켓 오픈/////////////////////////////////////
		ws.onopen = function() {
			$('#chatStatus').text('입찰 시작');
			
			$('input[name=chatInput]').on('keyup', function(evt) { //키다운 치는순간 키업은 떼는순간
				if (evt.keyCode == 13) { //엔터
					var bidPrice = $('input[name=chatInput]').val(); //입력한 입찰가
					var maxPrice = $('#bidValue').val(); //최고입찰가
					ws.send(bidPrice); //입찰가격 보내기
					$('input[name=chatInput]').val(''); //입력창 초기화
				}
			});
		};

		////////////////////////////////받기/////////////////////////////////////
		var eventDataByJson = null; //제이슨 객체
		ws.onmessage = function(event) {
			//$('#bidValue').text(event.data+'\n');  //최고가
			eventDataByJson = JSON.parse(event.data); //제이슨 객체 반환
			$('#bidValue').text(eventDataByJson.price + '\n'); //최고입찰가
			$('textarea').eq(0).prepend(
					eventDataByJson.name+ '\t입찰시간 '
							+ eventDataByJson.date + '\t입찰가 '
							+ eventDataByJson.price + '\n');
		};

		////////////////////////////////종료/////////////////////////////////////
		ws.onclose = function(event) {
			$('#chatStatus').text('Info: connection closed.');
		};
	});
</script>
</head>
<body>
	<p>
	<div id='chatStatus'></div>
	<div id='bidValue'>100</div>
	<textarea name="chatMsg" rows="20" cols="80"></textarea>
	<p>
		메시지 입력 : <input type="number" name="chatInput">
</body>
	</html>
</p>