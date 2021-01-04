<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<div class="modal fade change" id="staticBackdrop" tabindex="-1"
	aria-labelledby="exampleModalLabel" data-backdrop="static"
	aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">교환신청</h5>
				<button type="button btn-sm" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>

			</div>

			<form class="modal-body changeFrm" method="post">
				<input type="hidden" name="detailNum" value="${detailNo }">
				<select name="changeReason" style="width: 100%;"
					class=" changeReason form-select d-block py-2 mb-3"
					aria-label="Default select example">
					<option value="no" selected>교환사유</option>
					<option value="bad">불량</option>
					<option value="delivery">배송지연</option>
					<option value="color">색상변경</option>
					<option value="other">기타</option>
				</select>
				<div class="form-floating changeText">
					<textarea name="changeTextArea" class="form-control changeTextArea" placeholder="교환 옵션을 적어주세요. (사이즈, 수량문의는 취소 후 재구매)" style="height:100px;"></textarea>
				</div>
				<p class="text-center">교환신청 하시겠습니까?</p>
				<div class="d-flex justify-content-center">
					<button type="button" class="btn btn-outline-secondary btn-sm "
						data-dismiss="modal">취소</button>
					<button type="button"
						class="btn btn-outline-secondary btn-sm ml-2 changeEndBtn">신청</button>

				</div>
			</form>

		</div>
	</div>
</div>
<script>
$(function(){
		 
	  $(".changeEndBtn").on("click", e => {
		 avaliality(".changeReason",".changeText > textarea",".changeFrm","${path}/member/changeApply.do");
	 })
	 //유효성검사 함수
	 function avaliality(a,b,c,d) {
		 let aa = $(a).val();
		 if(aa == "no") {
			 alert("교환사유를 선택해주세요");
			 return;
		 }if($(b).val() == "") {
			 alert("교환사유를 적어주세요");
			 return;
		 } 
		
		 $(c).attr("action", d).submit();
	 }
})

</script>