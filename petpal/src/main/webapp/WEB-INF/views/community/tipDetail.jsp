<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/> 
 <jsp:include page="/WEB-INF/views/common/commonLink.jsp" />
 <script>
 	$(document).ready(function() {
 		$("#delete").on("click", e=>{
 			if(window.confirm("게시글을 삭제하시겠습니까?")){
				 location.href="${path}/community/tipDelete.do?tipNo=${mainList[0].TIPNO}";
 			}
 		});
 	});
 </script>
</head>
<body class="bg-white">
<jsp:include page="/WEB-INF/views/common/header.jsp" />
  
  <main role="main" style="min-height:100vh;">
   	<div class="album  bg-light">
   	<div class="container my-4 mt-lg-0">
		<div class="row ">
			<jsp:include page="/WEB-INF/views/common/communityNav.jsp" >
				<jsp:param value="tipDetail" name="comNav"/>
			</jsp:include>
		</div>
	</div>
      <div class="my-4 mt-lg-0">

       
	
		<c:forEach items="${imgList }" var="t">
			<c:if test="${not empty t.MAINIMG}">
        <!-- top 이미지 -->
        <img src="${path}/resources/upload/tip/${t.MAINIMG}" class="img-fluid" style="max-height: auto; height : 300px; width : 100%;">
        </c:if>
		</c:forEach>
		
        <div class="container">
          <div class="row ">

            <!-- 왼쪽 -->
            <div class="col-lg-9 col-sm-12">
              <div class="container" id="title">
                <div class="form-inline container mt-5 mb-5">
                	<h5><c:out value="${mainList[0].CATEGORY }"/></h5>
                	<small class="ml-3">#해시태그</small>
                	<small class="ml-3">#해시태그</small>
                	<small class="ml-3">#해시태그</small>
	                
	                <c:if test="${memberNo eq mainList[0].MEMBERNO }">
	                	<div class="dropdown ml-auto">
	                		<div href="#" id="imageDropdown" data-toggle="dropdown">
	                			<svg width="2em" height="2em" viewBox="0 0 16 16" class="bi bi-three-dots-vertical" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
	                				<path fill-rule="evenodd" d="M9.5 13a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0zm0-5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0zm0-5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0z"/>
		                		</svg>
	      					</div>
	      					<c:forEach items="${imgList }" var="t">
							    <div class="dropdown-menu dropdown-menu-right">
								    <button class="dropdown-item" type="button" onclick="location.replace('${path}/community/tipUpdate.do?tipNo=${t.TIPNO}')">수정하기</button>
								    <button class="dropdown-item" type="button" id="delete">삭제하기</button>
							  	</div>
						  	</c:forEach>
	    				</div>
    				</c:if>
                </div>

                <div class="container">
                	<c:forEach items="${mainList }" var="t">
                  <h1><c:out value="${t.TITLE }"/></h1>
                  <div class="form-inline mt-5 mb-5">
                    <h5><c:out value="${t.MEMBERNO }"/></h5>
                    <small class="ml-5"><c:out value="${t.ENROLLDATE }"/></small>
                    <button class="btn btn-sm btn-outline-secondary ml-auto">팔로우</button>
                    <button class="btn btn-sm btn-outline-secondary ml-3">신고하기</button>
                  </div>
                  </c:forEach>
                  <div>
                  <c:forEach items="${mainList }" var="t">
                    <div class="mt-5 mb-5" style="white-space:pre-line;">
                    	<c:out value="${t.CONTENT1 }"/>
                    </div>
                    </c:forEach>
					
					<c:forEach items="${imgList }" var="t">
					<c:if test="${not empty t.CONTENTIMG }">
						<div>
						<img src="${path }/resources/upload/tip/${t.CONTENTIMG}" width="100%" height="400px">
						</div>
						<div class="mb-5" style="white-space:pre-line;">
						<c:out value="${t.CONTENT}"/>
						</div>
                    </c:if>
                    </c:forEach>
						
						<c:forEach items="${mainList }" var="t">
						<c:if test="${not empty t.CONTENT2 }">
	                    	<div class="mb-5" style="white-space:pre-line;">
	                    		<c:out value="${t.CONTENT2 }"/>
	                    	</div>
	                    </c:if>
	                    </c:forEach>
					
                    <div class="nav navbar-nav d-lg-none d-inline">
                      <button class="btn btn-outline-dark mb-3"><svg width="1em" height="1em" viewBox="0 0 16 16"
                            class="bi bi-heart" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                            <path fill-rule="evenodd"
                              d="M8 2.748l-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z" />
                          </svg></button>
                      <button class="btn btn-outline-dark mb-3"><svg width="1em" height="1em" viewBox="0 0 16 16"
                            class="bi bi-bookmark" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                            <path fill-rule="evenodd"
                              d="M2 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.777.416L8 13.101l-5.223 2.815A.5.5 0 0 1 2 15.5V2zm2-1a1 1 0 0 0-1 1v12.566l4.723-2.482a.5.5 0 0 1 .554 0L13 14.566V2a1 1 0 0 0-1-1H4z" />
                          </svg></button>
                    </div>


                   <!-- 댓글 -->
				                 <div id="commentContainer">

                  </div>
                </div>
              </div>
            </div>

            
          </div>
            <!-- 오른쪽 스티키-->
		        <div class="col-3 d-none d-lg-block sticky-top" style="top:200px; height:100px; margin-top:200px;">
		               <button type="button" class="btn btn-link mb-3">
		                  <svg width="1em" height="1em" viewBox="0 0 16 16"
		                   class="bi bi-heart" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
		                   <path fill-rule="evenodd" d="M8 2.748l-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z" />
		                  </svg>
		                  <span>00</span>
		                </button>
		                <button type="button" class="btn btn-link mb-3">
		                	<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-chat" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                            <path fill-rule="evenodd" d="M2.678 11.894a1 1 0 0 1 .287.801 10.97 10.97 0 0 1-.398 2c1.395-.323 2.247-.697 2.634-.893a1 1 0 0 1 .71-.074A8.06 8.06 0 0 0 8 14c3.996 0 7-2.807 7-6 0-3.192-3.004-6-7-6S1 4.808 1 8c0 1.468.617 2.83 1.678 3.894zm-.493 3.905a21.682 21.682 0 0 1-.713.129c-.2.032-.352-.176-.273-.362a9.68 9.68 0 0 0 .244-.637l.003-.01c.248-.72.45-1.548.524-2.319C.743 11.37 0 9.76 0 8c0-3.866 3.582-7 8-7s8 3.134 8 7-3.582 7-8 7a9.06 9.06 0 0 1-2.347-.306c-.52.263-1.639.742-3.468 1.105z"/>
                        	</svg>
		                  <span>00</span>
		                </button>
		               <div>
		                 <div class="row d-flex justify-content-between mb-2"> 
		                    <a href="${path }/user/moveUserInfo.do?memberNo=${daily.MEMBERNO}" class="col-7 p-0 d-flex align-items-center ml-2">
		                      <div class="col-3 p-0">
			                        <c:if test="${not empty daily.IMG }">                
	                                	<img src="${path }/resources/upload/member/profile/${daily.IMG}" class="rounded" style="width:40px; height: 40px;">
	                                </c:if>
	                                <c:if test="${ empty daily.IMG }">  
	                                	<img src="${path }/resources/upload/member/profile/avatar.webp" class="rounded" style="width:40px; height: 40px;">
	                                </c:if>
		                      </div>
		                      <strong><span class="col-3 p-0 ml-2 align-middle"><c:out value="${daily.NICKNAME }"/></span></strong>
		                    </a>
		                    <button type="button" class="followBtn btn btn-sm bg-point col-4 col-xl-3 mr-2">팔로우</button>
		                 </div>
		                 <div class="mt-3">
		                   <pre class="my-1 "><c:out value="${daily.CONTENT }"/></pre>
		                   <div>
		                     <c:forEach var="h" items="${hashList}">
                           		<a href="#">#<c:out value="${h.hashContent }"/></a>				                                    	
                             </c:forEach>
		                   </div>
		                 </div>
		                 <div class="d-flex justify-content-end align-items-center">
		                   <span class="text-secondary" style="font-size:14px;"><c:out value="${daily.ENROLLDATE }"/></span>
		                   <button type="button" class="btn btn-link text-secondary" style="font-size: 14px;" onclick="fn_claimModal('${daily.DAILYNO}');">신고</button>
		                 </div>
		               </div>
		               <c:if test="${(loginMember.memberNo eq daily.MEMBERNO) or (loginMember.memberNo eq '63') }">
			               <div class="d-flex justify-content-end mr-1">
			               		<c:if test="${loginMember.memberNo eq daily.MEMBERNO }">
			                  		<button type="button" onclick="location.replace('${path}/daily/moveUpdate.do?dailyNo=${daily.DAILYNO }');" class="dailyEdit btn btn-link btn-outline-secondary px-2 py-0 mr-2 text-black-50">수정</button>
			                  	</c:if>
			                  	<button type="button" onclick="location.replace('${path}/daily/deleteDaily.do?dailyNo=${daily.DAILYNO }');" class="dailyDelete btn btn-link btn-outline-secondary px-2 py-0 text-black-50">삭제</button>
			               </div>
		               </c:if>
		         </div><!-- 스티키 -->
        </div>
      </div>
    </div>
  </main>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>

</html>