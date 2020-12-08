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
		<div class="album py-5 bg-light">
			<div class="container my-4 mt-lg-0">
				<div class="row ">
					

					<div class="form-inline container text-center mb-3">
						<h3>테마별 노하우</h3>
						<button type="button" class="btn btn-outline-secondary ml-auto" onclick="location.replace('${path}/community/TipWrite.do')">글쓰기</button>
					</div>
					<div class="form-inline container-xl mb-5">
						<button type="button" class="btn btn-outline-secondary mr-2">전체</button>
						<button type="button" class="btn btn-outline-secondary mr-2">훈련</button>
						<button type="button" class="btn btn-outline-secondary mr-2">수제간식</button>
						<button type="button" class="btn btn-outline-secondary mr-2">DIY 옷</button>
						<button type="button" class="btn btn-outline-secondary mr-2">DIY 가구</button>
						<button type="button" class="btn btn-outline-secondary mr-2">건강</button>
						<button type="button" class="btn btn-outline-secondary mr-2">팁</button>
						<button type="button" class="btn btn-outline-secondary mr-2">기타</button>
						
						<div class="dropdown ml-auto">
							<button class="btn btn-light dropdown-toggle" type="button"
								id="dropdownMenuButton" data-toggle="dropdown"
								aria-haspopup="true" aria-expanded="false">정렬</button>
							<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
								<button class="dropdown-item" >최신순</button>
								<button class="dropdown-item" >인기순</button>
								<button class="dropdown-item" >팔로워순</button>
								<button class="dropdown-item" >스크랩순</button>
							</div>
						</div>
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
						</style>
					</div>

					<div class="col-xl-3 col-lg-4 col-md-6" style="cursor:pointer" id="img" onclick="location.replace('${path}/community/TipDetail.do')">
						<div class="card mb-4 bg-transparent border-0"  >
							<div class="test">
								<img src="${path }/resources/images/test.jpg"  id="scale" width="100%" height="225">
							</div>
							<div class="card-body">
								<p class="card-text">제목</p>
								<div class="d-flex justify-content-between align-items-center">
									<small class="text-muted"> <label>조회수 0
											</label> <label>스크랩 0
												</label></small>
								</div>
							</div>
						</div>
					</div>
					
					<c:forEach items="${list }" var="t">
						<c:if test="${not empty t.MAINIMG }">
						<div class="col-xl-3 col-lg-4 col-md-6" style="cursor:pointer" id="img" onclick="location.replace('${path}/community/TipDetail.do?tipNo=${t.TIPNO}')">
							<div class="card mb-4 bg-transparent border-0"  >
								<div class="test">
									<img src="${path}/resources/upload/tip/${t.MAINIMG}"  id="scale" width="100%" height="225">
								</div>
								<div class="card-body">
									<p class="card-text"><c:out value="${t.TITLE }"/></p>
									<div class="d-flex justify-content-between align-items-center">
									<small class="text-muted"> <label>조회수 0
											</label> <label>스크랩 0
												</label></small>
									</div>
								</div>
							</div>
						</div>						
						</c:if>
					</c:forEach>
					
					
					<style>
					.test {
						width:100%;
						height:225px;
						overflow:hidden;
					}
					
					#scale {
						transition:all 0.5s;
					}
					#scale:hover {
					  transform: scale(1.1);
					  -webkit-transform: scale(1.1);
					  -moz-transform: scale(1.1);
					  -ms-transform: scale(1.1);
					  -o-transform: scale(1.1);
					}
					</style>
					
					
				</div>
			</div>
		</div>

	</main>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>

</html>