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
				<h5 class="modal-title" id="exampleModalLabel">교환/배송</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<c:if test="${not empty list }">
					<p style="font-size: 16px; font-weight: 600;">상품이름</p>
						<div class="pl-2 mb-3">
							<span><c:out value="${list.PRODUCTNAME }" /><c:out value="/${list.COLOR }"/><c:out value="/${list.PRODUCTSIZE }"/></span>
						</div>
					<p style="font-size: 16px; font-weight: 600;">상태</p>
					<div class="pl-2 mb-3">
						<span><c:out value="${list.DETAILSTATUS }" /></span>
					</div>
					<c:if test="${not empty list.REFUNDINFO || not empty list.CHANGEINFO}">
					
						<p style="font-size: 16px; font-weight: 600;">내용</p>
						<div class="pl-2  mb-3">
							<span><c:out value="${list.REFUNDINFO }" /><c:out value="${list.CHANGEINFO }" /></span>
						</div>
					</c:if>
					<p style="font-size: 16px; font-weight: 600;">결제정보</p>
					<div class="pl-2 mb-3">
						<span><c:out value="${list.PAYKIND }" /></span>
					</div>
					<c:if test="${not empty list.REFUNDDATE || not empty list.CHANGEDATE}">
					
						<p style="font-size: 16px; font-weight: 600;">신청날짜</p>
						<div class="pl-2  mb-3">
							<span><c:out value="${list.REFUNDDATE }" /><c:out value="${list.CHANGEDATE }" /></span>
						</div>
					</c:if>
				</c:if>
			</div>
			<div class="modal-footer ">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>

