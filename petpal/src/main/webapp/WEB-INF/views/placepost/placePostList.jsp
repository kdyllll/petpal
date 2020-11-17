<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/> 
 <jsp:include page="/WEB-INF/views/common/commonLink.jsp" />
   <link rel="stylesheet" href="${path }/resources/css/community/placePostList.css">  
</head>

<jsp:include page="/WEB-INF/views/common/header.jsp" />
  
  <!-- Page Content -->
  <main role="main" >
   <section class="mt-5 pt-5">
	   <div class="container mt-2">
	        <div id="blog" class="row">
	            <div id="btn">
	                <button type="button" class="btn btn-secondary btn-sm mr-3">병원</button>
	                <button type="button" class="btn btn-secondary btn-sm mr-3">미용</button>
	                <button type="button" class="btn btn-secondary btn-sm mr-3">호텔링</button>
	                <button type="button" class="btn btn-secondary btn-sm mr-3">훈련소</button>
	                <button type="button" class="btn btn-secondary btn-sm mr-3">기타</button>
	            </div>
	            <div class="m-3 col-12"></div>
	            <div class="col-10 offset-1 blogShort mb-4 border-bottom">
	                <a href="#" class="post-all">
	                    <div class="row">
	                        <div class="col-9">
	                            <div class="decoration">
	                                <h3>제목</h3>
	                                <article>
	                                    <p>
	                                        내용
	                                    </p>
	                                </article>
	                            </div>
	                            <span class="mr-2">작성자</span>
	                            <span class="mr-2">작성날짜</span>
	                            <span class="mr-2">댓글수</span>
	                            <span class="mr-2">카테고리분류</span>
	                            <p>주소</p>
	                        </div>
	                        <div class="col-3">
	                            <img src="sea)연어.png" alt="post img" class="rounded float-right">
	                        </div>
	                    </div>
	
	                </a>
	            </div>
	            <div class="col-10 offset-1 blogShort mb-4 border-bottom">
	                <a href="#" class="post-all">
	                    <div class="row">
	                        <div class="col-9">
	                            <div class="decoration">
	                                <h3>제목</h3>
	                                <article>
	                                    <p>
	                                        내용
	                                    </p>
	                                </article>
	                            </div>
	                            <span class="mr-2">작성자</span>
	                            <span class="mr-2">작성날짜</span>
	                            <span class="mr-2">댓글수</span>
	                            <span class="mr-2">카테고리분류</span>
	                            <p>주소</p>
	                        </div>
	                        <div class="col-3">
	                            <img src="sea)연어.png" alt="post img" class="rounded float-right">
	                        </div>
	                    </div>
	
	                </a>
	            </div>
	        </div>
	        <p class="text-center">페이지바</p>
	    </div>
   </section>
  </main>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>
<style>
    #btn {
        margin: auto;
    }

    .post-all {
        color: black;
    }

    .post-all:hover {
        color: black;
        text-decoration: none;
    }

    .float-right {
        width: 130px;
        height: 130px;
    }

    .decoration:hover {
        text-decoration: underline;
    }
</style>

</html>