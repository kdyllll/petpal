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

	<!-- Page Content -->
	<main role="main">
		<section class="mt-5 pt-5">
			<div class="container mt-2">
				<div id="blog" class="row">
					<div id="btn">
						<a href="${path }/place/movePlaceList.do">리스트</a>
						<button type="button" class="kind btn btn-secondary btn-sm mr-3">병원</button>
						<button type="button" class="kind btn btn-secondary btn-sm mr-3">미용</button>
						<button type="button" class="kind btn btn-secondary btn-sm mr-3">호텔링</button>
						<button type="button" class="kind btn btn-secondary btn-sm mr-3">훈련소</button>
						<button type="button" class="kind btn btn-secondary btn-sm mr-3">기타</button>
					</div>
					<div class="m-3 col-12"></div>
					<c:if test="${empty list }">
						<div class="col-12 mb-4 text-center">
							<p>장소 후기가 없습니다.</p>
						</div>
					</c:if>
					<c:if test="${not empty list }">
						<c:forEach var="p" items="${list }">
							<div class="col-10 offset-1 blogShort mb-4 border-bottom">
								<a href="${path }/place/movePlaceDetail.do?placeNo=${p.placeNo}" class="post-all">
									<div class="row">
										<div class="col-9">
											<div class="decoration">
												<h3>
													<c:out value="${ p.title} " />
												</h3>
												<article>
													<p>
														<c:out value="${p.content }" />
													</p>
												</article>
											</div>
											<img
												style="width: 1em; height: 1em; vertical-align: baseline;"
												class="rounded"
												src="${path}/resources/upload/member/profile/${p.img}"><span
												class="mr-2"><c:out value="${p.nickName }" /></span> <span
												class="mr-2"> 
												${p.placeDate }
													
												 </span>
											<span class="mr-2">댓글수</span> <span class="mr-2"><c:out
													value="${p.category }" /></span>
											<p>
												<c:out value="${p.position[0] }" />
												<c:out value="${p.position[1] }" />
											</p>
										</div>
										<div class="col-3">
											<img src="${path }/resources/upload/place/${p.fileName}"
												alt="post img" class="rounded float-right">
										</div>
									</div>
								</a>
							</div>
						</c:forEach>
					</c:if>
				</div>
				<p class="text-center">페이지바</p>
			</div>
		</section>
	</main>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>
<script>
	$(document).on(
			'click',
			'.kind',
			function(e) {

				location.assign('${path}/place/movePlaceList.do?category='
						+ e.target.textContent);

			});
</script>
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