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
				<h5 class="modal-title" id="exampleModalLabel">재고등록</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
			<c:if test="${not empty sList }">
			<c:forEach var="s" items="${sList }">
				<form>
					<div class="form-group">
						<label for="recipient-name" class="col-form-label d-block">
						<c:if test="${s.color ne null && s.productSize ne null}">
							<c:out value="${s.productSize }/${s.color }" />
						</c:if>
						</label> <input type="number" min="0" value="0"
							class="form-control col-md-4 d-inline align-middle">
						<button type="button"
							class=" d-inline btn btn-outline-secondary align-middle">수정</button>
						<button type="button"
							class=" d-inline btn btn-outline-danger align-middle">삭제</button>
					</div>
				</form>
				</c:forEach>
				</c:if>
			</div>
			<div class="modal-footer ">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>