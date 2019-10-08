<%@ page language="java" contentType="text/html; charset=UTF-8"
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
							<th><c:url value = ${lost.unique_id } />${lost.product_name}</th>
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
