<%@ page contentType="text/html; charset=utf-8"
		pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>입찰 페이지</title>
<style>
#countdown, #HourCountdown, #countExpire {
	display: inline;
	color: blue;
	font-weight: bold;
}
</style>
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
		//var ws = new WebSocket("ws://localhost:8000/mine/replyEcho");
		//r ws = new WebSocket("ws://"+root+"/replyEcho");

		//////////////////////////////아이디/////////////////////////////////////
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
					if (bidPrice > maxPrice) {
						ws.send(bidPrice); //입찰가격 보내기
						$('input[name=chatInput]').val(''); //입력창 초기화
					} else {
						alert('상위 입찰 하세요');
					}
				}
			});
		};
		var maxPrice = 0;
		var eventDataByJson = null; //제이슨 객체
		////////////////////////////////받기/////////////////////////////////////
		ws.onmessage = function(event) {
			eventDataByJson = JSON.parse(event.data); //제이슨 객체 반환
			$('#bidValue').text(eventDataByJson.price + '\n'); //최고입찰가 화면 갱신
			$('textarea').eq(0).prepend(
					eventDataByJson.name + '\t입찰시간 ' + eventDataByJson.date
							+ '\t입찰가 ' + eventDataByJson.price + '\n');
			maxPrice = parseInt($('#bidValue').text()); //최고입찰가 변수 갱신
			$('input[name=chatInput]').attr('placeholder', maxPrice + ' 상위 입찰'); //입찰시 인풋태그 밸류값 갱신
			//alert(maxPrice);
		};

		////////////////////////////////종료/////////////////////////////////////
		ws.onclose = function(event) {
			$('#chatStatus').text('Info: connection closed.');
		};
	});
</script>
<!-- 타이머 -->
<script type="text/javascript">
	var end_date = '<c:out value="${list.end_date}"/>';
	CountDownTimer(end_date, 'HourCountdown');
	function CountDownTimer(dt, id) {
		var end = new Date(dt);
		var _second = 1000;
		var _minute = _second * 60;
		var _hour = _minute * 60;
		var _day = _hour * 24;
		var timer;
		function showRemaining() {
			var now = new Date();
			var distance = end - now;
			// 시간 종료 시 뜨는 문구
			if (distance < 0) {
				clearInterval(timer);
				document.getElementById(id).innerHTML = '입찰마감합니다!';
				return;
			}
			var days = Math.floor(distance / _day);
			var hours = Math.floor((distance % _day) / _hour);
			var minutes = Math.floor((distance % _hour) / _minute);
			var seconds = Math.floor((distance % _minute) / _second);
			document.getElementById(id).innerHTML = days + '일 ';
			document.getElementById(id).innerHTML += hours + '시간 ';
			document.getElementById(id).innerHTML += minutes + '분 ';
			document.getElementById(id).innerHTML += seconds + '초';
		}
		timer = setInterval(showRemaining, 1000);
	}
</script>
</head>
<body>
	<!-- 타이머 -->
	입찰 마감 시간은 <c:out value="${list.end_date}"/><br>
	입찰 마감까지<div id="HourCountdown"></div>남았습니다.<br>
	<!--  -->
	<div>${list.unique_id}</div>
	<div>${list.product_name}</div>
	<p>
	<div id='chatStatus'></div>
	<div id='bidValue'>0</div>
	<textarea name="chatMsg" rows="20" cols="80"></textarea>
	<p>
		메시지 입력 : <input type="number" name="chatInput">
</body>
	</html>