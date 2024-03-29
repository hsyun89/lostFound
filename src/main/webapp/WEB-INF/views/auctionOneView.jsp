<%@ page contentType="text/html; charset=utf-8"
		pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
  <head>
  	<style>
  	
		#countdown, #HourCountdown, #countExpire {
			display: inline;
			color: #7971ea;
			font-weight: bold;
		}
	</style>
    <title>Shoppers &mdash; Colorlib e-Commerce Template</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Mukta:300,400,700"> 
    <link rel="stylesheet" href="/mine/resources/fonts/icomoon/style.css">

    <link rel="stylesheet" href="/mine/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="/mine/resources/css/magnific-popup.css">
    <link rel="stylesheet" href="/mine/resources/css/jquery-ui.css">
    <link rel="stylesheet" href="/mine/resources/css/owl.carousel.min.css">
    <link rel="stylesheet" href="/mine/resources/css/owl.theme.default.min.css">


    <link rel="stylesheet" href="/mine/resources/css/aos.css">

    <link rel="stylesheet" href="/mine/resources/css/style.css">
    
  </head>
  
 <script type="text/javascript"src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script src="http://cdn.sockjs.org/sockjs-0.3.4.js"></script>
<script type="text/javascript">
//낙찰자여부
//var flag = '<c:out value="${flag}"/>'
/* if(flag=='notBidder'){
	alert('당신은 낙찰자가 아닙니다!!!!!');
} */
var end;  //마감시간 전역변수
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

/*  		window.onload = function() {
		$('textarea').text('<c:out value="${biddingList}"/>' + '\n'); //모든 입찰내역 불러오기
		} */
		var maxPrice = parseInt($('#bidValue').text());
		////////////////////////////////소켓 오픈/////////////////////////////////////
		ws.onopen = function() {
			$('#chatStatus').text('');
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
			$('button[id=bidButton]').on('click', function(evt) { //입찰하기 버튼 누르기
					var bidPrice = $('input[name=chatInput]').val(); //입력한 입찰가
					if (bidPrice > maxPrice) {
						ws.send(bidPrice); //입찰가격 보내기
						$('input[name=chatInput]').val(''); //입력창 초기화
					} else {
						alert('상위 입찰 하세요');
					}
			});
		};
		var eventDataByJson = null; //제이슨 객체
		////////////////////////////////받기/////////////////////////////////////
		ws.onmessage = function(event) {
			if(event.data == 'endBid'){
				alert("마감된 경매입니다!!");
			}
			eventDataByJson = JSON.parse(event.data); //제이슨 객체 반환
			//웹소켓 메시지 도착시 타이머 갱신
			//clearInterval(CountDownTimer);
			//document.getElementById('HourCountdown').innerHTML = '';
			//$('#HourCountdown').text(' ');
			//CountDownTimer(eventDataByJson.end_date, 'HourCountdown');
			//alert(eventDataByJson.end_date);
			//alert('<c:out value="${list.end_date}"/>');
			end=new Date(eventDataByJson.end_date);
			
			$('#bidValue').text(eventDataByJson.price + '\n'); //최고입찰가 화면 갱신
			$('textarea').eq(0).prepend(
					//eventDataByJson.name + 
					'입찰시간 ' + eventDataByJson.date
							+ '  입찰가 ' + eventDataByJson.price + '\n');
			maxPrice = parseInt($('#bidValue').text()); //최고입찰가 변수 갱신
			$('input[name=chatInput]').attr('placeholder', maxPrice + '+'); //입찰시 인풋태그 밸류값 갱신
			//alert(maxPrice);
		};

		////////////////////////////////종료/////////////////////////////////////
		ws.onclose = function(event) {
			$('#chatStatus').text('Info: connection closed.');
		};
	});

/* 타이머 */
	var end_date = '<c:out value="${list.end_date}"/>';
	CountDownTimer(end_date, 'HourCountdown');
	function CountDownTimer(dt, id) {
		end = new Date(dt);
		var _second = 1000;
		var _minute = _second * 60;
		var _hour = _minute * 60;
		var _day = _hour * 24;
		var timer;
		
		//서버와 클라이언트의 시간차 조정
		var st = srvTime();
		var serverT = new Date(st);
		var clientT = new Date();
		var gap = serverT - clientT;
		//alert(gap);
		clearInterval(timer);
		function showRemaining() {
			var now = new Date();
			//alert(now);
			var distance = end - now - gap; //시간차 조정
			// 시간 종료 시 뜨는 문구
			if (distance < 0) {
				clearInterval(timer);
				document.getElementById(id).innerHTML = '입찰 마감';
				return;
			}
			var days = Math.floor(distance / _day);
			var hours = Math.floor((distance % _day) / _hour);
			var minutes = Math.floor((distance % _hour) / _minute);
			var seconds = Math.floor((distance % _minute) / _second);
			document.getElementById(id).innerHTML = '입찰 마감까지 ';
			document.getElementById(id).innerHTML += days + '일 ';
			document.getElementById(id).innerHTML += hours + '시간 ';
			document.getElementById(id).innerHTML += minutes + '분 ';
			document.getElementById(id).innerHTML += seconds + '초';
			document.getElementById(id).innerHTML += ' 남았습니다!';
		}
		//clearInterval(timer);
		timer = setInterval(showRemaining, 1000);
	}
	//서버시간 불러오기
    var xmlHttp;
    function srvTime() {
        try {
            //FF, Opera, Safari, Chrome
            xmlHttp = new XMLHttpRequest();
        }
        catch (err1) {
            //IE
            try {
                xmlHttp = new ActiveXObject('Msxml2.XMLHTTP');
            }
            catch (err2) {
                try {
                    xmlHttp = new ActiveXObject('Microsoft.XMLHTTP');
                }
                catch (eerr3) {
                    //AJAX not supported, use CPU time.
                    alert("AJAX not supported");
                }
            }
        }
        xmlHttp.open('HEAD', window.location.href.toString(), false);
        xmlHttp.setRequestHeader("Content-Type", "text/html");
        xmlHttp.send('');
        return xmlHttp.getResponseHeader("Date");
    }
	//마감시간에 따른 버튼 디스플레이
	//마감후 결제 버튼 보이기 & 입찰 버튼 숨기기
