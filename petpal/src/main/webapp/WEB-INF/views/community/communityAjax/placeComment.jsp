<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<c:forEach items="${cList }" var="c">
	<div class="d-flex mb-3">
		<a href="#">
			<div>
				<img src="${path }/resources/upload/member/profile/${c.img }"
					class="rounded-circle mr-3">
			</div>
			<div>
				<div>
					<strong><span><c:out value="${c.nickName }" /></span></strong>
		</a> <span><c:out value="${c.placeComment }" /></span>
	</div>
	<div>
		<span style="font-size: 14px; color: gray;"> <c:set var="today"
				value="<%=new java.util.Date()%>" /> <fmt:parseNumber
				value="${(today.time-c.writeDate.time)/(1000*60) }" var="cha"
				integerOnly="true" /> <c:choose>
				<c:when test="${cha<60 }">${cha}분 전</c:when>
				<c:when test="${cha>=60&&cha<1440}">
					<fmt:formatNumber value="${cha/60 }" type="number"
						maxFractionDigits="0" />시간 전</c:when>
				<c:when test="${cha>=1440&&cha<43200 }">
					<fmt:formatNumber value="${cha/60/24 }" type="number"
						maxFractionDigits="0" />일 전</c:when>
				<c:otherwise>
					<c:out value="${c.writeDate }" />
				</c:otherwise>
			</c:choose>
		</span>
		<button class="reply click text-black-50" style="font-weight: bold;"
			value="${c.placeCommentNo }">답글 달기</button>
		<button class="click" style="color: gray; font-size: 14px;">신고</button>
	</div>
	</div>
	</div>
</c:forEach>

