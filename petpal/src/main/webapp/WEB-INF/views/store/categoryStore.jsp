<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<jsp:include page="/WEB-INF/views/common/commonLink.jsp" />

</head>
<style>
.dropdown .dropdown-menu {
     display: block;
     opacity: 0;
     transition: all 850ms ease;
     }

     .dropdown:hover .dropdown-menu {
     display: block;
     opacity: 1;
     }
.card-img-top {
	/* width: 255px; */
	height: 255px;
}

a:hover {
	text-decoration: none;
}
.review{
	color:black;
}
</style>
<body class="bg-white">
	<jsp:include page="/WEB-INF/views/common/header.jsp" />

	<main role="main" style="min-height: 100vh;">
		<section>
			<div class="container my-4">

				<div class="row">
					<div class="col-12 mt-xl-3 mt-5 pt-3">
						<h4>강아지 > 홈/리빙</h4>
					</div>
					<div class="col-lg-3 d-lg-block d-none my-5">
						<div class="accordion" id="accordionExample">

							<div class="card border-0">
								<div class="card-header bg-transparent" id="headingOne">
									<h2 class="mb-0">
										<button class="btn btn-link btn-block text-left text"
											style="font-weight: bold;" type="button"
											data-toggle="collapse" data-target="#collapseOne"
											aria-expanded="true" aria-controls="collapseOne">
											강아지</button>
									</h2>
								</div>
								<div id="collapseOne" class="collapse"
									aria-labelledby="headingOne" data-parent="#accordionExample">
									<div class="card-body">
										<ul class="nav flex-column">
											<li class="nav-item"><a class="nav-link active"
												href="${path }/store/moveCategory.do?cNo=D1">홈/리빙</a></li>
											<li class="nav-item"><a class="nav-link"
												href="${path }/store/moveCategory.do?cNo=D2">식품</a></li>
											<li class="nav-item"><a class="nav-link"
												href="${path }/store/moveCategory.do?cNo=D3">옷</a></li>
											<li class="nav-item"><a class="nav-link"
												href="${path }/store/moveCategory.do?cNo=D4">용품</a></li>
											<li class="nav-item"><a class="nav-link"
												href="${path }/store/moveCategory.do?cNo=D5">목욕/미용</a></li>
										</ul>
									</div>
								</div>
							</div>

							<div class="card border-0">
								<div class="card-header bg-transparent" id="headingTwo">
									<h2 class="mb-0">
										<button class="btn btn-link btn-block text-left collapsed"
											style="font-weight: bold;" type="button"
											data-toggle="collapse" data-target="#collapseTwo"
											aria-expanded="false" aria-controls="collapseTwo">
											고양이</button>
									</h2>
								</div>
								<div id="collapseTwo" class="collapse"
									aria-labelledby="headingTwo" data-parent="#accordionExample">
									<div class="card-body">
										<ul class="nav flex-column">
											<li class="nav-item"><a class="nav-link active"
												href="${path }/store/moveCategory.do?cNo=C1">홈/리빙</a></li>
											<li class="nav-item"><a class="nav-link"
												href="${path }/store/moveCategory.do?cNo=C2">식품</a></li>
											<li class="nav-item"><a class="nav-link"
												href="${path }/store/moveCategory.do?cNo=C3">옷</a></li>
											<li class="nav-item"><a class="nav-link"
												href="${path }/store/moveCategory.do?cNo=C4">용품</a></li>
											<li class="nav-item"><a class="nav-link"
												href="${path }/store/moveCategory.do?cNo=C5">목욕/미용</a></li>
										</ul>
									</div>
								</div>
							</div>

							<div class="card border-0">
								<div class="card-header bg-transparent" id="headingThree">
									<h2 class="mb-0">
										<button class="btn btn-link btn-block text-left collapsed"
											style="font-weight: bold;" type="button"
											data-toggle="collapse" data-target="#collapseThree"
											aria-expanded="false" aria-controls="collapseThree">
											소동물</button>
									</h2>
								</div>
								<div id="collapseThree" class="collapse"
									aria-labelledby="headingThree" data-parent="#accordionExample">
									<div class="card-body">
										<ul class="nav flex-column">
											<li class="nav-item"><a class="nav-link active"
												href="${path }/store/moveCategory.do?cNo=S1">햄스터</a></li>
											<li class="nav-item"><a class="nav-link"
												href="${path }/store/moveCategory.do?cNo=S2">토끼</a></li>
											<li class="nav-item"><a class="nav-link"
												href="${path }/store/moveCategory.do?cNo=S3">물고기</a></li>
											<li class="nav-item"><a class="nav-link"
												href="${path }/store/moveCategory.do?cNo=S4">새</a></li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- /.col-lg-3 -->

					<div class="col-lg-9 mt-5" >
						<div
							class="form-inline container-xl mb-4 d-flex justify-content-between">
							<c:if test="${not empty scList }">
							<button type="button"
								class="font-weight-bold btn btn-secondary btn-sm mr-3 mt-2 subcate">전체</button>
								<c:forEach var="sc" items="${scList }">
							<button type="button"
								class="font-weight-bold btn btn-secondary btn-sm mr-3 mt-2 subcate"><c:out value="${sc.SUBCATE }"/></button>
								</c:forEach>
								</c:if>
								<input type="hidden" id="subcate">
							<div class="dropdown ml-auto mt-2">
								<button class="btn btn-light dropdown-toggle" type="button"
									id="dropdownMenuButton" data-toggle="dropdown"
									aria-haspopup="true" aria-expanded="false">정렬</button>
								<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
									<button class="dropdown-item sort" value="date">최신순</button>
									<button class="dropdown-item sort" value="popul">인기순</button>
									<button class="dropdown-item sort" value="star">리뷰평점순</button>
									<input id="sortState" type="hidden">
								</div>
							</div>
						</div>
						<div class="row" id="container">
							<c:set var="product" value="${list[0] }"/>
							<input type="hidden" value="${product.categoryNo }" id="cNo">
							<c:if test="${empty list && empty soList }">
								<div class="col-12 mb-4 text-center">
									<p>상품이 없습니다.</p>
								</div>
							</c:if>
							<c:if test="${not empty list }">
							<c:forEach var="p" items="${list }">
								<div class="col-lg-4 col-md-6 mb-4">
									<a href="${path }/store/moveDetail.do?productNo=${p.productNo}"> <img class="card-img-top" src="${path }/resources/upload/product/detail/${p.imgName}"
										alt="">
										<h4 class="text-black" style="color: black;"><c:out value="${p.productName }"/></h4>
										<div>
											<span style="font-weight: bold; color: #35c5f0;"><c:out value="${p.sale }"/>%</span>
											<c:set var="per" value="${p.price-(p.price*p.sale/100) }"/> <span
												style="font-weight: bold; color: black;"><fmt:formatNumber value="${per+(100-(per%100))%100 }"/>~</span>
										</div>
										<c:if test="${p.star!=0 }">
									<div><span class="review">리뷰평점</span>
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
  <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
