<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/> 
<div class="row">
<c:if test="${empty findList }">
	<div class="col-12 mb-4 text-center mt-5">
		<p class="">찾아주세요 글이 없습니다.</p>
	</div>
</c:if>
<c:if test="${not empty findList  }">
	<c:forEach var="f" items="${findList }">
		<div class="col-xl-3 col-lg-4 col-md-6 mb-4">
			<div class="card h-100 border-0 " style="overflow: hidden;">
				<a href="${path}/community/findDetail.do?findNo=${f.FINDNO}">
					<img src="${path }/resources/upload/find/${f.FILENAME}" style="width:100%;">
				</a>
				<div class="card-body">
					<h5 class="card-title"><c:out value="${f.TITLE }"/></h5>
				</div>
			</div>
		</div>
	</c:forEach>
</c:if>
</div>
<div class="mx-auto">${pageBar }</div>