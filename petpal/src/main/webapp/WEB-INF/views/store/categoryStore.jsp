<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/> 
 <jsp:include page="/WEB-INF/views/common/commonLink.jsp" />

</head>
	<style>
.card-img-top {
	width: 255px;
	height: 255px;
}
</style>
<body class="bg-white">
<jsp:include page="/WEB-INF/views/common/header.jsp" />
  
  <main role="main" style="min-height:100vh;">
   	<section>
   		<div class="container my-4">
        <div class="row">

            <div class="col-lg-3 d-lg-block d-none my-5">

                <div class="accordion" id="accordionExample">

                    <div class="card border-0">
                        <div class="card-header bg-transparent" id="headingOne">
                            <h2 class="mb-0">
                                <button class="btn btn-link btn-block text-left text" style="font-weight: bold;"
                                    type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true"
                                    aria-controls="collapseOne">
                                    강아지
                                </button>
                            </h2>
                        </div>
                        <div id="collapseOne" class="collapse" aria-labelledby="headingOne"
                            data-parent="#accordionExample">
                            <div class="card-body">
                                <ul class="nav flex-column">
                                    <li class="nav-item">
                                        <a class="nav-link active" href="#">홈/리빙</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="#">식품</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="#">옷</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="#">용품</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="#">목욕/미용</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>

                    <div class="card border-0">
                        <div class="card-header bg-transparent" id="headingTwo">
                            <h2 class="mb-0">
                                <button class="btn btn-link btn-block text-left collapsed" style="font-weight: bold;"
                                    type="button" data-toggle="collapse" data-target="#collapseTwo"
                                    aria-expanded="false" aria-controls="collapseTwo">
                                    고양이
                                </button>
                            </h2>
                        </div>
                        <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo"
                            data-parent="#accordionExample">
                            <div class="card-body">
                                <ul class="nav flex-column">
                                    <li class="nav-item">
                                        <a class="nav-link active" href="#">홈/리빙</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="#">식품</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="#">옷</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="#">용품</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="#">목욕/미용</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>

                    <div class="card border-0">
                        <div class="card-header bg-transparent" id="headingThree">
                            <h2 class="mb-0">
                                <button class="btn btn-link btn-block text-left collapsed" style="font-weight: bold;"
                                    type="button" data-toggle="collapse" data-target="#collapseThree"
                                    aria-expanded="false" aria-controls="collapseThree">
                                    소동물
                                </button>
                            </h2>
                        </div>
                        <div id="collapseThree" class="collapse" aria-labelledby="headingThree"
                            data-parent="#accordionExample">
                            <div class="card-body">
                                <ul class="nav flex-column">
                                    <li class="nav-item">
                                        <a class="nav-link active" href="#">햄스터</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="#">토끼</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="#">물고기</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="#">새</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.col-lg-3 -->

            <div class="col-lg-9 mt-5">
                <div class="form-inline container-xl mb-4 d-flex justify-content-between">
                    <button type="button" class="font-weight-bold btn btn-secondary btn-sm mr-3 mt-2">전체</button>
                    <button type="button" class="font-weight-bold btn btn-secondary btn-sm mr-3 mt-2">집</button>
                    <button type="button" class="font-weight-bold btn btn-secondary btn-sm mr-3 mt-2">계단</button>
                    <button type="button" class="font-weight-bold btn btn-secondary btn-sm mr-3 mt-2">이동장</button>
                    <button type="button" class="font-weight-bold btn btn-secondary btn-sm mr-3 mt-2">식기</button>
                    <button type="button" class="font-weight-bold btn btn-secondary btn-sm mr-3 mt-2">화장실</button>
                    <button type="button" class="font-weight-bold btn btn-secondary btn-sm mr-3 mt-2">울타리</button>
                    <div class="dropdown ml-auto mt-2">
                        <button class="btn btn-light dropdown-toggle" type="button" id="dropdownMenuButton"
                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            정렬
                        </button>
                        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                            <button class="dropdown-item" href="#">최신순</button>
                            <button class="dropdown-item" href="#">인기순</button>
                            <button class="dropdown-item" href="#">팔로워순</button>
                            <button class="dropdown-item" href="#">스크랩순</button>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-4 col-md-6 mb-4">
                        <a href="${path }/store/moveDetail.do?productNo=61">
                            <img class="card-img-top" src="sea)연어.png" alt="">
                            <h4 class="text-black" style="color:black;">상품명</h4>
                            <div>
                                <span style="font-weight: bold; color:#35c5f0;">70%</span>
                                <span style="font-weight: bold; color:black;">59,000~</span>
                            </div>
                            <div>
                                <small class="text-muted" style="font-weight: bold;">별점&#9733;4.0</small>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-4 col-md-6 mb-4">
                        <a href="#">
                            <img class="card-img-top" src="sea)연어.png" alt="">
                            <h4 class="text-black" style="color:black;">상품명</h4>
                            <div>
                                <span style="font-weight: bold; color:#35c5f0;">70%</span>
                                <span style="font-weight: bold; color:black;">59,000~</span>
                            </div>
                            <div>
                                <small class="text-muted" style="font-weight: bold;">별점&#9733;4.0</small>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-4 col-md-6 mb-4">
                        <a href="#">
                            <img class="card-img-top" src="sea)연어.png" alt="">
                            <h4 class="text-black" style="color:black;">상품명</h4>
                            <div>
                                <span style="font-weight: bold; color:#35c5f0;">70%</span>
                                <span style="font-weight: bold; color:black;">59,000~</span>
                            </div>
                            <div>
                                <small class="text-muted" style="font-weight: bold;">별점&#9733;4.0</small>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-4 col-md-6 mb-4">
                        <a href="#">
                            <img class="card-img-top" src="sea)연어.png" alt="">
                            <h4 class="text-black" style="color:black;">상품명</h4>
                            <div>
                                <span style="font-weight: bold; color:#35c5f0;">70%</span>
                                <span style="font-weight: bold; color:black;">59,000~</span>
                            </div>
                            <div>
                                <small class="text-muted" style="font-weight: bold;">별점&#9733;4.0</small>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-4 col-md-6 mb-4">
                        <a href="#">
                            <img class="card-img-top" src="sea)연어.png" alt="">
                            <h4 class="text-black" style="color:black;">상품명</h4>
                            <div>
                                <span style="font-weight: bold; color:#35c5f0;">70%</span>
                                <span style="font-weight: bold; color:black;">59,000~</span>
                            </div>
                            <div>
                                <small class="text-muted" style="font-weight: bold;">별점&#9733;4.0</small>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-4 col-md-6 mb-4">
                        <a href="#">
                            <img class="card-img-top" src="sea)연어.png" alt="">
                            <h4 class="text-black" style="color:black;">상품명</h4>
                            <div>
                                <span style="font-weight: bold; color:#35c5f0;">70%</span>
                                <span style="font-weight: bold; color:black;">59,000~</span>
                            </div>
                            <div>
                                <small class="text-muted" style="font-weight: bold;">별점&#9733;4.0</small>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-4 col-md-6 mb-4">
                        <a href="#">
                            <img class="card-img-top" src="sea)연어.png" alt="">
                            <h4 class="text-black" style="color:black;">상품명</h4>
                            <div>
                                <span style="font-weight: bold; color:#35c5f0;">70%</span>
                                <span style="font-weight: bold; color:black;">59,000~</span>
                            </div>
                            <div>
                                <small class="text-muted" style="font-weight: bold;">별점&#9733;4.0</small>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-4 col-md-6 mb-4">
                        <a href="#">
                            <img class="card-img-top" src="sea)연어.png" alt="">
                            <h4 class="text-black" style="color:black;">상품명</h4>
                            <div>
                                <span style="font-weight: bold; color:#35c5f0;">70%</span>
                                <span style="font-weight: bold; color:black;">59,000~</span>
                            </div>
                            <div>
                                <small class="text-muted" style="font-weight: bold;">별점&#9733;4.0</small>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-4 col-md-6 mb-4">
                        <a href="#">
                            <img class="card-img-top" src="sea)연어.png" alt="">
                            <h4 class="text-black" style="color:black;">상품명</h4>
                            <div>
                                <span style="font-weight: bold; color:#35c5f0;">70%</span>
                                <span style="font-weight: bold; color:black;">59,000~</span>
                            </div>
                            <div>
                                <small class="text-muted" style="font-weight: bold;">별점&#9733;4.0</small>
                            </div>
                        </a>
                    </div>


                </div>
                <!-- /.row -->

            </div>
            <!-- /.col-lg-9 -->

        </div>
        <!-- /.row -->
    </div>
    <!-- /.container -->
   	</section>
  </main>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>

</html>