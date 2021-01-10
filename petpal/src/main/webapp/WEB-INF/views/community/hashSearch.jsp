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
  
  <main role="main" style="min-height:100vh;">
  	<div class="container my-4 pt-4">
  		<form class="my-2 mt-5 d-flex justify-content-center" action="${path }/community/hashSearch.do">
  			<div class="input-group col-lg-6 col-8">	  		
			    <input type="text" id="hashInput" class="form-control" name="hashtag" placeholder="#해시태그 재검색" value="${hashtag }" >
                 <div class="input-group-append">
                     <button type="submit" class="input-group-text bg-point">검색</button>
                 </div>
                  
            </div>
  		</form>
   		<div class="dailyCon row col-12 my-4 border-bottom pb-3">
			<p class="h4 col-12 mb-3"><strong>사진 검색 결과</strong> 
			<a href="${path }/daily/moveList.do?hashtag=${hashtag}" class="text-hgh ml-1 ${empty dailyList?'d-none':'' }" style="font-size:15px;">더보기</a></p>
			<div class="mx-auto mb-2"><c:out value="${empty dailyList?'검색 결과가 없습니다.':'' }"/></div>
			<c:forEach var="d" items="${dailyList}">
				<div class="col-lg-3 col-6" >
					<div class="card mb-4 bg-transparent border-0">
						<a href="${path}/daily/moveDetail.do?dailyNo=${d.DAILYNO }">
							<img src="${path }/resources/upload/community/daily/${d.DAILYIMGNAME}" width="100%" class="rounded">
						</a>
						<div class="card-body p-0 pt-2 pl-2">
							 <div class="px-3 row mb-2">                
                                <a href="${path }/user/moveUserInfo.do?memberNo=${d.MEMBERNO}"><img src="${path }/resources/upload/member/profile/${d.IMG}" class="rounded" style="width:30px; height: 30px;"></a>
                                <div class="ml-1">
                                    <a href="${path }/user/moveUserInfo.do?memberNo=${d.MEMBERNO}"><span class="text-dark align-top mx-1"><strong><c:out value="${d.NICKNAME }"/></strong></span></a> 
                                </div>   
                                <div class="d-flex justify-content-between align-items-center col-12 p-0 mt-1">
		                                <small class="text-muted pl-1">
		                                	<c:forEach var="h" items="${d.hashList}">
		                                		<c:if test="${not empty h}">
		                                    		<a href="${path }/community/hashSearch.do?hashtag=${h}" class="text-secondary bg-point">#<c:out value="${h }"/></a>
		                                    	</c:if>
		                                    </c:forEach>  
		                                </small>
		                            </div>                 
                        	</div>
						</div>
					</div>
				</div>
			</c:forEach>
			
		</div>
		
		<div class="tipCon row col-12 my-4 border-bottom pb-3">
			<p class="h4 col-12 mb-3"><strong>노하우 검색 결과</strong>
				<a href="${path }/community/tipList.do?hashtag=${hashtag}" class="text-hgh ml-2 ${empty tipList?'d-none':'' }" style="font-size:15px;">더보기</a>
			</p>
			<div class="mx-auto mb-2"><c:out value="${empty tipList?'검색 결과가 없습니다.':'' }"/></div>
			<c:forEach var="t" items="${tipList }">						
				<div class="col-lg-3 col-6" style="cursor: pointer" onclick="location.replace('${path}/community/tipDetail.do?tipNo=${t.TIPNO }')">							
					<div class="card mb-4 bg-transparent border-0">
						<div class="test">
							<img src="${path }/resources/upload/tip/${t.MAINIMG}" width="100%" class="rounded">
						</div>
						<div class="card-body p-0 pt-2 pl-2">
							<strong><c:out value="${t.TITLE }"/></strong>
						</div>
						<div class="d-flex justify-content-between align-items-center">
                              <small class="text-muted pl-1">
                                	<c:forEach var="h" items="${t.hashList}">
                                		<c:if test="${not empty h}">
                                    		<a href="${path }/community/hashSearch.do?hashtag=${h}" class="text-secondary bg-point">#<c:out value="${h }"/></a>
                                    	</c:if>
                                    </c:forEach>  
                              </small>
                          </div>
					</div>						
				</div>
			</c:forEach>
		</div>
		
		<div class="placeCon row col-12 my-4 border-bottom pb-3 mb-4">
			<p class="h4 col-12 mb-3"><strong>유저들의 장소리뷰</strong><a href="${path }/place/movePlaceList.do?hashtag=${hashtag}" class="text-hgh ml-2 ${empty placeList?'d-none':'' }" style="font-size:15px;">더보기</a></p>
			<div class="mx-auto mb-2"><c:out value="${empty placeList?'검색 결과가 없습니다.':'' }"/></div>
			<c:forEach var="p" items="${placeList }">
				<div class="col-11 ml-3 border-bottom row py-2" style="cursor: pointer" onclick="location.replace('${path}/place/movePlaceDetail.do?placeNo=${p.PLACENO }')">
					<div class="col-2 ml-5 my-3">
						<img style="width:100%; vertical-align: baseline;" class="rounded" src="${path }/resources/upload/place/${p.FILENAME}">
					</div>
					<ul class="m-0 p-0 pt-3 pl-3" style="list-style:none;">
						<li class="h5 mb-2"><strong><c:out value="${p.TITLE }"/></strong></li>
						<li class="mb-2"><c:out value="${p.EXPLANATION}"/></li>
						<li><c:out value="${p.POSITION}"/></li>
						<li><div class="d-flex justify-content-between align-items-center">
                                <small class="text-muted pl-1">
                                   <c:forEach var="h" items="${p.hashList}">
	                               		<c:if test="${not empty h}">
	                                   		<a href="${path }/community/hashSearch.do?hashtag=${h}" class="text-secondary bg-point">#<c:out value="${h }"/></a>
	                                   	</c:if>
                                   </c:forEach>    
                                </small>
                            </div></li>
					</ul>
					
				</div>
			</c:forEach>
		</div>
	</div>
  </main>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>

</html>