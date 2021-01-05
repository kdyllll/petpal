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
						<div id="carouselExampleIndicators" class="carousel slide mb-5 rounded col-10" data-ride="carousel">
							<ol class="carousel-indicators">
								<li data-target="#carouselExampleIndicators" data-slide-to="0"
									class="active"></li>
								<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
							</ol>
							<div class="carousel-inner" role="listbox">
								<div class="carousel-item active">
									<img class="d-block img-fluid rounded" src="${path }/resources/images/banner.jpg"
										alt="First slide" style=" width: 100%">
								</div>
								<div class="carousel-item">
									<img class="d-block img-fluid rounded" src="${path }/resources/images/banner2.jpg"
										alt="Second slide" style="width: 100%">
								</div>
							</div>
							<a class="carousel-control-prev"
								href="#carouselExampleIndicators" role="button"
								data-slide="prev"> <span class="carousel-control-prev-icon"
								aria-hidden="true"></span> <span class="sr-only">Previous</span>
							</a> <a class="carousel-control-next"
								href="#carouselExampleIndicators" role="button"
								data-slide="next"> <span class="carousel-control-next-icon"
								aria-hidden="true"></span> <span class="sr-only">Next</span>
							</a>
						</div>
					
					
					<div class="form-inline container text-center mb-3">
						<h3>인기 사진</h3>
					</div>

					<div class="col-xl-3 col-lg-4 col-md-6" style="cursor: pointer"	onclick="location.replace('${path}/community/tipDetail.do')">
						<div class="card mb-4 bg-transparent border-0">
							<div class="test">
								<img src="${path }/resources/images/test.jpg" id="scale"
									width="100%" height="225">
							</div>
							<div class="card-body">
								<p class="card-text">제목</p>
								<div class="d-flex justify-content-between align-items-center">
									<small class="text-muted"> <label>조회수 0 </label> <label>스크랩
											0 </label></small>
								</div>
							</div>
						</div>
					</div>



				</div>
			</div>
		</div>

	</main>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>

</html>