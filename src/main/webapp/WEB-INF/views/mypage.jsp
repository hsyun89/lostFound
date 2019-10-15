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
<style>
#btn1{
    height:38px; 
    width:100px; 
    margin: -20px -50px; 
    position:relative;
    top:50%; 
    left:45%;
}
#btn2{
    height:38px; 
    width:100px; 
    margin: -400px -50px; 
    position:relative;
    top:10%; 
    left:55%;
} 
</style>
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
										<li class="nav-item"><a class="nav-link" href="/mine/logout">로그아웃</a></li>
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
	<div style="margin-top: 20px">
<button type="button" id="btn1" class="btn btn-success" data-toggle="modal" data-target="#myModal">
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

<button type="submit" class="btn btn-success">수정하기</button>

<!-- 비밀번호 중복체크 -->
<script type="text/javascript"
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
</form>
                      </div>                  
                      <!-- Modal footer -->
                      <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                      </div>
                      
                    </div>
                  </div>
                </div>
<!-- <button type="submit" class="btn btn-danger" id="btn2" data-dismiss="modal" onclick="location.href='/mine/userdelete'">탈퇴하기</button> -->
<button type="button" class="btn btn-danger" id="btn2" data-toggle="modal" data-target="#myModal2">
                  탈퇴하기
                </button>
                </div>
              
                <!-- The Modal -->
                <div class="modal" id="myModal2">
                  <div class="modal-dialog">
                    <div class="modal-content">
                    
                      <!-- Modal Header -->
                      <div class="modal-header">
                        <h4 class="modal-title">탈퇴하실려면 비밀번호를 입력해주세요</h4>
                        <button type="button" class="close" data-dismiss="modal">×</button>
                      </div>
                      
                      <!-- Modal body -->
                      <div class="modal-body">
                      <input value="${ status.email }" name="email" id="deleteemail"
							class="form-control" placeholder="이메일" type="hidden" readonly>
                       <input type="password" id="checkpw" name="checkpw" class="form-control" 
			placeholder="비밀번호" required autofocus>
			<div class="check" id="checkpw1"></div>
			<br>
			<form action="/mine/userdelete" method="POST">
			<button type="submit" class="btn btn-danger" id="withdraw" onclick="location.href='/mine/userdelete'">탈퇴하기</button>
             </form>
                      </div>
                      
                      <!-- Modal footer -->
                      <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                      </div>
                      
                    </div>
                  </div>
                </div>
                <script>
                 $(document).ready(function(){
		$("#checkpw").blur(function() {
					var password = $("#checkpw").val();
					var email = $("#deleteemail").val();
					$.ajax({
						url : '/mine/checkpw?password=' + password+'&email='+email,
						type : 'get',
						success : function(data) {
							 console.log(data);
							if (data == 0) {
								$('#checkpw1').text("비밀번호가 다릅니다.").css(
										"color", "red");
								$("#submit").attr("disabled", true);
							} else {
								$('#checkpw1').text("비밀번호가 일치").css(
										"color", "blue");
								$("#submit").attr("disabled", false);
							}
						},
						error : function() {
							console.log("실패");
						}
					})
				});
	 })
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
	 /* $("#withdraw").click(function(){
		 var email = $("#deleteemail").val();
		 alert(email);
		 $.ajax({
			 url : '/mine/userdelete?email=' + email,
		 	 type : 'post',
		 	 success : function(data) {
		 		if(data == "true") {
		 			location.href = "/mine/main";
		 		} else {
		 			console.log("실패~~~")
		 		}		 		
		 	 },
		 	error : function() {
				console.log("실패");
		 	}
		 })
	 }); */
	 </script>
</body>
</html>