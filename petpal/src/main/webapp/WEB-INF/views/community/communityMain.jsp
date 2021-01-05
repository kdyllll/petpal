<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<jsp:include page="/WEB-INF/views/common/commonLink.jsp" />

</head>
<body class="bg-white">
	<jsp:include page="/WEB-INF/views/common/header.jsp" />

	<main role="main" style="min-height: 100vh;">
		<div class="album">
			<div class="container my-4 mt-lg-0">
				<div class="row ">
					<jsp:include page="/WEB-INF/views/common/communityNav.jsp" >
						<jsp:param value="comHome" name="comNav"/>
					</jsp:include>
					
					<!-- 배너 -->
					<div class="col-9 mb-5 banner">
						<a href="#"><img class="rounded" width="100%" src="${path }/resources/images/banner.jpg"/></a>
					</div>

					<div id="carouselExampleIndicators" class="find carousel slide col-3 p-0 rounded mb-5 border" data-ride="carousel">
							<ol class="carousel-indicators">
								<li data-target="#carouselExampleIndicators" data-slide-to="0"
									class="active"></li>
								<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>

							</ol>
							<div class="carousel-inner" role="listbox">
								<div class="carousel-item active w-100" >
									<div class="mt-4 mb-1 text-center mr-2">찾아주세요</div>
									<div class="mb-2 ml-3"><strong>지역</strong></div>
									<div class="col-12">
										<img src="${path }/resources/images/test.jpg" width="100%" class="rounded">
									</div>
									<div class="my-4 ml-3">내용</div>
								</div>
								<div class="carousel-item">

								</div>

							</div>
							<a class="carousel-control-prev text-dark"
								href="#carouselExampleIndicators" role="button"
								data-slide="prev"> <span class="carousel-control-prev-icon"
								aria-hidden="true"></span> <span class="sr-only">Previous</span>
							</a> 
							<a class="carousel-control-next text-dark"
								href="#carouselExampleIndicators" role="button"
								data-slide="next"> <span class="carousel-control-next-icon"
								aria-hidden="true"></span> <span class="sr-only">Next</span>
							</a>
						</div>
									
					
					<div class="dailyCon row col-12 my-3">
						<p class="h4 col-12 mb-4"><strong>인기 사진</strong></p>
						<div class="col-3" style="cursor: pointer"	onclick="location.replace('${path}/community/tipDetail.do')">
							<div class="card mb-4 bg-transparent border-0">
								<div class="test">
									<img src="${path }/resources/images/test.jpg" width="100%" class="rounded">
								</div>
								<div class="card-body p-0 pt-2 pl-2">
									 <div class="px-3 row mb-2">                
		                                <a href="#"><img src="${path }/resources/upload/member/profile/avatar.webp" class="rounded" style="width:30px; height: 30px;"></a>
		                                <div class="ml-1">
		                                    <a href="${path }/user/moveUserInfo.do?memberNo"><span class="text-dark align-top mx-1"><strong>닉넴</strong></span></a> 
		                                </div>                    
		                        	</div>
								</div>
							</div>
						</div>
					</div>
					
					<div class="tipCon row col-12 my-3">
						<p class="h4 col-12 mb-4"><strong>베스트 노하우</strong></p>
						<div class="col-4" style="cursor: pointer"	onclick="location.replace('${path}/community/tipDetail.do')">
							<div class="card mb-4 bg-transparent border-0">
								<div class="test">
									<img src="${path }/resources/images/test.jpg" width="100%" class="rounded">
								</div>
								<div class="card-body p-0 pt-2 pl-2">
									<strong>제목</strong>
								</div>
							</div>
						</div>
					</div>
					
					<div class="placeCon row col-12 my-3">
						<p class="h4 col-12 mb-4"><strong>유저들의 장소리뷰</strong></p>
						<div class="col-11 ml-3 border-bottom row">
							<div class="col-2 ml-5 mb-3">
								<img style="width:100%; vertical-align: baseline;" class="rounded" src="${path }/resources/images/test.jpg">
							</div>
							<ul class="my-2 p-0 pl-3" style="list-style:none;">
								<li class="h4 mb-2"><strong>제목</strong></li>
								<li class="mb-3">내용</li>
								<li>장소</li>
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