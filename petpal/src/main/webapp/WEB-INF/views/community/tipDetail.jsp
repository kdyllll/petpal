<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/> 
 <jsp:include page="/WEB-INF/views/common/commonLink.jsp" />
</head>
<body class="bg-white">
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<jsp:include page="/WEB-INF/views/community/claim.jsp"/>
  
  <main role="main" style="min-height:100vh;">
   	<div class="album  bg-white">
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
                	
                	<c:forEach items="${mainList }" var="t">
	                	<span class="text-muted ml-3 mr-2"> 
							<c:forEach var="h" items="${t.hashList}">
	                             		<c:if test="${not empty h}">
	                                 		<a href="${path }/community/hashSearch.do?hashtag=${h}" class="text-secondary bg-point mr-2">#<c:out value="${h }"/></a>
	                                 	</c:if>
	                                 </c:forEach>
						</span>
	                </c:forEach>
                </div>

                <div class="container">
                	<c:forEach items="${mainList }" var="t">
	                  <h1><c:out value="${t.TITLE }"/></h1>
	                  <div class="form-inline mt-5 mb-5">
	                  <a href="${path }/user/moveUserInfo.do?memberNo=${mainList[0].MEMBERNO}" class="col-7 p-0 d-flex align-items-center ml-2">
	                    <h5><c:out value="${member[0].NICKNAME }"/></h5>
	                  </a>
	                  </div>
	              	</c:forEach>
                  <div>
                  <div class="ml-2">
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
					</div>
                    
                    <div class="d-lg-none mt-5">
	                    <div class="row d-flex justify-content-between">
	                      <div class="row ml-3 d-flex align-items-center">
		                      <a href="${path }/user/moveUserInfo.do?memberNo=${mainList[0].MEMBERNO}" class="text-black p-0 d-flex align-items-center ml-2">
		                    	<input type="hidden" class="loginMember" value="${memberNo}" />
		                      <div class="col-5 p-0">
			                        <c:if test="${not empty member[0].IMG }">         
	                                	<img src="${path }/resources/upload/member/profile/${member[0].IMG}" class="rounded" style="width:40px; height: 40px;">
	                                </c:if>
	                                <c:if test="${ empty member[0].IMG }">  
	                                	<img src="${path }/resources/upload/member/profile/avatar.webp" class="rounded" style="width:40px; height: 40px;">
	                                </c:if>
		                      </div>
		                      <strong><span class="text-black p-0 ml-2 align-middle"><c:out value="${member[0].NICKNAME }"/></span></strong>
		                    </a>
								
								<c:if test="${memberNo ne mainList[0].MEMBERNO }">
		                    	<button type="button" class="follow followBtn btn btn-sm bg-point mr-2 ml-3">팔로우
		                    		<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-person" viewBox="0 0 16 16">
									  <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z"/>
									</svg>
								</button>
		                    	<button type="button" class="following followBtn btn btn-sm mr-2 ml-3"  style="background-color:#dfdfdf;">팔로워
									<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-person-check-fill" viewBox="0 0 16 16">
									  <path fill-rule="evenodd" d="M15.854 5.146a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 0 1 .708-.708L12.5 7.793l2.646-2.647a.5.5 0 0 1 .708 0z"/>
									  <path d="M1 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
									</svg>
								</button>
		                    </c:if>
                       		  
                     		  </div>
                     		  
                     		  <div class="mr-4 d-flex">
		                        <div  class="d-flex align-items-center">
						<c:if test="${not empty like }">				
								<button type="button" class="btn d-none" >
									<svg xmlns="http://www.w3.org/2000/svg" width="1.2em" height="1.5em" fill="currentColor" class="bi bi-suit-heart binHeart text-danger" viewBox="0 0 16 16">
									  <path d="M8 6.236l-.894-1.789c-.222-.443-.607-1.08-1.152-1.595C5.418 2.345 4.776 2 4 2 2.324 2 1 3.326 1 4.92c0 1.211.554 2.066 1.868 3.37.337.334.721.695 1.146 1.093C5.122 10.423 6.5 11.717 8 13.447c1.5-1.73 2.878-3.024 3.986-4.064.425-.398.81-.76 1.146-1.093C14.446 6.986 15 6.131 15 4.92 15 3.326 13.676 2 12 2c-.777 0-1.418.345-1.954.852-.545.515-.93 1.152-1.152 1.595L8 6.236zm.392 8.292a.513.513 0 0 1-.784 0c-1.601-1.902-3.05-3.262-4.243-4.381C1.3 8.208 0 6.989 0 4.92 0 2.755 1.79 1 4 1c1.6 0 2.719 1.05 3.404 2.008.26.365.458.716.596.992a7.55 7.55 0 0 1 .596-.992C9.281 2.049 10.4 1 12 1c2.21 0 4 1.755 4 3.92 0 2.069-1.3 3.288-3.365 5.227-1.193 1.12-2.642 2.48-4.243 4.38z"/>
									</svg>
								</button>
								<button type="button" class="btn " >
									<svg xmlns="http://www.w3.org/2000/svg" width="1.2em" height="1.5em" fill="currentColor" class="bi bi-suit-heart-fill text-danger" viewBox="0 0 16 16">
									  <path class="fillHeart" d="M4 1c2.21 0 4 1.755 4 3.92C8 2.755 9.79 1 12 1s4 1.755 4 3.92c0 3.263-3.234 4.414-7.608 9.608a.513.513 0 0 1-.784 0C3.234 9.334 0 8.183 0 4.92 0 2.755 1.79 1 4 1z"/>
									</svg>
								</button>
						</c:if>
						<c:if test="${empty like }">				
								<button type="button" class="btn " >
									<svg xmlns="http://www.w3.org/2000/svg" width="1.2em" height="1.5em" fill="currentColor" class="bi bi-suit-heart binHeart text-danger" viewBox="0 0 16 16">
									  <path d="M8 6.236l-.894-1.789c-.222-.443-.607-1.08-1.152-1.595C5.418 2.345 4.776 2 4 2 2.324 2 1 3.326 1 4.92c0 1.211.554 2.066 1.868 3.37.337.334.721.695 1.146 1.093C5.122 10.423 6.5 11.717 8 13.447c1.5-1.73 2.878-3.024 3.986-4.064.425-.398.81-.76 1.146-1.093C14.446 6.986 15 6.131 15 4.92 15 3.326 13.676 2 12 2c-.777 0-1.418.345-1.954.852-.545.515-.93 1.152-1.152 1.595L8 6.236zm.392 8.292a.513.513 0 0 1-.784 0c-1.601-1.902-3.05-3.262-4.243-4.381C1.3 8.208 0 6.989 0 4.92 0 2.755 1.79 1 4 1c1.6 0 2.719 1.05 3.404 2.008.26.365.458.716.596.992a7.55 7.55 0 0 1 .596-.992C9.281 2.049 10.4 1 12 1c2.21 0 4 1.755 4 3.92 0 2.069-1.3 3.288-3.365 5.227-1.193 1.12-2.642 2.48-4.243 4.38z"/>
									</svg>
								</button>
								<button type="button" class="btn d-none" >
									<svg xmlns="http://www.w3.org/2000/svg" width="1.2em" height="1.5em" fill="currentColor" class="bi bi-suit-heart-fill text-danger" viewBox="0 0 16 16">
									  <path class="fillHeart" d="M4 1c2.21 0 4 1.755 4 3.92C8 2.755 9.79 1 12 1s4 1.755 4 3.92c0 3.263-3.234 4.414-7.608 9.608a.513.513 0 0 1-.784 0C3.234 9.334 0 8.183 0 4.92 0 2.755 1.79 1 4 1z"/>
									</svg>
								</button>
						</c:if>
							<!-- 좋아요 수 -->
							<span class="likeCount"><c:out value="${likeCount }"/></span>
						</div>
                     		  
						<div class="d-flex align-items-center ml-2">
							<button type="button" class="btn btn-link">
								<svg width="1.2em" height="1.2em" viewBox="0 0 16 16" class="bi bi-chat" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
		                            <path fill-rule="evenodd" d="M2.678 11.894a1 1 0 0 1 .287.801 10.97 10.97 0 0 1-.398 2c1.395-.323 2.247-.697 2.634-.893a1 1 0 0 1 .71-.074A8.06 8.06 0 0 0 8 14c3.996 0 7-2.807 7-6 0-3.192-3.004-6-7-6S1 4.808 1 8c0 1.468.617 2.83 1.678 3.894zm-.493 3.905a21.682 21.682 0 0 1-.713.129c-.2.032-.352-.176-.273-.362a9.68 9.68 0 0 0 .244-.637l.003-.01c.248-.72.45-1.548.524-2.319C.743 11.37 0 9.76 0 8c0-3.866 3.582-7 8-7s8 3.134 8 7-3.582 7-8 7a9.06 9.06 0 0 1-2.347-.306c-.52.263-1.639.742-3.468 1.105z" />
	                        	</svg>
							</button>
							<!-- 댓글 수 -->
							<span class="commentCount"><c:out value="${commentCount }"/></span>
						</div>
						</div>
                     		   
                     		   
                   		 </div> <!-- row d-flex -->
                   		 <div class="ml-3 my-2">
                     			<pre class="m-0"><c:out value="${member[0].CONTENT }"/></pre>
		                      <div>
	                       		<c:forEach var="h" items="${hashList}">
                                   		<a href="${path }/community/hashSearch.do?hashtag=${h}">#<c:out value="${h.hashContent }"/></a>				                                    	
                                   </c:forEach>
		                      </div>
                   		 </div>

                    		<c:choose>
	                    		<c:when test="${(loginMember.memberNo eq mainList[0].MEMBERNO) or (loginMember.memberNo eq '63') }">
			                     <div class="d-flex justify-content-between align-items-center">
				                     	<div>
				                     		<c:if test="${loginMember.memberNo eq mainList[0].MEMBERNO }">
							               <div class="d-flex justify-content-end">
												    <button type="button" class="btn btn-link btn-outline-secondary px-2 py-0 mr-2 text-black-50" onclick="location.href='${path}/community/tipUpdate.do?tipNo=${mainList[0].TIPNO}'">수정</button>
							                  	<button type="button" class="btn btn-link btn-outline-secondary px-2 py-0 text-black-50 delete">삭제</button>
							               </div>
						               </c:if>
						          		</div>
									    <div>
					                      <span class="text-secondary"><c:out value="${mainList[0].TIPDATE }"/></span>
					                      <c:if test="${loginMember.memberNo ne mainList[0].MEMBERNO }">
					                      	<button type="button" class="btn btn-link text-black-50 p-0 ml-2"  onclick="fn_claimModal('${mainList[0].TIPNO}');">신고</button>
					                      </c:if> 
				                     	</div>
				                   </div>
						        </c:when>
						        <c:otherwise>
						        	<div class="d-flex justify-content-end align-items-center">
							        	<div>
					                      <span class="text-secondary"><c:out value="${mainList[0].TIPDATE }"/></span>
					                      <button type="button" class="btn btn-link text-black-50 p-0 ml-2"  onclick="fn_claimModal('${mainList[0].TIPNO}');">신고</button> 
				                     	</div>
				                     </div>
						        </c:otherwise>
				        	</c:choose>
	                     	<!--  -->
	                     </div>
	                     
                   
                   <!-- 댓글 -->
                </div>
					<div id="commentContainer"></div>
					<input type="hidden" class="writeMember" value="${mainList[0].MEMBERNO }"/>
              </div>
            </div>

            
          </div>
            <!-- 오른쪽 스티키-->
		        <div class="col-3 d-none d-lg-block sticky-top" style="top:200px; height:100px; margin-top:200px;">
		              <div class="d-flex mb-3">
						<div  class="d-flex align-items-center">
						<c:if test="${not empty like }">				
								<button type="button" class="btn d-none" >
									<svg xmlns="http://www.w3.org/2000/svg" width="1.2em" height="1.5em" fill="currentColor" class="bi bi-suit-heart binHeart text-danger" viewBox="0 0 16 16">
									  <path d="M8 6.236l-.894-1.789c-.222-.443-.607-1.08-1.152-1.595C5.418 2.345 4.776 2 4 2 2.324 2 1 3.326 1 4.92c0 1.211.554 2.066 1.868 3.37.337.334.721.695 1.146 1.093C5.122 10.423 6.5 11.717 8 13.447c1.5-1.73 2.878-3.024 3.986-4.064.425-.398.81-.76 1.146-1.093C14.446 6.986 15 6.131 15 4.92 15 3.326 13.676 2 12 2c-.777 0-1.418.345-1.954.852-.545.515-.93 1.152-1.152 1.595L8 6.236zm.392 8.292a.513.513 0 0 1-.784 0c-1.601-1.902-3.05-3.262-4.243-4.381C1.3 8.208 0 6.989 0 4.92 0 2.755 1.79 1 4 1c1.6 0 2.719 1.05 3.404 2.008.26.365.458.716.596.992a7.55 7.55 0 0 1 .596-.992C9.281 2.049 10.4 1 12 1c2.21 0 4 1.755 4 3.92 0 2.069-1.3 3.288-3.365 5.227-1.193 1.12-2.642 2.48-4.243 4.38z"/>
									</svg>
								</button>
								<button type="button" class="btn " >
									<svg xmlns="http://www.w3.org/2000/svg" width="1.2em" height="1.5em" fill="currentColor" class="bi bi-suit-heart-fill text-danger" viewBox="0 0 16 16">
									  <path class="fillHeart" d="M4 1c2.21 0 4 1.755 4 3.92C8 2.755 9.79 1 12 1s4 1.755 4 3.92c0 3.263-3.234 4.414-7.608 9.608a.513.513 0 0 1-.784 0C3.234 9.334 0 8.183 0 4.92 0 2.755 1.79 1 4 1z"/>
									</svg>
								</button>
						</c:if>
						<c:if test="${empty like }">				
								<button type="button" class="btn " >
									<svg xmlns="http://www.w3.org/2000/svg" width="1.2em" height="1.5em" fill="currentColor" class="bi bi-suit-heart binHeart text-danger" viewBox="0 0 16 16">
									  <path d="M8 6.236l-.894-1.789c-.222-.443-.607-1.08-1.152-1.595C5.418 2.345 4.776 2 4 2 2.324 2 1 3.326 1 4.92c0 1.211.554 2.066 1.868 3.37.337.334.721.695 1.146 1.093C5.122 10.423 6.5 11.717 8 13.447c1.5-1.73 2.878-3.024 3.986-4.064.425-.398.81-.76 1.146-1.093C14.446 6.986 15 6.131 15 4.92 15 3.326 13.676 2 12 2c-.777 0-1.418.345-1.954.852-.545.515-.93 1.152-1.152 1.595L8 6.236zm.392 8.292a.513.513 0 0 1-.784 0c-1.601-1.902-3.05-3.262-4.243-4.381C1.3 8.208 0 6.989 0 4.92 0 2.755 1.79 1 4 1c1.6 0 2.719 1.05 3.404 2.008.26.365.458.716.596.992a7.55 7.55 0 0 1 .596-.992C9.281 2.049 10.4 1 12 1c2.21 0 4 1.755 4 3.92 0 2.069-1.3 3.288-3.365 5.227-1.193 1.12-2.642 2.48-4.243 4.38z"/>
									</svg>
								</button>
								<button type="button" class="btn d-none" >
									<svg xmlns="http://www.w3.org/2000/svg" width="1.2em" height="1.5em" fill="currentColor" class="bi bi-suit-heart-fill text-danger" viewBox="0 0 16 16">
									  <path class="fillHeart" d="M4 1c2.21 0 4 1.755 4 3.92C8 2.755 9.79 1 12 1s4 1.755 4 3.92c0 3.263-3.234 4.414-7.608 9.608a.513.513 0 0 1-.784 0C3.234 9.334 0 8.183 0 4.92 0 2.755 1.79 1 4 1z"/>
									</svg>
								</button>
						</c:if>
							<!-- 좋아요 수 -->
							<span class="likeCount"><c:out value="${likeCount }"/></span>
						</div>
						<div class="d-flex align-items-center ml-2">
							<button type="button" class="btn btn-link">
								<svg width="1.2em" height="1.2em" viewBox="0 0 16 16" class="bi bi-chat" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
		                            <path fill-rule="evenodd" d="M2.678 11.894a1 1 0 0 1 .287.801 10.97 10.97 0 0 1-.398 2c1.395-.323 2.247-.697 2.634-.893a1 1 0 0 1 .71-.074A8.06 8.06 0 0 0 8 14c3.996 0 7-2.807 7-6 0-3.192-3.004-6-7-6S1 4.808 1 8c0 1.468.617 2.83 1.678 3.894zm-.493 3.905a21.682 21.682 0 0 1-.713.129c-.2.032-.352-.176-.273-.362a9.68 9.68 0 0 0 .244-.637l.003-.01c.248-.72.45-1.548.524-2.319C.743 11.37 0 9.76 0 8c0-3.866 3.582-7 8-7s8 3.134 8 7-3.582 7-8 7a9.06 9.06 0 0 1-2.347-.306c-.52.263-1.639.742-3.468 1.105z" />
	                        	</svg>
							</button>
							<!-- 댓글 수 -->
							<span class="commentCount"><c:out value="${commentCount }"/></span>
						</div>
					</div>
		                 <div class="row d-flex justify-content-between mb-2"> 
		                    <a href="${path }/user/moveUserInfo.do?memberNo=${mainList[0].MEMBERNO}" class="col-7 p-0 d-flex align-items-center ml-2">
		                    	<input type="hidden" class="loginMember" value="${memberNo}" />
		                      <div class="col-3 p-0">
			                        <c:if test="${not empty member[0].IMG }">         
	                                	<img src="${path }/resources/upload/member/profile/${member[0].IMG}" class="rounded" style="width:40px; height: 40px;">
	                                </c:if>
	                                <c:if test="${ empty member[0].IMG }">  
	                                	<img src="${path }/resources/upload/member/profile/avatar.webp" class="rounded" style="width:40px; height: 40px;">
	                                </c:if>
		                      </div>
		                      <strong><span class="col-3 p-0 ml-2 align-middle"><c:out value="${member[0].NICKNAME }"/></span></strong>
		                    </a>
		                    <c:if test="${loginMember.memberNo ne mainList[0].MEMBERNO }">
		                    	<button type="button" class="follow followBtn btn btn-sm bg-point col-4 col-xl-4 mr-2">팔로우
		                    		<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-person" viewBox="0 0 16 16">
									  <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z"/>
									</svg>
								</button>
		                    	<button type="button" class="following followBtn btn btn-sm col-4 col-xl-4 mr-2"  style="background-color:#dfdfdf;">팔로워
									<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-person-check-fill" viewBox="0 0 16 16">
									  <path fill-rule="evenodd" d="M15.854 5.146a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 0 1 .708-.708L12.5 7.793l2.646-2.647a.5.5 0 0 1 .708 0z"/>
									  <path d="M1 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
									</svg>
								</button>
		                    </c:if>
		                 </div>
		                 <div class="d-flex justify-content-end align-items-center">
		                   <span class="text-secondary" style="font-size:14px;"><c:out value="${mainList[0].TIPDATE }"/></span>
		                   <c:if test="${loginMember.memberNo ne mainList[0].MEMBERNO }">
		                   		<button type="button" class="btn btn-link text-secondary" style="font-size: 14px;" onclick="fn_claimModal('${mainList[0].TIPNO}');">신고</button>
		                   </c:if>
		                 </div>
		               <c:if test="${loginMember.memberNo eq mainList[0].MEMBERNO }">
			               <div class="d-flex justify-content-end mr-1">
								    <button type="button" class="btn btn-link btn-outline-secondary px-2 py-0 mr-2 text-black-50" onclick="location.href='${path}/community/tipUpdate.do?tipNo=${mainList[0].TIPNO}'">수정</button>
			                  	<button type="button" class="btn btn-link btn-outline-secondary px-2 py-0 text-black-50 delete">삭제</button>
			               </div>
		               </c:if>
		         </div><!-- 스티키 -->
		         
	               			</div>
	               			
		         <div class="loginModal"></div>
        </div>
        <input type="hidden" class="tipNo" value="${mainList[0].TIPNO }"> 
      </div>
    </div>
  </main>
  	<div class="pdtModal"></div>
	<jsp:include page="/WEB-INF/views/community/claim.jsp"/>
  <script>
  	let tipNo = $(".tipNo").val();
	let loginMember=$(".loginMember").val();
	commentAjax();
	
 	$(document).ready(function() {
 		$(".delete").on("click", e=>{
 			if(window.confirm("게시글을 삭제하시겠습니까?")){
				 location.href="${path}/community/tipDelete.do?tipNo=${mainList[0].TIPNO}";
 			}
 		});
 	});
 	
 	$(".binHeart").on("click" , e => {
 		if(loginMember==""){//로그인 안되어있다면
 			loginModal();
 		}else {//댓글 내용이 없으면
 			$(e.target).parent().addClass("d-none");
 			$(e.target).parent().next().removeClass("d-none");
 			$.ajax({
 		        url:"${path}/tip/insertLike.do",
 		        data:{tipNo : tipNo},
 		        success: (data) => {
 		       	 console.log(data); 
 		        }
 			})
 			$(".likeCount").text(Number(Number($(".likeCount").html()) + 1));
 		} 
 	})

 	$(".fillHeart").on("click" , e => {
 		if(loginMember==""){//로그인 안되어있다면
 			loginModal();
 		}else {//댓글 내용이 없으면
 			$(e.target).parent().parent().addClass("d-none");
 			$(e.target).parent().parent().prev().removeClass("d-none");
 			$.ajax({
 				async: false,
 		        url:"${path}/tip/deleteLike.do",
 		        data:{tipNo : tipNo},
 		        success: (data) => {
 		       	 console.log(data); 
 		        }
 		     })
 		    $(".likeCount").text(Number(Number($(".likeCount").html()) - 1));
 		}
 	})
 	
	//로그인 모달
	function loginModal(){
		$.ajax({
			async: false,
			url: "${path}/login/moveLogin.do",
			dataType:"html",
			success:(data) => {
				$(".loginModal").html(data);	
	        	$('#loginModal').modal(); 
			}
		});
	};
	
	$(".followBtn").on('click',function() {
		if(loginMember!=""){
			let writerNo = '${writer}';
 	 		$.ajax({
 	 			async: false,
 	 			url: "${path}/user/following.do",
 	 			data: {writerNo : writerNo},
 	 			success:(data) => {
 	 				if(data==10){
 	 					$(".following").show();
 	 					$(".follow").hide();
 	 				}else if(data==20){
 	 					$(".following").hide();
 	 					$(".follow").show();
 	 				}
 	 			},error:function(request, status, error){
 	 				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
 	 			}
 	 		});
		}else{ //로그인 안되어 있으면 로그인 모달 띄우기
			loginModal();
		};
 	});
 	
 	$(document).ready(function(){
 		let writerNo = '${writer}';
 		$.ajax({
 			async: false,
 			url: "${path}/user/followingCheck.do",
 			data: {writerNo : writerNo},
 			success:(data) => {
 				if(data==10){
 					$(".following").hide();
 					$(".follow").show();
 				}else if(data==20){
 					$(".following").show();
 					$(".follow").hide();
 				}
 				if(data==100){
 					$(".following").hide();
 					$(".follow").show();
 				}
 			},error:function(request, status, error){
 				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
 			}
 		});
 	})
 	
 	//댓글 스크립트
