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
   <main role="main" style="min-height:100vh;" class="pt-5">      
        <!--스티키-->
            <div class="sticky-top d-none d-lg-block" style="top:70px; height:20px;">
                <nav class="navbar mt-3 navbar-expand-lg navbar-light bg-light ">
                    <ul class="nav container justify-content-around d-flex col-6 offset-3">
                        <li class="nav-item ">
                            <a class="nav-link text-primary" href="#"><strong>모두 보기</strong></a>
                        </li>
                        <li class="nav-item ">
                            <a class="nav-link text-dark" href="#"><strong>일상</strong></a>
                        </li>
                        <li class="nav-item ">
                            <a class="nav-link text-dark" href="#"><strong>노하우</strong></a>
                        </li>
                        <li class="nav-item ">
                            <a class="nav-link text-dark" href="#"><strong>후기</strong></a>
                        </li>
                        <li class="nav-item ">
                            <a class="nav-link text-dark" href="#"><strong>찾아주세요</strong></a>
                        </li>
                    </ul>                     
                </nav>
            </div>
            <div class="sticky-top d-lg-none" style="top:170px; height:20px;">
                <nav class="navbar mt-3 navbar-expand-lg navbar-light bg-light ">
                    <ul class="nav container justify-content-around">
                        <li class="nav-item ">
                            <a class="nav-link text-primary" href="#"><strong>모두 보기</strong></a>
                        </li>
                        <li class="nav-item ">
                            <a class="nav-link text-dark" href="#"><strong>일상</strong></a>
                        </li>
                        <li class="nav-item ">
                            <a class="nav-link text-dark" href="#"><strong>노하우</strong></a>
                        </li>
                        <li class="nav-item ">
                            <a class="nav-link text-dark" href="#"><strong>후기</strong></a>
                        </li>
                        <li class="nav-item ">
                            <a class="nav-link text-dark" href="#"><strong>찾아주세요</strong></a>
                        </li>
                    </ul>                     
                </nav>
            </div>
        
        <div class="container mt-5">
            <div class="row pt-5">
                <!--프로필-->
                <!-- <div class="col-12 col-lg-3"> -->
                <div class="d-lg-none col-12 my-5">
                  <div class="img-thumbnail mt-5 mx-0 px-2 py-3 row shadow-sm">
                      <div class="my-2 d-none d-sm-block col-sm-3">
                          <img src="./img/avatar.webp" class="rounded" style="width:100%;">
                      </div>
                      <div class="col-5">
                        <p class="h3 text-left pt-2 my-0"><strong>닉네임</strong></p>                      
                        <div class="text-left">
                          <span class="border-right pr-2" style="font-size:12px;"><a href="#" class="text-dark">팔로워 <strong>0</strong></a></span>
                          <span style="font-size:12px;"><a href="#" class="text-dark">팔로잉 <strong>0</strong></a></span>
                        </div>
                        <form>
                          <div class="form-group text-left mt-2">
                            <input type="hidden" value="유저넘버"/>
                            <button class="btn btn-primary" style="width:120px;">팔로우</button>
                          </div>
                        </form>
                        <p class="text-left d-none d-sm-block">설명글~</p>
                      </div>
                  </div>
                </div>
                <div class="d-none d-lg-block col-lg-3">
                  <div class="img-thumbnail px-5">
                      <div class="my-2">
                          <img src="./img/avatar.webp" class="rounded col-lg-10 offset-lg-1 col-3" >
                      </div>
                      <div>
                        <p class="h2 text-center pt-2"><strong>닉네임</strong></p>                      
                        <div class="text-center">
                          <span class="border-right pr-2" style="font-size:12px;"><a href="#" class="text-dark">팔로워 <strong>0</strong></a></span>
                          <span style="font-size:12px;"><a href="#" class="text-dark">팔로잉 <strong>0</strong></a></span>
                        </div>
                        <form>
                          <div class="form-group text-center mt-2">
                            <input type="hidden" value="유저넘버"/>
                            <button class="btn btn-primary" style="width:120px;">팔로우</button>
                          </div>
                        </form>
                        <p class="text-center">설명글~</p>
                      </div>
                  </div>
                </div>
                <!--글목록들-->
                <div class="col-12 offset-lg-1 col-lg-8"> 
                  <section>
                    <div class="d-flex justify-content-between mb-1">
                      <p class="h5">일상 <strong>0</strong></p>
                      <a href="#">전체보기</a>
                    </div>
                    <div class="row">
                      <div class="card col-4 col-md-3 border-0 mb-3">
                        <a href="#">
                          <img src="../final/img/cc.webp" class="rounded" style="width:100%; height:100%;">
                        </a>
                      </div>
                      <div class="card col-4 col-md-3 border-0 mb-3">
                        <a href="#">
                          <img src="../final/img/cc.webp" class="rounded" style="width:100%; height:100%;">
                        </a>
                      </div>
                      <div class="card col-4 col-md-3 border-0 mb-3">
                        <a href="#">
                          <img src="../final/img/cc.webp" class="rounded" style="width:100%; height:100%;">
                        </a>
                      </div>
                      <div class="card col-4 col-md-3 border-0">
                        <a href="#">
                          <img src="../final/img/cc.webp" class="rounded" style="width:100%; height:100%;">
                        </a>
                      </div>
                      <div class="card col-4 d-md-none border-0">
                        <a href="#">
                          <img src="../final/img/cc.webp" class="rounded" style="width:100%; height:100%;">
                        </a>
                      </div> 
                      <div class="card col-4 d-md-none border-0">
                        <a href="#">
                          <img src="../final/img/cc.webp" class="rounded" style="width:100%; height:100%;">
                        </a>
                      </div>                      
                    </div>
                  </section>
                  <section class="mt-5">
                    <div class="d-flex justify-content-between mb-1">
                      <p class="h5">노하우 <strong>0</strong></p>
                      <a href="#">전체보기</a>
                    </div>
                    <div class="row">
                      <div class="card col-4 col-md-3 border-0">
                        <a href="#">
                          <img src="../final/img/cc2.webp" class="rounded" style="width:100%; ">
                          <p class="text-center text-dark">제목</p>
                        </a>
                      </div>
                      <div class="card col-4 col-md-3 border-0">
                        <a href="#">
                          <img src="../final/img/cc2.webp" class="rounded" style="width:100%; ">
                          <p class="text-center text-dark">제목</p>
                        </a>
                      </div>
                      <div class="card col-4 col-md-3 border-0">
                        <a href="#">
                          <img src="../final/img/cc2.webp" class="rounded" style="width:100%;">
                          <p class="text-center text-dark">제목</p>
                        </a>
                      </div>
                      <div class="card col-4 col-md-3 border-0">
                        <a href="#">
                          <img src="../final/img/cc2.webp" class="rounded" style="width:100%;">
                          <p class="text-center text-dark">제목</p>
                        </a>
                      </div>
                      <div class="card col-4 d-md-none border-0">
                        <a href="#">
                          <img src="../final/img/cc2.webp" class="rounded" style="width:100%;">
                          <p class="text-center text-dark">제목</p>
                        </a>
                      </div> 
                      <div class="card col-4 d-md-none border-0">
                        <a href="#">
                          <img src="../final/img/cc2.webp" class="rounded" style="width:100%;">
                          <p class="text-center text-dark">제목</p>
                        </a>
                      </div>                      
                    </div>
                  </section>
                  <section class="mt-5">
                    <div class="d-flex justify-content-between mb-1">
                      <p class="h5">후기 <strong>0</strong></p>
                      <a href="#">전체보기</a>
                    </div>
                    <div class="row">
                      <div class="card col-4 col-md-3 border-0">
                        <a href="#">
                          <img src="../final/img/cc3.jpg" class="rounded" style="width:100%; ">
                          <p class="text-center text-dark">제목</p>
                        </a>
                      </div>
                      <div class="card col-4 col-md-3 border-0">
                        <a href="#">
                          <img src="../final/img/cc3.jpg" class="rounded" style="width:100%; ">
                          <p class="text-center text-dark">제목</p>
                        </a>
                      </div>
                      <div class="card col-4 col-md-3 border-0">
                        <a href="#">
                          <img src="../final/img/cc3.jpg" class="rounded" style="width:100%;">
                          <p class="text-center text-dark">제목</p>
                        </a>
                      </div>
                      <div class="card col-4 col-md-3 border-0">
                        <a href="#">
                          <img src="../final/img/cc3.jpg" class="rounded" style="width:100%;">
                          <p class="text-center text-dark">제목</p>
                        </a>
                      </div>
                      <div class="card col-4 d-md-none border-0">
                        <a href="#">
                          <img src="../final/img/cc3.jpg" class="rounded" style="width:100%;">
                          <p class="text-center text-dark">제목</p>
                        </a>
                      </div> 
                      <div class="card col-4 d-md-none border-0">
                        <a href="#">
                          <img src="../final/img/cc3.jpg" class="rounded" style="width:100%;">
                          <p class="text-center text-dark">제목</p>
                        </a>
                      </div>                      
                    </div>
                  </section>
                  <section class="my-5">
                    <div class="d-flex justify-content-between">
                      <p class="h5">찾아주세요 <strong>0</strong></p>
                      <a href="#">전체보기</a>
                    </div>
                    <div class="row">
                      <div class="card col-4 col-md-3 border-0 mb-3">
                        <a href="#">
                          <img src="../final/img/cc.webp" class="rounded" style="width:100%;">
                          <p class="text-center text-dark">제목</p>
                        </a>
                      </div>
                      <div class="card col-4 col-md-3 border-0 mb-3">
                        <a href="#">
                          <img src="../final/img/cc.webp" class="rounded" style="width:100%;">
                          <p class="text-center text-dark">제목</p>
                        </a>
                      </div>
                      <div class="card col-4 col-md-3 border-0 mb-3">
                        <a href="#">
                          <img src="../final/img/cc.webp" class="rounded" style="width:100%;">
                          <p class="text-center text-dark">제목</p>
                        </a>
                      </div>
                      <div class="card col-4 col-md-3 border-0">
                        <a href="#">
                          <img src="../final/img/cc.webp" class="rounded" style="width:100%;">
                          <p class="text-center text-dark">제목</p>
                        </a>
                      </div>
                      <div class="card col-4 d-md-none border-0">
                        <a href="#">
                          <img src="../final/img/cc.webp" class="rounded" style="width:100%;">
                          <p class="text-center text-dark">제목</p>
                        </a>
                      </div> 
                      <div class="card col-4 d-md-none border-0">
                        <a href="#">
                          <img src="../final/img/cc.webp" class="rounded" style="width:100%;">
                          <p class="text-center text-dark">제목</p>
                        </a>
                      </div>                      
                    </div>
                  </section>
                </div>
            </div>
        </div>
       
  </main>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>

</html>