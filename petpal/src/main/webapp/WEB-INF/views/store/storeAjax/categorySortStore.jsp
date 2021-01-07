<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />

<c:set var="product" value="${list[0] }" />
<input type="hidden" value="${product.categoryNo }" id="cNo">
<c:if test="${empty list && empty soList }">
	<div class="col-12 mb-4 text-center">
		<p>상품이 없습니다.</p>
	</div>
</c:if>
<c:if test="${not empty list }">
	<c:forEach var="p" items="${list }">
		<div class="col-lg-4 col-md-6 mb-4">
			<a href="${path }/store/moveDetail.do?productNo=${p.productNo}">
				<img class="card-img-top"
				src="${path }/resources/upload/product/detail/${p.imgName}" alt="">
				<h4 class="text-black" style="color: black;">
					<c:out value="${p.productName }" />
				</h4>
				<div>
					<span style="font-weight: bold; color: #35c5f0;"><c:out
							value="${p.sale }" />%</span>
					<c:set var="per" value="${p.price-(p.price*p.sale/100) }" />
					<span style="font-weight: bold; color: black;"><fmt:formatNumber
							value="${per+(100-(per%100))%100 }" />~</span>
				</div> <c:if test="${p.star!=0 }">
					<div>
						<span class="review">리뷰평점</span>
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
							fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
  <path
								d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z" />
</svg>
						<small class="text-muted" style="font-weight: bold;"><c:out
								value="${p.star }" /></small>
					</div>
				</c:if>
			</a>
		</div>
	</c:forEach>
</c:if>
<!-- 품절리스트 -->
<c:if test="${not empty soList }">
	<c:forEach var="p" items="${soList }">
		<div class="col-lg-4 col-md-6 mb-4">
			<a href="${path }/store/moveDetail.do?productNo=${p.productNo}">
				<img class="card-img-top"
				src="${path }/resources/upload/product/detail/${p.imgName}" alt="">
				<h4 class="text-black" style="color: black;">
					<c:out value="${p.productName }" />
				</h4>
				<div>
					<svg height="1.5em" width="2.5em" class="rounded"
						style="background-color: #CCCCCC">
												  <text x="4" y="18" class="font-weight-bold">품절</text>
												</svg>
				</div> <c:if test="${p.star!=0 }">
					<div>
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
							fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
  <path
								d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z" />
</svg>
						<small class="text-muted" style="font-weight: bold;"><c:out
								value="${p.star }" /></small>
					</div>
				</c:if>
			</a>
		</div>
	</c:forEach>
</c:if>