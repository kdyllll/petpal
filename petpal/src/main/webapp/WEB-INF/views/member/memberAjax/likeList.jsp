<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<jsp:include page="/WEB-INF/views/common/commonLink.jsp" />

<div class="col-lg-12 pr-0 pl-0">
	<div class="mb-3 pb-3 px-3 bg-white rounded shadow-sm">
		<span>좋아요 모든 글</span>
		<c:forEach var="all" items="${allList }">
			<c:if test="${fn:substring(all.LIKENO,0,1) eq 'D' }">
				<div class="media text-muted pt-3">
					<a href="${path }/daily/moveDetail.do?dailyNo=${all.LIKENO}"><img
						class="bd-placeholder-img mr-2 rounded" width="32" height="32"
						src="${path }/resources/upload/community/daily/${all.DAILYIMGNAME}" /></a>
					<div
						class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">
						<div
							class="d-flex justify-content-between align-items-center w-100">
							<strong class="text-gray-dark"><c:out
									value="${all.CONTENT }" /></strong> <span><fmt:formatDate
									value="${all.ENROLLDATE }" pattern="yyyy/MM/dd" /></span>
						</div>
						<span class="d-block"><fmt:formatDate
								value="${all.DAILYDATE }" pattern="yyyy/MM/dd" /></span>
					</div>
				</div>
			</c:if>
			<c:if test="${fn:substring(all.LIKENO,0,1) eq 'F' }">
				<div class="media text-muted pt-3">
					<a href="${path }/community/findDetail.do?findNo=${all.LIKENO}"><img
						class="bd-placeholder-img mr-2 rounded" width="32" height="32"
						src="${path }/resources/upload/find/${all.FILENAME}" /></a>
					<div
						class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">
						<div
							class="d-flex justify-content-between align-items-center w-100">
							<strong class="text-gray-dark"><c:out
									value="${all.TITLE }" /></strong> <span><fmt:formatDate
									value="${all.ENROLLDATE }" pattern="yyyy/MM/dd" /></span>
						</div>
						<span class="d-block"><c:out value="${all.CONTENT }" /></span>
					</div>
				</div>
			</c:if>
			<c:if test="${fn:substring(all.LIKENO,0,1) eq 'P' }">
				<div class="media text-muted pt-3">
					<a href="${path }/place/movePlaceDetail.do?placeNo=${all.LIKENO}"><img
						class="bd-placeholder-img mr-2 rounded" width="32" height="32"
						src="${path }/resources/upload/place/${all.FILENAME}" /></a>
					<div
						class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">
						<div
							class="d-flex justify-content-between align-items-center w-100">
							<strong class="text-gray-dark"><c:out
									value="${all.TITLE }" /></strong> <span><c:out value="${all.POSITION }" /></span>
						</div>
						<span class="d-block"><fmt:formatDate
									value="${all.ENROLLDATE }" pattern="yyyy/MM/dd" /></span>
					</div>
				</div>
			</c:if>
			<c:if test="${fn:substring(all.LIKENO,0,1) eq 'T' }">
				<div class="media text-muted pt-3">
					<a href="${path }/community/tipDetail.do?tipNo=${all.LIKENO}"><img
						class="bd-placeholder-img mr-2 rounded" width="32" height="32"
						src="${path }/resources/upload/tip/${all.MAINIMG}" /></a>
					<div
						class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">
						<div
							class="d-flex justify-content-between align-items-center w-100">
							<strong class="text-gray-dark"><c:out
									value="${all.TITLE }" /></strong> <span><fmt:formatDate
									value="${all.ENROLLDATE }" pattern="yyyy/MM/dd" /></span>
						</div>
						<span class="d-block"><c:out value="${all.CONTENT }" /></span>
					</div>
				</div>
			</c:if>
		</c:forEach>
	</div>
</div>

