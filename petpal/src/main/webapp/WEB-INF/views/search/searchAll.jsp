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
					<c:out value="'${keyword }'"/>에 대한 통합검색 검색 결과<span class="text-info">&nbsp; <c:out value="${total }"/>개</span>
				</h4>
				<div class="row mb-5">
					<div class="col-12 d-flex justify-content-between mt-5">
						<h5 class="font-weight-bold ">
							스토어<span class="text-info">&nbsp;<c:out value="${storeCount }"/></span>
						</h5>
						<a href="${path }/search/moveSearchStore.do?keyword=${keyword}" class="d-none d-md-block">더보기</a>
					</div>
					<c:set value="${4-fn:length(pList) }" var="temp"/>
					<c:if test="${not empty pList }">
					<c:forEach items="${pList }" var="p" varStatus="status">
					<c:if test="${status.index<4 }">
					<div class="col-lg-3 col-md-4 col-sm-6">
						<a href="${path }/store/moveDetail.do?productNo=${p.productNo}"> <img class="card-img-top"
							src="${path }/resources/upload/product/detail/${p.imgName }" alt="">
							<h4 class="text-black" style="color: black;"><c:out value="${p.productName }"/></h4>
							<div>
								
								<span style="font-weight: bold; color: #35c5f0;"><c:out value="${p.sale }"/>%</span>
								<c:set var="per" value="${p.price-(p.price*p.sale/100) }"/>
								 <span style="font-weight: bold; color: black;"><fmt:formatNumber value="${per+(100-(per%100))%100 }"/>~</span>
							</div>
							<c:if test="${p.star!=0 }">
							<div>
							<span class="review">리뷰평점</span>
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
  <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
</svg>
								<small class="text-muted" style="font-weight: bold;"><c:out value="${p.star }"/></small>
							</div>
							</c:if>
						</a>
					</div>
					</c:if>
					</c:forEach> 
					</c:if>
					<c:if test="${not empty soList&&(4-fn:length(pList))>0 }">
					<c:forEach items="${soList }" var="p" varStatus="status">
					<c:if test="${status.index<temp}">
					<div class="col-lg-3 col-md-4 col-sm-6">
						<a href="${path }/store/moveDetail.do?productNo=${p.productNo}"> <img class="card-img-top"
							src="${path }/resources/upload/product/detail/${p.imgName }" alt="">
							<h4 class="text-black" style="color: black;"><c:out value="${p.productName }"/></h4>
							<div>
								<svg height="1.5em" width="2.5em" class="rounded" style="background-color:#CCCCCC">
									<text x="4" y="18" class="font-weight-bold">품절</text>
								</svg>
							</div>
							<c:if test="${p.star!=0 }">
							<div>
							<span class="review">리뷰평점</span>
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
  <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
</svg>
								<small class="text-muted" style="font-weight: bold;"><c:out value="${p.star }"/></small>
							</div>
							</c:if>
						</a>
					</div>
					</c:if>
					</c:forEach> 
					</c:if>
					
					<div class="col-12 d-md-none my-3 text-center font-weight-bold">
						<a href="" class="bg-dark d-block"
							style="width: 100%; font-size: 18px;"> 스토어 더보기 <svg
								width="1.2em" height="1.2em" viewBox="0 0 16 16"
								class="arrow bi bi-chevron-compact-right" fill="currentColor"
								xmlns="http://www.w3.org/2000/svg">
            <path fill-rule="evenodd"
									d="M6.776 1.553a.5.5 0 0 1 .671.223l3 6a.5.5 0 0 1 0 .448l-3 6a.5.5 0 1 1-.894-.448L9.44 8 6.553 2.224a.5.5 0 0 1 .223-.671z" />
          </svg>
						</a>
					</div>
					<div class="col-12 d-flex justify-content-between mt-5">
						<h5 class="font-weight-bold ">
							일상<span class="text-info">&nbsp;100</span>
						</h5>
						<a href="#" class="d-none d-md-block">더보기</a>
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
					<div class="col-12 d-md-none my-3 text-center font-weight-bold">
						<a href="" class="bg-dark d-block"
							style="width: 100%; font-size: 18px;"> 일상 더보기 <svg
								width="1.2em" height="1.2em" viewBox="0 0 16 16"
								class="arrow bi bi-chevron-compact-right" fill="currentColor"
								xmlns="http://www.w3.org/2000/svg">
            <path fill-rule="evenodd"
									d="M6.776 1.553a.5.5 0 0 1 .671.223l3 6a.5.5 0 0 1 0 .448l-3 6a.5.5 0 1 1-.894-.448L9.44 8 6.553 2.224a.5.5 0 0 1 .223-.671z" />
          </svg>
						</a>
					</div>
					<div class="col-12 d-flex justify-content-between mt-5">
						<h5 class="font-weight-bold ">
							노하우<span class="text-info">&nbsp;100</span>
						</h5>
						<a href="#" class="d-none d-md-block">더보기</a>
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
					<div class="col-12 d-md-none my-3 text-center font-weight-bold">
						<a href="" class="bg-dark d-block"
							style="width: 100%; font-size: 18px;"> 노하우 더보기 <svg
								width="1.2em" height="1.2em" viewBox="0 0 16 16"
								class="arrow bi bi-chevron-compact-right" fill="currentColor"
								xmlns="http://www.w3.org/2000/svg">
            <path fill-rule="evenodd"
									d="M6.776 1.553a.5.5 0 0 1 .671.223l3 6a.5.5 0 0 1 0 .448l-3 6a.5.5 0 1 1-.894-.448L9.44 8 6.553 2.224a.5.5 0 0 1 .223-.671z" />
          </svg>
						</a>
					</div>
					<div class="col-12 d-flex justify-content-between mt-5">
						<h5 class="font-weight-bold ">
							후기<span class="text-info">&nbsp;100</span>
						</h5>
						<a href="#" class="d-none d-md-block">더보기</a>
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
					<div class="col-12 d-md-none my-3 text-center font-weight-bold">
						<a href="" class="bg-dark d-block"
							style="width: 100%; font-size: 18px;">
							<div>
								<span>후기 더보기</span>
								<svg width="1.2em" height="1.2em" viewBox="0 0 16 16"
									class="arrow bi bi-chevron-compact-right" fill="currentColor"
									xmlns="http://www.w3.org/2000/svg">
              <path fill-rule="evenodd"
										d="M6.776 1.553a.5.5 0 0 1 .671.223l3 6a.5.5 0 0 1 0 .448l-3 6a.5.5 0 1 1-.894-.448L9.44 8 6.553 2.224a.5.5 0 0 1 .223-.671z" />
            </svg>
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

.arrow {
	padding-bottom: 5px;
}
.review{
	color:black;
}
</style>

</html>