</svg>
										<small class="text-muted" style="font-weight: bold;"><c:out value="${p.star }"/></small>
									</div>
									</c:if>
									</a>
								</div>
							</c:forEach>
							</c:if>
							<!-- 품절리스트 -->
							<c:if test="${not empty soList }">
								<c:forEach var="p" items="${soList }">
									<div class="col-lg-4 col-md-6 mb-4">
										<a href="${path }/store/moveDetail.do?productNo=${p.productNo}"> <img class="card-img-top" src="${path }/resources/upload/product/detail/${p.imgName}"
											alt="">
											<h4 class="text-black" style="color: black;"><c:out value="${p.productName }"/></h4>
											<div>
												<svg height="1.5em" width="2.5em" class="rounded" style="background-color:#CCCCCC">
												  <text x="4" y="18" class="font-weight-bold">품절</text>
												</svg>
											</div>
											<c:if test="${p.star!=0 }">
									<div>
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
  <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
</svg>
										<small class="text-muted" style="font-weight: bold;"><c:out value="${p.star }"/></small>
									</div>
									</c:if>
										</a>
									</div>
								</c:forEach>
							</c:if>


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
<script>
var state=$("#sortState").val();//정렬상태
var subcate=$("#subcate").val();//소분류 상태
var cNo=$("#cNo").val();//중분류 카테고리번호
$(document).on(//소분류 눌렀을때
		'click',
		'.subcate',
		function(e) {
			if(e.target.textContent=='전체'){
				subcate="";
			}else{
				subcate=e.target.textContent;
			}
			 $.ajax({
				url:"${path}/store/sortProduct.do",
				data:{cNo:cNo,state:state,subcate:subcate},
				success:data=>{
					$("#container").html("");
					$("#container").append(data);
					
				}
			}); 
		});
		
$(document).on(//정렬 눌렀을떄
		'click',
		'.sort',
		function(e) {
			state=$(e.target).val();
			 $.ajax({
				url:"${path}/store/sortProduct.do",
				data:{cNo:cNo,state:state,subcate:subcate},
				success:data=>{
					$("#container").html("");
					$("#container").append(data);
				}
			}); 
		});
</script>

</html>