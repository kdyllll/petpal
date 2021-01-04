<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />


<jsp:include page="/WEB-INF/views/common/commonLink.jsp" />


<jsp:include page="/WEB-INF/views/common/myPageNav.jsp">
	<jsp:param name="mpNav" value="shop" />
</jsp:include>
<div class="row  py-3 mb-3 mt-4  bg-white rounded shadow-sm ">
	<div class="py-2 " style="width: 100%;">
		<a href="#"
			class="mb-0 text-decoration-none lh-100 px-3 text-dark d-block text-center ">적립금
			<c:out value="${member.point}" />원
		</a>
	</div>
</div>
<div class="row">
	<div class="col-12 my-2 p-3 bg-white rounded shadow-sm">
		<h6 class=" pb-3 mb-0">적립금 내역</h6>
		<div class="media text-muted pt-3">
			<p
				class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">
				<strong class="d-block text-gray-dark">@username</strong> +20000
			</p>
		</div>
		<div class="media text-muted pt-3">
			<p
				class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">
				<strong class="d-block text-gray-dark">@username</strong> +20000
			</p>
		</div>
		<div class="media text-muted pt-3">
			<p
				class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">
				<strong class="d-block text-gray-dark">@username</strong> +20000
			</p>
		</div>
		<small class="d-block text-right mt-3"> <a href="#">더보기</a>
		</small>
	</div>
</div>
<div class="row  py-3 mb-3 mt-5  bg-white rounded shadow-sm ">
	<div class="py-2 d-flex justify-content-around align-items-center"
		style="width: 100%;">

		<a href="#"
			class="mb-0 text-decoration-none lh-100 px-3 text-dark d-block "><strong>결제완료
				0</strong></a>
		<svg class="bi bi-chevron-right" width="20" height="20"
			viewBox="0 0 20 20" fill="currentColor"
			xmlns="http://www.w3.org/2000/svg">
			<path fill-rule="evenodd"
				d="M6.646 3.646a.5.5 0 01.708 0l6 6a.5.5 0 010 .708l-6 6a.5.5 0 01-.708-.708L12.293 10 6.646 4.354a.5.5 0 010-.708z" /></svg>
		<a href="#"
			class="mb-0 text-decoration-none lh-100 px-3 text-dark d-block "><strong>배송준비
				0</strong></a>
		<svg class="bi bi-chevron-right" width="20" height="20"
			viewBox="0 0 20 20" fill="currentColor"
			xmlns="http://www.w3.org/2000/svg">
			<path fill-rule="evenodd"
				d="M6.646 3.646a.5.5 0 01.708 0l6 6a.5.5 0 010 .708l-6 6a.5.5 0 01-.708-.708L12.293 10 6.646 4.354a.5.5 0 010-.708z" /></svg>
		<a href="#"
			class="mb-0 text-decoration-none lh-100 px-3 text-dark d-block "><strong>배송중
				0</strong></a>
		<svg class="bi bi-chevron-right" width="20" height="20"
			viewBox="0 0 20 20" fill="currentColor"
			xmlns="http://www.w3.org/2000/svg">
			<path fill-rule="evenodd"
				d="M6.646 3.646a.5.5 0 01.708 0l6 6a.5.5 0 010 .708l-6 6a.5.5 0 01-.708-.708L12.293 10 6.646 4.354a.5.5 0 010-.708z" /></svg>
		<a href="#"
			class="mb-0 text-decoration-none lh-100 px-3 text-dark d-block "><strong>배송완료
				0</strong></a>
		<svg class="bi bi-chevron-right" width="20" height="20"
			viewBox="0 0 20 20" fill="currentColor"
			xmlns="http://www.w3.org/2000/svg">
			<path fill-rule="evenodd"
				d="M6.646 3.646a.5.5 0 01.708 0l6 6a.5.5 0 010 .708l-6 6a.5.5 0 01-.708-.708L12.293 10 6.646 4.354a.5.5 0 010-.708z" /></svg>
		<a href="#"
			class="mb-0 text-decoration-none lh-100 px-3 text-dark d-block "><strong>구매확정
				0</strong></a>
	</div>
