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
				<h5 class="modal-title" id="exampleModalLabel">재고삭제</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
			<c:if test="${not empty sList }">
			<c:forEach var="s" items="${sList }">
				<form class="priceFrm" method="post" >
					<div class="form-group">
						<label for="stock" class="col-form-label d-block">
						<c:choose>
							<c:when test="${s.color ne null && s.productSize ne null}">
								<c:out value="${s.productSize }/${s.color }" />
							</c:when>
							<c:otherwise>
								<c:out value="${s.productSize }${s.color }" />
							</c:otherwise>
						</c:choose>
						</label>
						<input type="submit" value="삭제"
							class=" d-inline btn btn-outline-danger align-middle deleteStockBtn"/>
					</div>
					<script>
						$(".deleteStockBtn").on("click", function() {
							$(".priceFrm").attr("action","${path}/admin/deleteStockEnd.do").submit();
						})
					</script>
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
