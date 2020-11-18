<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<jsp:include page="/WEB-INF/views/common/commonLink.jsp" />

</head>
<body class="bg-white">
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<style>
.card-img-top {
	width: 255px;
	height: 255px;
}
</style>
	<main role="main" style="min-height: 100vh;">
		<section class="mt-5">

			<!-- Page Content -->
			<div class="container my-4">
				<div class="row">

					<div class="col-lg-3 d-lg-block d-none my-5">
						<div class="accordion" id="accordionExample">

							<div class="card border-0">
								<div class="card-header bg-transparent" id="headingOne">
									<h2 class="mb-0">
										<button class="btn btn-link btn-block text-left text"
											style="font-weight: bold;" type="button"
											data-toggle="collapse" data-target="#collapseOne"
											aria-expanded="true" aria-controls="collapseOne">
											강아지</button>
									</h2>
								</div>
								<div id="collapseOne" class="collapse"
									aria-labelledby="headingOne" data-parent="#accordionExample">
									<div class="card-body">
										<ul class="nav flex-column">
											<li class="nav-item"><a class="nav-link active" href="#">홈/리빙</a>
											</li>
											<li class="nav-item"><a class="nav-link" href="#">식품</a>
											</li>
											<li class="nav-item"><a class="nav-link" href="#">옷</a>
											</li>
											<li class="nav-item"><a class="nav-link" href="#">용품</a>
											</li>
											<li class="nav-item"><a class="nav-link" href="#">목욕/미용</a>
											</li>
										</ul>
									</div>
								</div>
							</div>

							<div class="card border-0">
								<div class="card-header bg-transparent" id="headingTwo">
									<h2 class="mb-0">
										<button class="btn btn-link btn-block text-left collapsed"
											style="font-weight: bold;" type="button"
											data-toggle="collapse" data-target="#collapseTwo"
											aria-expanded="false" aria-controls="collapseTwo">
											고양이</button>
									</h2>
								</div>
								<div id="collapseTwo" class="collapse"
									aria-labelledby="headingTwo" data-parent="#accordionExample">
									<div class="card-body">
										<ul class="nav flex-column">
											<li class="nav-item"><a class="nav-link active" href="#">홈/리빙</a>
											</li>
											<li class="nav-item"><a class="nav-link" href="#">식품</a>
											</li>
											<li class="nav-item"><a class="nav-link" href="#">옷</a>
											</li>
											<li class="nav-item"><a class="nav-link" href="#">용품</a>
											</li>
											<li class="nav-item"><a class="nav-link" href="#">목욕/미용</a>
											</li>
										</ul>
									</div>
								</div>
							</div>

							<div class="card border-0">
								<div class="card-header bg-transparent" id="headingThree">
									<h2 class="mb-0">
										<button class="btn btn-link btn-block text-left collapsed"
											style="font-weight: bold;" type="button"
											data-toggle="collapse" data-target="#collapseThree"
											aria-expanded="false" aria-controls="collapseThree">
											소동물</button>
									</h2>
								</div>
								<div id="collapseThree" class="collapse"
									aria-labelledby="headingThree" data-parent="#accordionExample">
									<div class="card-body">
										<ul class="nav flex-column">
											<li class="nav-item"><a class="nav-link active" href="#">햄스터</a>
											</li>
											<li class="nav-item"><a class="nav-link" href="#">토끼</a>
											</li>
											<li class="nav-item"><a class="nav-link" href="#">물고기</a>
											</li>
											<li class="nav-item"><a class="nav-link" href="#">새</a>
											</li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- /.col-lg-3 -->

					<div class="col-lg-9">

						<div id="carouselExampleIndicators" class="carousel slide my-5"
							data-ride="carousel">
							<ol class="carousel-indicators">
								<li data-target="#carouselExampleIndicators" data-slide-to="0"
									class="active"></li>
								<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
								<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
							</ol>
							<div class="carousel-inner" role="listbox">
								<div class="carousel-item active">
									<img class="d-block img-fluid" src="sea)연어.png"
										alt="First slide" style="height: 350px; width: 100%">
								</div>
								<div class="carousel-item">
									<img class="d-block img-fluid" src="sea)연어.png"
										alt="Second slide" style="height: 350px; width: 100%">
								</div>
								<div class="carousel-item">
									<img class="d-block img-fluid" src="sea)연어.png"
										alt="Third slide" style="height: 350px; width: 100%">
								</div>
							</div>
							<a class="carousel-control-prev"
								href="#carouselExampleIndicators" role="button"
								data-slide="prev"> <span class="carousel-control-prev-icon"
								aria-hidden="true"></span> <span class="sr-only">Previous</span>
							</a> <a class="carousel-control-next"
								href="#carouselExampleIndicators" role="button"
								data-slide="next"> <span class="carousel-control-next-icon"
								aria-hidden="true"></span> <span class="sr-only">Next</span>
							</a>
						</div>


						<div class="row">
							<div class="col-12 category-container mt-5">
								<h5 style="font-weight: bold;">강아지</h5>
								<a class="text-info" style="font-weight: bold;" href="#">더보기</a>
							</div>
							<div class="col-lg-4 col-md-6 mb-4">
								<a href="#"> <img class="card-img-top"
									src="resources/images/common3.jpg" alt="">
									<h4 class="text-black" style="color: black;">상품명</h4>
									<div>
										<span style="font-weight: bold; color: #35c5f0;">70%</span> <span
											style="font-weight: bold; color: black;">59,000~</span>
									</div>
									<div>
										<small class="text-muted" style="font-weight: bold;">별점&#9733;4.0</small>
									</div>
								</a>
							</div>
							<div class="col-lg-4 col-md-6 mb-4">
								<a href="#"> <img class="card-img-top"
									src="resources/images/common3.jpg" alt="">
									<h4 class="text-black" style="color: black;">상품명</h4>
									<div>
										<span style="font-weight: bold; color: #35c5f0;">70%</span> <span
											style="font-weight: bold; color: black;">59,000~</span>
									</div>
									<div>
										<small class="text-muted" style="font-weight: bold;">별점&#9733;4.0</small>
									</div>
								</a>
							</div>
							<div class="col-lg-4 col-md-6 mb-4">
								<a href="#"> <img class="card-img-top"
									src="resources/images/common3.jpg" alt="">
									<h4 class="text-black" style="color: black;">상품명</h4>
									<div>
										<span style="font-weight: bold; color: #35c5f0;">70%</span> <span
											style="font-weight: bold; color: black;">59,000~</span>
									</div>
									<div>
										<small class="text-muted" style="font-weight: bold;">별점&#9733;4.0</small>
									</div>
								</a>
							</div>
							<div class="col-12 category-container mt-5">
								<h5 style="font-weight: bold;">고양이</h5>
								<a class="text-info" style="font-weight: bold;" href="#">더보기</a>
							</div>
							<div class="col-lg-4 col-md-6 mb-4">
								<a href="#"> <img class="card-img-top" src="sea)연어.png"
									alt="">
									<h4 class="text-black" style="color: black;">상품명</h4>
									<div>
										<span style="font-weight: bold; color: #35c5f0;">70%</span> <span
											style="font-weight: bold; color: black;">59,000~</span>
									</div>
									<div>
										<small class="text-muted" style="font-weight: bold;">별점&#9733;4.0</small>
									</div>
								</a>
							</div>
							<div class="col-lg-4 col-md-6 mb-4">
								<a href="#"> <img class="card-img-top" src="sea)연어.png"
									alt="">
									<h4 class="text-black" style="color: black;">상품명</h4>
									<div>
										<span style="font-weight: bold; color: #35c5f0;">70%</span> <span
											style="font-weight: bold; color: black;">59,000~</span>
									</div>
									<div>
										<small class="text-muted" style="font-weight: bold;">별점&#9733;4.0</small>
									</div>
								</a>
							</div>
							<div class="col-lg-4 col-md-6 mb-4">
								<a href="#"> <img class="card-img-top" src="sea)연어.png"
									alt="">
									<h4 class="text-black" style="color: black;">상품명</h4>
									<div>
										<span style="font-weight: bold; color: #35c5f0;">70%</span> <span
											style="font-weight: bold; color: black;">59,000~</span>
									</div>
									<div>
										<small class="text-muted" style="font-weight: bold;">별점&#9733;4.0</small>
									</div>
								</a>
							</div>
							<div class="col-12 category-container mt-5">
								<h5 style="font-weight: bold;">소동물</h5>
								<a class="text-info" style="font-weight: bold;" href="#">더보기</a>
							</div>
							<div class="col-lg-4 col-md-6 mb-4">
								<a href="#"> <img class="card-img-top" src="sea)연어.png"
									alt="">
									<h4 class="text-black" style="color: black;">상품명</h4>
									<div>
										<span style="font-weight: bold; color: #35c5f0;">70%</span> <span
											style="font-weight: bold; color: black;">59,000~</span>
									</div>
									<div>
										<small class="text-muted" style="font-weight: bold;">별점&#9733;4.0</small>
									</div>
								</a>
							</div>
							<div class="col-lg-4 col-md-6 mb-4">
								<a href="#"> <img class="card-img-top" src="sea)연어.png"
									alt="">
									<h4 class="text-black" style="color: black;">상품명</h4>
									<div>
										<span style="font-weight: bold; color: #35c5f0;">70%</span> <span
											style="font-weight: bold; color: black;">59,000~</span>
									</div>
									<div>
										<small class="text-muted" style="font-weight: bold;">별점&#9733;4.0</small>
									</div>
								</a>
							</div>
							<div class="col-lg-4 col-md-6 mb-4">
								<a href="#"> <img class="card-img-top" src="sea)연어.png"
									alt="">
									<h4 class="text-black" style="color: black;">상품명</h4>
									<div>
										<span style="font-weight: bold; color: #35c5f0;">70%</span> <span
											style="font-weight: bold; color: black;">59,000~</span>
									</div>
									<div>
										<small class="text-muted" style="font-weight: bold;">별점&#9733;4.0</small>
									</div>
								</a>
							</div>


						</div>
						<!-- /.row -->

					</div>
					<!-- /.col-lg-9 -->

				</div>
				<!-- /.row -->

			</div>
			<!-- /.container -->
		</section>
	</main>
	<style>
a:hover {
	text-decoration: none;
}

.category-container {
	display: flex;
	justify-content: space-between;
}
</style>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>