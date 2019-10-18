<%@ page contentType="text/html; charset=utf-8"
		pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Shoppers &mdash; Colorlib e-Commerce Template</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Mukta:300,400,700"> 
    <link rel="stylesheet" href="/mine/resources/fonts/icomoon/style.css">

    <link rel="stylesheet" href="/mine/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="/mine/resources/css/magnific-popup.css">
    <link rel="stylesheet" href="/mine/resources/css/jquery-ui.css">
    <link rel="stylesheet" href="/mine/resources/css/owl.carousel.min.css">
    <link rel="stylesheet" href="/mine/resources/css/owl.theme.default.min.css">


    <link rel="stylesheet" href="/mine/resources/css/aos.css">

    <link rel="stylesheet" href="/mine/resources/css/style.css">
    
  </head>
  <body>
  
  <div class="site-wrap">
    <header class="site-navbar" role="banner">
      <div class="site-navbar-top">
        <div class="container">
          <div class="row align-items-center">

            <div class="col-6 col-md-4 order-2 order-md-1 site-search-icon text-left">
              <form action="" class="site-block-top-search">
                <span class="icon icon-search2"></span>
                <input type="text" class="form-control border-0" placeholder="Search">
              </form>
            </div>

            <div class="col-12 mb-3 mb-md-0 col-md-4 order-1 order-md-2 text-center">
              <div class="site-logo">
                <a href="<%=request.getContextPath()%>/main" class="js-logo-clone">내 꺼 야</a>
              </div>
            </div>

            <div class="col-6 col-md-4 order-3 order-md-3 text-right">
              <div class="site-top-icons">
                <ul>
<!--                   <li><a href="#"><span class="icon icon-person"></span></a></li>
                  <li><a href="#"><span class="icon icon-heart-o"></span></a></li> -->
                  <li>
                    <a href="<%=request.getContextPath()%>/combid" class="site-cart">
                      <span class="icon icon-shopping_cart"></span>
                      <span class="count">${cartCount}</span>
                    </a>
                  </li> 
                  <li class="d-inline-block d-md-none ml-md-0"><a href="#" class="site-menu-toggle js-menu-toggle"><span class="icon-menu"></span></a></li>
                </ul>
              </div> 
            </div>

          </div>
        </div>
      </div> 
      <nav class="site-navigation text-right text-md-center" role="navigation">
        <div class="container">
          <ul class="site-menu js-clone-nav d-none d-md-block">
                       <!-- <li class="has-children"> -->
              <li><a href="<%=request.getContextPath()%>/main">Home</a></li>
<!--               <ul class="dropdown">
                <li><a href="#">Menu One</a></li>
                <li><a href="#">Menu Two</a></li>
                <li><a href="#">Menu Three</a></li>
                <li class="has-children">
                  <a href="#">Sub Menu</a>
                  <ul class="dropdown">
                    <li><a href="#">Menu One</a></li>
                    <li><a href="#">Menu Two</a></li>
                    <li><a href="#">Menu Three</a></li>
                  </ul>
                </li>
              </ul> -->
            <!-- </li> -->
            <!-- <li class="has-children"> -->
              <li><a href="<%=request.getContextPath()%>/lost">Lost</a></li>
              <!-- <ul class="dropdown">
                <li><a href="#">Menu One</a></li>
                <li><a href="#">Menu Two</a></li>
                <li><a href="#">Menu Three</a></li>
              </ul> -->
           <!--  </li> -->
            <li class="active"><a href="<%=request.getContextPath()%>/auction">Auction</a></li>
