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
				href="/mine/main">
				<div class="sidebar-brand-icon rotate-n-15">
					<i class="fas fa-laugh-wink"></i>
				</div>
				<div class="sidebar-brand-text mx-3">
					내꺼야 <sup>it's mine</sup>
				</div>
			</a>
			
			
			
			<!--  -------------------사이드 바------------------- -->
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
			
			<!-- Nav Item - All -->
			<li class="nav-item"><a class="nav-link collapsed" href="/mine/lost" aria-expanded="true">
				 <span>All</span>
			</a>
			</li>
			
			<!-- Nav Item - Bag -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseBag"
				aria-expanded="true" aria-controls="collapseBag">
				<img width="50px" src="https://2.bp.blogspot.com/--jx7n7clXQA/Xaas15tOMRI/AAAAAAAAAQI/WHaYgWKdd9AodkItsDscwufU72Ry7uoXgCK4BGAYYCw/s1600/1.png"> <span>가방</span>
			</a>
				<div id="collapseBag" class="collapse" aria-labelledby="headingBag"
					data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<a class="collapse-item" data-cat="여성용가방" >여성용가방</a>
						<a class="collapse-item" data-cat="남성용가방">남성용가방</a>
						<a class="collapse-item" data-cat="기타가방">기타가방</a>
					</div>
				</div>
			</li>

			<!-- Nav Item - Jewelry -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseJewelry"
				aria-expanded="true" aria-controls="collapseJewelry">
				<img width="50px" src="https://1.bp.blogspot.com/-IYkGJSZt2a0/Xaa3adg71NI/AAAAAAAAASo/pOYXvidk760GFVCkKWcFruzU7Zb8Z5qcwCLcBGAsYHQ/s1600/02.png"> <span>귀금속</span>
			</a>
				<div id="collapseJewelry" class="collapse"
					aria-labelledby="headingJewelry" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<a class="collapse-item" data-cat="반지">반지</a>
						<a class="collapse-item" data-cat="목걸이">목걸이</a>
						<a class="collapse-item" data-cat="귀걸이">귀걸이</a>
						<a class="collapse-item" data-cat="시계">시계</a>
						<a class="collapse-item" data-cat="기타">기타</a>
					</div>
				</div>
			</li>
			
			<!-- Nav Item - Book -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseBook"
				aria-expanded="true" aria-controls="collapseBook">
				<img width=50px src="https://1.bp.blogspot.com/-3sTSyhwUg6I/Xaa3Z9QU1_I/AAAAAAAAASg/cp7Yv7R8glUz2-zBYq8jn1r4Al6Ti-BuQCLcBGAsYHQ/s1600/03.png"> <span>서적</span>
			</a>
				<div id="collapseBook" class="collapse"
					aria-labelledby="headingBook" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<a class="collapse-item" data-cat="학습서적">학습서적</a>
						<a class="collapse-item" data-cat="컴퓨터서적">컴퓨터서적</a>
						<a class="collapse-item" data-cat="소설">소설</a>
						<a class="collapse-item" data-cat="만화책">만화책</a>
						<a class="collapse-item" data-cat="기타서적">기타서적</a>
					</div>
				</div>
			</li>
			
			<!-- Nav Item - Document -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseDocument"
				aria-expanded="true" aria-controls="collapseDocument">
				<img width=50px src="https://1.bp.blogspot.com/-wnQ80N2acbU/Xaa3Z6n-NbI/AAAAAAAAASk/XUh1V4n2A1UDe5bRrKbOWv7hAgRWurGpgCLcBGAsYHQ/s1600/04.png"> <span>서류</span>
			</a>
				<div id="collapseDocument" class="collapse"
					aria-labelledby="headingDocument" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<a class="collapse-item" data-cat="서류">서류</a>
						<a class="collapse-item" data-cat="기타물품">기타물품</a>
					</div>
				</div>
			</li>
			
			<!-- Nav Item - Tools -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseTools"
				aria-expanded="true" aria-controls="collapseTools">
				<img width=50px src="https://1.bp.blogspot.com/-3w7pW7vozBo/Xaa3bd7gC0I/AAAAAAAAASs/GoUKxE7uLvky_XEpQbkcstkKH82yCewwACLcBGAsYHQ/s1600/05.png"> <span>산업용품</span>
			</a>
				<div id="collapseTools" class="collapse"
					aria-labelledby="headingTools" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<a class="collapse-item" data-cat="기타물품">기타물품</a>
					</div>
				</div>
			</li>
			
			<!-- Nav Item - Shoppingbag -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseShoppingbag"
				aria-expanded="true" aria-controls="collapseShoppingbag">
				<img width=50px src="https://1.bp.blogspot.com/-ws8-Xd6xDOA/Xaa3biZ1ZMI/AAAAAAAAASw/aUKfPeHeHREpM-UPEpY1VjgU_ktHQyw8ACLcBGAsYHQ/s1600/06.png"> <span>쇼핑백</span>
			</a>
				<div id="collapseShoppingbag" class="collapse"
					aria-labelledby="headingShoppingbag" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<a class="collapse-item" data-cat="쇼핑백">쇼핑백</a>
					</div>
				</div>
			</li>
			
			<!-- Nav Item - Sport -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseSport"
				aria-expanded="true" aria-controls="collapseSport">
				<img width=50px src="https://1.bp.blogspot.com/-83nCvImqKfI/Xaa3cFEZP_I/AAAAAAAAAS0/DavojYcedpEF1D4iHhnLNR4h9zkY-h0HACLcBGAsYHQ/s1600/07.png"> <span>스포츠</span>
			</a>
				<div id="collapseSport" class="collapse"
					aria-labelledby="headingSport" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<a class="collapse-item" data-cat="기타용품">기타용품</a>
					</div>
				</div>
			</li>
			
			<!-- Nav Item - Instrument -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseInstrument"
				aria-expanded="true" aria-controls="collapseInstrument">
				<img width=50px src="https://1.bp.blogspot.com/-PcVMHVj97s8/Xaa3cBece1I/AAAAAAAAAS4/wtz69ElrEeAYTm14ZJtqpHcJzmndqr4JgCLcBGAsYHQ/s1600/08.png"> <span>악기</span>
			</a>
				<div id="collapseInstrument" class="collapse"
					aria-labelledby="headingSport" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<a class="collapse-item" data-cat="건반악기">건반악기</a>
						<a class="collapse-item" data-cat="관악기">관악기</a>
						<a class="collapse-item" data-cat="현악기">현악기</a>
						<a class="collapse-item" data-cat="타악기">타악기</a>
						<a class="collapse-item" data-cat="기타악기">기타악기</a>
					</div>
				</div>
			</li>
			
			<!-- Nav Item - Securities -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseSecurities"
				aria-expanded="true" aria-controls="collapseSecurities">
				<img width=50px src="https://1.bp.blogspot.com/-3xz6_ivavmM/Xaa3cXnjDBI/AAAAAAAAAS8/MrLq80BFSFwjmdWS7h_Y_ATfDqBalC9OgCLcBGAsYHQ/s1600/09.png"> <span>유가증권</span>
			</a>
				<div id="collapseSecurities" class="collapse"
					aria-labelledby="headingSecurities" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<a class="collapse-item" data-cat="어음">어음</a>
						<a class="collapse-item" data-cat="상품권">상품권</a>
						<a class="collapse-item" data-cat="채권">채권</a>
						<a class="collapse-item" data-cat="기타">기타</a>
					</div>
				</div>
			</li>
			
			<!-- Nav Item - Clothes -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseClothes"
				aria-expanded="true" aria-controls="collapseClothes">
				<img width=50px src="https://1.bp.blogspot.com/-11yQwAAJhAA/Xaa3cgvCc1I/AAAAAAAAATA/OTCJBrLmK1AeUGyoUkRpqTXkl1bkS7YxwCLcBGAsYHQ/s1600/10.png"> <span>의류</span>
			</a>
				<div id="collapseClothes" class="collapse"
					aria-labelledby="headingClothes" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<a class="collapse-item" data-cat="여성의류">여성의류</a>
						<a class="collapse-item" data-cat="남성의류">남성의류</a>
						<a class="collapse-item" data-cat="아기의류">아기의류</a>
						<a class="collapse-item" data-cat="기타의류">기타의류</a>
					</div>
				</div>
			</li>
			
			<!-- Nav Item - Car -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseCar"
				aria-expanded="true" aria-controls="collapseCar">
				<img width=50px src="https://1.bp.blogspot.com/-t1BvAN6Xn6E/Xaa3cu4Mi4I/AAAAAAAAATE/JMMgCYVe_uMQV8hgYUh_XkdLxPTHNytqgCLcBGAsYHQ/s1600/11.png"> <span>자동차</span>
			</a>
				<div id="collapseCar" class="collapse"
					aria-labelledby="headingCar" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<a class="collapse-item" data-cat="자동차열쇠">자동차열쇠</a>
						<a class="collapse-item" data-cat="자동차번호판">자동차번호판</a>
						<a class="collapse-item" data-cat="임시번호판">임시번호판</a>
						<a class="collapse-item" data-cat="네비게이션">네비게이션</a>
						<a class="collapse-item" data-cat="기타용품">기타용품</a>
					</div>
				</div>
			</li>
			
			<!-- Nav Item - Electronic -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseElectronic"
				aria-expanded="true" aria-controls="collapseElectronic">
				<img width=50px src="https://1.bp.blogspot.com/-_M2cDe0NAFc/Xaa3dB8kWsI/AAAAAAAAATI/94aU9zRwqBABND6LwK7aXIzIQnsi22gkgCLcBGAsYHQ/s1600/12.png"> <span>전자기기</span>
			</a>
				<div id="collapseElectronic" class="collapse"
					aria-labelledby="headingElectronic" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<a class="collapse-item" data-cat="PMP">PMP</a>
						<a class="collapse-item" data-cat="PDA">PDA</a>
						<a class="collapse-item" data-cat="MP3">MP3</a>
						<a class="collapse-item" data-cat="카메라">카메라</a>
						<a class="collapse-item" data-cat="전자수첩">전자수첩</a>
						<a class="collapse-item" data-cat="기타용품">기타용품</a>
					</div>
				</div>
			</li>
			
			<!-- Nav Item - Wallet -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseWallet"
				aria-expanded="true" aria-controls="collapseWallet">
				<img width=50px src="https://1.bp.blogspot.com/-s4poQPZy778/Xaa3d921-gI/AAAAAAAAATM/p8fWDBCcfIUGVXZzwFk3M60eJp5bsD1HwCLcBGAsYHQ/s1600/13.png"> <span>지갑</span>
			</a>
				<div id="collapseWallet" class="collapse"
					aria-labelledby="headingWallet" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<a class="collapse-item" data-cat="여성용 지갑">여성용 지갑</a>
						<a class="collapse-item" data-cat="남성용 지갑">남성용 지갑</a>
						<a class="collapse-item" data-cat="기타 지갑">기타 지갑</a>
					</div>
				</div>
			</li>
			
			<!-- Nav Item - Certificate -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseCertificate"
				aria-expanded="true" aria-controls="collapseCertificate">
				<img width=50px src="https://1.bp.blogspot.com/-CaOfQrZyIPY/Xaa3eAASmwI/AAAAAAAAATQ/oiNMOpUkYNEDBkPST3yDT9aVO6KshN_SgCLcBGAsYHQ/s1600/14.png"> <span>증명서</span>
			</a>
				<div id="collapseCertificate" class="collapse"
					aria-labelledby="headingCertificate" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<a class="collapse-item" data-cat="기타서적">신분증</a>
						<a class="collapse-item" data-cat="면허증">면허증</a>
						<a class="collapse-item" data-cat="여권">여권</a>
						<a class="collapse-item" data-cat="기타">기타</a>
					</div>
				</div>
			</li>
			
			<!-- Nav Item - Computer -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseComputer"
				aria-expanded="true" aria-controls="collapseComputer">
				<img width=50px src="https://1.bp.blogspot.com/-KAACUwSDxkU/Xaa3eNg3NAI/AAAAAAAAATU/1BTv97lUQ4YpNnViN3Y4QMrTiNItkO2IQCLcBGAsYHQ/s1600/15.png"> <span>컴퓨터</span>
			</a>
				<div id="collapseComputer" class="collapse"
					aria-labelledby="headingComputer" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<a class="collapse-item" data-cat="삼성노트북">삼성노트북</a>
						<a class="collapse-item" data-cat="LG노트북">LG노트북</a>
						<a class="collapse-item" data-cat="삼보노트북">삼보노트북</a>
						<a class="collapse-item" data-cat="HP노트북">HP노트북</a>
						<a class="collapse-item" data-cat="기타">기타</a>
					</div>
				</div>
			</li>
			
			<!-- Nav Item - Card -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseCard"
				aria-expanded="true" aria-controls="collapseCard">
				<img width=50px src="https://1.bp.blogspot.com/-Z7KvszYj3GY/Xaa3eYWzuXI/AAAAAAAAATY/vI38hrzvq1okU_spsRB9FiEGDXtS5SJkQCLcBGAsYHQ/s1600/16.png"> <span>카드</span>
			</a>
				<div id="collapseCard" class="collapse"
					aria-labelledby="headingCard" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<a class="collapse-item" data-cat="신용(체크)카드)">신용(체크)카드</a>
						<a class="collapse-item" data-cat="일반카드">일반카드</a>
						<a class="collapse-item" data-cat="기타카드">기타카드</a>
					</div>
				</div>
			</li>
			
			<!-- Nav Item - Cash -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseCash"
				aria-expanded="true" aria-controls="collapseCash">
				<img width=50px src="https://1.bp.blogspot.com/-aQVwhkaPdo4/Xaa6b2Piv8I/AAAAAAAAAUU/R-ibQMrSDX0fkIgh6g9LCKutdIvOL_rEQCLcBGAsYHQ/s1600/17.png"> <span>현금</span>
			</a>
				<div id="collapseCash" class="collapse"
					aria-labelledby="headingCash" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<a class="collapse-item" data-cat="현금">현금</a>
						<a class="collapse-item" data-cat="수표">수표</a>
						<a class="collapse-item" data-cat="카드">카드</a>
						<a class="collapse-item" data-cat="외화">외화</a>
						<a class="collapse-item" data-cat="기타">기타</a>
					</div>
				</div>
			</li>
			
			<!-- Nav Item - Cellphone -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseCellphone"
				aria-expanded="true" aria-controls="collapseCellphone">
				<img width=50px src="https://1.bp.blogspot.com/-hQpKMWvd_ik/Xaa6cBXfpLI/AAAAAAAAAUY/a7Gv3TE1zM88uDdjzmETP0oqw7mKoOt7gCLcBGAsYHQ/s1600/18.png"> <span>휴대폰</span>
			</a>
				<div id="collapseCellphone" class="collapse"
					aria-labelledby="headingCellphone" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<a class="collapse-item" data-cat="삼성휴대폰">삼성휴대폰</a>
						<a class="collapse-item" data-cat="LG휴대폰">LG휴대폰</a>
						<a class="collapse-item" data-cat="아이폰">아이폰</a>
						<a class="collapse-item" data-cat="모토로라휴대폰">모토로라휴대폰</a>
						<a class="collapse-item" data-cat="스카이휴대폰">SKY휴대폰</a>
						<a class="collapse-item" data-cat="기타통신기기">기타통신기기</a>
					</div>
				</div>
			</li>
			
						<!-- Nav Item - Ect -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseEct"
				aria-expanded="true" aria-controls="collapseEct">
				<img width=50px src="https://1.bp.blogspot.com/-hQpKMWvd_ik/Xaa6cBXfpLI/AAAAAAAAAUY/a7Gv3TE1zM88uDdjzmETP0oqw7mKoOt7gCLcBGAsYHQ/s1600/19.png"> <span>기타</span>
			</a>
				<div id="collapseEct" class="collapse"
					aria-labelledby="headingEct" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<a class="collapse-item" data-cat="기타">기타</a>
					</div>
				</div>
			</li>
			
			
			
			<!-- Divider -->
			<hr class="sidebar-divider">

			<!-- Heading -->
			<div class="sidebar-heading">Addons</div>


			<!-- Sidebar Toggler (Sidebar) -->
			<div class="text-center d-none d-md-inline">
				<button class="rounded-circle border-0" id="sidebarToggle"></button>
			</div>

		</ul>
		<!-- End of Sidebar -->
		<!--  -------------------/사이드 바------------------- -->
		
		
		
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
						공공 습득물은 습득일부터 9개월간 이곳에 보관됩니다. 자세한 내용은 <a class = "d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" target="_blank"
							href="https://www.lost112.go.kr/html.do?html=/prevent/lostProcedures&sub=F&title=%EC%9C%A0%EC%8B%A4%EB%AC%BC%EC%A2%85%ED%95%A9%EC%95%88%EB%82%B4&ptitle=%EC%9C%A0%EC%8B%A4%EB%AC%BC%EC%B2%98%EB%A6%AC%EC%A0%88%EC%B0%A8">유실물처리절차</a>를 클릭하세요.
					</p>
					<!-- -----------------습득물 리스트 게시판----------------- -->
					<!-- -----------------검색창----------------- -->
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">Found items</h6>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table id="searchBox" style="float:left; width:1000px; height:10px; table-layout: fixed;">
									<tr>
									<td width=100 style="word-break:break-all">
									<a id="selectDate" href="#dateModal" data-toggle="modal" onmouseover="this.style.opacity='0.2';" onmouseleave="this.style.opacity='1';">
										<i class="fas fa-calendar fa-2x text-gray-300"></i>
										습득일자
									</a>
									</td>
									<td width=95px style="word-break:break-all">
										<span id="lostFrom">${pageMaker.from }</span>
									</td>
									<td width=10px style="word-break:break-all">
										~
									</td>
									<td width=95px style="word-break:break-all">
										<span id="lostTo">${pageMaker.to }</span>
									</td>
									<td width=250 style="word-break:break-all">
									<a id="selectCat" href="#catModal" data-toggle="modal" onmouseover="this.style.opacity='0.2';" onmouseleave="this.style.opacity='1';">
										<i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
										습득지역
									</a>
										<span id="lostPlace">${pageMaker.place}</span>
									</td>
									<td>
									<div style="display:inline-block">
										<select name="searchType" class="form-control" id="searchType">
											<option value="all"
												<c:out value="${pageMaker.searchType eq 'all' ? 'selected' : '' }"/>>All</option>
											<option value="product_name"
												<c:out value="${pageMaker.searchType eq 'product_name' ? 'selected' : '' }"/>>습득물명</option>
											<option value="keep_place"
												<c:out value="${pageMaker.searchType eq 'keep_place' ? 'selected' : '' }"/>>보관장소</option>
											<option value="find_date"
												<c:out value="${pageMaker.searchType eq 'find_date' ? 'selected' : '' }"/>>습득일자(YYYY-MM-DD)</option>
											<option value="find_place"
												<c:out value="${pageMaker.searchType eq 'find_place' ? 'selected' : '' }"/>>습득장소</option>
										</select>
										<input type="text" name="keyword" id="keywordInput"
											class="form-control" value="${pageMaker.keyword}" style="float:left;">
									</div>
									<button id="searchBtn" class="btn btn-primary">검색</button>
									<button class="btn btn-primary" id="refreshBtn">새로고침</button>
									</tr>
								</table>
								
								<!-- <div><a>초기화</a><a><i class="fas fa-search fa-sm"></i></a></div> -->
								<!--  -----------------테이블----------------- -->
								<table class="table table-bordered" id="dataTable" width="100%"
									cellspacing="0">
									<thead>
										<tr>
											<th>사진</th>
											<th width=300px style=style="word-break:break-all">습득물명</th>
											<th>습득장소</th>
											<th>보관장소</th>
											<th>습득일자</th>
										</tr>
									</thead>
									<tbody>
											<c:forEach var="vo" items="${list}">
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
														data-place="${vo.keep_place }"
														data-Addr="${vo.addr }"
														<%-- data-lon="${vo.lon }"
														data-lat="${vo.lat }" --%>
														>
														${vo.product_name }
														</a></td>
													<td>${vo.find_place }</td>
													<td>${vo.keep_place}</td>
													<td>${vo.find_date}</td>
												</tr>
											</c:forEach>
									</tbody>
									<!--  페이징 -->
									<tfoot>
										<tr>
											<td colspan="8" class="text-center">
												<ul class="pagination">
													<c:if test="${pageMaker.prev}">
														<li><a class = "btn blue"
															href="lost${pageMaker.makeSearch(pageMaker.startPage -1)}">&laquo;</a></li>
													</c:if>

													<c:forEach begin="${pageMaker.startPage }"
														end="${pageMaker.endPage}" var="idx">
														<li class = "btn blue"
															<c:out value="${pageMaker.page ==idx? 'class=active' : ''}" />>
															<a href="lost${pageMaker.makeSearch(idx)}">${idx}</a>
														</li>
													</c:forEach>

													<c:if test="${pageMaker.next && pageMaker.endPage >0 }">
														<li><a class = "btn blue"
															href="lost${pageMaker.makeSearch(pageMaker.endPage +1)}">&raquo;</a></li>
													</c:if>
												</ul>
											</td>
										</tr>
									</tfoot>

								</table>
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
								<img id="m_image" alt="이미지 준비중입니다." src="" width="300"
									height="300"
									style="margin-left: auto; margin-right: auto; display: block;">
								<br>
								<h5 id="m_title" style="font-weight: bold;"></h5>
								<p id="m_category" style="font-size: small;"></p>
								<p id="m_content"></p>
								습득일 : <span id="m_date" style="font-size: small;"></span>
								<hr>
								<div name=keepplaceInfo>
								<div id="mapid" style="width: 250px; height: 250px; float:left;" ></div>
								<div style="float:right; text-align:left; width:210px; height:250px;">
								<p id="m_place" style="font-weight:bold;"></p>
								<p id="m_addr"></p>
								<br>
								</div>						
								</div>
								<div><span style="font-size:large; font-weight:bold; color:#4e73df;">찾으시는 물건이 맞나요?</span>
								<a class = "d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" target="_blank"
							href="https://www.lost112.go.kr/html.do?html=/prevent/lostProcedures&sub=F&title=%EC%9C%A0%EC%8B%A4%EB%AC%BC%EC%A2%85%ED%95%A9%EC%95%88%EB%82%B4&ptitle=%EC%9C%A0%EC%8B%A4%EB%AC%BC%EC%B2%98%EB%A6%AC%EC%A0%88%EC%B0%A8">
								유실물처리절차</a>를 통해 되찾으세요!</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default" id="closeBtn"
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
								<h4 class="modal-title">기간을 선택해주세요.</h4>
								<button type="button" class="close" data-dismiss="modal">×</button>
							</div>
						<div class="modal-body">
	    			분실일 : <input type="date" id="from"/>
	    			~ <input type="date" id="to"/>
	    			<p style="font-size:small;">*정책에 따라 9개월 이내의 습득물만 보관합니다.</p>
	    		</div>
	    		<div class="modal-footer">
	    			<button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
		       		<button class="btn btn-primary" type="button" id="btn_date">Submit</button>
	    		</div>
					</div>
				</div>
				</div>
				<!-- -----------------------/날짜 모달--------------------------- -->
				
				<!-- ------------------------- 지역 선택 모달 ------------------------- -->
				<!-- Modal -->
				<div class="modal fade" id="catModal" role="dialog">
					<div class="modal-dialog">
						<!-- Modal content-->
						<div class="modal-content">
							<div class="modal-header">
								<h4 class="modal-title">분류를 선택해주세요.</h4>
								<button type="button" class="close" data-dismiss="modal">×</button>
							</div><form>
						<div class="modal-body">
							<table>
								<tr style="padding:5px;">
								<td style="padding:5px;"><input type="checkbox" value="도봉구" name="find_place">도봉구</td>
								<td style="padding:5px;"><input type="checkbox" value="강북구" name="find_place">강북구</td>
								<td style="padding:5px;"><input type="checkbox" value="노원구" name="find_place">노원구</td>
								<td style="padding:5px;"><input type="checkbox" value="은평구" name="find_place">은평구</td>
								</tr >
								<tr style="padding:5px;">
								<td style="padding:5px;"><input type="checkbox" value="성북구" name="find_place">성북구</td>
								<td style="padding:5px;"><input type="checkbox" value="중량구" name="find_place">중량구</td>
								<td style="padding:5px;"><input type="checkbox" value="서대문구" name="find_place">서대문구</td>
								<td style="padding:5px;"><input type="checkbox" value="종로구" name="find_place">종로구</td>
								</tr>
								<tr style="padding:5px;">
								<td style="padding:5px;"><input type="checkbox" value="동대문구" name="find_place">동대문구</td>
								<td style="padding:5px;"><input type="checkbox" value="마포구" name="find_place">마포구</td>
								<td style="padding:5px;"><input type="checkbox" value="중구" name="find_place">중구</td>
								<td style="padding:5px;"><input type="checkbox" value="성동구" name="find_place">성동구</td>
								</tr>
								<tr style="padding:5px;">
								<td style="padding:5px;"><input type="checkbox" value="용산구" name="find_place">용산구</td>
								<td style="padding:5px;"><input type="checkbox" value="광진구" name="find_place">광진구</td>
								<td style="padding:5px;"><input type="checkbox" value="강서구" name="find_place">강서구</td>
								<td style="padding:5px;"><input type="checkbox" value="양천구" name="find_place">양천구</td>
								</tr>
								<tr style="padding:5px;">
								<td style="padding:5px;"><input type="checkbox" value="영등포구" name="find_place">영등포구</td>
								<td style="padding:5px;"><input type="checkbox" value="구로구" name="find_place">구로구</td>
								<td style="padding:5px;"><input type="checkbox" value="금천구" name="find_place">금천구</td>
								<td style="padding:5px;"><input type="checkbox" value="관악구" name="find_place">관악구</td>
								</tr>
								<tr style="padding:5px;">
								<td style="padding:5px;"><input type="checkbox" value="송파구" name="find_place">송파구</td>
								<td style="padding:5px;"><input type="checkbox" value="강동구" name="find_place">강동구</td>
								<td style="padding:5px;"><input type="checkbox" value="강남구" name="find_place">강남구</td>
								<td style="padding:5px;"><input type="checkbox" value="서초구" name="find_place">서초구</td>
								</tr>
								<tr style="padding:5px;">
								<td style="padding:5px;"><input type="checkbox" value="송파구" name="find_place">송파구</td>
								</tr>
						</table>
	    			<br><br>
	    			<p style="font-size:small;">*정책에 따라 9개월 이내의 습득물만 보관합니다.</p>
	    		</div>
	    		<div class="modal-footer">
	    			<!-- <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button> -->
		       		<button class="btn btn-primary" type="button" id="btn_cat">Submit</button>
	    		</div>
	    		</form>
			</div>
		</div>
				<!-- -----------------------/카테고리 모달--------------------------- -->
				
				
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
    $(function () {
        $(".list").click(function () {
            var m_title = $(this).data('title');
            var m_image = $(this).data('image');
			var m_category = $(this).data('category');
			var m_date = $(this).data('date');
			var m_content = $(this).data('content');
			var m_place = $(this).data('place');
			var m_addr=$(this).data('addr');
			
			var modal = $(this);
            $("#m_title").text(m_title);
            $("#m_image").attr("src", m_image);
            $('#m_category').text(m_category);
            $('#m_date').text(m_date);
            $('#m_content').text(m_content);
            $('#m_place').text(m_place);
            $('#m_addr').text(m_addr);
            
            //모달창 이벤트 등록 -> myMap() 함수 호출, 동적 생성된 엘리먼트 삭제 연계
            $("div#myModal").on("shown.bs.modal", function() {
    			myMap(m_addr,m_place);
    		});
    		$("div#myModal").on("hidden.bs.modal", function() {
    		$("div#mapid").empty();
    		});
            
        })
    });