function commentAjax(){
	let writeMember=$(".writeMember").val();
	$.ajax({
		url: "${path}/tip/tipComment.do",
		dataType:"html",
		data:{tipNo:tipNo,writeMember:writeMember},
		success:(data)=>{
			$("#commentContainer").html(data);
		}
	});
};

function commentDelete(path,data){
	$.ajax({
		url:path,
		data:{tipCommentNo:data},
		success:data=>{
			if(data===true){
				alert("댓글이 삭제되었습니다.");
				commentAjax();
				$(".commentCount").text(Number(Number($(".commentCount").html()) - 1));
			}else{
				alert("댓글 삭제에 실패하였습니다.");
			}
		},
		error:function(){
			alert("댓글 삭제에 실패하였습니다.");
		}
	})
}

 
$(function(){//로그인 안되어있을때 댓글창 누르면 손가락표시
	if(loginMember==""){
		$("[name=tipComment]").css({"cursor":"pointer"});
	}
});

$(document).on('click','[name=tipComment]',function(e) { //댓글창 누르면 로그인 확인
		if(loginMember==""){
			loginModal();
		}
});

$(document).on('click','.reply',function(e) {//답글달기 눌렀을때
	if(loginMember==""){
		loginModal();
		return;
	}
	var comment=$(e.target).parents("div.comment");//답글달기의 댓글
	
	if($("div.editor").length==2&&!comment.next().hasClass("editor")){//댓글달기 창이 두개이고 
		var flag=confirm("다른 댓글에서 작성하고 있던 내용이 유실됩니다. 정말 이 댓글로 전환하시겠습니까?")
		if(flag==true){//확인 눌렀을때
			$("#commentContainer").find("div.subComment").remove();
		}else{//취소 눌렀을때 변화없음
			
		}
	}
	if($("div.editor").length==1){//댓글달기창이 하나일때
	var editor=$("div.editor").clone();
	editor.addClass("ml-5");
	editor.addClass("subComment");
	editor.find("[name=commentLevel]").val("2");
	editor.find("[name=tipComment]").val("");
	editor.find("[name=commentRef]").val($(e.target).val());
	comment.after(editor);//
	}
});

