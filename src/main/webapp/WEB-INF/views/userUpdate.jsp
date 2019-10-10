<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="/mine/login" method="POST" class="form-signin">
<input value="${ status.email }" name="email"
							class="form-control" placeholder="이메일" type="text" readonly>

<input value="${ status.user_name }" name="user_name"
							class="form-control" placeholder="이름" type="text" required autofocus>						

<input type="password" id="password" name="password" class="form-control" 
			placeholder="비밀번호" required autofocus>

<input type="password" id="confirmpassword" name="confirmpassword"
			class="form-control" placeholder="비밀번호재확인" required autofocus>

<p id="pwcheck" style="color: red"></p>

<!-- 비밀번호 중복체크 -->
<script>
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
</form>
</body>
</html>