</script>

<!-- 카테고리 검색 -->
<script>
$(function () {
	  $(".collapse-item").click(function () {
		  var cat=$(this).data('cat');
		  location.href = "lost${pageMaker.makeQuery(1)}"+
		  "&cat="+cat;
	  })
});
</script>

<!-- 분실물 상세보기 내 지도 -->
<script>
var mymap;
	function myMap(addr,place) {
		var lat;
		var lng;
		$.getJSON("https://maps.googleapis.com/maps/api/geocode/json?key=&address="+encodeURIComponent(addr), function(data) {
			 if (data.results.length > 0) {
			lat = data.results[0].geometry.location.lat;
			lng = data.results[0].geometry.location.lng;
			if(mymap) mymap.remove();
			mymap = L.map('mapid').setView([lat, lng], 16)
			L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token=pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpejY4NXVycTA2emYycXBndHRqcmZ3N3gifQ.rJcFIG214AriISLbB6B5aw', {
				maxZoom: 18,
				attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors, ' +
				'<a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, ' +
				'Imagery <a href="https://www.mapbox.com/">Mapbox</a>',
				id: 'mapbox.streets'
			}).addTo(mymap);
		
			var myIcon = L.icon({
		   		iconUrl: "https://1.bp.blogspot.com/-Ust3Y-tSEuA/XZvxuJP7MQI/AAAAAAAAAPc/rWzTjUzDxdsIRjLv3oIxnQGwL-45xvQfQCLcBGAsYHQ/s320/police_guard-512.png",
		    	iconSize: [50, 50]
			});
			var content = "<b>"+place+"</b><hr>"+addr
			L.marker([lat, lng],{icon: myIcon}).addTo(mymap).bindPopup(content);
			}
		});
	}
