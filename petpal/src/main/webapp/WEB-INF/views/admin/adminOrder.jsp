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
			<jsp:include page="/WEB-INF/views/common/adminNav.jsp" />
			<section role="main"
				class="col-md-9 ml-sm-auto col-lg-10 px-md-4 mb-5 "
				style="height: 100vh; overflow-y: auto;">
				<h2 class="my-3">주문내역</h2>
				<div class="row align-items-center">
					<div class="mb-3  col-lg-2">
						<label class="mr-sm-2 sr-only" for="inlineFormCustomSelect">Preference</label>
						<select class="custom-select mr-sm-2" id="searchType">
							<option selected value="userEmail">이메일</option>
							<option value="userName">이름</option>
							<option value="userPhone">전화번호</option>
							<option value="userOrderNum">주문번호</option>
						</select>
					</div>
					<form id="search-userEmail" class="input-group mb-3  col-lg-5">
						<input type="hidden" name="searchType" value="userEmail">
						<input type="text" class="form-control input-group-sm"
							name="searchKeyword" placeholder="이메일을 입력해주세요">
						<div class="input-group-append">
							<button class="btn btn-outline-secondary" type="button"
								id="button-addon2">Button</button>
						</div>
					</form>
					<form id="search-userName"
						class="input-group mb-3  col-lg-5 d-none">

						<input type="hidden" name="searchType" value="userName"> <input
							type="text" class="form-control input-group-sm"
							name="searchKeyword" placeholder="이름을 입력해주세요">
						<div class="input-group-append">
							<button class="btn btn-outline-secondary" type="button"
								id="button-addon2">Button</button>
						</div>

					</form>
					<form id="search-userPhone"
						class="input-group mb-3  col-lg-5 d-none">

						<input type="hidden" name="searchType" value="userPhone">
						<input type="text" class="form-control input-group-sm"
							name="searchKeyword" placeholder="전화번호를 입력해주세요">
						<div class="input-group-append">
							<button class="btn btn-outline-secondary" type="button"
								id="button-addon2">Button</button>
						</div>

					</form>
					<form id="search-userOrderNum"
						class="input-group mb-3  col-lg-5 d-none">

						<input type="hidden" name="searchType" value="userOrderNum">
						<input type="text" class="form-control input-group-sm"
							name="searchKeyword" placeholder="주문번호를 입력해주세요">
						<div class="input-group-append">
							<button class="btn btn-outline-secondary" type="button"
								id="button-addon2">Button</button>
						</div>

					</form>
				</div>

				<div class="table-responsive" style="min-height: 80vh;">
					<table class="table mb-5">
						<thead>
							<tr>
								<th scope="col" class="text-center align-middle">주문번호</th>
								<th scope="col" class="text-center align-middle">상품사진</th>
								<th scope="col" class="text-center align-middle">상품이름</th>
								<th scope="col" class="text-center align-middle">카테고리</th>
								<th scope="col" class="text-center align-middle">주문날짜</th>
								<th scope="col" class="text-center align-middle">주문자이메일</th>
								<th scope="col" class="text-center align-middle">주문자번호</th>
								<th scope="col" class="text-center align-middle"></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th scope="row" class="align-middle text-center">1</th>
								<td class="text-center"><img
									style="width: 100px; height: 100px;"></td>
								<td class="align-middle text-center">Otto</td>
								<td class="align-middle text-center">@mdo</td>
								<td class="align-middle text-center">Otto</td>
								<td class="align-middle text-center">Otto109@naver.com</td>
								<td class="align-middle text-center">sdfs155sdgswet21</td>
								<td class="align-middle text-center "><form
										class="d-flex flex-column">
										<button type="button"
											class="btn btn-outline-secondary btn-sm mb-1">주문상세보기</button>
										<button type="button" class="btn  btn-outline-danger btn-sm">주문취소</button>
									</form></td>
							</tr>

							<tr>
								<th scope="row" class="align-middle text-center">1</th>
								<td class="text-center"><img
									style="width: 100px; height: 100px;"></td>
								<td class="align-middle text-center">Otto</td>
								<td class="align-middle text-center">@mdo</td>
								<td class="align-middle text-center">Otto</td>
								<td class="align-middle text-center">Ottao109@naver.com</td>
								<td class="align-middle text-center">sd5sdgswet21</td>
								<td class="align-middle text-center"><form
										class="d-flex flex-column">
										<button type="button"
											class="btn btn-outline-secondary btn-sm mb-1">주문상세보기</button>
										<button type="button" class="btn  btn-outline-danger btn-sm">주문취소</button>
									</form></td>
							</tr>

							<tr>
								<th scope="row" class="align-middle text-center">1</th>
								<td class="text-center"><img
									style="width: 100px; height: 100px;"></td>
								<td class="align-middle text-center">Otto</td>
								<td class="align-middle text-center">@mdo</td>
								<td class="align-middle text-center">Otto</td>
								<td class="align-middle text-center">Ottdfsdfsdfsdo109@naver.com</td>
								<td class="align-middle text-center">sdfs155sdgswds124et21</td>
								<td class="align-middle text-center"><form
										class="d-flex flex-column">
										<button type="button"
											class="btn btn-outline-secondary btn-sm mb-1">주문상세보기</button>
										<button type="button" class="btn  btn-outline-danger btn-sm">주문취소</button>
									</form></td>
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
	<script>
    $(function(){
        let userEmail = $("#search-userEmail");
        let userName = $("#search-userName");
        let userPhone = $("#search-userPhone");
        let userOrderNum = $("#search-userOrderNum");
        $("#searchType").on("change", e => {
            userEmail.addClass("d-none");
            userName.addClass("d-none");
            userPhone.addClass("d-none");
            userOrderNum.addClass("d-none");

            let target = $(e.target).val();
            $("#search-"+target).removeClass("d-none");
        });
        $("#searchType").change();
    })
</script>
</body>
</html>
