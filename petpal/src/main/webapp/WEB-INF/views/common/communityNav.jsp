<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />

<div class="col-lg-12 my-5 mt-lg-0 ">
	<div class="mt-3 mt-lg-0 d-lg-flex py-3">
		<a href="${path }/daily/moveList.do"
			class="d-block d-xl-inline text-left mb-0 border-0 px-0 pr-3 py-3 "
			type="button"> 홈 </a> <a href="${path }/daily/moveList.do"
			class="d-block d-xl-inline text-left mb-0 border-0 px-0 pr-3 py-3 "
			type="button"> 사진 </a> <a href="${path }/community/tipList.do"
			class="d-block d-xl-inline text-left collapsed mb-0 border-0 px-0 pr-3 py-3"
			type="button"> 노하우 </a> <a href="${path }/place/movePlaceList.do"
			class="d-block d-xl-inline text-left collapsed mb-0 border-0 px-0 pr-3 py-3"
			type="button"> 장소 </a> <a href="${path }/community/findList.do"
			class="d-block d-xl-inline text-left collapsed mb-0 border-0 px-0 py-3"
			type="button"> 찾아주세요 </a>

	</div>
</div>