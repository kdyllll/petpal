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
				<h5 class="modal-title" id="exampleModalLabel">장소상세보기</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<c:set var="p" value="${place }" />
			<div class="modal-body">
				<span><fmt:formatDate value="${p.PLACEDATE }"
						pattern="yyyy년MM월dd일" /></span>
				<p class="mt-3" style="font-size: 16px; font-weight: 600;">[카테고리]제목</p>
				<p>
					[
					<c:out value="${p.CATEGORY }" />
					]
					<c:out value="${p.TITLE }" />
				</p>
				<p style="font-size: 16px; font-weight: 600;">내용</p>
				<p>
					<c:out value="${p.EXPLANATION }" />
				</p>
				<p style="font-size: 16px; font-weight: 600;">장소</p>
				<p id="loc">
					<c:out value="${p.POSITION }" />
				</p>
			</div>
			<div class="modal-footer ">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>
