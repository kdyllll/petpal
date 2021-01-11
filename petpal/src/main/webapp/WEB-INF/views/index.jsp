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
		<article id="carouselExampleIndicators"
			class="carousel slide carousel-fade my-5" data-ride="carousel">
			<ol class="carousel-indicators ">
				<li data-target="#carouselExampleIndicators" data-slide-to="0"class="active"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
			</ol>
			<div class="carousel-inner" role="listbox">
				<div class="carousel-item active ">
					<img class="d-block img-fluid"
						src="${path }/resources/images/newyear.png" alt="First slide"
						style="width: 100%; height: 400px;">
				</div>
				<div class="carousel-item">
					<img class="d-block img-fluid"
						src="${path }/resources/images/january.png" alt="Second slide"
						style="width: 100%; height: 400px;">
				</div>
				<div class="carousel-item">
					<img class="d-block img-fluid"
						src="${path }/resources/images/cold.png" alt="Third slide"
						style="width: 100%; height: 400px;">
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
		</article>
		<article class="homeContainer mt-3">
			
			<!-- 올리에서 베스트 아이템 -->
			<p class="text-center mb-5" style="font-size: 25px;">
				<strong>PETPAL BEST 아이템</strong>
			</p>
			<aside
				class="row row-cols-1 row-cols-md-2 row-cols-lg-2 row-cols-xl-4 g-4">
				<c:forEach var="p" items="${productList}">
					<div class="col mb-4">
						<div class="card h-100 border-0 " style="overflow: hidden;">
							<span><strong>BEST</strong></span>
							<div class="position-relative rounded" style="background-color: #f4eeed;">
								<a href="${path }/store/moveDetail.do?productNo=${p.PRODUCTNO}" style="width: 100%;" class="rounded text-hgh"> 
								<img
									src="${path }/resources/upload/product/detail/${p.IMGNAME}" alt="..."
									class="card-img-top rounded">
								</a>
							</div>
							<div class="card-body pt-2">
								<p class="text-secondary m-0 mb-1"><strong><c:out value="${p.PRODUCTNAME }"/></strong></p>
								<p class="card-title text-hgh m-0"><fmt:formatNumber value="${p.PRICE * (100 - p.SALE) / 100  }" pattern="###,###,###"/>원</p>
							</div>
						</div>
					</div>
				</c:forEach>
			</aside>
			<!-- 올리에서 best리뷰상품 / 우리는 커뮤니티로 바꿀예정 -->
			<aside class="bg-point py-5 px-3 my-5" style="width: 100%;">
				<p class="text-center mb-5" style="font-size: 25px;">
					<strong>베스트 리뷰상품</strong>
				</p>
				<div class="row row-cols-1 row-cols-md-2 row-cols-lg-2 row-cols-xl-4 g-4">
					
					<c:forEach var="r" items="${reviewList }" begin="0" end="3">
					<div class="col mb-4">
						<div class="card h-100 border-0 " style="overflow: hidden;">
							<a href="${path }/store/moveDetail.do?productNo=${r.PRODUCTNO}" class="rounded"> 
							<img src="${path }/resources/upload/store/review/${r.FILENAME}"
								alt="..." class="card-img-top">
							</a>
							<div class="card-body">
								<p class="card-text " style="font-size: 13px;">
									<c:out value="${fn:substring(r.CONTENT, 0, 41) }"/>${fn:length(r.CONTENT) gt 42?'...':''}
								</p>
								<span style="font-size: 12px;"><c:out value="${r.NICKNAME }"/></span><span
									style="font-size: 12px;"><c:out value="${r.REVIEWDATE }"/></span>
								<div style="height: 1px; width: 100%;" class="bg-light my-3"></div>
								<a href="${path }/store/moveDetail.do?productNo=${r.PRODUCTNO}" class="d-flex justify-content-between text-hgh">
									<p style="font-size: 13px;" class=""><c:out value="${r.PRODUCTNAME }"/></p>

								</a>
							</div>
						</div>
					</div>
					</c:forEach>
				</div>
					<div class="col-12 mt-5 px-3">
						<div class="row border px-3 pt-4 bg-white">
						
							<c:forEach var="r" items="${reviewList }" begin="4" end="5">
							<div class="col-12">
								<div class="col-12 row align-items-center">
									<div class="col-4 col-md-2 d-flex justify-content-start rounded">
										<img src="${path }/resources/upload/store/review/${r.FILENAME}"
											style="width: 100px; border-radius: 20%;">
									</div>
									<div class="col-8 col-md-8 ">
										<p class="mb-0" style="font-size: 15px;">
											<c:out value="${fn:substring(r.CONTENT, 0, 41) }"/>${fn:length(r.CONTENT) gt 42?'...':''}
										</p>
										<a href="${path }/store/moveDetail.do?productNo=${r.PRODUCTNO}" class="text-hgh"><span class="pt-3" style="font-size: 14px;">
										<c:out value="${r.PRODUCTNAME }"/>
										</span> <span>></span></a>
									</div>
									<div class="col-md-2 d-flex justify-content-end"
										style="font-size: 14px;"><c:out value="${r.REVIEWDATE }"/></div>
								</div>
							</div>
							<!-- 나누는 선 -->
							<div class="w-100 my-4" style="height: 1px; width: 100%; background: #dfe6e9;"></div>
							</c:forEach>

	
	
							
						</div>
					</div>


			</aside>
			<aside class="my-5">
				<p class="text-center mb-5" style="font-size: 25px;">
					<strong>펫팔 스토리</strong>
				</p>
				<div class="row border-top border-bottom px-3 py-5 bg-white">
				
					<c:forEach var="d" items="${dailyList}">
					<div class="col-12">
						<div class="row align-items-center">
							<a href="${path }/daily/moveDetail.do?dailyNo=${d.DAILYNO }" class="offset-1 col-3  d-flex justify-content-start rounded">
								<img src="${path }/resources/upload/community/daily/${d.DAILYIMGNAME}"
									style="width: 100%; " class="rounded">
							</a>
							<div class="ml-2 col-7">
								<p class="mb-0" style="font-size: 16px;">
									<c:out value="${fn:substring(d.CONTENT, 0, 41) }"/>${fn:length(d.CONTENT) gt 42?'...':''}
								</p>
								<span class="pt-3 text-muted mr-3" style="font-size: 15px;"><c:out value="${d.DAILYDATE }"/></span> 
								<span class="pt-3 text-muted" style="font-size: 15px;"><c:out value="${d.NICKNAME }"/></span>
								<div class="row mt-3">
									<%-- <div class="col-4 ">
										<img src="${path }/resources/images/test/aa.jpg"
									style="width: 50px; border-radius:50%;">
										<span class="mr-2" style="font-size: 14px;">강아지패딩</span>
										<span class="text-danger" style="font-size: 13px;">9,700원</span>
									</div>
									<div class="col-4 ">
										<img src="${path }/resources/images/test/aa.jpg"
									style="width: 50px; border-radius:50%;">
										<span class="mr-2" style="font-size: 14px;">강아지패딩</span>
										<span class="text-danger" style="font-size: 13px;">9,700원</span>
									</div> --%>
								</div>
							</div>
							
						</div>
					</div>
					<!-- 나누는선 -->
					<div class="w-100 my-5" style="height: 1px; width: 100%; background: #dfe6e9;"></div>
					</c:forEach>

					

					
				</div>
			</aside>
		</article>
	</main>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>

</html>