<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="vo.LostVO, java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleLeapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text.javascript">

</script>
<!-- map -->
 <link rel="stylesheet" href="https://unpkg.com/leaflet@1.5.1/dist/leaflet.css"
   integrity="sha512-xwE/Az9zrjBIphAcBb3F6JVqxf46+CDLwfLMHloNu6KEQCAWi6HcDUbeOfBIptF7tcCzusKFjFw2yuvEpDL9wQ=="
   crossorigin=""/>
<script src="https://unpkg.com/leaflet@1.5.1/dist/leaflet.js"
   integrity="sha512-GffPMF3RvMeYyc1LWMHtK8EbPv0iNZ8/oTtHPx9/cc2ILxQ+u905qIwdpULaqDkyBKgOaB57QTMg7ztg8Jm2Og=="
   crossorigin=""></script>
</head>
<body>
<%-- <h1>찾기리스트</h1>
<c:out value="${param.lostName}"/> --%>
	<select name="contentnum" id="contentnum">
		<option></option>
	</select>
	<table>
	
	</table>

<%
	ArrayList<LostVO> list = (ArrayList<LostVO>)request.getAttribute("list");
	LostVO listOne = (LostVO)request.getAttribute("listOne");
	ArrayList<LostVO> searchList = (ArrayList<LostVO>)request.getAttribute("searchList");
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
	}
	if(listOne!=null){
%>
	<h2>분실물 상세조회</h2>
	<form method="post" action="/mine/lost">
		<input type="hidden" name="actid" value="<%=listOne.getUnique_id()%>">
		<div>
			<div class="img_area">
				<p>
					<img alt="이미지 준비중입니다." src="<%=listOne.getImage_address()%>">
				</p>
			</div>
			<div>
				<p style="background-color:yellow">습득물명 : <%=listOne.getProduct_name()%></p>
				<p>관리번호 : <%=listOne.getUnique_id()%></p>
				<p>습득일자 : <%=listOne.getFind_date()%></p>
				<p>물품분류 : <%=listOne.getCategory()%></p>
				<p>보관장소 : <%=listOne.getKeep_place()%></p>
				<hr>
				<p>내용</p>
				<p><%=listOne.getContent()%></p>
			</div>
		</div>	
		<a href="/mine/lost"><input type="button" value="확인"></a>
	</form>
	<div id="mapid" style="width: 600px; height: 400px;"></div>
<script>
	var lat = "<%=listOne.getLat()%>";
	var lon = "<%=listOne.getLon()%>";
	var name ="<%=listOne.getProduct_name()%>"
	var mymap = L.map('mapid').setView([lat, lon], 18); //L.map 줌레벨
	L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token=pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpejY4NXVycTA2emYycXBndHRqcmZ3N3gifQ.rJcFIG214AriISLbB6B5aw', {
		maxZoom: 18,
		attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors, ' +
			'<a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, ' +
			'Imagery <a href="https://www.mapbox.com/">Mapbox</a>',
		id: 'mapbox.streets'
	}).addTo(mymap);
	
	var myIcon = L.icon({
		//주석 해제 시 분실물 이미지
		<%--  iconUrl : <%listOne.getImage_address%> --%>
	    iconUrl: 'https://1.bp.blogspot.com/-QvA1rI-reAY/XZLkojqs41I/AAAAAAAAAMs/x2cvjNgmwNoWWHZX3kjycTs9yyfpkcXEgCLcBGAsYHQ/s1600/%25EA%25B3%25A0%25EB%25B8%2594%25EB%25A6%25B0.png',
	    iconSize: [50, 50]
	});
	var content = "<b>"+name+"</b><hr>찾아줘"
		L.marker([lat, lon],{icon: myIcon}).addTo(mymap).bindPopup(content);
</script>
<% 
	}
	if(searchList != null){
%>
	<h2>분실물 검색결과</h2>
	<table>
	<tr>
	<td>관리번호</td>
	<td>습득물명</td>
	<td>보관장소</td>
	<td>습득일자</td>
	</tr>
<% 
	for(LostVO vo : searchList){
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
	}
%>
</body>
</html>