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
<%-- <c:if test="${empty msg}">
		<script>
			alert("로그인 후 이용하실 수 있습니다")
			location.href = "/mine/login";
		</script>
	</c:if> --%>

<form action="/mine/insertAuction" method="post">
<input type="text" id="unique_id" name="unique_id">	
<input type="text" id="start_price" name="start_price">	
<input type="text" id="min_bid" name="min_bid">	
<input type="date" id="start_date" name="start_date">	
<input type="date" id="end_date" name="end_date">
<button id="auction_btn" type="submit">등록</button>	
</form>
</body>
</html>