$(document).on('click','.write',function(e) {//댓글 등록 버튼 눌렀을때
	if(loginMember==""){//로그인 안되어있다면
		loginModal();
		return;
	}else if($(e.target).parents("div.editor").find("[name=tipComment]").val().trim()==""){//댓글 내용이 없으면
		alert("내용을 입력해주세요.");
		return;
	}
	var tipNo=$(".tipNo").val();
	var tipComment=$(e.target).parents("div.editor").find("[name=tipComment]").val();
	var commentLevel=$(e.target).parents("div.editor").find("[name=commentLevel]").val();
	var commentRef=$(e.target).parents("div.editor").find("[name=commentRef]").val();
	$.ajax({
		url:"${path}/tip/commentWrite.do",
		data:{tipComment:tipComment,commentLevel:commentLevel,memberNo:loginMember,tipNo:tipNo,commentRef:commentRef},
		success:data=>{
			if(data===true){
				alert("댓글이 등록되었습니다.");
				commentAjax();
				$(".commentCount").text(Number(Number($(".commentCount").html()) + 1));
			}else{
				alert("댓글 등록에 실패하였습니다.");
			}
		},
		error:function(){
			alert("댓글 등록에 실패하였습니다.");
		}
	})
});

$(document).on("click",".commentDelete",e=>{
	//댓글 삭제 눌렀을 때 (댓글은 업뎃 대댓글은 삭제)
	commentDelete("${path}/tip/commentDelete.do",$(e.target).val());
});

$(document).on("click",".comment2Delete",e=>{
	//대댓글 삭제 눌렀을 때 (대댓글은 삭제)
	commentDelete("${path}/tip/comment2Delete.do",$(e.target).val());
});

 </script>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>

</html>