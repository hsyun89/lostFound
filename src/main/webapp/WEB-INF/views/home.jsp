<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>Home</title>
</head>
<body>
	<h1>Hello world!</h1>

	<P>The time on the server is ${serverTime}.</P>
	<c:forEach var="i" begin="1" end="10" step="2">
${i } hh

</c:forEach>
<c:if test ="${ empty list }">
dd
</c:if>
	<c:forEach var="vo" items="${ alllist }">


		<img alt="이미지 준비중입니다." src="${vo.image_address}" width="100"
			height="100">
		${vo.product_name}
											
											${vo.keep_place}
											${vo.find_date}
		
					
										</c:forEach>
</body>
</html>
