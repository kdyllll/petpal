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
				<h2 class="my-3">신고관리</h2>
				<form method="post" action="${path }/admin/searchClaim.do" class="row align-items-center">
					<div class="mb-3  col-lg-2">
						<label class="mr-sm-2 sr-only" for="inlineFormCustomSelect">Preference</label>
						<select class="custom-select mr-sm-2" name="searchType" id="searchType">
							<option selected value="EMAIL">신고자이메일</option>
							<option value="CLAIMNO">신고번호</option>
							<option value="POSTNO">신고글번호</option>
						</select>
					</div>
					<div  class="input-group mb-3  col-lg-5">
						<input type="text" class="form-control input-group-sm"
							name="keyword" placeholder="검색어를 입력해주세요">
						<div class="input-group-append">
							<button class="btn btn-outline-secondary" type="submit"
								id="button-addon2">Button</button>
						</div>
					</div>

				</form>

				<div class="table-responsive" style="min-height: 80vh;">
					<table class="table mb-5">
						<thead>
							<tr>
								<th scope="col" class="text-center align-middle">신고번호</th>
								<th scope="col" class="text-center align-middle">신고글번호</th>
								<th scope="col" class="text-center align-middle">신고카테고리</th>
								<th scope="col" class="text-center align-middle">신고사유</th>
								<th scope="col" class="text-center align-middle">신고상태</th>
								<th scope="col" class="text-center align-middle">신고자이메일</th>
								<th scope="col" class="text-center align-middle">신고일</th>
								<th scope="col" class="text-center align-middle"></th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${not empty cList }">
								<c:forEach var="c" items="${cList }">
									<tr>
										<th scope="row" class="align-middle text-center"><c:out
												value="${c.CLAIMNO }" /></th>
										<td class="align-middle text-center"><c:out
												value="${c.POSTNO }" /></td>
										<td class="align-middle text-center"><c:out
												value="${c.CATEGORY }" /></td>
										<td class="align-middle text-center">
										<c:out value="${fn:substring(c.CONTENT,0,8) }" /><c:if test="${fn:length(c.CONTENT) > 8 }">...</c:if></td>
										<td class="align-middle text-center"><c:choose>
												<c:when test="${c.STATUS eq 'N' }">신고대기</c:when>
												<c:otherwise>신고완료</c:otherwise>
											</c:choose></td>
										<td class="align-middle text-center"><c:out
												value="${c.EMAIL }" /></td>
										<td class="align-middle text-center"><fmt:formatDate value="${c.CLAIMDATE }" pattern="yyyy년MM월dd일"/></td>
										<td class="align-middle text-center">
												<form class="claimDetailFrm d-inline">
												<input type="hidden" name="claimNo" value="${c.CLAIMNO }" />
												<button type="button" class="claimDetailBtn btn btn-outline-secondary btn-sm mb-1">신고상세보기</button>
												</form>									
											</td>	
									</tr>
								</c:forEach>
							</c:if>
						</tbody>
					</table>
				</div>
				<nav aria-label="Page navigation example"
					style="margin-bottom: 150px;"
					class=" d-flex justify-content-center">
					<p class="text-center">${pageBar }</p> 
				</nav>
			</section>
		</div>
	</div>
	<div class="claimModal"></div>
	<script>
    $(function(){
      
        $(".claimDetailBtn").on("click", e => {
        	let claimNo = $(e.target).prev().val();
        	$.ajax({
				url: "${path}/admin/claimDetail.do",
				data:{claimNo : claimNo },
				dataType:"html",
				success:(data) => {
					console.log(data);
					$(".claimModal").html(data);
	         		$('div.modal').modal(); 
				}
			});
        })
    })
</script>
</body>
</html>