</div>
<div class="row  py-3 mt-5  bg-white rounded ">
<h6 class="pl-2 pb-3 mb-0">주문내역(0개)</h6>
	<div class="py-2 d-flex justify-content-around align-items-center"
		style="width: 100%;">
		<a href="#"
			class="mb-0 text-decoration-none lh-100 px-3 text-dark d-block "><strong>반품(대기)
				0</strong></a>	
		<a href="#"
			class="mb-0 text-decoration-none lh-100 px-3 text-dark d-block "><strong>반품(완료)
				0</strong></a>		
		<a href="#"
			class="mb-0 text-decoration-none lh-100 px-3 text-dark d-block "><strong>환불(대기)
				0</strong></a>	
		<a href="#"
			class="mb-0 text-decoration-none lh-100 px-3 text-dark d-block "><strong>환불(완료)
				0</strong></a>
		<a href="#"
			class="mb-0 text-decoration-none lh-100 px-3 text-dark d-block "><strong>구매완료
				0</strong></a>
	</div>
</div>
<div class="row">
	<div class="col-12 my-3 p-3 bg-white rounded shadow-sm">
		
		<c:if test="${not empty shop }">
			<c:forEach var="s" items="${shop }">
				<div>
					<div class="media text-muted pt-3 border-bottom border-gray">
						<div style="width: 45px; height: 45px; border: 1px solid;">
							<img style="width: 100%;"
								src="${path }/resources/upload/product/detail/${s.IMGNAME}">
						</div>
						<p class="media-body pb-3 mb-0 small lh-125  ml-2">
							<strong class="d-block text-gray-dark"><c:if
									test="${s.DETAILSTATUS eq '결제완료' }">( <c:out
										value="${s.DETAILSTATUS }" /> )</c:if></strong>
							<c:out value="${s.PRODUCTNAME }" />
							<br />
							<c:out value="${s.COLOR }" />
							<c:out value="${s.PRODUCTSIZE }" />
							수량:
							<c:out value="${s.CNT }" />
						</p>
						<!-- 배송전인 상태의 상품만 주문취소가능하게 -->
						<c:choose>
							<c:when test="${s.DETAILSTATUS eq '결제' }">
								<button type="button"
									class="btn btn-outline-secondary btn-sm mr-2 shopDetail"
									style="font-size: 12px;">상세보기</button>
								<!-- 결제일, 결제정보 주소지 ... -->
								<input type="hidden" value="${s.DETAILNO }" name="detailNo">
								<button type="button"
									class="btn btn-outline-secondary btn-sm mr-2 refundBtn"
									style="font-size: 12px;">반품신청</button>
								<input type="hidden" name="detailNo" value="${s.DETAILNO }" />
								<button type="button" class="btn btn-outline-secondary btn-sm changeBtn"
									style="font-size: 12px;">교환신청</button>
							</c:when>
							<c:when test="${s.DETAILSTATUS eq '반품중' }">
								<span style="font-size: 12px;">반품신청(대기)</span>
								<button type="button"
									class="ml-2 btn btn-outline-secondary btn-sm infoDetail"
									style="font-size: 12px;">반품정보</button>
									<input type="hidden" name="detailNo" value="${s.DETAILNO }" />
								
							</c:when>
							
							<c:when test="${s.DETAILSTATUS eq '교환중' }">
								<span style="font-size: 12px;">교환신청(대기)</span>
								<button type="button"
									class="ml-2 btn btn-outline-secondary btn-sm infoDetail"
									style="font-size: 12px;">교환정보</button>
									<input type="hidden" name="detailNo" value="${s.DETAILNO }" />
								
							</c:when>
							<c:when test="${s.DETAILSTATUS eq '교환' }">
								<span style="font-size: 12px;">교환신청(완료)</span>
								<button type="button"
									class="ml-2 btn btn-outline-danger btn-sm infoDetail"
									style="font-size: 12px;">교환정보</button>
									<input type="hidden" name="detailNo" value="${s.DETAILNO }" />
								
							</c:when>
							<c:otherwise>
								<span style="font-size: 12px;">취소완료</span>
								<button type="button"
									class="ml-2 btn btn-outline-secondary btn-sm infoDetail"
									style="font-size: 12px;">반품정보</button>
									<input type="hidden" name="detailNo" value="${s.DETAILNO }" />

							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</c:forEach>
		</c:if>
	</div>
	<div class="shopModal"></div>
	<div class="shopRefundModal">
		<div class="modal fade refund" id="staticBackdrop" tabindex="-1"
			aria-labelledby="exampleModalLabel" data-backdrop="static"
			aria-hidden="true">
			<div
				class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">반품신청</h5>
						<button type="button btn-sm" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>

					</div>

					<form class="modal-body refundFrm" method="post">
						<div class="refundNo"></div>
						<select name="refundReason" style="width:100%;" class=" refundReason form-select d-block py-2 mb-3" aria-label="Default select example">
						  <option value="no" selected>반품사유</option>
						  <option value="bad">불량</option>
						  <option value="delivery">배송지연</option>
						  <option value="simple">단순변심</option>
						  <option value="other">기타</option>
						</select>
						<div class="form-floating refundText">
						  

						</div>
						<p class="text-center">반품신청 하시겠습니까?</p>
						<div class="d-flex justify-content-center">
							<button type="button" class="btn btn-outline-secondary btn-sm"
								data-dismiss="modal">취소</button>
							<button type="button"
								class="btn btn-outline-secondary btn-sm ml-2 refundEndBtn">신청</button>
							
						</div>
					</form>

				</div>
			</div>
		</div>
	</div>
	<div class="shopChangeModal">
		
	</div>
