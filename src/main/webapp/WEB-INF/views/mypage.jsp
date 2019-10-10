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

<style>
.nav-link {
	
}
</style>

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
						<li class="nav-item"><a class="nav-link" href="#">Home</a></li>
						<li class="nav-item"><a class="nav-link" href="#work">Work</a></li>
						<li class="nav-item"><a class="nav-link" href="#contact">Contact</a></li>
						<li class="nav-item"><a class="nav-link" href="/mine/auction">Auction</a></li>
						<c:choose>
							<c:when test="${empty status}">
								<li class="nav-item"><a class="nav-link" href="/mine/login">로그인</a></li>
							</c:when>
							<c:otherwise>
								<div class="btn-group">
									<form method="post" action="/mine/logout">
										<li class="nav-item"><a class="nav-link" href="/mine/logout">로그아웃</a></li>
									</form>
								</div>
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
	<c:if test="${admin==1}">
		<input type="button"><a href="/mine/insertAuction">rrr</a>
	</c:if>
		<input><a href = "/mine/userupdate">수정하기</a>
</body>
</html>