<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en-US">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>내꺼야</title>
<meta name="description"
	content="This is a basic starter template for MMPilot which includes Bootstrap Framework." />
<link
	href="https://fonts.googleapis.com/css?family=Oxygen:300,400,600,700"
	rel="stylesheet">
<link href="/mine/resources/styles/main.css" rel="stylesheet">
</head>
<body id="top">
	<header class="tf-header">
		<nav class="navbar py-5 navbar-dark">
			<div class="container">
				<h1>
					<a class="navbar-brand" href="/mine">It's Mine</a>
				</h1>
				<div id="navbar">
					<ul class="nav pull-right">
						<li class="nav-item"><a class="nav-link" href="#">Home</a></li>
						<li class="nav-item"><a class="nav-link" href="#work">Work</a></li>
						<li class="nav-item"><a class="nav-link" href="#contact">Contact</a></li>
					</ul>
				</div>
			</div>
		</nav>
		<div class="container">
			<div class="row">
				<div class="col-md-7 col-sm-12">
					<h2>
						내꺼야 <br> 잃어버린 물건 찾기 &<br> 습득물 공매
					</h2>
				</div>
			</div>
			<div class="row">
				<div class="col-md-7 col-sm-12">
					<p class="mt-4">나의 잃어버린 물건을 편리하게 찾거나, 습득물을 저렴한 가격에 겟챠~!</p>
					<p class="mt-5">
						<strong class="text-uppercase">간편한 검색</strong><span> - 찾고자
							하는 물건 혹은 원하는 물건을 검색해보세요.</span>
					</p>
				</div>
			</div>
			
				<div class="row no-gutters">
					<div class="col-md-4 col-sm-12 tf-hh-col">
						<input type="text" name="keyword" id="keywordInput"
											class="form-control" value="${pageMaker.keyword}"  placeholder="*물건명을 입력하세요">
					</div>
					<div class="col-md-3 col-sm-12">
						<button class="btn btn-primary" id="searchBtn" class=>검색</button>
					</div>
				</div>
			
		</div>
	</header>
	<div class="page-content">
		<div>
			<div class="tf-work-section">
				<div class="container" id="work">
					<h2 class="h3">잃어버린 물건 찾기와 공매 과정</h2>
				</div>
				<div class="container">
					<div class="row">
						<div class="col-md-4 col-sm-12 pt-2">
							<div class="card">
								<img class="img-fluid card-img-top"
									src="/mine/resources/images/2-start-simple.jpg"
									alt="2-start-simple" />
								<div class="card-body">
									<p class="text-muted">매일 업데이트되는 습득물 정보를 기반으로 간편하게 잃어버린 물건을
										찾아보세요!</p>
									<a class="text-dark card-link" href="#">Learn More</a>
								</div>
							</div>
						</div>
						<div class="col-md-4 col-sm-12 pt-2">
							<div class="card">
								<img class="img-fluid card-img-top"
									src="/mine/resources/images/3-start-simple.jpg"
									alt="3-start-simple" />
								<div class="card-body">
									<p class="text-muted">보관기간이 6~9개월이 넘어간 물건은 국고에 귀속되거나 폐기,
										공매의 절차를 거치게 됩니다.</p>
									<a class="text-dark card-link" href="#">Learn More</a>
								</div>
							</div>
						</div>
						<div class="col-md-4 col-sm-12 pt-2">
							<div class="card">
								<img class="img-fluid card-img-top"
									src="/mine/resources/images/4-start-simple.jpg"
									alt="4-start-simple" />
								<div class="card-body">
									<p class="text-muted">복잡하고 불편한 오프라인 경매가 아닌 온라인에서 간편하게 공매에
										참여해보세요!</p>
									<a class="text-dark card-link" href="#">Learn More</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="tf-quotes-section">
				<div class="carousel slide mt-5" id="tf-carousel"
					data-ride="carousel">
					<ol class="carousel-indicators">
						<li class="active" data-target="#tf-carousel" data-slide-to="0"></li>
						<li data-target="#tf-carousel" data-slide-to="1"></li>
						<li data-target="#tf-carousel" data-slide-to="2"></li>
					</ol>
					<div class="carousel-inner">
						<div class="carousel-item active"
							style="background-image: url('/mine/resources/images/5-start-simple-slider.jpg');">
							<div class="carousel-caption">
								<p class="slider-text-1">
									"정말 소중한 추억이 담긴 지갑이었는데 내꺼야 서비스를 통해<br>찾을 수 있었어요!"
								</p>
								<p class="slider-text-2">
									이경준<br>직장인, 물건 찾기 사용자
								</p>
							</div>
						</div>
						<div class="carousel-item"
							style="background-image: url('/mine/resources/images/6-start-simple-slider.jpg');">
							<div class="carousel-caption">
								<p class="slider-text-1">
									"중고 사이트보다 훨씬 저렴한 가격에 노트북을 살 수 있었어요.<br>앞으로도 종종 사용할게요!"
								</p>
								<p class="slider-text-2">
									김소미<br>대학생, 공매 사용자
								</p>
							</div>
						</div>
						<div class="carousel-item"
							style="background-image: url('/mine/resources/images/7-start-simple-slider.jpg');">
							<div class="carousel-caption">
								<p class="slider-text-1">
									"잃어버린 물건을 주인에게 찾아주고 그렇지 못한 물건은 공매합니다.<br>아나바다의 새로운 탄생이랄까"
								</p>
								<p class="slider-text-2">
									홍성재<br>내꺼야 CTO
								</p>
							</div>
						</div>
					</div>
					<a class="carousel-control-prev" href="#tf-carousel" role="button"
						data-slide="prev"><span class="carousel-control-prev-icon"
						aria-hidden="true"></span><span class="sr-only">Previous</span></a><a
						class="carousel-control-next" href="#tf-carousel" role="button"
						data-slide="next"><span class="carousel-control-next-icon"
						aria-hidden="true"></span><span class="sr-only">Next</span></a>
				</div>
			</div>
			<div class="tf-contact-section">
				<div class="container" id="contact">
					<h2 class="h4">Tell us About Your Requirement</h2>
				</div>
				<div class="container">
					<div class="row">
						<div class="col-md-4 col-sm-12">
							<h3 class="h5">Contact us</h3>
							<form action="https://formspree.io/youremail@example.com"
								method="POST">
								<div class="row no-gutters">
									<div class="col-lg-6 col-md-12 col-sm-12 tf-contact-col">
										<input class="bg-light form-control" type="text" name="name"
											placeholder="*Name" required="required" />
									</div>
									<div class="col-lg-6 col-md-12 col-sm-12 pb-2">
										<input class="bg-light form-control" type="email"
											name="_replyto" placeholder="*Your Email Address"
											required="required" />
									</div>
								</div>
								<div class="row pb-2 no-gutters">
									<div class="col-md-12 col-sm-12">
										<textarea class="bg-light mb-2 form-control" name="message"
											placeholder="*Your Message" rows="5" required="required"></textarea>
									</div>
								</div>
								<button class="btn btn-primary" type="submit">Submit</button>
							</form>
						</div>
						<div class="col-md-8 col-sm-12 float-right text-right">
							<h3 class="h5">Address</h3>
							<span>내꺼야<br />서울특별시 역삼동 멀티캠퍼스 1304호
							</span>
							<p></p>
							<h3 class="h5">Phone</h3>
							<p>(243) 948 3866</p>
							<h3 class="h5">Email</h3>
							<p>contact@example.com</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<footer class="bg-dark py-4 mt-5 tf-footer">
		<div class="container text-light">
			<div class="row">
				<div class="col-md-6 col-sm-12">&copy; 내꺼야. All rights
					reserved.</div>
				<div class="col-md-6 col-sm-12 text-right tf-design">
					Design - <a href="https://templateflip.com" target="_blank">Templateflip</a>
				</div>
			</div>
		</div>
	</footer>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
	<script src="/mine/resources/scripts/main.js"></script>
	<script>
	$(document).ready(
			function() {
				$("#searchBtn").on(
						"click",
						function(event) {
							var url = "/mine/lost?page=1&perPageNum=10";
							url += "&searchType=" + searchType()
									+ "&keyword=" + keywordInput()
									+ "&place="
							        + "&cat=";
							self.location = url;
						});
			});
		function searchType() {
			return "all";
		}
		function keywordInput() {
			return $("#keywordInput").val();
		}
		</script>
</body>
</html>