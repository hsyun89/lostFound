<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

<c:if test="${empty status}">
		<script>
			location.href = "/mine/login";
		</script>
</c:if>
	
  <title>Lost&Find</title>
<style>
#user_name{
	font-weight: bold;
	left: 10%;
}
</style>
  <!-- Custom fonts for this template -->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="css/sb-admin-2.min.css" rel="stylesheet">

  <!-- Custom styles for this page -->
  <link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

</head>

<body id="page-top">

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar -->
		<ul
			class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
			id="accordionSidebar">

			<!-- Sidebar - Brand -->
			<a class="sidebar-brand d-flex align-items-center justify-content-center"
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
			<li class="nav-item"><a class="nav-link collapsed" href="/mine/auction"
		
				aria-expanded="true">
				 <span>All</span>
			</a>
			</li>
			
			<!-- Nav Item - Bag -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseBag"
				aria-expanded="true" aria-controls="collapseBag">
				<img src="https://www.lost112.go.kr/images/home/common/ico01.gif"> <span>가방</span>
			</a>
				<div id="collapseBag" class="collapse" aria-labelledby="headingBag"
					data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header">분류명 선택:</h6>
						<a class="collapse-item" href="/mine/lostkey?key=남성용가방">남성용가방</a>
						<a class="collapse-item" href="/mine/lostkey?key=여성용가방">여성용가방</a>
						<a class="collapse-item" href="/mine/lostkey?key=기타가방">기타가방</a>
					</div>
				</div>
			</li>
			
			<!-- Nav Item - Phone -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseCellphone"
				aria-expanded="true" aria-controls="collapseCellphone">
				<img src="https://www.lost112.go.kr/images/home/common/ico18.gif"> <span>휴대폰</span>
			</a>
				<div id="collapseCellphone" class="collapse"
					aria-labelledby="headingCellphone" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header">분류명 선택:</h6>
						<a class="collapse-item" href="/mine/lostkey?key=삼성휴대폰">삼성휴대폰</a>
						<a class="collapse-item" href="/mine/lostkey?key=아이폰">아이폰</a>
						<a class="collapse-item" href="/mine/lostkey?key=LG휴대폰">LG휴대폰</a>
						<a class="collapse-item" href="/mine/lostkey?key=기타통신기기">기타통신기기</a>
					</div>
				</div>
			</li>
			
			<!-- Nav Item - Computer -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseComputer"
				aria-expanded="true" aria-controls="collapseComputer">
				<img src="https://www.lost112.go.kr/images/home/common/ico15.gif"> <span>컴퓨터</span>
			</a>
				<div id="collapseComputer" class="collapse"
					aria-labelledby="headingComputer" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header">분류명 선택:</h6>
						<a class="collapse-item" href="/mine/lostkey?key=삼성노트북">삼성노트북</a>
						<a class="collapse-item" href="/mine/lostkey?key=LG노트북">LG노트북</a>
						<a class="collapse-item" href="/mine/lostkey?key=삼보노트북">삼보노트북</a>
						<a class="collapse-item" href="/mine/lostkey?key=기타">기타</a>
					</div>
				</div>
			</li>
			
			<!-- Nav Item - Wallet -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseWallet"
				aria-expanded="true" aria-controls="collapseWallet">
				<img src="https://www.lost112.go.kr/images/home/common/ico13.gif"> <span>지갑</span>
			</a>
				<div id="collapseWallet" class="collapse"
					aria-labelledby="headingWallet" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header">분류명 선택:</h6>
						<a class="collapse-item" href="/mine/lostkey?key=여성용 지갑">여성용 지갑</a>
						<a class="collapse-item" href="/mine/lostkey?key=남성용 지갑">남성용 지갑</a>
						<a class="collapse-item" href="/mine/lostkey?key=기타 지갑">기타 지갑</a>
					</div>
				</div>
			</li>
			
			<!-- Nav Item - Jewelry -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseJewelry"
				aria-expanded="true" aria-controls="collapseJewelry">
				<img src="https://www.lost112.go.kr/images/home/common/ico02.gif"> <span>귀금속</span>
			</a>
				<div id="collapseJewelry" class="collapse"
					aria-labelledby="headingJewelry" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header">분류명 선택:</h6>
						<a class="collapse-item" href="/mine/lostkey?key=반지">반지</a>
						<a class="collapse-item" href="/mine/lostkey?key=목걸이">목걸이</a>
						<a class="collapse-item" href="/mine/lostkey?key=귀걸이">귀걸이</a>
						<a class="collapse-item" href="/mine/lostkey?key=시계">시계</a>
					</div>
				</div>
			</li>
			
			<!-- Nav Item - Ect -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseEct"
				aria-expanded="true" aria-controls="collapseEct">
				<img src="https://www.lost112.go.kr/images/home/common/ico19.gif"> <span>기타물품</span>
			</a>
				<div id="collapseEct" class="collapse"
					aria-labelledby="headingEct" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header">분류명 선택:</h6>
						<a class="collapse-item" href="/mine/lostkey?key=기타">기타</a>
					</div>
				</div>
			</li>
			
			</ul>

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content">

        <!-- Topbar -->
        <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">


          <!-- Sidebar Toggle (Topbar) -->
					<button id="sidebarToggleTop"
						class="btn btn-link d-md-none rounded-circle mr-3">
						<i class="fa fa-bars"></i>
					</button>
					<!-- Topbar Navbar -->
					<ul class="navbar-nav ml-auto">
						<li class="nav-item dropdown no-arrow"><a
							class="nav-link dropdown-toggle" href="#" id="userDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> 
							<span id="user_name"class="mr-2 d-none d-lg-inline text-gray-600 small">
							${ status.user_name }
								</span> 
					<img class="img-profile rounded-circle"	src="https://source.unsplash.com/QAB-WJcbgJk/60x60">
						</a> <!-- Dropdown - User Information -->
						<div
								class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
								aria-labelledby="userDropdown">
							<a class="dropdown-item" href="#"> 
								<i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i> 
									Profile
							</a>  
							<a class="dropdown-item" href="/mine/combid"> 
								<i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i> 
									myAuction
							</a> 
							<c:if test="${admin==1}">
							<a class="dropdown-item" href="/mine/insertAuction">
							<i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
							InsertAuction
							</a>
							</c:if>
						<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
							 <i	class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
									Logout
								</a>
							</div></li>
					</ul>

				</nav>
        <!-- End of Topbar -->

        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6>싸게싸게 가져가세요</h6>
            </div>
            <div class="card-body">
              <div class="table-responsive">
              <form method="get" action="/mine/auction">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>거래번호</th>
                      <th>이미지</th>
                      <th>물품명</th>
                      <th>시작가격</th>
                      <th>시작시간</th>
                      <th>마감시간</th>
                    </tr>
                  </thead>
                  
                  <tbody>
                   <c:if test="${!empty list}">
							<c:forEach var="vo" items="${list}">
								<tr>
									<td>${vo.unique_id}</td>
									<td><img src="${vo.image_address}"
									width="100" height="100" style="margin-left: auto; margin-right: auto; display: block;">
									</td>
									<td><a href="/mine/auctionWebsocket?productId=${vo.unique_id}">${vo.product_name}</a></td>
									<td>${vo.start_price}</td>
									<%-- <td>${vo.min_bid}</td> --%>
									<td>${vo.start_date}</td>
									<td>${vo.end_date}</td>
									<c:if test="${admin==1}">
									<td><button type="button" class="delete" value="${vo.unique_id}">
									<img src="/mine/resources/images/delete.png"
									width="20" height="20"></img>
									</button></td>
									</c:if>
								</tr>
							</c:forEach>
						</c:if>
                  </tbody>
                </table>
                </form>
              </div>
            </div>
          </div>

        </div>
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
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <!-- Logout Modal-->
  <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
        <div class="modal-footer">
          <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
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
<script>
$(".delete").click(function(){
	 var unique_id = $(this).val();
	 alert(unique_id);
	 $.ajax({
		 url : '/mine/deleteAuction?unique_id=' + unique_id,
	 	 type : 'post',
	 	 success : function(data) {
	 		if(data == 1) {
	 			location.href = "/mine/auction";
	 		} else {
	 			console.log("실패~~~")
	 		}		 		
	 	 },
	 	error : function() {
			console.log("실패");
	 	}
	 })
});
</script>
</body>

</html>
