<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="vo.LostVO, java.util.ArrayList"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>물건 찾기</title>
<!-- map -->
<
<link rel="stylesheet"
	href="https://unpkg.com/leaflet@1.5.1/dist/leaflet.css"
	integrity="sha512-xwE/Az9zrjBIphAcBb3F6JVqxf46+CDLwfLMHloNu6KEQCAWi6HcDUbeOfBIptF7tcCzusKFjFw2yuvEpDL9wQ=="
	crossorigin="" />
<script src="https://unpkg.com/leaflet@1.5.1/dist/leaflet.js"
	integrity="sha512-GffPMF3RvMeYyc1LWMHtK8EbPv0iNZ8/oTtHPx9/cc2ILxQ+u905qIwdpULaqDkyBKgOaB57QTMg7ztg8Jm2Og=="
	crossorigin=""></script>

<!-- Custom fonts for this template -->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/sb-admin-2.min.css" rel="stylesheet">

<!-- Custom styles for this page -->
<link href="vendor/datatables/dataTables.bootstrap4.min.css"
	rel="stylesheet">

</head>
<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar -->
		<ul
			class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
			id="accordionSidebar">

			<!-- Sidebar - Brand -->
			<a
				class="sidebar-brand d-flex align-items-center justify-content-center"
				href="index.html">
				<div class="sidebar-brand-icon rotate-n-15">
					<i class="fas fa-laugh-wink"></i>
				</div>
				<div class="sidebar-brand-text mx-3">
					내꺼야 <sup>2</sup>
				</div>
			</a>

			<!-- Divider -->
			<hr class="sidebar-divider my-0">

			<!-- Nav Item - Dashboard -->
			<li class="nav-item"><a class="nav-link" href="index.html">
					<i class="fas fa-fw fa-tachometer-alt"></i> <span>Dash Board</span>
			</a></li>

			<!-- Divider -->
			<hr class="sidebar-divider">

			<!-- Heading -->
			<div class="sidebar-heading">Interface</div>

			<!-- Nav Item - Pages Collapse Menu -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseTwo"
				aria-expanded="true" aria-controls="collapseTwo"> <i
					class="fas fa-fw fa-cog"></i> <span>Components</span>
			</a>
				<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo"
					data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header">Custom Components:</h6>
						<a class="collapse-item" href="buttons.html">Buttons</a> <a
							class="collapse-item" href="cards.html">Cards</a>
					</div>
				</div></li>

			<!-- Nav Item - Utilities Collapse Menu -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseUtilities"
				aria-expanded="true" aria-controls="collapseUtilities"> <i
					class="fas fa-fw fa-wrench"></i> <span>Utilities</span>
			</a>
				<div id="collapseUtilities" class="collapse"
					aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header">Custom Utilities:</h6>
						<a class="collapse-item" href="utilities-color.html">Colors</a> <a
							class="collapse-item" href="utilities-border.html">Borders</a> <a
							class="collapse-item" href="utilities-animation.html">Animations</a>
						<a class="collapse-item" href="utilities-other.html">Other</a>
					</div>
				</div></li>

			<!-- Divider -->
			<hr class="sidebar-divider">

			<!-- Heading -->
			<div class="sidebar-heading">Addons</div>

			<!-- Nav Item - Pages Collapse Menu -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapsePages"
				aria-expanded="true" aria-controls="collapsePages"> <i
					class="fas fa-fw fa-folder"></i> <span>Pages</span>
			</a>
				<div id="collapsePages" class="collapse"
					aria-labelledby="headingPages" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header">Login Screens:</h6>
						<a class="collapse-item" href="login.html">Login</a> <a
							class="collapse-item" href="register.html">Register</a> <a
							class="collapse-item" href="forgot-password.html">Forgot
							Password</a>
						<div class="collapse-divider"></div>
						<h6 class="collapse-header">Other Pages:</h6>
						<a class="collapse-item" href="404.html">404 Page</a> <a
							class="collapse-item" href="blank.html">Blank Page</a>
					</div>
				</div></li>

			<!-- Nav Item - Charts -->
			<li class="nav-item"><a class="nav-link" href="charts.html">
					<i class="fas fa-fw fa-chart-area"></i> <span>Charts</span>
			</a></li>

			<!-- Nav Item - Tables -->
			<li class="nav-item active"><a class="nav-link"
				href="tables.html"> <i class="fas fa-fw fa-table"></i> <span>Tables</span></a>
			</li>

			<!-- Divider -->
			<hr class="sidebar-divider d-none d-md-block">

			<!-- Sidebar Toggler (Sidebar) -->
			<div class="text-center d-none d-md-inline">
				<button class="rounded-circle border-0" id="sidebarToggle"></button>
			</div>

		</ul>
		<!-- End of Sidebar -->

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<!-- Topbar -->
				<nav
					class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

					<!-- Sidebar Toggle (Topbar) -->
					<button id="sidebarToggleTop"
						class="btn btn-link d-md-none rounded-circle mr-3">
						<i class="fa fa-bars"></i>
					</button>

					<!-- Topbar Search -->
					<form
						class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
						<div class="input-group">
							<input type="text" class="form-control bg-light border-0 small"
								placeholder="Search for..." aria-label="Search"
								aria-describedby="basic-addon2">
							<div class="input-group-append">
								<button class="btn btn-primary" type="button">
									<i class="fas fa-search fa-sm"></i>
								</button>
							</div>
						</div>
					</form>

					<!-- Topbar Navbar -->
					<ul class="navbar-nav ml-auto">

						<!-- Nav Item - Search Dropdown (Visible Only XS) -->
						<li class="nav-item dropdown no-arrow d-sm-none"><a
							class="nav-link dropdown-toggle" href="#" id="searchDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> <i class="fas fa-search fa-fw"></i>
						</a> <!-- Dropdown - Messages -->
							<div
								class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
								aria-labelledby="searchDropdown">
								<form class="form-inline mr-auto w-100 navbar-search">
									<div class="input-group">
										<input type="text"
											class="form-control bg-light border-0 small"
											placeholder="Search for..." aria-label="Search"
											aria-describedby="basic-addon2">
										<div class="input-group-append">
											<button class="btn btn-primary" type="button">
												<i class="fas fa-search fa-sm"></i>
											</button>
										</div>
									</div>
								</form>
							</div></li>

						<!-- Nav Item - Alerts -->
						<li class="nav-item dropdown no-arrow mx-1"><a
							class="nav-link dropdown-toggle" href="#" id="alertsDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> <i class="fas fa-bell fa-fw"></i> <!-- Counter - Alerts -->
								<span class="badge badge-danger badge-counter">3+</span>
						</a> <!-- Dropdown - Alerts -->
							<div
								class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
								aria-labelledby="alertsDropdown">
								<h6 class="dropdown-header">Alerts Center</h6>
								<a class="dropdown-item d-flex align-items-center" href="#">
									<div class="mr-3">
										<div class="icon-circle bg-primary">
											<i class="fas fa-file-alt text-white"></i>
										</div>
									</div>
									<div>
										<div class="small text-gray-500">December 12, 2019</div>
										<span class="font-weight-bold">A new monthly report is
											ready to download!</span>
									</div>
								</a> <a class="dropdown-item d-flex align-items-center" href="#">
									<div class="mr-3">
										<div class="icon-circle bg-success">
											<i class="fas fa-donate text-white"></i>
										</div>
									</div>
									<div>
										<div class="small text-gray-500">December 7, 2019</div>
										$290.29 has been deposited into your account!
									</div>
								</a> <a class="dropdown-item d-flex align-items-center" href="#">
									<div class="mr-3">
										<div class="icon-circle bg-warning">
											<i class="fas fa-exclamation-triangle text-white"></i>
										</div>
									</div>
									<div>
										<div class="small text-gray-500">December 2, 2019</div>
										Spending Alert: We've noticed unusually high spending for your
										account.
									</div>
								</a> <a class="dropdown-item text-center small text-gray-500"
									href="#">Show All Alerts</a>
							</div></li>

						<!-- Nav Item - Messages -->
						<li class="nav-item dropdown no-arrow mx-1"><a
							class="nav-link dropdown-toggle" href="#" id="messagesDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> <i class="fas fa-envelope fa-fw"></i>
								<!-- Counter - Messages --> <span
								class="badge badge-danger badge-counter">7</span>
						</a> <!-- Dropdown - Messages -->
							<div
								class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
								aria-labelledby="messagesDropdown">
								<h6 class="dropdown-header">Message Center</h6>
								<a class="dropdown-item d-flex align-items-center" href="#">
									<div class="dropdown-list-image mr-3">
										<img class="rounded-circle"
											src="https://source.unsplash.com/fn_BT9fwg_E/60x60" alt="">
										<div class="status-indicator bg-success"></div>
									</div>
									<div class="font-weight-bold">
										<div class="text-truncate">Hi there! I am wondering if
											you can help me with a problem I've been having.</div>
										<div class="small text-gray-500">Emily Fowler · 58m</div>
									</div>
								</a> <a class="dropdown-item d-flex align-items-center" href="#">
									<div class="dropdown-list-image mr-3">
										<img class="rounded-circle"
											src="https://source.unsplash.com/AU4VPcFN4LE/60x60" alt="">
										<div class="status-indicator"></div>
									</div>
									<div>
										<div class="text-truncate">I have the photos that you
											ordered last month, how would you like them sent to you?</div>
										<div class="small text-gray-500">Jae Chun · 1d</div>
									</div>
								</a> <a class="dropdown-item d-flex align-items-center" href="#">
									<div class="dropdown-list-image mr-3">
										<img class="rounded-circle"
											src="https://source.unsplash.com/CS2uCrpNzJY/60x60" alt="">
										<div class="status-indicator bg-warning"></div>
									</div>
									<div>
										<div class="text-truncate">Last month's report looks
											great, I am very happy with the progress so far, keep up the
											good work!</div>
										<div class="small text-gray-500">Morgan Alvarez · 2d</div>
									</div>
								</a> <a class="dropdown-item d-flex align-items-center" href="#">
									<div class="dropdown-list-image mr-3">
										<img class="rounded-circle"
											src="https://source.unsplash.com/Mv9hjnEUHR4/60x60" alt="">
										<div class="status-indicator bg-success"></div>
									</div>
									<div>
										<div class="text-truncate">Am I a good boy? The reason I
											ask is because someone told me that people say this to all
											dogs, even if they aren't good...</div>
										<div class="small text-gray-500">Chicken the Dog · 2w</div>
									</div>
								</a> <a class="dropdown-item text-center small text-gray-500"
									href="#">Read More Messages</a>
							</div></li>

						<div class="topbar-divider d-none d-sm-block"></div>

						<!-- Nav Item - User Information -->
						<li class="nav-item dropdown no-arrow"><a
							class="nav-link dropdown-toggle" href="#" id="userDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> <span
								class="mr-2 d-none d-lg-inline text-gray-600 small">Valerie
									Luna</span> <img class="img-profile rounded-circle"
								src="https://source.unsplash.com/QAB-WJcbgJk/60x60">
						</a> <!-- Dropdown - User Information -->
							<div
								class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
								aria-labelledby="userDropdown">
								<a class="dropdown-item" href="#"> <i
									class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i> Profile
								</a> <a class="dropdown-item" href="#"> <i
									class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
									Settings
								</a> <a class="dropdown-item" href="#"> <i
									class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
									Activity Log
								</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="#" data-toggle="modal"
									data-target="#logoutModal"> <i
									class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
									Logout
								</a>
							</div></li>

					</ul>

				</nav>
				<!-- End of Topbar -->






				<!-- ------------------------- 컨텐츠 시작------------------------- -->
				<c:out value="${param.lostName}" />


				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- Page Heading -->
					<h1 class="h3 mb-2 text-gray-800">여기에서 잃어버린 물건을 찾아보세요.</h1>
					<p class="mb-4">
						공공 습득물은 습득일부터 9개월간 이곳에 보관됩니다. 자세한 내용은 <a target="_blank"
							href="https://datatables.net">여기</a>를 클릭하세요.
					</p>

					<%
						//ArrayList<LostVO> list = (ArrayList<LostVO>) request.getAttribute("list");
						//LostVO listOne = (LostVO) request.getAttribute("listOne");
						//ArrayList<LostVO> searchList = (ArrayList<LostVO>) request.getAttribute("searchList");
						// if (list != null) {
					%>

					<!-- 습득물 리스트 게시판 -->
					<!-- 테이블 -->
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">Found items</h6>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<div id="searchBox" style="float: left">
									<a id="searchDate" href="#" data-toggle="modla"
										data-target="#dateModal" onclick="selectDate();"
										onmouseover="this.style.opacity='0.2';"
										onmouseleave="this.style.opacity='1';"> <i
										class="fas fa-calendar fa-2x text-gray-300" width="10"
										height="10"></i> 습득일자
									</a> <span id="lostDate">ddd</span>
								</div>
								<table class="table table-bordered" id="dataTable" width="100%"
									cellspacing="0">
									<thead>
										<tr>
											<th>사진</th>
											<th>습득물명</th>
											<th>보관장소</th>
											<th>습득일자</th>
										</tr>
									</thead>
									<tbody>
										<c:if test="${ !empty List }">
											<c:forEach var="vo" items="${List}">
												<tr>
													<td><img alt="이미지 준비중입니다." src="${vo.image_address}"
														width="100" height="100"
														style="margin-left: auto; margin-right: auto; display: block;"></td>
													<td><a href="#" data-target="#myModal"
														data-toggle="modal" class="list"
														data-title="${vo.product_name }"
														data-image="${vo.image_address }"
														data-category="${vo.category }"
														data-date="${vo.find_date }" data-content="${vo.content }"
														data-place="${vo.keep_place }" data-Addr="${vo.addr }">
															${vo.product_name } </a></td>
													<td>${vo.keep_place}</td>
													<td>${vo.find_date}</td>
												</tr>
											</c:forEach>
										</c:if>
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
									</tbody>
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
				</div>
				<!-- ------------------------- 조회 모달 ------------------------- -->
				<!-- Modal -->
				<div class="modal fade" id="myModal" role="dialog">
					<div class="modal-dialog">

						<!-- Modal content-->
						<div class="modal-content">
							<div class="modal-header">
								<h4 class="modal-title">분실물 상세정보</h4>
								<button type="button" class="close" data-dismiss="modal">×</button>
							</div>
							<div class="modal-body">
								<img id="m_image" alt="이미지 준비중입니다." src="" width="400"
									height="300"
									style="margin-left: auto; margin-right: auto; display: block;">
								<br>
								<h5 id="m_title" style="font-weight: bold;"></h5>
								<p id="m_category" style="font-size: small;"></p>
								<p id="m_content"></p>
								습득일 : <span id="m_date" style="font-size: small;"></span>
								<hr>
								<div id="mapid"
									style="width: 250px; height: 250px; float: left;"></div>
								<div>
									<p id="m_place" style="font-weight: bold;"></p>
									<p>주소 ex)서울시 강남구 역삼동</p>
									<p>연락처 ex)010-3214-4212</p>
								</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">Close</button>
							</div>
						</div>

					</div>
				</div>
				<!-- -----------------------/조회 모달--------------------------- -->

				<!-- ------------------------- 날짜 선택 모달 ------------------------- -->
				<!-- Modal -->
				<div class="modal fade" id="dateModal" role="dialog">
					<div class="modal-dialog">

						<!-- Modal content-->
						<div class="modal-content">
							<div class="modal-header">
								<h4 class="modal-title">분실물 상세정보</h4>
								<button type="button" class="close" data-dismiss="modal">×</button>
							</div>
							<div class="modal-body">
								<img id="m_image" alt="이미지 준비중입니다." src="" width="400"
									height="300"
									style="margin-left: auto; margin-right: auto; display: block;">
								<br>
								<h5 id="m_title" style="font-weight: bold;"></h5>
								<p id="m_category" style="font-size: small;"></p>
								<p id="m_content"></p>
								습득일 : <span id="m_date" style="font-size: small;"></span>
								<hr>
								<div id="mapid"
									style="width: 250px; height: 250px; float: left;"></div>
								<div>
									<p id="m_place" style="font-weight: bold;"></p>
									<p>주소 ex)서울시 강남구 역삼동</p>
									<p>연락처 ex)010-3214-4212</p>
								</div>


							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">Close</button>
							</div>
						</div>

					</div>
				</div>
				<!-- -----------------------/조회 모달--------------------------- -->
				<!-- /.container-fluid -->

			</div>
			<!-- End of Main Content -->

			<!-- Footer -->
			<footer class="sticky-footer bg-white">
				<div class="container my-auto">
					<div class="copyright text-center my-auto">
						<span>Copyright &copy; Your Website 2019</span>
					</div>
				</div>
			</footer>
			<!-- End of Footer -->

		</div>
		<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<!-- Logout Modal-->
	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">Select "Logout" below if you are ready
					to end your current session.</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">Cancel</button>
					<a class="btn btn-primary" href="login.html">Logout</a>
				</div>
			</div>
		</div>
	</div>

	<!-- Bootstrap core JavaScript-->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="js/sb-admin-2.min.js"></script>

	<!-- Page level plugins -->
	<script src="vendor/datatables/jquery.dataTables.min.js"></script>
	<script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>

	<!-- Page level custom scripts -->
	<script src="js/demo/datatables-demo.js"></script>
	<script type="text/javascript"></script>

	<!-- 분실물 상세보기 -->
	<script>
		$(function() {
			$(".read").click(function() {
				var m_title = $(this).data('title');
				var m_image = $(this).data('image');
				var m_category = $(this).data('category');
				var m_date = $(this).data('date');
				var m_content = $(this).data('content');
				var m_place = $(this).data('place');
				var m_addr = $(this).data('addr');
				var modal = $(this);
				$("#m_title").text(m_title);
				$("#m_image").attr("src", m_image);
				$('#m_category').text(m_category);
				$('#m_date').text(m_date);
				$('#m_content').text(m_content);
				$('#m_place').text(m_place);

				//map 호출
				$("div#myModal").on("shown.bs.modal", function() {
					myMap(m_addr);
				});
				$("div#myModal").on("hidden.bs.modal", function() {
					$("div#mapid").empty();
				});

			})
		});
	</script>
	<!-- 검색 스크립트 -->
	<script>
		$(document).ready(
				function() {
					$("#searchBtn").on(
							"click",
							function(event) {

								var url = "lost${pageMaker.makeQuery(1)}";
								url += "&searchType=" + searchType()
										+ "&keyword=" + keywordInput();
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
	<!-- map  -->
	<script>
		/* 	$(document).ready(function() {
		 //모달창 이벤트 등록 -> myMap() 함수 호출, 동적 생성된 엘리먼트 삭제 연계
		 $("div#myModal").on("shown.bs.modal", function() {
		 myMap();
		 });
		 $("div#myModal").on("hidden.bs.modal", function() {
		 $("div#mapid").empty();
		 });
		 }); */
	</script>

	<script>
		function myMap(addr) {
			var mymap;
			var lat;
			var lng;
			if (addr) {
				$
						.getJSON(
								"https://maps.googleapis.com/maps/api/geocode/json?key=AIzaSyD-nx_y7aBlJgfgVZRaIwMbnShQJsxpryY&address="
										+ encodeURIComponent(addr),
								function(data) {
									lat = data.results[0].geometry.location.lat;
									lng = data.results[0].geometry.location.lng;
									if (mymap)
										mymap.remove();
									mymap = L.map('mapid').setView(
											[ lat, lng ], 16)
									L
											.tileLayer(
													'https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token=pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpejY4NXVycTA2emYycXBndHRqcmZ3N3gifQ.rJcFIG214AriISLbB6B5aw',
													{
														maxZoom : 18,
														attribution : 'Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors, '
																+ '<a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, '
																+ 'Imagery <a href="https://www.mapbox.com/">Mapbox</a>',
														id : 'mapbox.streets'
													}).addTo(mymap);

									L.marker([ lat, lng ]).addTo(mymap)
											.bindPopup("<b>여기...").openPopup();
								});
			}
		}
	</script>


	<!-- 날짜 검색 -->
	<script>
		function selectDate() {
			/* document.getElementById('m_title').value=m_title; 
			document.getElementById('m_content').value=m_content.replace(/(<br\/>|(<br><\/button>))/g, '\r\n');
			$('#'+m_star).parent().children("a").removeClass("on");
			$('#'+m_star).addClass("on").prevAll("a").addClass("on");

			var m_star = m_star;
			$('a[target]').click(function(){
				m_star = $(this).attr('id');
			});
			
			//서평 추가 모달에서 확인버튼 눌렀을 때
				$('button#m_submit').click(function(){ 
					
				    var m_title = $('input#m_title').val();
				    var m_content = $('textarea#m_content').val();
				  	m_content = m_content.replace(/(?:\r\n|\r|\n)/g, '<br/>');
				    $.ajax({
				        url: "readBook",
				        type: 'POST', 
				        data: {
				        	bookNum : id,
				        	m_title : m_title,
				        	m_star : m_star,
				        	m_content : m_content
				        },
				        dataType : "text",
				        success: function(data){           
				 	 		$("#myModal2 .close").click(); 			 	 		
				        },
				        error : function(request, status, error){
				            console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:");
				        }
				    }); 
				});  */
		}
	</script>

</body>

</html>
