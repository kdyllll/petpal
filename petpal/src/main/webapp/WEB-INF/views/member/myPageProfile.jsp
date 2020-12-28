<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>

 <jsp:include page="/WEB-INF/views/common/commonLink.jsp" />

  <!-- myPageNav.jsp 연결 -->
  <jsp:include page="/WEB-INF/views/common/myPageNav.jsp" />
  <div class="row py-3 justify-content-between">
  <c:if test ="${member != null }"> 
    <div class="col-lg-4 rounded shadow-sm py-3" style=" height: 430px;">
    <!-- 프로필부분,사진,닉네임,팔로우,팔로잉, 좋아요, 적립금, -->
    	<div class="row d-flex flex-column align-items-center">
    		<p><c:out value="${member.NICKNAME }" /></p>
    		<c:choose>
		    	<c:when test="${not empty member.IMG }"><img src="${path }/resources/upload/member/profile/${member.IMG}" style="width:45%;"></c:when>
		    	<c:otherwise><img src="${path }/resources/upload/member/profile/avatar.webp"></c:otherwise>
	    	</c:choose>
	    	<p class="mt-2"><c:out value="${member.EMAIL }"/></p>
	    	<c:if test="${not empty member.INFO }">	 
	    		<p><c:out value="${member.INFO }"/></p>
	    	</c:if>   
		    
    	</div>
		<div style="width:100%; height:1px; background-color:#ced6e0;" class="my-3"></div>
    	<div class="row d-flex justify-content-around mt-4">
    		<div class="d-flex flex-column align-items-center">
    	 	 	<a href="#">좋아요</a><p><c:out value="${fav }" /></p>
    	 	 </div >
    	 	 <div class="d-flex flex-column align-items-center">
	   		 	<a href="#">팔로우</a><p><c:out value="${follow }" /></p>
	   		 </div>
	   		 <div class="d-flex flex-column align-items-center">
	   		 	<span>포인트</span><p><c:out value="${member.POINT }" /></p>
	   		 </div>
    	</div>  
    </div>
     </c:if>
    <div class="col-lg-8 pr-0">
      <div class="mb-3 pb-3 px-3 bg-white rounded shadow-sm">
        <h6 class="border-bottom border-gray pb-2 mb-0">일상 <c:out default="0" value="${dailyCnt }"/></h6>
        <c:choose>
         <c:when test="${not empty dList}">
        <c:forEach var="d" items="${dList }">      
        <div class="media text-muted pt-3">
          <a href="#"><img class="bd-placeholder-img mr-2 rounded" width="32" height="32" src="${path }/resources/upload/daily/${d.FILENAME}" /></a>
          <div class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">
            <div class="d-flex justify-content-between align-items-center w-100">
              <strong class="text-gray-dark"><c:out value="${d.CONTENT }"/></strong>
              <a href="#">Follow</a>
            </div>
            <span class="d-block"><fmt:formatDate value="${d.DAILYDATE }" pattern="yyyy/MM/dd"/></span>
          </div>
        </div>
        
        </c:forEach>
        <small class="d-block text-right mt-3">
          <a href="#">더보기</a>
        </small>
         </c:when>
         <c:otherwise >
         	<a href="#" class="d-block text-center mt-5 mb-4 text-muted ">글작성하기</a>
         </c:otherwise>
         </c:choose>
      </div>
      <div class="mb-3 pb-3 px-3 bg-white rounded shadow-sm">
        <h6 class="border-bottom border-gray pb-2 mb-0">노하우 <c:out default="0" value="${tipCnt }"/></h6>
       <c:choose>
         <c:when test="${not empty tList}">
        <c:forEach var="t" items="${tList }">      
        <div class="media text-muted pt-3">
          <a href="#"><img class="bd-placeholder-img mr-2 rounded" width="32" height="32" src="${path }/resources/upload/tip/${t.MAINIMG}" /></a>
          <div class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">
            <div class="d-flex justify-content-between align-items-center w-100">
              <strong class="text-gray-dark"><c:out value="${t.TITLE }"/></strong>
              <a href="#">Follow</a>
            </div>
            <span class="d-block"><c:out value="${t.CONTENT }"/></span>
          </div>
        </div>
        
        </c:forEach>
        <small class="d-block text-right mt-3">
          <a href="#">더보기</a>
        </small>
         </c:when>
         <c:otherwise >
         	<a href="#" class="d-block text-center mt-5 mb-4 text-muted ">글작성하기</a>
         </c:otherwise>
         </c:choose>
      </div>
      <div class="mb-3 pb-3 px-3 bg-white rounded shadow-sm">
        <h6 class="border-bottom border-gray pb-2 mb-0">후기 <c:out default="0" value="${placeCnt }"/></h6>
        <c:choose>
         <c:when test="${not empty pList}">
        <c:forEach var="p" items="${pList }">      
        <div class="media text-muted pt-3">
          <a href="#"><img class="bd-placeholder-img mr-2 rounded" width="32" height="32" src="${path }/resources/upload/place/${p.FILENAME}" /></a>
          <div class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">
            <div class="d-flex justify-content-between align-items-center w-100">
              <strong class="text-gray-dark"><c:out value="${p.TITLE }"/></strong>
              <a href="#">Follow</a>
            </div>
            <span class="d-block"><c:out value="${p.CONTENT }"/></span>
          </div>
        </div>
        
        </c:forEach>
        <small class="d-block text-right mt-3">
          <a href="#">더보기</a>
        </small>
         </c:when>
         <c:otherwise >
         	<a href="#" class="d-block text-center mt-5 mb-4 text-muted ">글작성하기</a>
         </c:otherwise>
         </c:choose>
      </div>

	
      <div class="mb-3 pb-3 px-3 bg-white rounded shadow-sm">
        <h6 class="border-bottom border-gray pb-2 mb-0">찾아주세요 <c:out default="0" value="${findCnt }"/></h6>
        <c:choose>
         <c:when test="${not empty fList}">
        <c:forEach var="f" items="${fList }">      
        <div class="media text-muted pt-3">
          <a href="#"><img class="bd-placeholder-img mr-2 rounded" width="32" height="32" src="${path }/resources/upload/find/${f.FILENAME}" /></a>
          <div class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">
            <div class="d-flex justify-content-between align-items-center w-100">
              <strong class="text-gray-dark"><c:out value="${f.TITLE }"/></strong>
              <a href="#">Follow</a>
            </div>
            <span class="d-block"><c:out value="${f.CONTENT }"/></span>
          </div>
        </div>
        
        </c:forEach>
        <small class="d-block text-right mt-3">
          <a href="#">더보기</a>
        </small>
         </c:when>
         <c:otherwise >
         	<a href="#" class="d-block text-center mt-5 mb-4 text-muted ">글작성하기</a>
         </c:otherwise>
         </c:choose>
      </div>
     
  </div>
</div>
</main>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>

</html>