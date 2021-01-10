<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<div class="modal fade iDetail" id="staticBackdrop" tabindex="-1"
	aria-labelledby="exampleModalLabel" data-backdrop="static"
	aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">정보</h5>
				<button type="button btn-sm" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>

			</div>
			<style>
div.modal-body>p {
	font-size: 14px;
}
</style>
			<div class="modal-body" method="post">
				<p>
					<strong>상태</strong>
				</p>
				<p class="pl-3">
					<c:out value="${detail.DETAILSTATUS }" /> 
					<c:choose>
						<c:when test="${(detail.DETAILSTATUS eq '취소' || detail.DETAILSTATUS eq '반품중') && not empty detail.REFUNDDATE }">
							( <fmt:formatDate value="${detail.REFUNDDATE }" pattern="yyyy/MM/dd" /> )
						</c:when>
						<c:when test="${(detail.DETAILSTATUS eq '교환' || detail.DETAILSTATUS eq '교환중') && not empty detail.CHANGEDATE }">
							( <fmt:formatDate value="${detail.CHANGEDATE }" pattern="yyyy/MM/dd"/> )
						</c:when>
					</c:choose> 			
				</p>
				<p>
					<strong>사유</strong>
					<p class="pl-3">
					<c:choose>
						<c:when test="${detail.DETAILSTATUS eq '취소' || detail.DETAILSTATUS eq '반품중' }">
							<c:choose>
							<c:when test="${not empty detail.REFUNDINFO }">
								<c:out value="${detail.REFUNDINFO }" />
							</c:when>
							<c:otherwise>
								취소완료
							</c:otherwise>
							</c:choose>
						</c:when>
						<c:when test="${detail.DETAILSTATUS eq '교환' || detail.DETAILSTATUS eq '교환중' }">
							<c:out value="${detail.CHANGEINFO }" />
						</c:when>
					</c:choose> 
					</p>
				</p>
			</div>
		</div>
	</div>
</div>
