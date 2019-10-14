<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:if test="${empty status}">
		<script>
			alert("로그인 후 이용 가능합니다")
			location.href = "/mine/login";
		</script>
	</c:if>

<!-- Custom fonts for this template -->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="css/sb-admin-2.min.css" rel="stylesheet">

  <!-- Custom styles for this page -->
  <link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
  
</head>
<body id="page-top">

 <!-- Page Wrapper -->
  <div id="wrapper">
  <!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
    
    <!-- Sidebar - Brand -->
      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="/mine/main">
        <div class="sidebar-brand-icon rotate-n-15">
          <i class="fas fa-laugh-wink"></i>
        </div>
        <div class="sidebar-brand-text mx-3">SB Admin <sup>2</sup></div>
      </a>
      <hr class="sidebar-divider my-0">
      <ul>
					<li><a href="/mine/auction">전체</a></li>
					<li><a href="/mine/lostkey?key=가방">가방</a></li>
					<ol>
						<li><a href="/mine/lostkey?key=남성용가방">남성용가방</a></li>
						<li><a href="/mine/lostkey?key=여성용가방">여성용가방</a></li>
					</ol>
					<li><a href="/mine/lostkey?key=지갑">지갑</a></li>
					<ol>
						<li><a href="/mine/lostkey?key=남성용지갑">남성용지갑</a></li>
						<li><a href="/mine/lostkey?key=여성용가방">여성용지갑</a></li>
						<li><a href="/mine/lostkey?key=기타 지갑">기타 지갑</a></li>
					</ol>
					<li><a href="/mine/lostkey?key=휴대폰">휴대폰</a></li>
					<ol>
						<li><a href="/mine/lostkey?key=삼성휴대폰">삼성휴대폰</a></li>
						<li><a href="/mine/lostkey?key=아이폰">아이폰</a></li>
						<li><a href="/mine/lostkey?key=LG휴대폰">LG휴대폰</a></li>
					</ol>
					<li><a href="/mine/lostkey?key=귀금속">귀금속</a></li>
					<ol>
						<li><a href="/mine/lostkey?key=시계">시계</a></li>
						<li><a href="/mine/lostkey?key=목걸이">목걸이</a></li>
						<li><a href="/mine/lostkey?key=반지">반지</a></li>
					</ol>
					<li><a href="/mine/lostkey?key=기타">기타</a></li>
				</ul>
      
    </ul>
  </div>
<div class="container">
		<div class="row">

			<div class="col-md-1">
				
			</div>
			<div class="col-md-2">
				<form method="get" action="/mine/auction">
					<table>
						<tr id=label>
							<td>아이디</td>
							<td>이미지</td>
							<td>물품명</td>
							<td>시작가격</td>
							<td>추가가격</td>
							<td>시작시간</td>
							<td>마감시간</td>
							<td>카테고리</td>
						</tr>
						<c:if test="${!empty list}">
							<c:forEach var="vo" items="${list}">
								<tr>
									<td>${vo.unique_id}</td>
									<td><img src="${vo.image_address}"></td>
									<td>${vo.product_name}</td>
									<td>${vo.start_price}</td>
									<td>${vo.min_bid}</td>
									<td>${vo.start_date}</td>
									<td>${vo.end_date}</td>
									<td>${vo.category}</td>
								</tr>
							</c:forEach>
						</c:if>
					</table>
				</form>
			</div>
		</div>
	</div>
</body>
</html>