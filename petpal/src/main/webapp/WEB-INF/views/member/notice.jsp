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
  
  <!-- Page Content -->
  <main role="main" style="min-height:100vh;">
   <section class="container pt-5">
    <div class="my-3 p-3 bg-white rounded shadow-sm">
      <h6 class="border-bottom border-gray pb-2 mb-0">최근 소식</h6>
      <a href="#">
        <div class="media text-muted pt-3">
          <img src="sea)연어.png" class="rounded-circle mr-2 mt-2" alt="" style="width: 2.5em; height: 2.5em;">
          <div class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">
            <div class="d-flex justify-content-between align-items-center w-100">
              <strong class="text-gray-dark">박철우님이 사진을 올렸어요.</strong>
              <p>Follow</p>
            </div>
            <span class="d-block">몇분전</span>
          </div>
        </div>
      </a>
    </div>

    <div class="my-3 p-3 bg-white rounded shadow-sm">
      <h6 class="border-bottom border-gray pb-2 mb-0">팔로우</h6>
      <a href="#">
        <div class="media text-muted pt-3">
          <img src="sea)연어.png" class="rounded-circle mr-2 mt-2" alt="" style="width: 2.5em; height: 2.5em;">
          <div class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">
            <div class="d-flex justify-content-between align-items-center w-100">
              <strong class="text-gray-dark">박철우님이 사진을 올렸어요.</strong>
              <p>Follow</p>
            </div>
            <span class="d-block">몇분전</span>
          </div>
        </div>
      </a>
      <a href="#">
        <div class="media text-muted pt-3">
          <img src="sea)연어.png" class="rounded-circle mr-2 mt-2" alt="" style="width: 2.5em; height: 2.5em;">
          <div class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">
            <div class="d-flex justify-content-between align-items-center w-100">
              <strong class="text-gray-dark">박철우님이 사진을 올렸어요.</strong>
              <p>Follow</p>
            </div>
            <span class="d-block">몇분전</span>
          </div>
        </div>
      </a>
      <a href="#">
        <div class="media text-muted pt-3">
          <img src="sea)연어.png" class="rounded-circle mr-2 mt-2" alt="" style="width: 2.5em; height: 2.5em;">
          <div class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">
            <div class="d-flex justify-content-between align-items-center w-100">
              <strong class="text-gray-dark">박철우님이 사진을 올렸어요.</strong>
              <p>Follow</p>
            </div>
            <span class="d-block">몇분전</span>
          </div>
        </div>
      </a>
    </div>
   </section>
  </main>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>

</html>