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
                	<h5>카테고리</h5>
                	<small class="ml-3">#해시태그</small>
                	<small class="ml-3">#해시태그</small>
                	<small class="ml-3">#해시태그</small>
	                		
                	<div class="dropdown ml-auto">
                		<div href="#" id="imageDropdown" data-toggle="dropdown">
                			<svg width="2em" height="2em" viewBox="0 0 16 16" class="bi bi-three-dots-vertical" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                				<path fill-rule="evenodd" d="M9.5 13a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0zm0-5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0zm0-5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0z"/>
	                		</svg>
      					</div>
      					<c:forEach items="${imgList }" var="t">
						    <div class="dropdown-menu dropdown-menu-right">
							    <button class="dropdown-item" type="button" onclick="location.replace('${path}/community/tipUpdate.do?tipNo=${t.TIPNO}')">수정하기</button>
							    <button class="dropdown-item" type="button">삭제하기</button>
						  	</div>
					  	</c:forEach>
    				</div>
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
                    <hr>
                    <h4>댓글<span class="su">2</span></h4>
                    <div class="comment-all mb-3">
                      <div class="input-group mb-3">
                        <input type="text" class="form-control" placeholder="칭찬과 격려의 댓글은 작성자에게 큰 힘이 됩니다:)"
                          aria-label="Recipient's username" aria-describedby="button-addon2">
                        <div class="input-group-append">
                          <button class="btn btn-outline-secondary" type="button" id="button-addon2">등록</button>
                        </div>
                      </div>
                    </div>
                    <div class="comment-all mb-3">
                      <div>
                        <img src="" class="" >
                      </div>
                      <div>
                        <div>
                          <strong><span>작성자</span></strong>
                          <span>내용</span>
                        </div>
                        <div>
                          <span style="font-size:14px; color:gray;">몇분전</span>
                          <button class="click text-black-50" style="font-weight:bold;">답글 달기</button>
                          <button class="click" style="color:gray; font-size: 14px;">신고</button>
                        </div>
                      </div>
                    </div>
                    <div class="comment-all mb-3">
                      <div>
                        <img src="" class="">
                      </div>
                      <div>
                        <div>
                          <strong><span>작성자</span></strong>
                          <span>안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕</span>
                        </div>
                        <div>
                          <span style="font-size:14px; color:gray;">몇분전</span>
                          <button class="click text-black-50" style="font-weight:bold;">답글 달기</button>
                          <button class="click" style="color:gray; font-size: 14px;">신고</button>
                        </div>
                      </div>
                    </div>

                    <style>
                      .su {
                        color: #35c5f0;
        
                      }
                      .comment-all {
                        display: flex;
                      }
                      button.click:hover {
                        text-decoration: underline;
                      }
                      button.click {
                        background-color: white;
                        border: none;
                      }
                    </style>


                  </div>
                </div>
              </div>
            </div>

            <!-- 오른쪽 -->
            <div class="col-3 d-none d-lg-block" style="margin-top: 300px;">
              <ul class="nav navbar-nav">
                <li><button class="btn btn-outline-dark mb-3"><svg width="1em" height="1em" viewBox="0 0 16 16"
                      class="bi bi-heart" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                      <path fill-rule="evenodd"
                        d="M8 2.748l-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z" />
                    </svg></button></li>
                <li><button class="btn btn-outline-dark mb-3"><svg width="1em" height="1em" viewBox="0 0 16 16"
                      class="bi bi-bookmark" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                      <path fill-rule="evenodd"
                        d="M2 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.777.416L8 13.101l-5.223 2.815A.5.5 0 0 1 2 15.5V2zm2-1a1 1 0 0 0-1 1v12.566l4.723-2.482a.5.5 0 0 1 .554 0L13 14.566V2a1 1 0 0 0-1-1H4z" />
                    </svg></button></li>
                <li>
                  <div>
                    <div>
                      <strong><span>작성자</span></strong>
                      <span>안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕</span>
                    </div>
                    <div>
                      <span style="font-size:14px; color:gray;">몇분전</span>
                      <button class="click text-black-50" style="font-weight:bold;">답글 달기</button>
                      <button class="click" style="color:gray; font-size: 14px;">신고</button>
                    </div>
                  </div>
                </li>
              </ul>
            </div>
            
          </div>
        </div>
      </div>
    </div>
  </main>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>

</html>