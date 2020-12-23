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
								>Button</button>
						</div>
					</form>
					<form id="search-userCommunityNum"
						class="input-group mb-3  col-lg-5 d-none">

						<input type="hidden" name="searchType" value="userCommunityNum">
						<input type="text" class="form-control input-group-sm"
							name="searchKeyword" placeholder="게시글번호를 입력해주세요">
						<div class="input-group-append">
							<button class="btn btn-outline-secondary" type="button"
								>Button</button>
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
							<c:if test="${not empty pList }">
								<c:forEach var="c" items="${pList }">
									<tr>
										<th scope="row" class=" align-middle text-center"><c:out value="${c.PLACENO }"/></th>
										<td class="text-center align-middle"><c:out value="${c.TITLE }"/></td>
										<td class="align-middle text-center"><c:out value="${c.EMAIL }"/></td>
										<td class="align-middle text-center">
											<input type="hidden"  name="placeNo" value="${c.PLACENO }">
											<a style="cursor:pointer; color:red;" class="placeDetail" >상세보기</a>
										</td>
										<td class="align-middle text-center"><fmt:formatDate value="${c.PLACEDATE }" pattern="yyyy년MM월dd일" /></td>
										<td class="align-middle text-center"><form class="d-inline placeFrm"  method="post">
											<c:choose>
											<c:when test="${c.STATUS eq 'N' }">
											<button type="button"
												class="btn btn-outline-secondary btn-sm  placeAcceptBtn">수락</button>
												<input type="hidden" name="placeNo" value="${c.PLACENO }">
											<button type="button" class="btn  btn-outline-danger btn-sm  placeDenyBtn">거절</button>
											</form>
											</c:when >
											<c:when test="${c.STATUS eq 'Y' }">
												승인완료
											</c:when>
											<c:otherwise>
												승인거절
											</c:otherwise>
											</c:choose>
										</td>
									</tr>
								</c:forEach>
							</c:if>
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
	<div class="placeModal"></div>
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
        
        $(".placeDetail").on("click", e => {
        	let placeNo = $(e.target).prev().val();
        	$.ajax({
        		url : "${path}/admin/adminPlaceDetail.do",
        		data : {placeNo : placeNo},
        		dataType: "html",
        		success : (data) => {
        			console.log(data);
        			$(".placeModal").html(data);
        			$("div.modal").modal();
        		}
        	})
        })
        
        $(".placeDenyBtn").on("click", e => {
        	let placeNo = $(e.target).next().val();
        	$(".placeFrm").attr("action", "${path}/admin/placeDeny.do?placeNum="+placeNo).submit();
        })
        $(".placeAcceptBtn").on("click", e => {
        	let placeNo = $(e.target).prev().val();
        	$(".placeFrm").attr("action", "${path}/admin/placeAccept.do?placeNum="+placeNo).submit();
        })
        
        
    })

</script>

</body>
</html>