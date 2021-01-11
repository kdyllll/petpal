<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />

<div class="modal fade" id="staticBackdrop" tabindex="-1"
	aria-labelledby="exampleModalLabel" data-backdrop="static"
	aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">주문취소</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>

			<div class="modal-body">

				<c:if test="${not empty pdList }">
					<p style="font-size: 16px; font-weight: 600;">상품리스트</p>
					<div class="mb-3">
						<c:forEach var="pd" items="${pdList }">
							<form class="orderCancelFrm" method="post">
								<span><a href="#"><c:out value="${pd.PRODUCTNAME }" /></a></span>
								<span><c:out value="${pd.COLOR }" /></span> <span><c:out
										value="${pd.PRODUCTSIZE }" /></span>
								<div>
									<span class="text-end">수량 : <c:out value="${pd.CNT }" />
										(<c:out value="${pd.PRICE }" />)
									</span> <span> / 총 가격 : <c:out value="${pd.PRICE * pd.CNT }" />원
									</span>
								</div>
								<input type="hidden" name="detailNo" value="${pd.DETAILNO }" />
								<c:choose>
									<c:when test="${pd.DETAILSTATUS eq '결제' }">
										<input type="submit"
											class="orderCancelBtn btn btn-outline-danger btn-sm mb-3 mt-2 " value="주문취소" />
											<input type="hidden" name="paymentNo" value="${pd.PAYMENTNO }">
									</c:when>
									<c:otherwise>
										<p class="text-muted">(취소완료)</p>
									</c:otherwise>
									
								</c:choose>

								<br />
								<script>
									$(function(){
										$(".orderCancelBtn").on("click", e => {
											let status = confirm( '주문취소하시겠습니까?' );
									    	if(status == true) {
												$.ajax({
													url : "${path}/admin/orderCancelEnd.do",
													data : {detailNo : $(e.target).prev().val(), paymentNo : $(e.target).next().val() }, 
													success : data => {
														if(data == true) {
															alert("주문취소성공");
															location.reload();
														} else {
															alert("주문취소실패")
														}
													}
												})
									    	} else {
									    		location.replace();
									    	}
										})
									})
								
								</script>
							</form>
						</c:forEach>
					</div>
				</c:if>

			</div>
			<div class="modal-footer ">
				<form id="allPayCancelFrm" action="${path }/admin/allPaymentCancel.do" method="post">
				<input type="hidden" name="paymentNo" value="${pList.PAYMENTNO }">
				<button type="button" class="allCancelBtn btn btn-outline-danger">전체주문취소</button>
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				</form>
			</div>
		</div>
	</div>
</div>
<script>
	$(".allCancelBtn").on("click", function() {
		let status = confirm( '정말 전체취소하시겠습니까?' );
    	if(status == true) {
			$("#allPayCancelFrm").submit();
    	}
	})
</script>


