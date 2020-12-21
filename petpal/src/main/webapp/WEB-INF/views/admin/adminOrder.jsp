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
			<jsp:param name="nav" value="adminOrder" />
			</jsp:include>
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
								<th scope="col" class="text-center align-middle">회원상태</th>
								<th scope="col" class="text-center align-middle">회원이름</th>
								<th scope="col" class="text-center align-middle">받는분이름</th>
								<th scope="col" class="text-center align-middle">전화번호</th>
								<th scope="col" class="text-center align-middle">주문날짜</th>
								<th scope="col" class="text-center align-middle">주문자이메일</th>
								<th scope="col" class="text-center align-middle">주문번호</th>
								<th scope="col" class="text-center align-middle">결제상태</th>
								<th scope="col" class="text-center align-middle"></th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${empty oList }">주문정보가 없습니다.</c:if>
							<c:if test="${not empty oList }">
							<c:forEach var="o" items="${oList }">
							
							<tr>
								<th scope="row" class="align-middle text-center"><c:out value="${o.PAYMENTNO }"/></th>
								<th scope="row" class="align-middle text-center"><c:choose>
									<c:when test="${not empty o.MEMBERNO }">
										회원
									</c:when>
									<c:otherwise>
										비회원
									</c:otherwise>
								</c:choose></th>
								<td class="align-middle text-center"><c:out value="${o.NAME }"/></td>
								<td class="align-middle text-center"><c:out value="${o.RECEIVERNAME }"/></td>
								<td class="align-middle text-center"><c:out value="${o.TEL }"/></td>
								<td class="align-middle text-center"><fmt:formatDate value="${o.PAYDATE }" pattern="yyyy년MM월dd일" /></td>
								<td class="align-middle text-center"><c:out value="${o.EMAIL }"/></td>
								<td class="align-middle text-center"><c:out value="${o.ORDERNO }" /></td>
								<td class="align-middle text-center"><c:out value="${o.PAYSTATUS }"/></td>
								<td class="align-middle text-center "><form
										class="d-flex flex-column" method="post" >
										
										<button type="button"
											class="orderDetailBtn btn btn-outline-secondary btn-sm mb-1">주문상세보기</button>
											<input type="hidden" value="${o.PAYMENTNO }" name="paymentNo">
										
										<button type="button" class="orderCancel btn  btn-outline-danger btn-sm">주문취소</button>
								
									</form></td>
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
			<div class="orderModal"></div>
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
        
        $(".orderDetailBtn").on("click", e => {
        	let paymentNo = $(e.target).next().val();
        	ajaxModal("${path}/admin/paymentDetail.do", paymentNo);
        })
        
        $(".orderCancel").on("click", e=> {
        	let paymentNo = $(e.target).prev().val();
        	ajaxModal("${path}/admin/paymentCancel.do", paymentNo);
        })
    })
    
    function ajaxModal(path, paymentNo) {
    	$.ajax({
			url: path,
			data:{paymentNo : paymentNo },
			dataType:"html",
			success:(data) => {
				$(".orderModal").html(data);
         		$('div.modal').modal(); 
			}
		});
    }

</script>
</body>
</html>