</script>

<!-- 날짜 검색 -->
<script>
$(document).on("click", "#selectDate", function(e) {
	$("#dateModal").modal('show');
	$("#btn_date").on("click", function(e) {
		var from = $("#from").val();
		var to = $("#to").val();
		$('#lostFrom').html(from);
		$('#lostTo').html(to);
		$("#dateModal").modal('hide');
	});
});
</script>

<!-- 지역 검색 -->
<script>
$(document).on("click", "#selectCat", function(e) {
	//모달 띄움
	$("#catModal").modal('show');
	//제출 버튼 눌렀을때
	 $("#btn_cat").on("click", function(e) {
		 var gu = [];
		    $.each($("input[name='find_place']:checked"), function() {
		      gu.push($(this).val());
		    });
		      $("#lostPlace").html(gu.join(","));
		      $("#catModal").modal('hide');
	}); 
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
									+ "&keyword=" + keywordInput()
									+ "&place=" + placeInput()
									+ dateInput()
							        + "&cat=" + catInput();
							self.location = url;
						});
			});
		function searchType() {
			return $("#searchType").val();
		}
		function keywordInput() {
			return $("#keywordInput").val();
		}
		function catInput(cat){
			var pname= window.location.href;
			var appctx = pname.substring(pname.lastIndexOf("&cat"),pname.lastIndexOf("&cat")+5);
			if(appctx=="&cat="){
				return pname.substring(pname.lastIndexOf("=")+1);
			}
			else{
				return "all";
			}
		}
		function placeInput() {
			if($("#lostPlace").text()== ""){
				return "";
			}
			else {return $("#lostPlace").text();}
		}
		function dateInput() {
			return "&from="+$("#lostFrom").text()+"&to="+$("#lostTo").text();
		}
	</script>

<!-- 새로고침 버튼 -->
<script>
$(document).on("click", "#refreshBtn", function(e) {
	//모달 띄움
	$("#lostFrom").html("");
	$("#lostPlace").html("");
	$("#lostTo").html("");
	//제출 버튼 눌렀을때
});
</script>
<script>
$(document).on("click", "#closeBtn", function(e) {
	//모달 띄움
	$("div#mapid").html("");
	//제출 버튼 눌렀을때
});
</script>

</body>

</html>
