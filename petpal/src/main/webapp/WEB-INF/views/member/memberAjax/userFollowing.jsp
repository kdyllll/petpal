<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/> 
<div class="row">
<c:if test="${empty followingList }">
	<div class="col-12 mb-4 text-center mt-5">
		<p class="">팔로잉한 사람이 없습니다.</p>
	</div>
</c:if>
<c:if test="${not empty followingList  }">
	<c:forEach var="i" begin="0" end="${fn:length(memberNo)-1}">
		<div class="col-xl-12 col-lg-12 col-md-12 mb-4">
			<div class="card h-100 border-0 " style="overflow: hidden;">
				<input type="hidden" id="memberNo" value="${memberNo[i] }">
				<div class="userInfo" style="cursor:pointer">
					<div class="d-flex">
			    		<c:choose>
					    	<c:when test="${not empty img[i] }"><img src="${path }/resources/upload/member/profile/${img[i]}" style="width:80px;height:80px;"></c:when>
					    	<c:otherwise><img src="${path }/resources/upload/member/profile/avatar.webp" style="width:80px;"></c:otherwise>
				    	</c:choose>
						<span class="ml-4 mt-4"><c:out value="${nickName[i] }" /></span>
					</div>
		    	</div>
			</div>
		</div>
	</c:forEach>
</c:if>
</div>
<script>
	$(".userInfo").click(function(){
		let memberNo = $(this).prev().val();
		location.href="${path }/user/moveUserInfo.do?memberNo=" + memberNo;		
	});
</script>
<div class="mx-auto">${pageBar }</div>