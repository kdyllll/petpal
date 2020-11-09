<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>


 <jsp:include page="/WEB-INF/views/common/commonLink.jsp" />

  <!-- Custom styles for this template -->
   <link href="${path }/resources/css/admin/adminPage.css" rel="stylesheet">
 
</head>

<body style="overflow:hidden;">
      <header>
        <nav class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0 shadow py-lg-2 py-md-2">
          <a class="navbar-brand col-md-3 col-lg-2 mr-0 px-3" href="#">Company name</a>
          <button class="navbar-toggler position-absolute d-md-none collapsed" type="button" data-toggle="collapse" data-target="#sidebarMenu" aria-controls="sidebarMenu" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <ul class="navbar-nav px-3 py-2">
            <li class="nav-item text-nowrap">
              <a class="nav-link" href="#">Sign out</a>
            </li>
          </ul>
        </nav>
    </header>

<div class="container-fluid">
  <div class="row">
    <nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse ">
      <div class="sidebar-sticky pt-0 pt-md-4">
        <ul class="nav flex-column pt-md-3">
          <li class="nav-item">
            <a class="nav-link active" href="#">
              <span data-feather="home"></span>
              상품관리 <span class="sr-only">(current)</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">
              <span data-feather="users"></span>
              주문내역
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">
              <span data-feather="file"></span>
              회원관리
            </a>
          </li>      
          <li class="nav-item">
            <a class="nav-link" href="#">
              <span data-feather="shopping-cart"></span>
              게시글관리
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">
              <span data-feather="bar-chart-2"></span>
              신고관리
            </a>
          </li>
        </ul>
      </div>
    </nav>

    <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4 " style="height: 100vh; overflow-y: auto;">
      <h2 class="mt-3">Section title</h2>
      <div class="table-responsive" >
        <div style="height: 2000px;">dddd</div>  
      </div>
    </main>
  </div>
</div>
</body>

</html>