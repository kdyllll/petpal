<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/> 

<c:if test="${empty dailyList }">
<div class="mx-auto">
	<p class="">일상 글이 없습니다.</p>
</div>
</c:if>
<c:if test="${not empty dailyList }">

<c:forEach var="d" items="${dailyList}">
   <address class="col-xl-3 col-lg-4 col-md-6 m-0">
       <div class="card mb-4 bg-transparent border-0">
           <div class="px-3 row mb-2">  
           		<c:if test="${not empty d.IMG }">                
                   	<a href="${path }/user/moveUserInfo.do?memberNo=${d.MEMBERNO}"><img src="${path }/resources/upload/member/profile/${d.IMG}" class="rounded" style="width:40px; height: 40px;"></a>
                   </c:if>
                   <c:if test="${ empty d.IMG }">  
                   	<a href="${path }/user/moveUserInfo.do?memberNo=${d.MEMBERNO}"><img src="${path }/resources/upload/member/profile/avatar.webp" class="rounded" style="width:40px; height: 40px;"></a>
                   </c:if>
                   <div class="ml-1">
                       <a href="${path }/user/moveUserInfo.do?memberNo=${d.MEMBERNO}"><span class="text-dark align-top mx-1"><strong><c:out value="${d.NICKNAME }"/></strong></span></a>
                       <span><strong> · </strong></span>
                       <span><button class="btn btn-link text-point p-0 align-top"><strong> 팔로우</strong></button></span>
                       <p class="ml-1" style="font-size: 12px;"><c:out value="${d.INFO }"/></p>  
                   </div>                    
           </div>
           <c:forEach var="i" items="${imgList}">
           	<c:if test="${i.dailyNo eq d.DAILYNO}">
           	<a class="d-inline-block" href="${path }/daily/moveDetail.do?dailyNo=${d.DAILYNO }">                        
          			<img src="${path }/resources/upload/community/daily/${i.dailyImgName}" class="rounded" width="100%">
          			<input type="hidden" value="${d.DAILYNO }"/>
           	</a>	
           	</c:if>
           </c:forEach>
           <div class="d-flex justify-content-between mx-1 my-1">
               <button class="btn btn-link">
                   <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-heart text-dark" fill="currentColor" xmlns="http://www.w3.org/2000/svg" style="font-size:25px;">
                       <path fill-rule="evenodd" d="M8 2.748l-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z"/>
                   </svg>
                   <span class="text-dark mx-1">0</span>
               </button>
               
               <button class="btn btn-link">
                   <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-chat text-dark" fill="currentColor" xmlns="http://www.w3.org/2000/svg" style="font-size:25px;">
                       <path fill-rule="evenodd" d="M2.678 11.894a1 1 0 0 1 .287.801 10.97 10.97 0 0 1-.398 2c1.395-.323 2.247-.697 2.634-.893a1 1 0 0 1 .71-.074A8.06 8.06 0 0 0 8 14c3.996 0 7-2.807 7-6 0-3.192-3.004-6-7-6S1 4.808 1 8c0 1.468.617 2.83 1.678 3.894zm-.493 3.905a21.682 21.682 0 0 1-.713.129c-.2.032-.352-.176-.273-.362a9.68 9.68 0 0 0 .244-.637l.003-.01c.248-.72.45-1.548.524-2.319C.743 11.37 0 9.76 0 8c0-3.866 3.582-7 8-7s8 3.134 8 7-3.582 7-8 7a9.06 9.06 0 0 1-2.347-.306c-.52.263-1.639.742-3.468 1.105z"/>
                   </svg>
                   <span class="text-dark mx-1 align-text-middle">0</span>
               </button>
           </div>
           <div class="card-body p-0 px-1">
               <p class="card-text mb-1">${d.CONTENT }</p>
               <div class="d-flex justify-content-between align-items-center">
                   <small class="text-muted pl-1">
                   	<c:forEach var="h" items="${hashList}">
                   		<c:if test="${not empty h and (h.postNo eq d.DAILYNO )}">
                       		<a class="text-secondary bg-point" href="#">#<c:out value="${h.hashContent }"/></a>
                       	</c:if>
                       </c:forEach>  
                   </small>
               </div>
           </div>
       </div>
   </address>
 </c:forEach>
 <div class="mx-auto my-2">${pageBar }</div>
</c:if>