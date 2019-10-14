<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>내꺼야</title>

<meta name="description"
	content="This is a basic starter template for MMPilot which includes Bootstrap Framework." />
<link
	href="https://fonts.googleapis.com/css?family=Oxygen:300,400,600,700"
	rel="stylesheet">
<link href="/mine/resources/styles/main.css" rel="stylesheet">

<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body>
	<header class="tf-header">
		<nav class="navbar py-5 navbar-dark">
			<div class="container">
				<h1>
					<a class="navbar-brand" href="/mine">It's Mine</a>
				</h1>
				<div id="navbar">
					<ul class="nav pull-right">
						<li class="nav-item"><a class="nav-link" href="/mine/main">Home</a></li>
						<li class="nav-item"><a class="nav-link" href="/mine/auction">Auction</a></li>
						<li class="nav-item"><a class="nav-link" href="#contact">Contact</a></li>
						<c:choose>
							<c:when test="${empty status}">
								<li class="nav-item"><a class="nav-link" href="/mine/login">로그인</a></li>
							</c:when>
							<c:otherwise>
								<c:if test="${admin==1}">
								<li class="nav-item"><a class="nav-link" href="/mine/insertAuction">경매추가</a></li>
								</c:if>
									<form method="post" action="/mine/logout">
										<li class="nav-item"><a class="nav-link" href="/mine/logout">로그아웃</a></li>
									</form>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>
			</div>
		</nav>
		<c:if test="${empty status}">
		<script>
			alert("로그인 후 이용하실 수 있습니다")
			location.href = "/mine/login";
		</script>
	</c:if>
	</header>
<button type="button" class="btn btn-success" data-toggle="modal" data-target="#myModal">
                  수정하기
                </button>
              
                <!-- The Modal -->
                <div class="modal" id="myModal">
                <!-- inside the modal, instead of the page itself-->    
                <!-- <div class="modal-dialog modal-dialog-scrollable"> -->
                <!-- inside the modal, a scrollbar-->
                  <div class="modal-dialog">
                    <div class="modal-content">
                    
                      <!-- Modal Header -->
                      <div class="modal-header">
                        <h1 class="modal-title">Modal Heading</h1>
                        <button type="button" class="close" data-dismiss="modal">×</button>
                      </div>
                      
                      <!-- Modal body -->
                      <div class="modal-body">
                       <form action="/mine/userupdate" method="POST" class="form-signin">
<input value="${ status.email }" name="email"
							class="form-control" placeholder="이메일" type="text" readonly>

<input value="${ status.user_name }" name="user_name"
							class="form-control" placeholder="이름" type="text" required autofocus>						

<input type="password" id="password" name="password" class="form-control" 
			placeholder="비밀번호" required autofocus>

<input type="password" id="confirmpassword" name="confirmpassword"
			class="form-control" placeholder="비밀번호재확인" required autofocus>

<p id="pwcheck" style="color: red"></p>

<button type="submit">수정하기</button>

<!-- 비밀번호 중복체크 -->
<script type="text/javascript"
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
<script>
$(document).ready(function() {
	$('.login-info-box').fadeOut();
	$('.login-show').addClass('show-log-panel');

	$('#confirmpassword').blur(function() {
		console.log('#confirmpassword')
		if ($('#confirmpassword').val() != $('#password').val()) {
			$('#pwcheck').text("비밀번호가 다릅니다.");
		} else {
			$('#pwcheck').text("");
		}
	});
	function registerSuccess() {
		alert("수정완료")
	}
});
</script>
</form>
                      </div>
                      
                      <!-- Modal footer -->
                      <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                      </div>
                    </div>
                  </div>
                </div>
          <form action="/mine/userdelete" method="POST" class="form-signin">
<button type="submit" class="btn btn-danger" data-dismiss="modal" >탈퇴하기</button>
</form>
</body>
</html>