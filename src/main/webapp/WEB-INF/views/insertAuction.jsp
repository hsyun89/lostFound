<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
<style>
h1{

}
</style>
</head>
<body>
<h1><a class="navbar-brand" href="/mine/main">It's Mine</a></h1>
	<form action="/mine/insertAuction" method="post">
		<input type="text" id="unique_id" name="unique_id"> 
		<input type="text" id="start_price" name="start_price"> 
		<input type="text" id="min_bid" name="min_bid"> 
		<input type="datetime-local" id="start_date" name="start_date"> 
		<input type="datetime-local" id="end_date" name="end_date">
		<button id="auction_btn" type="submit">등록</button>
		<br>
		<p id="a" style="color: red"></p>
	</form>
</body>
</html>