/* 	var now = new Date();
	var distance = end-now;
	alert(distance);
	if(distance<0){
		alert('마감');
		document.getElementById('bidButton').style.display = 'none';
		document.getElementById('payButton').style.display = '';
	}else{
		document.getElementById('bidButton').style.display = '';
		document.getElementById('payButton').style.display = 'none';
	} */
</script>
  
  <body>
  
  <div class="site-wrap">
    <header class="site-navbar" role="banner">
      <div class="site-navbar-top">
        <div class="container">
          <div class="row align-items-center">

             <div class="col-6 col-md-4 order-2 order-md-1 site-search-icon text-left">
              <form action="" class="site-block-top-search">
                <span class="icon icon-search2"></span>
                <input type="text" class="form-control border-0" placeholder="Search">
              </form>
            </div>

            <div class="col-12 mb-3 mb-md-0 col-md-4 order-1 order-md-2 text-center">
              <div class="site-logo">
                <a href="<%=request.getContextPath()%>/main" class="js-logo-clone">내 꺼 야</a>
              </div>
            </div>

            <div class="col-6 col-md-4 order-3 order-md-3 text-right">
              <div class="site-top-icons">
                <ul>
<!--                   <li><a href="#"><span class="icon icon-person"></span></a></li>
                  <li><a href="#"><span class="icon icon-heart-o"></span></a></li> -->
                  <li>
                    <a href="<%=request.getContextPath()%>/combid" class="site-cart">
                      <span class="icon icon-shopping_cart"></span>
                      <span class="count">${cartCount}</span>
                    </a>
                  </li> 
                  <li class="d-inline-block d-md-none ml-md-0"><a href="#" class="site-menu-toggle js-menu-toggle"><span class="icon-menu"></span></a></li>
                </ul>
              </div> 
            </div>

          </div>
        </div>
      </div> 
      <nav class="site-navigation text-right text-md-center" role="navigation">
        <div class="container">
          <ul class="site-menu js-clone-nav d-none d-md-block">
            <!-- <li class="has-children"> -->
              <li><a href="<%=request.getContextPath()%>/main">Home</a></li>
<!--               <ul class="dropdown">
                <li><a href="#">Menu One</a></li>
                <li><a href="#">Menu Two</a></li>
                <li><a href="#">Menu Three</a></li>
                <li class="has-children">
                  <a href="#">Sub Menu</a>
                  <ul class="dropdown">
                    <li><a href="#">Menu One</a></li>
                    <li><a href="#">Menu Two</a></li>
                    <li><a href="#">Menu Three</a></li>
                  </ul>
                </li>
              </ul> -->
            <!-- </li> -->
            <!-- <li class="has-children"> -->
              <li><a href="<%=request.getContextPath()%>/lost">Lost</a></li>
              <!-- <ul class="dropdown">
                <li><a href="#">Menu One</a></li>
                <li><a href="#">Menu Two</a></li>
                <li><a href="#">Menu Three</a></li>
              </ul> -->
           <!--  </li> -->
            <li class="active"><a href="<%=request.getContextPath()%>/auction">Auction</a></li>
