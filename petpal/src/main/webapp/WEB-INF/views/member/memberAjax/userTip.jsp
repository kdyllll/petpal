<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/> 
<c:if test="${empty tipList }">
	<div class="col-12 mb-4 text-center mt-5">
		<p class="">노하우 글이 없습니다.</p>
	</div>
</c:if>
<c:if test="${not empty tipList }">
	<c:forEach var="t" items="${tipList }">
		<c:if test="${not empty t.MAINIMG }">
			<div class="col-xl-3 col-lg-4 col-md-6" style="cursor:pointer" id="img" onclick="location.replace('${path}/community/tipDetail.do?tipNo=${t.TIPNO}')">
				<div class="card mb-4 bg-transparent border-0"  >
					<div class="test">
						<img src="${path}/resources/upload/tip/${t.MAINIMG}"  id="scale" width="100%" height="225">
					</div>
					<div class="card-body">
						<p class="card-text"><c:out value="${t.TITLE }"/></p>
						<div class="d-flex justify-content-between align-items-center">
						<small class="text-muted"> <label>조회수 0
								</label> <label>스크랩 0
									</label></small>
						</div>
					</div>
				</div>
			</div>						
		</c:if>
	</c:forEach>
</c:if>
<div class="mx-auto">${pageBar }</div>