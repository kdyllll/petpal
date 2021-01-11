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
						<form class="stockFrm" >
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
									<button type="button" class=" d-inline btn btn-outline-secondary align-middle insertStockBtn" >수정</button>
									<input type="hidden" name="stockk" value="${s.stock }" /> 
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
	$(function() {
		$(".insertStockBtn").on("click", e => {
			 let stock = $(e.target).next();
			 let ioStatus = $(e.target).prev().prev().prev().val();
			 let input = $(e.target).prev().prev();
			let flag = true;
			if(ioStatus == "out") {			
				if(input.val() > stock.val()) {
					alert("출고 개수가 재고보다 많습니다. " + stock.val() + "보다 적게 입력해주세요.");
					flag=false;
				}
				if(input.val() < 0) {
					alert("출고 개수는 - 를 입력할 수 없습니다.");
					flag=false;
				}
			}
			if(ioStatus == "in") {
				if(input.val() < 0) {
					alert("입고 개수는  - 를 입력할 수 없습니다.");
					flag=false;
				}
			}
			if(flag == false) {
				return;
			} else {
				
				 $.ajax({
					url:"${path}/admin/updateStockEnd.do",
					data : {iostatus:ioStatus, stock : input.val(),stockNo : $(e.target).prev().val()},
					success: data => {
						let st = "";
						if(ioStatus == "in") {
							st = "입고";
						} else{
							st = "출고";
						}
						if(data == true) {		
 							alert("재고"+st+"성공");
							if(ioStatus === "in") {
								let total = (Number(stock.val())+Number(input.val()));
								$(e.target).prev().prev().prev().prev().html("재고("+total+")개");
								stock.val(total);
								input.val(0);
							} 
							if(ioStatus === "out") {
								let total2 = (Number(stock.val())-Number(input.val()));
								$(e.target).prev().prev().prev().prev().html("재고("+Number(total2)+")개");
								stock.val(total2);	
								input.val(0);
							}
						} else {
							alert("재고"+st+"실패");
						}
					}
				}) 
						
			}

		})
	})
</script>
