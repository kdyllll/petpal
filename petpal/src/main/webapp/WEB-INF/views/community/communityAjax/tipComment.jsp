<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/> 
<style>
.rounded-circle {
	width: 40px;
	height: 40px;
}

</style>
<hr>
<h4>
	댓글<span class="su text-secondary"><c:out value="${count }" /></span>
</h4>
<!-- 댓글등록 -->
<div class="d-flex mb-3 editor">
	<div class="input-group mb-3">
		<input type="hidden" name="commentLevel" value="1"> 
		<input type="hidden" name="commentRef" value=""> 
		<input type="text" class="form-control rounded" name="tipComment" placeholder="칭찬과 격려의 댓글은 작성자에게 큰 힘이 됩니다:)" aria-label="Recipient's username" aria-describedby="button-addon2">
		<div class="input-group-append">
			<button class="btn btn-outline-secondary write" type="button">등록</button>
		</div>
	</div>
</div>
<c:forEach items="${cList }" var="c">
	<c:if test="${c.commentLevel eq 1 }">
		<div class="d-flex mb-2 ml-1 comment level1">
			<a href="${path }/user/moveUserInfo.do?memberNo=${c.memberNo}">
				<div class="">
					<img src="${path }/resources/upload/member/profile/${c.img }" class="rounded-circle mr-3">
				</div>
				<div>
					<div>
						<strong><span class="text-dark"><c:out value="${c.nickName }" /></span></strong>
			</a> 
			<c:if test="${c.status eq 'E' }">
				<span class="ml-1"><c:out value="${c.tipComment }" /></span>
			</c:if>
			<c:if test="${c.status eq 'D' }">
				<span class="ml-1 text-black-50" style="font-size:14px;">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-exclamation-circle-fill" style="color:" viewBox="0 0 16 16">
					  <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM8 4a.905.905 0 0 0-.9.995l.35 3.507a.552.552 0 0 0 1.1 0l.35-3.507A.905.905 0 0 0 8 4zm.002 6a1 1 0 1 0 0 2 1 1 0 0 0 0-2z"/>
					</svg>
					 &nbsp;삭제된 댓글입니다.
				</span>
			</c:if>
		</div>
		<div>
			<span class="text-dark" style="font-size: 14px;"> 
				<c:set var="today" value="<%=new java.util.Date()%>" /> 
				<fmt:parseNumber value="${(today.time-c.writeDate.time)/(1000*60) }" var="cha" integerOnly="true" /> 
				<c:choose>
					<c:when test="${cha<60 }">${cha}분 전</c:when>
					<c:when test="${cha>=60&&cha<1440}">
						<fmt:formatNumber value="${cha/60 }" type="number" maxFractionDigits="0" />시간 전
					</c:when>
					<c:when test="${cha>=1440&&cha<43200 }">
						<fmt:formatNumber value="${cha/60/24 }" type="number" maxFractionDigits="0" />일 전
					</c:when>
					<c:otherwise>
						<c:out value="${c.writeDate }" />
					</c:otherwise>
				</c:choose>
			</span>
			<c:if test="${c.status eq 'E' }">
				<button class="reply click btn p-0 text-dark ml-2" style="font-weight: bold; font-size:14px;" value="${c.tipCommentNo }">답글 달기</button>
				<c:if test="${(loginMember.memberNo eq c.memberNo) or (loginMember.memberNo eq '63') or (writeMember eq loginMember.memberNo) }">
					<button class="commentDelete click btn p-0 text-black-50" style="font-weight: bold; font-size:14px;" value="${c.tipCommentNo }">· 삭제</button>
				</c:if>
			</c:if>
		</div>
		</div>
		</div>
	</c:if>
	<c:if test="${c.commentLevel eq 2 }">
		<div class="d-flex mb-1 comment level2 ml-5 p-2 py-3 rounded mr-1 ${loginMember.memberNo eq c.memberNo?'bg-point':'bg-light' }">
			<a class="text-dark" href="${path }/user/moveUserInfo.do?memberNo=${c.memberNo}">
				<div>
					<img src="${path }/resources/upload/member/profile/${c.img }"
						class="rounded-circle mr-3">
				</div>
				<div>
					<div>
						<strong><span><c:out value="${c.nickName }" /></span></strong>
			</a> <span class="ml-1"><c:out value="${c.tipComment }" /></span>
		</div>
		<div>
			<span class="text-dark" style="font-size: 14px;"> <c:set
					var="today" value="<%=new java.util.Date()%>" /> <fmt:parseNumber
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
			<c:if test="${(loginMember.memberNo eq c.memberNo) or (loginMember.memberNo eq '63') or (writeMember eq loginMember.memberNo) }">
			 <button class="comment2Delete click btn p-0 text-black-50" style="font-weight: bold; font-size:14px;" value="${c.tipCommentNo }">· 삭제</button>
			</c:if>
		</div>
		</div>
		</div>
	</c:if>

</c:forEach>
<div>${pageBar }</div>