<!--              <li><a href="#">Catalogue</a></li>
            <li><a href="#">New Arrivals</a></li> 
            <li><a href="contact.html">Contact</a></li> -->
          </ul>
        </div>
      </nav>
    </header>

    <div class="bg-light py-3">
      <div class="container">
        <div class="row">
          <div class="col-md-12 mb-0"><a href="<%=request.getContextPath()%>/main">Home</a> <span class="mx-2 mb-0">/</span> <a href="<%=request.getContextPath()%>/auction">Auction</a> <span class="mx-2 mb-0">/</span><strong class="text-black">${list.product_name}</strong></div>
        </div>
      </div>
    </div>  

    <div class="site-section">
      <div class="container">
        <div class="row">
          <div class="col-md-6">
            <img src="${list.image_address}" alt="Image" class="img-fluid">
          </div>
          <div class="col-md-6">
            <h2 class="text-black">${list.product_name}</h2>
            <p>  </p>
            <p class="mb-4"><div id="HourCountdown"></div><div id='chatStatus'></div></p>
            <p><strong id='bidValue'class="text-primary h4"><!-- 최고가 -->
            	<!-- 최고입찰가 or 시작가 -->
            	<c:choose>
	            	<c:when test= "${empty maxPriceAndUser.price}">
	            		${list.start_price}원
	            	</c:when>
	            	<c:otherwise>
	            		${maxPriceAndUser.price}원
	            	</c:otherwise>
            	</c:choose>
            </strong></p>
<!--             <div class="mb-1 d-flex">
              <label for="option-sm" class="d-flex mr-3 mb-3">
                <span class="d-inline-block mr-2" style="top:-2px; position: relative;"><input type="radio" id="option-sm" name="shop-sizes"></span> <span class="d-inline-block text-black">Small</span>
              </label>
              <label for="option-md" class="d-flex mr-3 mb-3">
                <span class="d-inline-block mr-2" style="top:-2px; position: relative;"><input type="radio" id="option-md" name="shop-sizes"></span> <span class="d-inline-block text-black">Medium</span>
              </label>
              <label for="option-lg" class="d-flex mr-3 mb-3">
                <span class="d-inline-block mr-2" style="top:-2px; position: relative;"><input type="radio" id="option-lg" name="shop-sizes"></span> <span class="d-inline-block text-black">Large</span>
              </label>
              <label for="option-xl" class="d-flex mr-3 mb-3">
                <span class="d-inline-block mr-2" style="top:-2px; position: relative;"><input type="radio" id="option-xl" name="shop-sizes"></span> <span class="d-inline-block text-black"> Extra Large</span>
              </label>
            </div> -->
            <div class="mb-5">
             <div class="input-group mb-3" style="max-width: 350px;">
              <div class="input-group-prepend">
                <button class="btn btn-outline-primary js-btn-minus" type="button">&minus;</button>
              </div>
              <input type="text" name="chatInput" class="form-control text-center" value="0" placeholder="" aria-label="Example text with button addon" aria-describedby="button-addon1" style="width: 80px !important;">
              <div class="input-group-append">
                <button class="btn btn-outline-primary js-btn-plus" type="button">&plus;</button>
              </div>
            <button id="bidButton" class="buy-now btn btn-sm btn-primary"style="display :; margin-left: 20px;">입찰하기</button>
            </div>
            </div>
            <!-- 입찰가 그래프 -->
            <!-- 경매내역 -->
            <textarea name="chatMsg" rows="5" cols="60"><c:if test="${!empty biddingList}"><c:forEach var="vo" items="${biddingList}"><c:out value="입찰시간 ${vo.bid_date}  입찰가 ${vo.price}원
"/></c:forEach></c:if></textarea>
			<%-- <p><a id='payButton' style="display :" href="http://70.12.113.171:8000/mine/payment?productId=${list.unique_id}" class="buy-now btn btn-sm btn-primary">결제지워</a></p> --%>
          </div>
        </div>
      </div>
    </div>

 


    <footer class="site-footer border-top">
      <div class="container">
        <div class="row">
          <div class="col-lg-6 mb-5 mb-lg-0">

          </div>
          <div class="col-md-6 col-lg-3 mb-4 mb-lg-0">

          </div>
          <div class="col-md-6 col-lg-3">
            <div class="block-5 mb-5">
              <h3 class="footer-heading mb-4">Contact Info</h3>
              <ul class="list-unstyled">
                <li class="address">서울특별시 역삼동 멀티캠퍼스 1304호</li>
                <li class="phone"><a href="tel://23923929210">02 123 1234</a></li>
                <li class="email">itsmine@mulcam.com</li>
              </ul>
            </div>


          </div>
        </div>
        <div class="row pt-5 mt-5 text-center">
          <div class="col-md-12">
            <p>
            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
            Copyright &copy;<script data-cfasync="false" src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script><script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="icon-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank" class="text-primary">Colorlib</a>
            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
            </p>
          </div>
          
        </div>
      </div>
    </footer>
  </div>

  <script src="/mine/resources/js/jquery-3.3.1.min.js"></script>
  <script src="/mine/resources/js/jquery-ui.js"></script>
  <script src="/mine/resources/js/popper.min.js"></script>
  <script src="/mine/resources/js/bootstrap.min.js"></script>
  <script src="/mine/resources/js/owl.carousel.min.js"></script>
  <script src="/mine/resources/js/jquery.magnific-popup.min.js"></script>
  <script src="/mine/resources/js/aos.js"></script>

  <script src="/mine/resources/js/main.js"></script>
    
  </body>
</html>

<!-- /////////////////////// -->
<%-- 
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
	</html> --%>