<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>NAVER LOGIN TEST</title>
</head>
<body>
	<h1>Login Form</h1>
	<hr>
	<br>
	<center>
		<c:if test="${!empty msg}">
			<script>
				alert("${msg}");
			</script>
		</c:if>
			
		<form action="/mine/login" method="POST">
			<!-- 이메일 아이디 -->
			<div class="form-group input-group">
				<div class="input-group-prepend">
					<span class="input-group-text"> <i class="fa fa-envelope"></i>
					</span>
				</div>
				<input id="Email" name="email" 
					placeholder="이메일을 입력해주세요." type="email" required autofocus>
			</div>

			<!-- 비밀번호 -->
			<div class="form-group input-group">
				<div class="input-group-prepend">
					<span class="input-group-text"> <i class="fa fa-lock"></i>
					</span>
				</div>
				<input id="Passward" name="password"
					placeholder="비밀번호를 입력해주세요." type="password">
			</div>
		<!-- 로그인 버튼 -->
		<div class="form-group">
			<input id="signIn" type="submit" class="btn btn-primary btn-block"
				value="로그인">
		</div>
		</form>
		<div id="naver_id_login" style="text-align:center"><a href="${url}">
<img width="223" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png"/></a></div>
<br>
	</center>
</body>
</html>