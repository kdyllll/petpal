<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />


<jsp:include page="/WEB-INF/views/common/commonLink.jsp" />


<jsp:include page="/WEB-INF/views/common/myPageNav.jsp" >
	<jsp:param name="mpNav" value="fav"/>
</jsp:include>

<div class="row py-3 justify-content-between">
	<div class="col-xl-3 col-md-4 col-sm-6">
		<a href="#" class="product-all">
			<div class="card shadow-sm">
				<img src="sea)연어.png" class="product">
			</div>
			<p class=" text-center name">상품이름</p>
		</a>
	</div>
	<div class="col-xl-3 col-md-4 col-sm-6">
		<a href="#" class="product-all">
			<div class="card shadow-sm">
				<img src="sea)연어.png" class="product">
			</div>
			<p class=" text-center name">상품이름</p>
		</a>
	</div>
	<div class="col-xl-3 col-md-4 col-sm-6">
		<a href="#" class="product-all">
			<div class="card shadow-sm">
				<img src="sea)연어.png" class="product">
			</div>
			<p class=" text-center name">상품이름</p>
		</a>
	</div>
	<div class="col-xl-3 col-md-4 col-sm-6">
		<a href="#" class="product-all">
			<div class="card shadow-sm">
				<img src="sea)연어.png" class="product">
			</div>
			<p class=" text-center name">상품이름</p>
		</a>
	</div>
	<div class="col-xl-3 col-md-4 col-sm-6">
		<a href="#" class="product-all">
			<div class="card shadow-sm">
				<img src="sea)연어.png" class="product">
			</div>
			<p class=" text-center name">상품이름</p>
		</a>
	</div>
	<div class="col-xl-3 col-md-4 col-sm-6">
		<a href="#" class="product-all">
			<div class="card shadow-sm">
				<img src="sea)연어.png" class="product">
			</div>
			<p class=" text-center name">상품이름</p>
		</a>
	</div>
	<div class="col-xl-3 col-md-4 col-sm-6">
		<a href="#" class="product-all">
			<div class="card shadow-sm">
				<img src="sea)연어.png" class="product">
			</div>
			<p class=" text-center name">상품이름</p>
		</a>
	</div>
	<div class="col-xl-3 col-md-4 col-sm-6">
		<a href="#" class="product-all">
			<div class="card shadow-sm">
				<img src="sea)연어.png" class="product">
			</div>
			<p class=" text-center name">상품이름</p>
		</a>
	</div>
</div>


<style>
.name {
	font-weight: bold;
}

.product-all {
	color: black;
}

.product-all:hover {
	text-decoration: none;
}

.product {
	width: 100%;
	height: 225px;
}
</style>

</main>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>

</html>