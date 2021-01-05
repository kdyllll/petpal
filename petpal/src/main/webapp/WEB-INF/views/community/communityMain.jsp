<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<jsp:include page="/WEB-INF/views/common/commonLink.jsp" />

</head>
<style>
.title{
/* 	text-shadow: -1px 0 #000,
	       0 1px #000,
	       1px 0 #000,
	       0 -1px #000; *//*글자 테두리*/
	text-shadow: 1px 1px 5px #000;

}
</style>
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
					<div class="col-9 mb-5 banner position-relative">
						<a href="${path }/community/tipDetail.do?tipNo=${tipList[0].TIPNO}"><img class="rounded" width="100%" src="${path }/resources/upload/tip/${tipList[0].MAINIMG}"/></a>
						<div class="position-absolute text-white" style="bottom:25;left:40;"><strong class="h3 title"><c:out value="${tipList[0].TITLE }"/></strong></div>
						<div class="position-absolute border border-white rounded px-3 py-2 text-weight-bold" style="bottom:20; right:40; cursor: pointer;" onclick="location.replace('${path}/community/tipDetail.do?tipNo=${tipList[0].TIPNO }')">
							<strong class="h5 title text-white">보러가기</strong>
						</div>
					</div>

					<div id="carouselExampleIndicators" class="find carousel slide col-3 p-0 mb-5 border-top border-bottom" data-ride="carousel">
							<ol class="carousel-indicators">
							<c:forEach items="${findList }" varStatus="vs">
								<li data-target="#carouselExampleIndicators" data-slide-to="${vs.index }" class="${vs.index eq 0?'active':'' }"></li>
							</c:forEach>
							</ol>
							<div class="carousel-inner" role="listbox">
							<c:forEach var="f" items="${findList }" varStatus="vs">
								<div class="carousel-item ${vs.index eq 0?'active':'' } w-100" style="cursor: pointer" onclick="location.replace('${path}/community/findDetail.do?findNo=${f.FINDNO }')" >
									<div class="mt-4 mb-1 text-center mr-2">찾아주세요</div>
									<div class="mb-2 ml-3"><strong><c:out value="${f.ADDRESS }"/></strong></div>
									<div class="col-12">
										<img src="${path }/resources/upload/find/${f.FILENAME}" width="100%" class="rounded">
									</div>
									<div class="my-4 ml-3"><c:out value="${f.TITLE }"/></div>
								</div>
							</c:forEach>

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
						<p class="h4 col-12 mb-4"><strong>인기 사진</strong> <a href="#" class="text-hgh ml-1" style="font-size:15px;">더보기</a></p>
						<c:forEach var="d" items="${dailyList}">
							<div class="col-3" >
								<div class="card mb-4 bg-transparent border-0">
									<a href="${path}/daily/moveDetail.do?dailyNo=${d.DAILYNO }">
										<img src="${path }/resources/upload/community/daily/${d.DAILYIMGNAME}" width="100%" class="rounded">
									</a>
									<div class="card-body p-0 pt-2 pl-2">
										 <div class="px-3 row mb-2">                
			                                <a href="${path }/user/moveUserInfo.do?memberNo=${d.MEMBERNO}"><img src="${path }/resources/upload/member/profile/${d.IMG}" class="rounded" style="width:30px; height: 30px;"></a>
			                                <div class="ml-1">
			                                    <a href="${path }/user/moveUserInfo.do?memberNo=${d.MEMBERNO}"><span class="text-dark align-top mx-1"><strong><c:out value="${d.NICKNAME }"/></strong></span></a> 
			                                </div>                    
			                        	</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
					
					<div class="tipCon row col-12 my-3">
						<p class="h4 col-12 mb-4"><strong>베스트 노하우</strong><a href="#" class="text-hgh ml-2" style="font-size:15px;">더보기</a></p>
						<c:forEach var="t" items="${tipList }" varStatus="vs" begin="1" end="3">						
							<div class="col-4" style="cursor: pointer" onclick="location.replace('${path}/community/tipDetail.do?tipNo=${t.TIPNO }')">							
								<div class="card mb-4 bg-transparent border-0">
									<div class="test">
										<img src="${path }/resources/upload/tip/${t.MAINIMG}" width="100%" class="rounded">
									</div>
									<div class="card-body p-0 pt-2 pl-2">
										<strong><c:out value="${t.TITLE }"/></strong>
									</div>
								</div>						
							</div>
						</c:forEach>
					</div>
					
					<div class="placeCon row col-12 my-3">
						<p class="h4 col-12 mb-4"><strong>유저들의 장소리뷰</strong><a href="#" class="text-hgh ml-2" style="font-size:15px;">더보기</a></p>
						<c:forEach var="p" items="${placeList }">
							<div class="col-11 ml-3 border-bottom row py-2" style="cursor: pointer" onclick="location.replace('${path}/place/movePlaceDetail.do?placeNo=${p.PLACENO }')">
								<div class="col-2 ml-5 my-3">
									<img style="width:100%; vertical-align: baseline;" class="rounded" src="${path }/resources/upload/place/${p.FILENAME}">
								</div>
								<ul class="m-0 p-0 pt-3 pl-3" style="list-style:none;">
									<li class="h5 mb-2"><strong><c:out value="${p.TITLE }"/></strong></li>
									<li class="mb-3"><c:out value="${p.EXPLANATION}"/></li>
									<li><c:out value="${p.POSITION}"/></li>
								</ul>
								
							</div>
						</c:forEach>
					</div>

					



				</div>
			</div>
		</div>

	</main>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>

</html>