</div>
</main>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />
<script>
 $(function() {
	 $(".shopDetail").on("click", e=> {
		 let detailNo = $(e.target).next().val();
		  moveAjaxModal("${path}/member/shopDetailAjax.do", detailNo, ".sDetail" ); 
	 })
	 
	 $(".refundBtn").on("click", e=> {
		 let input = $(e.target).next().val();
		 let newInput = $("<input>").attr({"name" : "detailNum" , "value":input, "type": "hidden"});
		 $(".refundFrm").children(".refundNo").html("");
		 $(".refundFrm").children(".refundNo").append(newInput);
		 console.log(input);
		 $(".refund").modal();
	 })
	 $(".changeBtn").on("click", e=> {
		 let detailNo = $(e.target).prev().val();
		 moveAjaxModal("${path}/member/moveProductChangePage.do",detailNo,".change");
	 })
	 $(".refundReason").on("change", e=> {
		 	$(".refundText").html("");
			 if($(e.target).val() == "other") {
				 let textA = $("<textarea>").attr({"class":"form-control refundTextArea","placeholder":"사유를 작성해주세요.", "height":"100px"});
				 $(".refundText").html(textA);
			 }
		 })
		 
	 $(".infoDetail").on("click", e => {
		 let detailNo = $(e.target).next().val();
		 moveAjaxModal("${path}/member/infoDetail.do",detailNo,".iDetail" );
	 })
	
		 
	//유효성 검사 && form넘기기
	 $(".refundEndBtn").on("click", e => {
		 avaliality(".refundReason",".refundText > textarea",".refundFrm", "${path}/member/refundApply.do");
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
	 
	//ajax 함수
	 function moveAjaxModal(path,detailNo, md) {
		 $.ajax({
			url:path,
			 data:{detailNo : detailNo},
			 dataType:"html",
			 success: data => {
				 console.log(data);
				 /* $(".shopModal").html(""); */
				 $(".shopModal").html(data);
	      		 $(md).modal(); 
			 }
		 });
	 }
 })
 
 
</script>
</body>

</html>