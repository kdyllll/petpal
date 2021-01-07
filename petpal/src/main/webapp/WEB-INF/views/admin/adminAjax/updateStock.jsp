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
						<form class="stockFrm" method="post">
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
								</label><span>재고(<c:out value="${s.stock }" />개)
								</span> 
								<select class="custom-select mr-sm-2 col-2 iostatus"
									name="iostatus">
									<option value="in">입고</option>
									<option value="out">출고</option>
								</select> 
								<input type="number" min="0" value="0"
									class="form-control col-3 d-inline align-middle stockNum"
									name="stock" /> 
									<input type="hidden" name="stockNo" class="stockNo" value="${s.stockNo }" /> 
									<input type="submit" value="수정" class=" d-inline btn btn-outline-secondary align-middle insertStockBtn" />
									<input type="hidden" name="stockk" value="${s.stock }" /> 
							</div>
							<script>
						$(function() {
							$(".insertStockBtn").on("click", e => {
								 let stock = $(e.target).next().val();
								 let ioStatus = $(e.target).prev().prev().prev().val();
								 let input = $(e.target).prev().prev().val();
								let flag = true;
								if(ioStatus == "out") {			
									if(input > stock) {
										alert("출고 개수가 재고보다 많습니다. " + stock + "보다 적게 입력해주세요.");
										flag=false;
									}
									if(input < 0) {
										alert("출고 개수는 - 를 입력할 수 없습니다.");
										flag=false;
									}
								}
								if(ioStatus == "in") {
									if(input < 0) {
										alert("입고 개수는  - 를 입력할 수 없습니다.");
										flag=false;
									}
								}
								if(flag == false) {
									return;
								}  else {
									$(".stockFrm").attr("action","${path}/admin/updateStockEnd.do").submit(); 									
								}
									
								
								
							})
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
