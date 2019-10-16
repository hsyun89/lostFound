<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script type="text/javascript"
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.modal-content {
	top : 60%;
	left : 80%;
	margin : auto;
}
.button
{

   margin: auto;

   width: 50%;

}
.button input

{

   padding: 5px;

   width: 100%;

   font-size: 30px;

}
#naver_id_login
{

   margin: auto;

   width: 50%;

}
#naver_id_login

{

   padding: 10px;

   width: 100%;

   font-size: 18px;

}
#main{
	left : 50%;
	margin : auto;
}

</style>
</head>
<body>
<div class="container">
	<div class="row">
    <div class="col col-md-5">
		<div class="modal-content">
				<div class="modal-body">
				<div class="fadeIn first">			
      <h2><a id="main" href="/mine/main" style="text-decoration:none">It's Mine</a></h2>
    </div>
					<form id="formSignUp" class="form-signin" action="/mine/register" method="post"
							onsubmit='return regcheck();'>
						<div id="errorSignUp">
						
						</div>
						
						<div class="form-group">
							<label class="control-label" for="email">Email</label>
							<div class="input-group">
								<span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
								<input type="email" id="email" name="email" class="form-control" placeholder="email@example.com">
							</div>
							<div class="check" id="checkemail"></div>
						</div>
						<div class="form-group">
							<label class="control-label" for="email">Name</label>
							<div class="input-group">
								<span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
								<input type="text" id="user_name" name="user_name" class="form-control"	placeholder="이름">
							</div>
						</div>
							
						<div class="form-group">
							<label class="control-label" for="password">Password</label>
							<div class="input-group">
								<span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
								<input type="password" id="password" name="password" class="form-control" placeholder="password">
							</div>
						</div>
						
						<div class="form-group">
							<label class="control-label" for="password">Confirm password</label>
							<div class="input-group">
								<span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
								<input type="password" id="confirmpassword" name="confirmpassword" class="form-control" placeholder="confirm password">
							</div>
							<p id="pwcheck" style="color: red"></p>
						</div>
						<div class="button">
						<button type="submit" id="btnSignUp" class="btn btn-primary" style="width: 215px;">Create an account</button>
					</div>
					</form>
					<!-- 네이버 로그인 창으로 이동 -->
		<div id="naver_id_login" style="text-align: center">
			<a href="${url}"> <img width="218"
				src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png" /></a>
		</div>
					
				</div>
				<div class="modal-footer">
					<small>Already a member? <a class="small" href="/mine/login">Login here</a></small>
				</div>
			</div>
            </div>
	</div>
</div>
	<script>
	/*이메일 중복체크*/
	 $(document).ready(function(){
		$("#email").blur(function() {
					var email = $("#email").val();
					$.ajax({
						url : '/mine/checkEmail?email=' + email,
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