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
	/* width: 255px; */
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
											<li class="nav-item"><a class="nav-link active" href="${path }/store/moveCategory.do?cNo=D1">홈/리빙</a>
											</li>
											<li class="nav-item"><a class="nav-link" href="${path }/store/moveCategory.do?cNo=D2">식품</a>
											</li>
											<li class="nav-item"><a class="nav-link" href="${path }/store/moveCategory.do?cNo=D3">옷</a>
											</li>
											<li class="nav-item"><a class="nav-link" href="${path }/store/moveCategory.do?cNo=D4">용품</a>
											</li>
											<li class="nav-item"><a class="nav-link" href="${path }/store/moveCategory.do?cNo=D5">목욕/미용</a>
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
											<li class="nav-item"><a class="nav-link active" href="${path }/store/moveCategory.do?cNo=C1">홈/리빙</a>
											</li>
											<li class="nav-item"><a class="nav-link" href="${path }/store/moveCategory.do?cNo=C2">식품</a>
											</li>
											<li class="nav-item"><a class="nav-link" href="${path }/store/moveCategory.do?cNo=C3">옷</a>
											</li>
											<li class="nav-item"><a class="nav-link" href="${path }/store/moveCategory.do?cNo=C4">용품</a>
											</li>
											<li class="nav-item"><a class="nav-link" href="${path }/store/moveCategory.do?cNo=C5">목욕/미용</a>
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
											<li class="nav-item"><a class="nav-link active" href="${path }/store/moveCategory.do?cNo=S1">햄스터</a>
											</li>
											<li class="nav-item"><a class="nav-link" href="${path }/store/moveCategory.do?cNo=S2">토끼</a>
											</li>
											<li class="nav-item"><a class="nav-link" href="${path }/store/moveCategory.do?cNo=S3">물고기</a>
											</li>
											<li class="nav-item"><a class="nav-link" href="${path }/store/moveCategory.do?cNo=S4">새</a>
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
									<img class="d-block img-fluid" src="${path }/resources/images/banner.jpg"
										alt="First slide" style=" width: 100%">
								</div>
								<div class="carousel-item">
									<img class="d-block img-fluid" src="${path }/resources/images/banner2.jpg"
										alt="Second slide" style="width: 100%">
								</div>
								<!-- <div class="carousel-item">
									<img class="d-block img-fluid" src="sea)연어.png"
										alt="Third slide" style="height: 350px; width: 100%">
								</div> -->
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
								<a class="text-info" style="font-weight: bold;" href="${path }/store/moveCategory.do?cNo=D1">더보기</a>
							</div>
							<c:if test="${empty dList }">
								<div class="col-12 mb-4 text-center">
									<p>상품이 없습니다.</p>
								</div>
							</c:if>
							<c:if test="${not empty dList }">
							<c:forEach var="p" items="${dList }" begin="0" end="2">
							<div class="col-lg-4 col-md-6 mb-4">
								<a href="${path }/store/moveDetail.do?productNo=${p.productNo}"> <img class="card-img-top"
									src="${path }/resources/upload/product/detail/${p.imgName}" alt="">
									<h4 class="text-black" style="color: black;"><c:out value="${p.productName }"/></h4>
									<div>
										<span style="font-weight: bold; color: #35c5f0;"><c:out value="${p.sale }"/>%</span> 
										<c:set var="per" value="${p.price-(p.price*p.sale/100) }"/>
										<span
											style="font-weight: bold; color: black;"><fmt:formatNumber value="${per+(100-(per%100))%100 }"/>~</span>
									</div>
									<c:if test="${p.star!=0 }">
									<div>
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
  <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
</svg>
										<small class="text-muted" style="font-weight: bold;"><c:out value="${p.star }"/></small>
									</div>
									</c:if>
								</a>
							</div>
							</c:forEach>
							</c:if>
							
							<div class="col-12 category-container mt-5">
								<h5 style="font-weight: bold;">고양이</h5>
								<a class="text-info" style="font-weight: bold;" href="${path }/store/moveCategory.do?cNo=C1">더보기</a>
							</div>
							<c:if test="${empty cList }">
								<div class="col-12 mb-4 text-center">
									<p>상품이 없습니다.</p>
								</div>
							</c:if>
							<c:if test="${not empty cList }">
							<c:forEach var="p" items="${cList }" begin="0" end="2">
							<div class="col-lg-4 col-md-6 mb-4">
								<a href="${path }/store/moveDetail.do?productNo=${p.productNo}"> <img class="card-img-top"
									src="${path }/resources/upload/product/detail/${p.imgName}" alt="">
									<h4 class="text-black" style="color: black;"><c:out value="${p.productName }"/></h4>
									<div>
										<span style="font-weight: bold; color: #35c5f0;"><c:out value="${p.sale }"/>%</span> 
										<c:set var="per" value="${p.price-(p.price*p.sale/100) }"/>
										<span
											style="font-weight: bold; color: black;"><fmt:formatNumber value="${per+(100-(per%100))%100 }"/>~</span>
									</div>
									<c:if test="${p.star!=0 }">
									<div>
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
  <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
</svg>
										<small class="text-muted" style="font-weight: bold;"><c:out value="${p.star }"/></small>
									</div>
									</c:if>
								</a>
							</div>
							</c:forEach>
							</c:if>
							<div class="col-12 category-container mt-5">
								<h5 style="font-weight: bold;">소동물</h5>
								<a class="text-info" style="font-weight: bold;" href="${path }/store/moveCategory.do?cNo=S">더보기</a>
							</div>
							<c:if test="${empty sList }">
								<div class="col-12 mb-4 text-center">
									<p>상품이 없습니다.</p>
								</div>
							</c:if>
							<c:if test="${not empty sList }">
							<c:forEach var="p" items="${sList }" begin="0" end="2">
							<div class="col-lg-4 col-md-6 mb-4">
								<a href="${path }/store/moveDetail.do?productNo=${p.productNo}"> <img class="card-img-top"
									src="${path }/resources/upload/product/detail/${p.imgName}" alt="">
									<h4 class="text-black" style="color: black;"><c:out value="${p.productName }"/></h4>
									<div>
										<span style="font-weight: bold; color: #35c5f0;"><c:out value="${p.sale }"/>%</span> 
										<c:set var="per" value="${p.price-(p.price*p.sale/100) }"/>
										<span
											style="font-weight: bold; color: black;"><fmt:formatNumber value="${per+(100-(per%100))%100 }"/>~</span>
									</div>
									<c:if test="${p.star!=0 }">
									<div>
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
  <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
</svg>
										<small class="text-muted" style="font-weight: bold;"><c:out value="${p.star }"/></small>
									</div>
									</c:if>
								</a>
							</div>
							</c:forEach>
							</c:if>

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