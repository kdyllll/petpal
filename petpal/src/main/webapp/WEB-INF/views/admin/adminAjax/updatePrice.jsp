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
				<h5 class="modal-title" id="exampleModalLabel">가격설정</h5>
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
						<label for="recipient-name" class="col-form-label d-block">
						<c:choose>
							<c:when test="${s.color ne null && s.productSize ne null}">
								<c:out value="${s.productSize }/${s.color }" />
							</c:when>
							<c:otherwise>
								<c:out value="${s.productSize }${s.color }" />
							</c:otherwise>
						</c:choose>
						</label>
							 가격<input type="number" min="0"  value="${s.price }"
							class="form-control col-3 d-inline align-middle" name="price">
							 세일률<input type="text" min="0"  value="${s.sale }"
							class="form-control col-3 d-inline align-middle" name="sale">
							<input type="hidden" name="stockNo" class="stockNo" value="${s.stockNo}">
						<button type="button" 
							class=" d-inline btn btn-outline-secondary align-middle updatePriceBtn" >수정</button>
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

<script>
	$(function(){
		$(".updatePriceBtn").on("click", e => {
			let price = $(e.target).prev().prev().prev();
			let sale = $(e.target).prev().prev();
			let stockNo = $(e.target).prev();
			$.ajax({
				url : "${path}/admin/updatePriceEnd.do",
				data:{price:price.val(),sale:sale.val(),stockNo:stockNo.val()},
				success : data => {
					if(data == true) {
						alert("가격수정 성공");
					} else {
						alert("가격수정 실패");
					}
				}
			})
		})
	})
</script>
