<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/> 
<c:if test="${empty findList }">
	<div class="mx-auto">
		<p class="">찾아주세요 글이 없습니다.</p>
	</div>
</c:if>
<c:if test="${not empty findList  }">
	<c:forEach var="f" items="${findList }">
		<div class="col mb-4">
			<div class="card h-100 border-0 " style="overflow: hidden;">
				<a href="${path}/community/findDetail.do?findNo=${f.FINDNO}">
					<img src="${path }/resources/upload/find/${f.FILENAME}" style="width: 100%; height: 200px;">
				</a>
				<div class="card-body">
					<h5 class="card-title"><c:out value="${f.TITLE }"/></h5>
					<p class="card-text"><c:out value="${f.CONTENT }"/></p>
					<span class=""><c:out value="${f.ADDRESS }"/></span>
				</div>
			</div>
		</div>
	</c:forEach>
</c:if>
<div class="mx-auto">페이지바</div>