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
				<form id="search-userEmail" method="post" class="row align-items-center orderFrm">
					<div class="mb-3  col-lg-2">
						<label class="mr-sm-2 sr-only" for="inlineFormCustomSelect">Preference</label>
						<select class="custom-select mr-sm-2" name="searchType" id="searchType">
							<option selected value="P.EMAIL">이메일</option>
							<option value="NAME">이름</option>
							<option value="RECEIVERNAME">받는분 이름</option>
							<option value="PHONE">전화번호</option>
							<option value="ORDERNO">주문번호</option>
						</select>
					</div>
					<div class="input-group mb-3  col-lg-5">
						<input type="text" class="form-control input-group-sm"
							name="keyword" placeholder="검색어를 입력해주세요.">
						<div class="input-group-append">
							<button class="btn btn-outline-secondary searchBtn" type="submit"
								>Button</button>
						</div>
					</div>
					<div class="input-group mb-3  col-lg-5 ">
						<div class="form-check form-check-inline ">
							<input class="form-check-input" name="status" type="radio"
								 value="결제완료" id="yes" ${status != null && status.equals("결제완료") ? "checked":""}> <label
								class="form-check-label" for="yes">결제완료</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" name="status" type="radio"
								id="ing" value="취소완료" ${status != null && status.equals("취소완료") ? "checked":""}> <label
								class="form-check-label" for="ing">취소완료</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" name="status" type="radio"
								value="결제대기" id="deny" ${status != null && status.equals("결제대기") ? "checked":""}> <label
								class="form-check-label" for="deny">결제대기</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" name="status" type="radio"
								 value="전체" id="com" ${status == null ? "checked":""}> <label
								class="form-check-label" for="com">전체</label>
						</div>
					</div>
				</form>

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
								<td class="align-middle text-center"><c:out value="${o.PAYSTATUS }"/><c:if test="${o.PAYSTATUS eq '결제대기'}">
									<button type="button" class="orderAccept btn  btn-outline-danger btn-sm">승인</button><input type="hidden" value="${o.PAYMENTNO }" name="paymentNo">
								</c:if></td>
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
					style="margin-bottom: 150px;"
					class=" d-flex justify-content-center">
					<p class="text-center">${pageBar }</p> 
				</nav>
			</section>
			<div class="orderModal"></div>
		</div>
	</div>
	<script>
    $(function(){
    	$(".searchBtn").on("click", e => {
    		$(".orderFrm").attr("action","${path }/admin/orderSearch.do").submit();
    	})
    	
    	$("input[type='radio']").on("change", e => {
    		if($(e.target).val()=="결제완료" || $(e.target).val()=="취소완료" || $(e.target).val()=="결제대기") {
    			$(".orderFrm").attr("action","${path }/admin/orderSearch.do").submit();
    		} else {
    			$(".orderFrm").attr("action","${path }/admin/adminOrder.do").submit();
    		}
    	})
    	
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
