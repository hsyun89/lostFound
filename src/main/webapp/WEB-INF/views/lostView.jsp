<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
	$(document).ready(
			function() {
				$("#searchBtn").on(
						"click",
						function(event) {

							var url = "lost${pageMaker.makeQuery(1)}";
							url += "&searchType=" + searchType() + "&keyword="
									+ keywordInput();
							self.location = url;
						});
			});
	function searchType() {
		return $("#searchType").val();
	}
	function keywordInput() {
		return $("#keywordInput").val();
	}
</script>
</head>
<body>
	<div class="row">
		<div class="col-xs-12 col-sm-12">
			<div class="table-responsive">
				<table class="table">
					<caption class="text-center">
						<h2>분실물 리스트</h2>
					</caption>
					<tr>
						<th>관리번호</th>
						<th>습득물명</th>
						<th>보관장소</th>
						<th>습득일자</th>
					</tr>
					<c:forEach items="${list}" var="lost">
						<tr>
							<th>${lost.unique_id}</th>
							<th>${lost.product_name}</th>
							<th>${lost.keep_place}</th>
							<th>${lost.find_date}</th>
						</tr>
					</c:forEach>
					<tfoot>
						<tr>
							<td colspan="8" class="text-center">
								<ul class="pagination">
									<c:if test="${pageMaker.prev}">
										<li><a
											href="lost${pageMaker.makeSearch(pageMaker.startPage -1)}">&laquo;</a></li>
									</c:if>

									<c:forEach begin="${pageMaker.startPage }"
										end="${pageMaker.endPage}" var="idx">
										<li
											<c:out value="${pageMaker.page ==idx? 'class=active' : ''}" />>
											<a href="lost${pageMaker.makeSearch(idx)}">${idx}</a>
										</li>
									</c:forEach>

									<c:if test="${pageMaker.next && pageMaker.endPage >0 }">
										<li><a
											href="lost${pageMaker.makeSearch(pageMaker.endPage +1)}">&raquo;</a></li>
									</c:if>
								</ul>
							</td>
						</tr>
					</tfoot>
				</table>
				<div class="center-block">
					<div class="col-sm-2">
						<select name="searchType" class="form-control" id="searchType">
							<option value="all"
								<c:out value="${pageMaker.searchType eq 'all' ? 'selected' : '' }"/>>All</option>
							<option value="unique_id"
								<c:out value="${pageMaker.searchType eq 'unique_id' ? 'selected' : '' }"/>>관리번호</option>
							<option value="product_name"
								<c:out value="${pageMaker.searchType eq 'product_name' ? 'selected' : '' }"/>>습득물명</option>
							<option value="keep_place"
								<c:out value="${pageMaker.searchType eq 'keep_place' ? 'selected' : '' }"/>>보관장소</option>
							<option value="find_date"
								<c:out value="${pageMaker.searchType eq 'find_date' ? 'selected' : '' }"/>>습득일자(YYYY-MM-DD)</option>
						</select>
					</div>
					<div class="col-sm-4">
						<input type="text" name="keyword" id="keywordInput"
							class="form-control" value="${pageMaker.keyword}">
					</div>
					<button id="searchBtn" class="btn btn-primary">검색</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
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
		 iconUrl : <%listOne.getImage_address%>
	    iconUrl: 'https://1.bp.blogspot.com/-QvA1rI-reAY/XZLkojqs41I/AAAAAAAAAMs/x2cvjNgmwNoWWHZX3kjycTs9yyfpkcXEgCLcBGAsYHQ/s1600/%25EA%25B3%25A0%25EB%25B8%2594%25EB%25A6%25B0.png',
	    iconSize: [50, 50]
	});
	var content = "<b>"+name+"</b><hr>찾아줘"
		L.marker([lat, lon],{icon: myIcon}).addTo(mymap).bindPopup(content);
</script>
	<%
		}
		if (searchList != null) {
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
			for (LostVO vo : searchList) {
		%>
		<tr>
			<td><%=vo.getUnique_id()%></td>
			<td class='<%=vo.getUnique_id()%>'><a
				href='/mine/lost?action=read&atcid=<%=vo.getUnique_id()%>'><%=vo.getProduct_name()%></a></td>
			<td><%=vo.getKeep_place()%></td>
			<td><%=vo.getFind_date()%></td>
		</tr>
		<%
			}
		%>
		<tfoot>
			<!-- 검색 처리 추가시 -->
			<tr>
				<td colspan="8" class="text-center">
					<!-- jsp 로 출력 할경우  -->
					<ul class="pagination">
						<c:if test="${pageMaker.prev}">
							<li><a
								href="lost${pageMaker.makeSearch(pageMaker.startPage -1)}">&laquo;</a></li>
						</c:if>

						<c:forEach begin="${pageMaker.startPage }"
							end="${pageMaker.endPage}" var="idx">
							<li
								<c:out value="${pageMaker.page ==idx? 'class=active' : ''}" />>
								<a href="lost${pageMaker.makeSearch(idx)}">${idx}</a>
							</li>
						</c:forEach>

						<c:if test="${pageMaker.next && pageMaker.endPage >0 }">
							<li><a
								href="lost${pageMaker.makeSearch(pageMaker.endPage +1)}">&raquo;</a></li>
						</c:if>
					</ul>
				</td>
			</tr>
		</tfoot>
	</table>
	<%
		}
	%>
</body>
</html> --%>