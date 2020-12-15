<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<jsp:include page="/WEB-INF/views/common/commonLink.jsp" />
<style>
.dropdown .dropdown-menu {
	display: block;
	opacity: 0;
	transition: all 700ms ease;
}

.dropdown:hover .dropdown-menu {
	display: block;
	opacity: 1;
}

.test {
	width: 100%;
	height: 225px;
	overflow: hidden;
}

#scale {
	transition: all 0.5s;
}

#scale:hover {
	transform: scale(1.1);
	-webkit-transform: scale(1.1);
	-moz-transform: scale(1.1);
	-ms-transform: scale(1.1);
	-o-transform: scale(1.1);
}

</style>
</head>
<body class="bg-white">
	<jsp:include page="/WEB-INF/views/common/header.jsp" />

	<main role="main" class="bg-white">
		<div class="album ">
			<div class="container my-4 mt-lg-0">
				<div class="row ">
					<div class="col-lg-12 my-5 mt-lg-0 ">
						<div class="mt-3 mt-lg-0 d-lg-flex py-3">
							<a
								class="d-block d-xl-inline text-left mb-0 border-0 px-0 pr-3 py-3 "
								type="button"> 홈 </a> <a
								class="d-block d-xl-inline text-left mb-0 border-0 px-0 pr-3 py-3 "
								type="button"> 사진 </a> <a
								class="d-block d-xl-inline text-left collapsed mb-0 border-0 px-0 pr-3 py-3"
								type="button"> 노하우 </a> <a
								class="d-block d-xl-inline text-left collapsed mb-0 border-0 px-0 pr-3 py-3"
								type="button"> 장소 </a> <a href="${path }/community/findList.do"
								class="d-block d-xl-inline text-left collapsed mb-0 border-0 px-0 py-3"
								type="button"> 찾아주세요 </a>

						</div>
					</div>
					<div class="form-inline container text-center mb-3">
						<h3>찾아주세요</h3>
						<button type="button" class="btn btn-outline-secondary ml-auto"
							onclick="location.replace('${path}/community/findWrite.do')">글쓰기</button>
					</div>
					<div class="form-inline container-xl mb-5">
						<button type="button" class="btn btn-outline-secondary mr-2">전체</button>
						<button type="button" class="btn btn-outline-secondary mr-2">강아지</button>
						<button type="button" class="btn btn-outline-secondary mr-2">고양이</button>
						<button type="button" class="btn btn-outline-secondary mr-2">소동물</button>

						<div class="dropdown ml-auto">
							<button class="btn btn-light dropdown-toggle" type="button"
								id="dropdownMenuButton" data-toggle="dropdown"
								aria-haspopup="true" aria-expanded="false">정렬</button>
							<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
								<button class="dropdown-item">최신순</button>
								<button class="dropdown-item">인기순</button>
								<button class="dropdown-item">팔로워순</button>
								<button class="dropdown-item">스크랩순</button>
							</div>
						</div>

					</div>

				</div>
				<div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 row-cols-xl-4 g-4">
					<div class="col mb-4">
						<div class="card h-100 border-0 " style="overflow: hidden;">
							<span>ddd</span> <a href="${path}/community/findDetail.do"><img
								src="..." alt="..." style="width: 100%; height: 200px;"></a>
							<div class="card-body">
								<h5 class="card-title">제목</h5>
								<p class="card-text">내용</p>
								<span class="">장소</span>
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