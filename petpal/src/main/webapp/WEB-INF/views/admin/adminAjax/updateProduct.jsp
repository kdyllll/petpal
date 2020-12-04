<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<form class="priceFrm" method="post" enctype="multipart/form-data"
				action="${path }/admin/updateProductEnd.do">
<div class="modal fade modalP" id="staticBackdrop" tabindex="-1"
	aria-labelledby="exampleModalLabel" data-backdrop="static"
	aria-hidden="true">
	<div class="modal-dialog modal-dialog-scrollable">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">상품수정</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			
				<div class="modal-body">
					<c:if test="${not empty pdt }">
						<div class="form-group">
							<label for="exampleFormControlInput1">카테고리</label> <input
								readonly value="${pdt.CATEGORYNAME }" type="text"
								class="form-control">
						</div>
						<div class="form-group">
							<label for="exampleFormControlInput1">소카테고리</label> <input
								value="${pdt.SUBCATE }" type="text" name="subCate" class="form-control">
						</div>
						<div class="form-group">
							<label for="exampleFormControlInput1">상품이름</label> <input
								value="${pdt.PRODUCTNAME }" name="productName" type="text" class="form-control">
						</div>

					</c:if>
					<c:if test="${not empty pimg }">
						<c:forEach var="pi" items="${pimg }">
							<div>
								
								<input type="hidden"
									name="type" value="${pi.type }" /> <input type="hidden"
									name="imgNamez" value="${pi.imgName}" /> 
									<img
									src="${path }/resources/upload/product/detail/${pi.imgName}"
									title="사진변경" class="imgClick"
									style="cursor: pointer; width: 100px; height: 100px;" /> <input
									type="file" name="imgNamez" class="d-none imgName" />
									<input type="hidden" name="pdtImgNo"
									value="${pi.productImgNo }" /> 
							</div>
						</c:forEach>
					</c:if>
					<div class="imgContainer">
		
					</div>
				</div>
				<div class="modal-footer ">
					<input type="hidden" name="productNo" value="${pdt.PRODUCTNO }" />
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<input type="button"
						class="btn btn-outline-secondary updateProductEnd" value="수정" />

				</div>
			

		</div>
	</div>
</div>
</form>
<script>
	$(function() {
		$(".imgClick").on("click", e => {
			let target = $(e.target).next();
			let imgT = $(e.target);
			target.click();
			target.on("change", e => {
				let reader = new FileReader();
	             reader.onload = (e) => {
	               $(imgT).attr("src", e.target.result);
	               let con = $("<input>").attr({"name":"productImgNo", "value" : target.next().val()});
	               $(".imgContainer").append(con);

	            };
		         reader.readAsDataURL($(e.target)[0].files[0]); //파일의 가상경로를 가져옴

			});
			
			
		})
		$(".updateProductEnd").on("click", function() {
			$(".priceFrm").submit();
		})
	})
</script>