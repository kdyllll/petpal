<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<div class="modal fade sDetail" id="staticBackdrop" tabindex="-1"
	aria-labelledby="exampleModalLabel" data-backdrop="static"
	aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">주문정보 상세보기</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<style>
div.modal-body>p {
	font-size: 14px;
}
</style>
			<div class="modal-body">
				<p>
					<strong>상품이름</strong>
				</p>
				<p class="pl-3">
					<c:out value="${shop.PRODUCTNAME }" />
				</p>
				<c:if test="${not empty shop.COLOR}">
					<p>
						<strong>색상</strong>
					</p>
					<p class="pl-3">
						<c:out value="${shop.COLOR }" />
					</p>
				</c:if>
				<c:if test="${not empty shop.COLOR}">
					<p>
						<strong>사이즈</strong>
					</p>
					<p class="pl-3">
						<c:out value="${shop.PRODUCTSIZE }" />
					</p>
				</c:if>
				<p>
					<strong>수량</strong>
				</p>
				<p class="pl-3">
					<c:out value="${shop.CNT }" />
				</p>
				<p>
					<strong>결제방법</strong>
				</p>
				<c:choose>
					<c:when test="${shop.PAYKIND eq 'CARD' }">
						<p class="pl-3">카드결제</p>
					</c:when>
					<c:otherwise>
						<p class="pl-3">무통장입금</p>
					</c:otherwise>
				</c:choose>
				
				<p>
					<strong>결제날짜</strong>
				</p>
				<p class="pl-3">
					<fmt:formatDate value="${shop.PAYDATE }" pattern="yyyy/MM/dd" />
				</p>
				<p>
					<strong>배송상태</strong>
				</p>
				<p class="pl-3">
					<c:out value="${shop.DELIVERYSTATUS}" />
				</p>
				<p>
					<strong>받는분 이름</strong>
				</p>
				<p class="pl-3">
					<c:out value="${shop.RECEIVERNAME}" />
				</p>
				<p>
					<strong>받는분 전화번호</strong>
				</p>
				<p class="pl-3">
					<c:out value="${shop.TEL}" />
				</p>
				<p>
					<strong>배송지</strong>
				</p>
				<p class="pl-3">
					<c:out value="${shop.L0C}" />
				</p>
				<p>
					<strong>메모</strong>
				</p>
				<p class="pl-3">
					<c:out value="${shop.MEMO}" />
				</p>
	
			</div>
			<div class="modal-footer ">
				<p>가격: <c:out value="${shop.PRICE }"/></p>
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>