<!--              <li><a href="#">Catalogue</a></li>
            <li><a href="#">New Arrivals</a></li> 
            <li><a href="contact.html">Contact</a></li> -->
          </ul>
        </div>
      </nav>
    </header>

    <div class="bg-light py-3">
      <div class="container">
        <div class="row">
          <div class="col-md-12 mb-0"><a href="<%=request.getContextPath()%>/main">Home</a> <span class="mx-2 mb-0">/</span> <strong class="text-black">Cart</strong></div>
        </div>
      </div>
    </div>

    <div class="site-section">
      <div class="container">
        <div class="row mb-5">
          <form class="col-md-12" method="post">
            <div class="site-blocks-table">
            <!-- 낙찰받은 물건 결제전 -->
            결제전
              <table class="table table-bordered">
                <thead>
                  <tr>
                    <th class="product-thumbnail">Image</th>
                    <th class="product-name">Product</th>
                    <th class="product-price">Price</th>
                    <th class="product-remove">Pay</th>
                  </tr>
                </thead>
                <tbody>
		            <c:if test="${!empty BiddingCompleteList}">
						<c:forEach var="vo" items="${BiddingCompleteList}">
		                  <tr>
		                    <td class="product-thumbnail">
		                      <img src="${vo.image_address}" alt="Image" class="img-fluid">
		                    </td>
		                    <td class="product-name">
		                      <h2 class="h5 text-black">${vo.product_name}</h2>
		                    </td>
		                    <td>${vo.price}원</td>
		                    <td><a class="btn btn-primary btn-sm" href="http://70.12.113.171:8000/mine/payment?productId=${vo.unique_id}">결제하기</a></td>
		                  </tr>
						</c:forEach>
					</c:if>
                </tbody>
              </table>
              <!-- 결제 완료된 물건 -->
              결제완료
              <table class="table table-bordered">
                <thead>
                  <tr>
                    <th class="product-thumbnail">Image</th>
                    <th class="product-name">Product</th>
                    <th class="product-price">Price</th>
                  </tr>
                </thead>
                <tbody>
		        	<c:if test="${!empty BuyCompleteList}">
						<c:forEach var="vo" items="${BuyCompleteList}">
		                  <tr>
		                    <td class="product-thumbnail">
		                      <img src="${vo.image_address}" alt="Image" class="img-fluid">
		                    </td>
		                    <td class="product-name">
		                      <h2 class="h5 text-black">${vo.product_name}</h2>
		                    </td>
		                    <td>${vo.price}원</td>
		                  </tr>
		                </c:forEach>
					</c:if>
                </tbody>
              </table>
            </div>
          </form>
        </div>

    <footer class="site-footer border-top">
      <div class="container">
        <div class="row">
          <div class="col-lg-6 mb-5 mb-lg-0">

          </div>
          <div class="col-md-6 col-lg-3 mb-4 mb-lg-0">

          </div>
          <div class="col-md-6 col-lg-3">
            <div class="block-5 mb-5">
              <h3 class="footer-heading mb-4">Contact Info</h3>
              <ul class="list-unstyled">
                <li class="address">서울특별시 역삼동 멀티캠퍼스 1304호</li>
                <li class="phone"><a href="tel://23923929210">02 123 1234</a></li>
                <li class="email">itsmine@mulcam.com</li>
              </ul>
            </div>


          </div>
        </div>
        <div class="row pt-5 mt-5 text-center">
          <div class="col-md-12">
            <p>
            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
            Copyright &copy;<script data-cfasync="false" src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script><script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="icon-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank" class="text-primary">Colorlib</a>
            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
            </p>
          </div>
          
        </div>
      </div>
    </footer>
  </div>

  <script src="/mine/resources/js/jquery-3.3.1.min.js"></script>
  <script src="/mine/resources/js/jquery-ui.js"></script>
  <script src="/mine/resources/js/popper.min.js"></script>
  <script src="/mine/resources/js/bootstrap.min.js"></script>
  <script src="/mine/resources/js/owl.carousel.min.js"></script>
  <script src="/mine/resources/js/jquery.magnific-popup.min.js"></script>
  <script src="/mine/resources/js/aos.js"></script>

  <script src="/mine/resources/js/main.js"></script>
    
  </body>
</html>