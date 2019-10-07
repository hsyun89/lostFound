<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>


<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
</style>
</head>
<body>
	<c:if test="${!empty msg}">
		<script>
			alert("${msg}");
		</script>
	</c:if>
	<form class="form-signin" action="/mine/register" method="post"
		onsubmit='return regcheck();'>

		<input type="email" id="email" name="email" class="form-control"
			placeholder="이메일">
		
		<div class="check" id="checkemail"></div>

		<input type="text" id="name" name="name" class="form-control"
			placeholder="이름"> 
		<input type="password" id="password" name="password" class="form-control" 
			placeholder="비밀번호">

		<input type="password" id="confirmpassword" name="confirmpassword"
			class="form-control" placeholder="비밀번호재확인">

		<p id="pwcheck" style="color: red"></p>

		<button type="submit">회원가입</button>
		<!-- 네이버 로그인 창으로 이동 -->
		<div id="naver_id_login" style="text-align: center">
			<a href="${url}"> <img width="223"
				src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png" /></a>
		</div>
		<br>

		<div class="text-center">
			<a class="small" href="/tst/login">로그인으로 이동하기</a>
		</div>
	</form>

	<script type="text/javascript"
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
	<script>
	/*이메일 중복체크*/
	 $(document).ready(function(){
		$("#email").blur(function() {
					var email = $("#email").val();
					$.ajax({
						url : '/tst/checkEmail?email=' + email,
						type : 'get',
						success : function(data) {
							 console.log(data);
							if (data == 1) {
								$('#checkemail').text("중복된 아이디입니다.").css(
										"color", "red");
								$("#submit").attr("disabled", true);
							} else {
								$('#checkemail').text("사용가능한 아이디입니다.").css(
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
/*비밀번호 중복체크*/
		$(document).ready(function() {
			$('.login-info-box').fadeOut();
			$('.login-show').addClass('show-log-panel');

			$('#confirmpassword').blur(function() {
				if ($('#confirmpassword').val() != $('#password').val()) {
					$('#pwcheck').text("비밀번호가 다릅니다.");
				} else {
					$('#pwcheck').text("");
				}
			});
			function registerSuccess() {
				alert("회원가입 성공")
			}
		});
	</script>
</body>
</html>