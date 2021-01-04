<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/> 
<div class="row">
<c:if test="${empty placeList }">
	<div class="col-12 mb-4 text-center mt-5">
		<p>장소 후기가 없습니다.</p>
	</div>
</c:if>
<c:if test="${not empty placeList }">
	<c:forEach var="p" items="${placeList }">
		<div class="col-12 col-sm-10 offset-sm-1 blogShort mb-4 border-bottom ">
			<a href="${path }/place/movePlaceDetail.do?placeNo=${p.PLACENO}" class="post-all">
				<div class="row">
					<div class="col-9">
						<div class="decoration">
							<h3><c:out value="${p.TITLE}" /></h3>
							<article>
								<p class="content"><c:out value="${p.CONTENT}" /></p>
							</article>
						</div>
						<span class="mr-2"> <c:out value="${p.PLACEDATE }"/> </span>
						<span class="mr-2"><c:out value="${p.CATEGORY }" /></span>
						<p><c:out value="${p.POSITION }" /></p>
					</div>
					<div class="col-3">
						<img src="${path }/resources/upload/place/${p.FILENAME}"
							alt="post img" class="rounded float-right" style="width:100%">
					</div>
				</div>
			</a>
		</div>
	</c:forEach>
</c:if>
</div>
<div class="mx-auto">${pageBar }</div>