<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<jsp:include page="/WEB-INF/views/common/commonLink.jsp" />

<style>
.homeContainer {
	padding: 0 130px;
}

@media screen and (min-width:1025px) and (max-width:1024px) {
	.homeContainer {
		padding: 0 50px;
	}
}

@media screen and (min-width:769px) and (max-width:1024px) {
	.homeContainer {
		padding: 0 50px;
	}
}

@media screen and (min-width:480px) and (max-width:768px) {
	.homeContainer {
		padding: 0 30px;
	}
}
</style>
</head>
<body class="bg-white">
	<jsp:include page="/WEB-INF/views/common/header.jsp" />


	<main role="main" style="min-height: 100vh;">
		<div id="carouselExampleIndicators"
			class="carousel slide carousel-fade my-5" data-ride="carousel">
			<ol class="carousel-indicators ">
				<li data-target="#carouselExampleIndicators" data-slide-to="0"
					class="active"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
			</ol>
			<div class="carousel-inner" role="listbox">
				<div class="carousel-item active ">
					<img class="d-block img-fluid"
						src="${path }/resources/images/banner.jpg" alt="First slide"
						style="width: 100%; height: 600px;">
				</div>
				<div class="carousel-item">
					<img class="d-block img-fluid"
						src="${path }/resources/images/banner2.jpg" alt="Second slide"
						style="width: 100%; height: 600px;">
				</div>
			</div>
			<a class="carousel-control-prev" href="#carouselExampleIndicators"
				role="button" data-slide="prev"> <span
				class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
				role="button" data-slide="next"> <span
				class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="sr-only">Next</span>
			</a>
		</div>
		<div class="homeContainer mt-3">
			<p class="text-center">PETPAL 고객님을 위한 혜택</p>
			<div id="carouselExampleDark"
				class="carousel carousel-dark slide my-5" data-ride="carousel">

				<div class="carousel-inner border border-1" role="listbox">
					<div class="carousel-item active bg-light">
						<p style="width: 100%; height: 40px;">여기다가 뭘 넣을까아
						<p>
					</div>
					<div class="carousel-item bg-light">
						<p style="width: 100%; height: 40px;">여기다 뭘 넣지
						<p>
					</div>
				</div>
			</div>
			<!-- 올리에서 베스트 아이템 -->
			<p class="text-center">PETPAL BEST 아이템</p>
			<div
				class="row row-cols-1 row-cols-md-2 row-cols-lg-2 row-cols-xl-4 g-4">

				<div class="col mb-4">
					<div class="card h-100 border-0 " style="overflow: hidden;">
						<span><strong>BEST</strong></span>
						<div class="position-relative" style="background-color: #f4eeed;">
							<a href="#" style="width: 100%;"> <img
								src="${path }/resources/images/test2.jpg" alt="..."
								class="card-img-top">
							</a>
							<div class="position-absolute" style="bottom: 0; left: 5px;">
								<p>제목</p>
							</div>
						</div>
						<div class="card-body">
							<p class="card-title">가격(할인률, 원래가격 등)</p>
							<p class="card-text">설명</p>
							<span class="">해쉬태그</span>
						</div>
					</div>
				</div>
				<div class="col mb-4">
					<div class="card h-100 border-0 " style="overflow: hidden;">
						<span><strong>BEST</strong></span>
						<div class="position-relative" style="background-color: #f4eeed;">
							<a href="#" style="width: 100%;"> <img
								src="${path }/resources/images/test2.jpg" alt="..."
								class="card-img-top">
							</a>
							<div class="position-absolute" style="bottom: 0; left: 5px;">
								<p>제목</p>
							</div>
						</div>
						<div class="card-body">
							<p class="card-title">가격(할인률, 원래가격 등)</p>
							<p class="card-text">설명</p>
							<span class="">해쉬태그</span>
						</div>
					</div>
				</div>
				<div class="col mb-4">
					<div class="card h-100 border-0 " style="overflow: hidden;">
						<span><strong>BEST</strong></span>
						<div class="position-relative" style="background-color: #f4eeed;">
							<a href="#" style="width: 100%;"> <img
								src="${path }/resources/images/test2.jpg" alt="..."
								class="card-img-top">
							</a>
							<div class="position-absolute" style="bottom: 0; left: 5px;">
								<p>제목</p>
							</div>
						</div>
						<div class="card-body">
							<p class="card-title">가격(할인률, 원래가격 등)</p>
							<p class="card-text">설명</p>
							<span class="">해쉬태그</span>
						</div>
					</div>
				</div>
				<div class="col mb-4">
					<div class="card h-100 border-0 " style="overflow: hidden;">
						<span><strong>BEST</strong></span>
						<div class="position-relative" style="background-color: #f4eeed;">
							<a href="#" style="width: 100%;"> <img
								src="${path }/resources/images/test2.jpg" alt="..."
								class="card-img-top">
							</a>
							<div class="position-absolute" style="bottom: 0; left: 5px;">
								<p>제목</p>
							</div>
						</div>
						<div class="card-body">
							<p class="card-title">가격(할인률, 원래가격 등)</p>
							<p class="card-text">설명</p>
							<span class="">해쉬태그</span>
						</div>
					</div>
				</div>

			</div>
			<!-- 올리에서 best리뷰상품 / 우리는 커뮤니티로 바꿀예정 -->
			<div class="bg-light py-5 px-3 my-5" style="width: 100%;">
				<p class="text-center" style="font-size: 25px;">
					<strong>베스트 리뷰상품</strong>
				</p>
				<div
					class="row row-cols-1 row-cols-md-2 row-cols-lg-2 row-cols-xl-4 g-4">
					<div class="col mb-4">
						<div class="card h-100 border-0 " style="overflow: hidden;">
							<a href="#"> <img src="${path }/resources/images/test2.jpg"
								alt="..." class="card-img-top">
							</a>
							<div class="card-body">
								<p class="card-text " style="font-size: 12px;">안그래도 귀여운 울애기
									옷 입혀놓으니 더 귀여워졌어요 장모종은 엄청난 추위 아닌 이상 옷이 딱히 필요 없다고 했는데 아직 아기기도...</p>
								<span style="font-size: 12px;">day***</span><span
									style="font-size: 12px;">2020/02/02</span>
								<div style="height: 1px; width: 100%;" class="bg-light my-3"></div>
								<div class="d-flex justify-content-between">
									<p style="font-size: 12px;" class="">...보러가기</p>
									<p style="font-size: 12px;">></p>
								</div>
							</div>
						</div>
					</div>
					<div class="col mb-4">
						<div class="card h-100 border-0 " style="overflow: hidden;">
							<a href="#"> <img src="${path }/resources/images/test2.jpg"
								alt="..." class="card-img-top">
							</a>
							<div class="card-body">
								<p class="card-text " style="font-size: 12px;">안그래도 귀여운 울애기
									옷 입혀놓으니 더 귀여워졌어요 장모종은 엄청난 추위 아닌 이상 옷이 딱히 필요 없다고 했는데 아직 아기기도...</p>
								<span style="font-size: 12px;">day***</span><span
									style="font-size: 12px;">2020/02/02</span>
								<div style="height: 1px; width: 100%;" class="bg-light my-3"></div>
								<div class="d-flex justify-content-between">
									<p style="font-size: 12px;" class="">...보러가기</p>
									<p style="font-size: 12px;">></p>
								</div>
							</div>
						</div>
					</div>
					<div class="col mb-4">
						<div class="card h-100 border-0 " style="overflow: hidden;">
							<a href="#"> <img src="${path }/resources/images/test2.jpg"
								alt="..." class="card-img-top">
							</a>
							<div class="card-body">
								<p class="card-text " style="font-size: 12px;">안그래도 귀여운 울애기
									옷 입혀놓으니 더 귀여워졌어요 장모종은 엄청난 추위 아닌 이상 옷이 딱히 필요 없다고 했는데 아직 아기기도...</p>
								<span style="font-size: 12px;">day***</span><span
									style="font-size: 12px;">2020/02/02</span>
								<div style="height: 1px; width: 100%;" class="bg-light my-3"></div>
								<div class="d-flex justify-content-between">
									<p style="font-size: 12px;" class="">...보러가기</p>
									<p style="font-size: 12px;">></p>
								</div>
							</div>
						</div>
					</div>
					<div class="col mb-4">
						<div class="card h-100 border-0 " style="overflow: hidden;">
							<a href="#"><img src="${path }/resources/images/test2.jpg"
								alt="..." class="card-img-top"> </a>
							<div class="card-body">
								<p class="card-text " style="font-size: 12px;">안그래도 귀여운 울애기
									옷 입혀놓으니 더 귀여워졌어요 장모종은 엄청난 추위 아닌 이상 옷이 딱히 필요 없다고 했는데 아직 아기기도...</p>
								<span style="font-size: 12px;">day***</span><span
									style="font-size: 12px;">2020/02/02</span>
								<div style="height: 1px; width: 100%;" class="bg-light my-3"></div>
								<div class="d-flex justify-content-between">
									<p style="font-size: 12px;" class="">...보러가기</p>
									<p style="font-size: 12px;">></p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>

</html>