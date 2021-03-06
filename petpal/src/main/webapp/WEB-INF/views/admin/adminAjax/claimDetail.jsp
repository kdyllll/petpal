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
				<c:if test="${fn:substring(claim.POSTNO,0,1) eq 'F' }">
					<a class=" text-end" href="${path }/community/findDetail.do?findNo=${claim.POSTNO}">( 신고 글 보러가기 )</a>
				</c:if>
				<c:if test="${fn:substring(claim.POSTNO,0,1) eq 'D' }">
					<a class=" text-end" href="${path }/daily/moveDetail.do?dailyNo=${claim.POSTNO}">( 신고 글 보러가기 )</a>
				</c:if>
				<c:if test="${fn:substring(claim.POSTNO,0,1) eq 'T' }">
					<a class=" text-end" href="${path }/community/tipDetail.do?tipNo=${claim.POSTNO}">( 신고 글 보러가기 )</a>
				</c:if>
				<c:if test="${fn:substring(claim.POSTNO,0,1) eq 'P' }">
					<a class=" text-end" href="${path }/place/movePlaceDetail.do?placeNo=${claim.POSTNO}">( 신고 글 보러가기 )</a>
				</c:if>
				<p class="mt-3" >
					<c:out value="${claim.CONTENT }" />
				</p>
				<div class="mt-4">
					<form id="detailFrm">
					<button type="button" class="claimDeleteBtn btn btn-sm btn-outline-danger">삭제하기</button>
					<input type="hidden" name="claimNo" value="${claim.CLAIMNO }">
					<button type="button" class="claimAcceptBtn btn btn-sm btn-outline-secondary">신고처리하기</button>
					</form>
				</div>
			</div>
			<div class="modal-footer ">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>
<script>
	$(function(){
		$(".claimDeleteBtn").on("click", e => {
			let claimNo = $(e.target).next().val();
			$("#detailFrm").attr("action", "${path}/admin/claimDelete.do").submit();
		})
		$(".claimAcceptBtn").on("click", e => {
			let claimNo = $(e.target).prev().val();
			$("#detailFrm").attr("action", "${path}/admin/claimAccept.do").submit();
		})
	})
</script>


