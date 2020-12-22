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
				<h5 class="modal-title" id="exampleModalLabel">신고상세보기</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<span style="font-size: 16px; font-weight: 600;">[ <c:out
						value="${claim.CATEGORY }" /> ]
				</span> <span class="pl-4"><fmt:formatDate
						value="${claim.CLAIMDATE }" pattern="yyyy년MM월dd일" /></span>
				<p class="mt-3">
					신고자 :
					<c:out value="${claim.EMAIL }" />
				</p>
				<span style="font-size: 16px; font-weight: 600;">내용</span>
				<a class=" text-end" href="#">( 신고 글 보러가기 )</a>
				<p class="mt-3" >
					<c:out value="${claim.CONTENT }" />
				</p>
				<div class="mt-4">
					<button type="button" class="btn btn-sm btn-outline-danger">삭제하기</button>
					<button type="button" class="btn btn-sm btn-outline-secondary">신고처리하기</button>
				</div>
			</div>
			<div class="modal-footer ">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>
<script>
	$(".allCancelBtn").on("click", function() {
		$("#allPayCancelFrm").submit();
	})
</script>


