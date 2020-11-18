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
			<jsp:include page="/WEB-INF/views/common/adminNav.jsp" >
			<jsp:param name="nav" value="adminCommunity" />
			</jsp:include>
			<section role="main"
				class="col-md-9 ml-sm-auto col-lg-10 px-md-4 mb-5 "
				style="height: 100vh; overflow-y: auto;">
				<h2 class="my-3">게시글관리</h2>
				<div class="row align-items-center">
					<div class="mb-3  col-lg-2">
						<label class="mr-sm-2 sr-only" for="inlineFormCustomSelect">Preference</label>
						<select class="custom-select mr-sm-2" id="searchType">
							<option selected value="userEmail">작성자이메일</option>
							<option value="userCommunityNum">게시글번호</option>
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
					<form id="search-userCommunityNum"
						class="input-group mb-3  col-lg-5 d-none">

						<input type="hidden" name="searchType" value="userCommunityNum">
						<input type="text" class="form-control input-group-sm"
							name="searchKeyword" placeholder="게시글번호를 입력해주세요">
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
								<th scope="col" class="text-center align-middle">글번호</th>
								<th scope="col" class="text-center align-middle">글제목</th>
								<th scope="col" class="text-center align-middle">작성자</th>
								<th scope="col" class="text-center align-middle">상세보기</th>
								<th scope="col" class="text-center align-middle">요청일</th>
								<th scope="col" class="text-center align-middle"></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th scope="row" class="align-middle text-center">1</th>
								<td class="text-center align-middle">재지줒지</td>
								<td class="align-middle text-center">datye10-</td>
								<td class="align-middle text-center"><a href="#">상세보기</a></td>
								<td class="align-middle text-center">2020/10/21</td>
								<td class="align-middle text-center">
										<button type="button" class="btn btn-outline-secondary btn-sm">수락</button>
										<button type="button" class="btn  btn-outline-danger btn-sm">거절</button>
									</td>
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
			<div class="modal fade" id="staticBackdrop" tabindex="-1"   aria-labelledby="exampleModalLabel" data-backdrop="static" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="exampleModalLabel">재고등록</h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
                <form>
                    <div class="form-group">
                      <label for="recipient-name" class="col-form-label d-block">- S / 빨강</label>
                      <input type="number" min="0" value="0" class="form-control col-md-4 d-inline align-middle" id="recipient-name">
                      <button type="button" class=" d-inline btn btn-outline-secondary align-middle">수정</button>
                      <button type="button" class=" d-inline btn btn-outline-danger align-middle">삭제</button>
                    </div>
                </form>
                <form>
                    <div class="form-group">
                      <label for="recipient-name" class="col-form-label d-block">- M / 빨강</label>
                      <input type="number" min="0" value="0" class="form-control col-md-4 d-inline align-middle" id="recipient-name">
                      <button type="button" class=" d-inline btn btn-outline-secondary align-middle">수정</button>
                      <button type="button" class=" d-inline btn btn-outline-danger align-middle">삭제</button>
                    </div>
                </form>
                <form>
                    <div class="form-group">
                      <label for="recipient-name" class="col-form-label d-block">- S / 파랑</label>
                      <input type="number" min="0" value="0" class="form-control col-md-4 d-inline align-middle" id="recipient-name">
                      <button type="button" class=" d-inline btn btn-outline-secondary align-middle">수정</button>
                      <button type="button" class=" d-inline btn btn-outline-danger align-middle">삭제</button>
                    </div>
                </form>
            </div>
            <div class="modal-footer ">
              <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            </div>
          </div>
        </div>
    </div>
    </div>
  </div>
<script>
    $(function(){
        let userEmail = $("#search-userEmail");
        let userCommunityNum = $("#search-userCommunityNum");
        $("#searchType").on("change", e => {
            userEmail.addClass("d-none");
            userCommunityNum.addClass("d-none");

            let target = $(e.target).val();
            $("#search-"+target).removeClass("d-none");
        });
        $("#searchType").change();
    })
</script>

</body>
</html>