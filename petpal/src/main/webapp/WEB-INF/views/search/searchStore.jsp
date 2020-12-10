<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<jsp:include page="/WEB-INF/views/common/commonLink.jsp" />

</head>
<body class="bg-white">
	<jsp:include page="/WEB-INF/views/common/header.jsp" />

	<main role="main" style="min-height: 100vh;">
		<section class="pt-5 mt-5">
			<div class="container">
				<h4 class="font-weight-bold mb-5">
					검색어에 대한 스토어 검색 결과<span class="text-info">&nbsp; 8개</span>
				</h4>
				<div class="row">
					<div class="col-lg-3 col-md-4 col-sm-6">
						<a href="#"> <img class="card-img-top" src="sea)연어.png" alt="">
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
					<div class="col-lg-3 col-md-4 col-sm-6">
						<a href="#"> <img class="card-img-top" src="sea)연어.png" alt="">
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
					<div class="col-lg-3 col-md-4 col-sm-6">
						<a href="#"> <img class="card-img-top" src="sea)연어.png" alt="">
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
					<div class="col-lg-3 col-md-4 col-sm-6">
						<a href="#"> <img class="card-img-top" src="sea)연어.png" alt="">
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
			</div>
		</section>
	</main>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>
<style>
a:hover {
	text-decoration: none;
}
</style>

</html>