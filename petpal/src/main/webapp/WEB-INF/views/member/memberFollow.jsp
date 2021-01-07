<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/> 
<jsp:include page="/WEB-INF/views/common/commonLink.jsp" />

</head>
<style>
a{color:black;}	
a:hover{text-decoration:none;}

</style>
<body class="bg-white">
<jsp:include page="/WEB-INF/views/common/header.jsp" />
  
  <!-- Page Content -->
   <main role="main" style="min-height:100vh;" class="">  
   <input type="hidden" class="loginMember" value="${loginMember.memberNo }"/>    
   <input type="hidden" class="userNo" value="${member.memberNo }"/>
        <div class="container mt-5">
            <div class="row pt-5">
                <!--프로필-->
                <!-- <div class="col-12 col-lg-3"> -->
                <div class="d-block col-lg-3">
                  <div class="img-thumbnail px-5">
                      <div class="my-2">
	                      <c:if test="${not empty member.img}">                
	                      	<img src="${path }/resources/upload/member/profile/${member.img}" class="rounded col-lg-10 offset-lg-1 col-3">
	                      </c:if>
	                      <c:if test="${ empty member.img}">  
	                      	<img src="${path }/resources/upload/member/profile/avatar.webp" class="rounded col-lg-10 offset-lg-1 col-3">
	                      </c:if>     
                      </div>
                      <div>
                        <p class="h2 text-center pt-2"><strong><c:out value="${member.nickName }"/></strong></p>                      
                        <div class="text-center">
                          <span class="border-right pr-2" style="font-size:12px;"><a href="#" class="text-dark">팔로워 <strong><c:out value="${follower }"/></strong></a></span>
                          <span style="font-size:12px;"><a href="#" class="text-dark">팔로s잉 <strong><c:out value="${following}"/></strong></a></span>
                        </div>
                        <form>
                          <div class="form-group text-center mt-2">
                            <button class="btn bg-point" style="width:120px;">팔로우</button>
                          </div>
                        </form>
                        <p class="text-center"><c:out value="${member.info }"/></p>
                      </div>
                  </div>
                </div>
            </div>
        </div>
       
  </main>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>
</html>