<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="vo.LostVO, java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- <h1>찾기리스트</h1>
<c:out value="${param.lostName}"/> --%>
<%
	ArrayList<LostVO> list = (ArrayList<LostVO>)request.getAttribute("list");
	if(list != null) {
%>
	<h2>분실물 찾기</h2>
	<table>
	<tr>
	<td>관리번호</td>
	<td>습득물명</td>
	<td>보관장소</td>
	<td>습득일자</td>
	</tr>
<% 
	for(LostVO vo : list) {
%>
	<tr>
	<td><%= vo.getUnique_id()%></td>
	<td class='<%=vo.getUnique_id()%>'><a href='/mine/lost?action=read&atcid=<%=vo.getUnique_id()%>'><%=vo.getProduct_name()%></a></td>
	<td><%= vo.getKeep_place() %></td>
	<td><%= vo.getFind_date() %></td>
	</tr>
<%
	}
%>
	</table>
<%
	}else{
%>
<% 
		LostVO listOne = (LostVO)request.getAttribute("listOne");
%>
	<h2>분실물 상세조회</h2>
	<form method="post" action="/mine/lost">

		<input type="hidden" name="actid" value="<%=listOne.getUnique_id()%>">
		<input value="<%=listOne.getImage_address()%>">
		<input value="습득물명<%=listOne.getProduct_name() %>">
		<input type="text" value="관리번호<%=listOne.getUnique_id()%>">
		<input type="text" value="습득일자<%=listOne.getFind_date()%>">
		<input type="text" value="물품분류<%=listOne.getCategory()%>">
		<input type="text" value="보관장소<%=listOne.getKeep_place()%>">
		<hr>
		<input type="text" value="<%=listOne.getContent()%>">

		<a href="/mine/lost"><input type="button" value="확인"></a>
	</form>
<%
	}
%>
</body>
</html>