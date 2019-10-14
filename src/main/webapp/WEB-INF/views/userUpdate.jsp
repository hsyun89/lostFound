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
<form action="/mine/userdelete" method="POST" class="form-signin">
<button type="submit">탈퇴하기</button>
</form>
</body>
</html>