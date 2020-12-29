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
		<section class="mt-5">
			<div class="container mt-2">
				<div id="blog" >
					<jsp:include page="/WEB-INF/views/common/communityNav.jsp" />
					<div class="container d-flex justify-content-center position-relative">
						<div id="btn" class="mb-5">
							<button type="button" class="kind btn btn-secondary btn-sm mr-3">병원</button>
							<button type="button" class="kind btn btn-secondary btn-sm mr-3">미용</button>
							<button type="button" class="kind btn btn-secondary btn-sm mr-3">호텔링</button>
							<button type="button" class="kind btn btn-secondary btn-sm mr-3">훈련소</button>
							<button type="button" class="kind btn btn-secondary btn-sm mr-3">기타</button>
						</div>
						 <div class="mr-5 position-absolute " style="top:0; right:0;"><button id="write" class="btn">글쓰기</button></div> 
					</div>
		
					<c:if test="${empty list }">
						<div class="col-12 mb-4 text-center mt-5">
							<p>장소 후기가 없습니다.</p>
						</div>
					</c:if>
					<c:if test="${not empty list }">
						<c:forEach var="p" items="${list }">
							<div class="col-12 col-sm-10 offset-sm-1 blogShort mb-4 border-bottom ">
								<a href="${path }/place/movePlaceDetail.do?placeNo=${p.placeNo}" class="post-all row ">
									
										<div class="col-9">
											<div class="decoration">
												<h3><c:out value="${p.title}" /></h3>
												<article>
													<p class="content">
													
													<c:out value="${fn:substring(p.content,0,50)}" /><c:if test="${fn:length(p.content) > 50 }">...</c:if></p>
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
										<div class="col-3 ">
											<img src="${path }/resources/upload/place/${p.fileName}"
												alt="post img" class="rounded float-right" style="width:75%;">
										</div>	
								</a>
							</div>
						</c:forEach>
					</c:if>
				</div>
				 <p class="text-center">${pageBar }</p> 
			</div>
		</section>
	</main>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>
<script>
$(function(){//글자길이가 길면 ...표시
	for(var i=0;i<$(".content").length;i++){
		var str=$(".content").eq(i).html();
		if(str.length>95){
			$(".content").eq(i).html(str.substring(0,95)+"...");
		}
	}
});


	$(document).on(
			'click',
			'.kind',
			function(e) {

				location.assign('${path}/place/movePlaceList.do?category='
						+ e.target.textContent);

			});
	$(document).on(
			'click',
			'#write',
			function(e) {

				location.assign('${path}/place/movePlaceWrite.do');
				
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