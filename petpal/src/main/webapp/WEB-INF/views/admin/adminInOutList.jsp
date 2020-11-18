<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />


<jsp:include page="/WEB-INF/views/common/commonLink.jsp" />


<!-- Custom styles for this template -->
<link href="${path }/resources/css/admin/adminPage.css" rel="stylesheet">

</head>

<body style="overflow: hidden;">
	<jsp:include page="/WEB-INF/views/common/adminHeader.jsp" />

	<div class="container-fluid">
		<div class="row">
			<jsp:include page="/WEB-INF/views/common/adminNav.jsp">
				<jsp:param name="nav" value="adminComplain" />
			</jsp:include>
			<section role="main"
				class="col-md-9 ml-sm-auto col-lg-10 px-md-4 mb-5 "
				style="height: 100vh; overflow-y: auto;">
				<h2 class="my-3">입출고리스트</h2>
				<form class="row align-items-center mb-3">
					<div class="input-group col-lg-5">
						<input type="text" class="form-control input-group-sm"
							placeholder="상품이름을 입력해주세요." aria-label="Recipient's username"
							aria-describedby="button-addon2">
						<div class="input-group-append">
							<button class="btn btn-outline-secondary" type="button"
								id="button-addon2">Button</button>
						</div>
					</div>
					<div class="form-check form-check-inline align-middle">
						<input class="form-check-input" name="InOutRadio" type="radio"
							id="productIn" value="wareHousing"> <label
							class="form-check-label" for="productIn">입고</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" name="InOutRadio" type="radio"
							id="productOut" value="release"> <label
							class="form-check-label" for="productOut">출고</label>
					</div>
				</form>

				<div class="table-responsive" style="min-height: 80vh;">
					<table class="table mb-5">
						<thead>
							<tr>
								<th scope="col" class="text-center align-middle">재고번호</th>
								<th scope="col" class="text-center align-middle">상품이름</th>
								<th scope="col" class="text-center align-middle">색상</th>
								<th scope="col" class="text-center align-middle">사이즈</th>
								<th scope="col" class="text-center align-middle">상태</th>
								<th scope="col" class="text-center align-middle">개수</th>
								<th scope="col" class="text-center align-middle">날짜</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th scope="row" class="align-middle text-center">1</th>
								<td class="align-middle text-center"><a>강아지옷1</a></td>
								<td class="align-middle text-center">One Color</td>
								<td class="align-middle text-center">One Size</td>
								<td class="align-middle text-center">입고</td>
								<td class="align-middle text-center">5</td>
								<td class="align-middle text-center">2020/01/20</td>
							</tr>
							<tr>
								<th scope="row" class="align-middle text-center">1</th>
								<td class="align-middle text-center"><a>강아지옷2</a></td>
								<td class="align-middle text-center">빨강</td>
								<td class="align-middle text-center">s</td>
								<td class="align-middle text-center">출고</td>
								<td class="align-middle text-center">3</td>
								<td class="align-middle text-center">2020/01/20</td>
							</tr>
							<tr>
								<th scope="row" class="align-middle text-center">1</th>
								<td class="align-middle text-center"><a>강아지옷2</a></td>
								<td class="align-middle text-center">파랑</td>
								<td class="align-middle text-center">M</td>
								<td class="align-middle text-center">입고</td>
								<td class="align-middle text-center">500</td>
								<td class="align-middle text-center">2020/01/20</td>
							</tr>

						</tbody>
					</table>
				</div>
				<nav aria-label="Page navigation example"
					style="margin-bottom: 120px;"
					class=" d-flex justify-content-center">
					<ul class="pagination">
						<li class="page-item"><a class="page-link text-dark" href="#"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a></li>
						<li class="page-item"><a class="page-link text-dark" href="#">1</a></li>
						<li class="page-item"><a class="page-link text-dark" href="#">2</a></li>
						<li class="page-item"><a class="page-link text-dark" href="#">3</a></li>
						<li class="page-item"><a class="page-link text-dark" href="#"
							aria-label="Next"> <span aria-hidden="true">&raquo;</span>
						</a></li>
					</ul>
				</nav>
			</section>
		</div>
	</div>
</body>
</html>

