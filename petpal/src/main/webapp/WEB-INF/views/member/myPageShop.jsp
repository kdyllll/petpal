<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />


<jsp:include page="/WEB-INF/views/common/commonLink.jsp" />


<jsp:include page="/WEB-INF/views/common/myPageNav.jsp">
	<jsp:param name="mpNav" value="shop" />
</jsp:include>
<div class="row  py-3 mb-3 mt-4  bg-white rounded shadow-sm ">
	<div class="py-2 " style="width: 100%;">
		<a href="#"
			class="mb-0 text-decoration-none lh-100 px-3 text-dark d-block text-center ">적립금
			<c:out value="${member.point}" />원
		</a>
	</div>
</div>
<div class="row">
	<div class="col-12 my-2 p-3 bg-white rounded shadow-sm">
		<h6 class=" pb-3 mb-0">적립금 내역</h6>
		<div class="media text-muted pt-3">
			<p
				class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">
				<strong class="d-block text-gray-dark">@username</strong> +20000
			</p>
		</div>
		<div class="media text-muted pt-3">
			<p
				class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">
				<strong class="d-block text-gray-dark">@username</strong> +20000
			</p>
		</div>
		<div class="media text-muted pt-3">
			<p
				class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">
				<strong class="d-block text-gray-dark">@username</strong> +20000
			</p>
		</div>
		<small class="d-block text-right mt-3"> <a href="#">더보기</a>
		</small>
	</div>
</div>
<div class="row  py-3 mb-3 mt-5  bg-white rounded shadow-sm ">
	<div class="py-2 d-flex justify-content-around align-items-center"
		style="width: 100%;">

		<a href="#"
			class="mb-0 text-decoration-none lh-100 px-3 text-dark d-block "><strong>결제완료
				0</strong></a>
		<svg class="bi bi-chevron-right" width="20" height="20"
			viewBox="0 0 20 20" fill="currentColor"
			xmlns="http://www.w3.org/2000/svg">
			<path fill-rule="evenodd"
				d="M6.646 3.646a.5.5 0 01.708 0l6 6a.5.5 0 010 .708l-6 6a.5.5 0 01-.708-.708L12.293 10 6.646 4.354a.5.5 0 010-.708z" /></svg>
		<a href="#"
			class="mb-0 text-decoration-none lh-100 px-3 text-dark d-block "><strong>배송준비
				0</strong></a>
		<svg class="bi bi-chevron-right" width="20" height="20"
			viewBox="0 0 20 20" fill="currentColor"
			xmlns="http://www.w3.org/2000/svg">
			<path fill-rule="evenodd"
				d="M6.646 3.646a.5.5 0 01.708 0l6 6a.5.5 0 010 .708l-6 6a.5.5 0 01-.708-.708L12.293 10 6.646 4.354a.5.5 0 010-.708z" /></svg>
		<a href="#"
			class="mb-0 text-decoration-none lh-100 px-3 text-dark d-block "><strong>배송중
				0</strong></a>
		<svg class="bi bi-chevron-right" width="20" height="20"
			viewBox="0 0 20 20" fill="currentColor"
			xmlns="http://www.w3.org/2000/svg">
			<path fill-rule="evenodd"
				d="M6.646 3.646a.5.5 0 01.708 0l6 6a.5.5 0 010 .708l-6 6a.5.5 0 01-.708-.708L12.293 10 6.646 4.354a.5.5 0 010-.708z" /></svg>
		<a href="#"
			class="mb-0 text-decoration-none lh-100 px-3 text-dark d-block "><strong>배송완료
				0</strong></a>
		<svg class="bi bi-chevron-right" width="20" height="20"
			viewBox="0 0 20 20" fill="currentColor"
			xmlns="http://www.w3.org/2000/svg">
			<path fill-rule="evenodd"
				d="M6.646 3.646a.5.5 0 01.708 0l6 6a.5.5 0 010 .708l-6 6a.5.5 0 01-.708-.708L12.293 10 6.646 4.354a.5.5 0 010-.708z" /></svg>
		<a href="#"
			class="mb-0 text-decoration-none lh-100 px-3 text-dark d-block "><strong>구매확정
				0</strong></a>
	</div>
</div>
<div class="row">
	<div class="col-12 my-3 p-3 bg-white rounded shadow-sm">
		<h6 class="pb-3 mb-0">주문내역(0개)</h6>
		<c:if test="${not empty shop }">
			<c:forEach var="s" items="${shop }">
				<div>
					<div class="media text-muted pt-3 border-bottom border-gray">
						<div style="width: 45px; height: 45px; border: 1px solid;">
							<img style="width: 100%;"
								src="${path }/resources/upload/product/detail/${s.IMGNAME}">
						</div>
						<p class="media-body pb-3 mb-0 small lh-125  ml-2">
							<strong class="d-block text-gray-dark"><c:if
									test="${s.DETAILSTATUS eq '결제완료' }">( <c:out
										value="${s.DETAILSTATUS }" /> )</c:if></strong>
							<c:out value="${s.PRODUCTNAME }" />
							<br />
							<c:out value="${s.COLOR }" />
							<c:out value="${s.PRODUCTSIZE }" />
							수량:
							<c:out value="${s.CNT }" />
						</p>
						<!-- 배송전인 상태의 상품만 주문취소가능하게 -->
						<c:choose>
							<c:when test="${s.DETAILSTATUS eq '결제' }">
								<button type="button"
									class="btn btn-outline-secondary btn-sm mr-2 shopDetail"
									style="font-size: 12px;">상세보기</button>
								<!-- 결제일, 결제정보 주소지 ... -->
								<input type="hidden" value="${s.DETAILNO }" name="detailNo">
								<button type="button"
									class="btn btn-outline-secondary btn-sm mr-2"
									style="font-size: 12px;">반품신청</button>
								<button type="button" class="btn btn-outline-secondary btn-sm"
									style="font-size: 12px;">환불신청</button>
							</c:when>
							<c:when test="${s.DETAILSTATUS eq '반품중' }">
								<span style="font-size: 12px;">반품신청(대기)</span>
							</c:when>
							<c:when test="${s.DETAILSTATUS eq '반품' }">
								<span style="font-size: 12px;">반품신청(완료)</span>
								<button type="button" class="btn btn-outline-secondary btn-sm"
									style="font-size: 12px;">반품정보</button>
							</c:when>
							<c:when test="${s.DETAILSTATUS eq '취소중' }">
								<span style="font-size: 12px;">취소신청(대기)</span>
							</c:when>
							<c:otherwise>
								<span style="font-size: 12px;">취소신청(완료)</span>
								<button type="button" class="ml-2 btn btn-outline-secondary btn-sm"
									style="font-size: 12px;">취소정보</button>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</c:forEach>
		</c:if>
	</div>
	<div class="shopModal"></div>
</div>
</main>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />
<script>
 $(function() {
	 $(".shopDetail").on("click", e=> {
		 let detailNo = $(e.target).next().val();
		  moveAjaxModal("${path}/member/shopDetailAjax.do", detailNo ); 
	 })
	 
	 function moveAjaxModal(path,detailNo) {
		 $.ajax({
			url:path,
			 data:{detailNo : detailNo},
			 dataType:"html",
			 success: data => {
				 console.log(data);
				 /* $(".shopModal").html(""); */
				 $(".shopModal").html(data);
	      		 $('div.modal').modal(); 
			 }
		 });
	 }
 })
 
 
</script>
</body>

</html>