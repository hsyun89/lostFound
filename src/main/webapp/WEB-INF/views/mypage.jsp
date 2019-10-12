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
						<li class="nav-item"><a class="nav-link" href="/mine/main">Home</a></li>
						<li class="nav-item"><a class="nav-link" href="/mine/auction">Auction</a></li>
						<li class="nav-item"><a class="nav-link" href="/mine/userupdate">회원수정</a></li>
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

</body>
</html>