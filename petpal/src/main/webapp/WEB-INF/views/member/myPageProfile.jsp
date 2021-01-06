<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>

 <jsp:include page="/WEB-INF/views/common/commonLink.jsp" />

  <!-- myPageNav.jsp 연결 -->
  <jsp:include page="/WEB-INF/views/common/myPageNav.jsp" >
  	<jsp:param name="mpNav" value="profile"/>
  </jsp:include>
  <div class="row py-3 justify-content-between profileAll" style="min-height: 100vh;">
  <c:if test ="${member != null }"> 
    <div class="col-lg-4 rounded shadow-sm py-3" style=" height: 430px;">
    <!-- 프로필부분,사진,닉네임,팔로우,팔로잉, 좋아요, 적립금, -->
    	<div class="row d-flex flex-column align-items-center">
    		<p><c:out value="${member.NICKNAME }" /></p>
    		<c:choose>
		    	<c:when test="${not empty member.IMG }"><img src="${path }/resources/upload/member/profile/${member.IMG}" style="width:45%;"></c:when>
		    	<c:otherwise><img src="${path }/resources/upload/member/profile/avatar.webp" style="width:45%;"></c:otherwise>
	    	</c:choose>
	    	<p class="mt-2"><c:out value="${member.EMAIL }"/></p>
	    	<c:if test="${not empty member.INFO }">	 
	    		<p><c:out value="${member.INFO }"/></p>
	    	</c:if>   
		    
    	</div>
		<div style="width:100%; height:1px; background-color:#ced6e0;" class="my-3"></div>
    	<div class="row d-flex justify-content-around mt-4">
    		<input type="hidden" name="memberNo" value="${member.MEMBERNO }" class="memberNo" />
    		<div class="d-flex flex-column align-items-center">
    	 	 	<button type="button" class="text-dark likeBtn" style="background:none; border:none; outline:none;">좋아요</button><p><c:out value="${fav }" /></p>
    	 	 </div >
    	 	 <div class="d-flex flex-column align-items-center">
	   		 	<a href="#" class="text-dark">팔로우</a><p><c:out value="${follow }" /></p>
	   		 </div>
	   		 <div class="d-flex flex-column align-items-center">
	   		 	<a href="${path }/member/myPageShop.do" class="text-dark">포인트</a><p><c:out value="${member.POINT }" /></p>
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
          <a href="${path }/daily/moveDetail.do?dailyNo=${d.DAILYNO}"><img class="bd-placeholder-img mr-2 rounded" width="32" height="32" src="${path }/resources/upload/community/daily/${d.DAILYIMGNAME}" /></a>
          <div class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">
            <div class="d-flex justify-content-between align-items-center w-100">
              <strong class="text-gray-dark"><c:out value="${d.CONTENT }"/></strong>
   				<span><fmt:formatDate value="${d.ENROLLDATE }" pattern="yyyy/MM/dd"/></span>
            </div>
            <span class="d-block"><fmt:formatDate value="${d.DAILYDATE }" pattern="yyyy/MM/dd"/></span>
          </div>
        </div>
        
        </c:forEach>

         </c:when>
         
         <c:otherwise >
         	<a href="${path }/daily/moveWrite.do" class="d-block text-center mt-5 mb-4 text-muted ">글작성하기</a>
         </c:otherwise>
         </c:choose>
         
      </div>
      <div class="mb-3 pb-3 px-3 bg-white rounded shadow-sm">
        <h6 class="border-bottom border-gray pb-2 mb-0">노하우 <c:out default="0" value="${tipCnt }"/></h6>
       <c:choose>
         <c:when test="${not empty tList}">
        <c:forEach var="t" items="${tList }">      
        <div class="media text-muted pt-3">
          <a href="${path }/community/tipDetail.do?tipNo=${t.TIPNO}"><img class="bd-placeholder-img mr-2 rounded" width="32" height="32" src="${path }/resources/upload/tip/${t.MAINIMG}" /></a>
          <div class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">
            <div class="d-flex justify-content-between align-items-center w-100">
              <strong class="text-gray-dark"><c:out value="${t.TITLE }"/></strong>
			<span><fmt:formatDate value="${t.ENROLLDATE }" pattern="yyyy/MM/dd"/></span>
            </div>
            <span class="d-block"><c:out value="${t.CONTENT }"/></span>
          </div>
        </div>
        
        </c:forEach>

         </c:when>
         <c:otherwise >
         	<a href="${path }/community/tipWrite.do" class="d-block text-center mt-5 mb-4 text-muted ">글작성하기</a>
         </c:otherwise>
         </c:choose>
         
      </div>
      <div class="mb-3 pb-3 px-3 bg-white rounded shadow-sm">
        <h6 class="border-bottom border-gray pb-2 mb-0">후기 <c:out default="0" value="${placeCnt }"/></h6>
        
        <c:choose>
         <c:when test="${not empty pList}">
        <c:forEach var="p" items="${pList }">      
        <div class="media text-muted pt-3">
          <a href="${path }/place/movePlaceDetail.do?placeNo=${p.PLACENO}"><img class="bd-placeholder-img mr-2 rounded" width="32" height="32" src="${path }/resources/upload/place/${p.FILENAME}" /></a>
          <div class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">
            <div class="d-flex justify-content-between align-items-center w-100">
              <strong class="text-gray-dark"><c:out value="${p.TITLE }"/></strong>
			<span><fmt:formatDate value="${p.ENROLLDATE }" pattern="yyyy/MM/dd"/></span>
            </div>
            <span class="d-block"><c:out value="${p.CONTENT }"/></span>
          </div>
        </div>
        
        </c:forEach>

         </c:when>
         <c:otherwise >
         	<a href="${path }/place/movePlaceWrite.do" class="d-block text-center mt-5 mb-4 text-muted ">글작성하기</a>
         </c:otherwise>
         </c:choose>
        
      </div>

	
      <div class="mb-3 pb-3 px-3 bg-white rounded shadow-sm">
      	<div class="border-bottom border-gray pb-2 pt-3 mb-0 d-flex justify-content-between align-items-center" >
        <span >찾아주세요 <c:out default="0" value="${findCnt }"/></span>
        <c:if test="${not empty fList }">
        <a href="${path }/daily/moveWrite.do" class="text-muted">글작성하기</a>
        </c:if>
        </div>
        <c:choose>
         <c:when test="${not empty fList}">
        <c:forEach var="f" items="${fList }">      
        <div class="media text-muted pt-3">
          <a href="${path }/community/findDetail.do?findNo=${f.FINDNO}"><img class="bd-placeholder-img mr-2 rounded" width="32" height="32" src="${path }/resources/upload/find/${f.FILENAME}" /></a>
          <div class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">
            <div class="d-flex justify-content-between align-items-center w-100">
              <strong class="text-gray-dark"><c:out value="${f.TITLE }"/></strong>
       			<span><fmt:formatDate value="${f.ENROLLDATE }" pattern="yyyy/MM/dd"/></span>
            </div>
            <span class="d-block"><c:out value="${f.CONTENT }"/></span>
          </div>
        </div>
        
        </c:forEach>
        <!-- <small class="d-block text-right mt-3">
          <a href="#">더보기</a>
        </small> -->
         </c:when>
         <c:otherwise >
         	<a href="${path }/community/findWrite.do" class="d-block text-center mt-5 mb-4 text-muted ">글작성하기</a>
         </c:otherwise>
         </c:choose>
         
      </div>
     
  </div>
</div>
</main>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />
<script>
 $(function() {
	 $(".likeBtn").on("click", e => {
		 $.ajax({
			 url : "${path}/member/likeList.do",
			 data : {memberNo : $(".memberNo").val() },
			 dataType : "html",
			 success : data => {
				 console.log(data);
				  $(".profileAll").html(data);
			 }
			 
		 })
		 
	 })
 })

</script>
</body>

</html>