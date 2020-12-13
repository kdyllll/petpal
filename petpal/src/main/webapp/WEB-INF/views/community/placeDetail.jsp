<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<jsp:include page="/WEB-INF/views/common/commonLink.jsp" />
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=83f13676e9dc2f1c67b6922e23af0c14&libraries=services"></script>
</head>
<body class="bg-white  ">
	<jsp:include page="/WEB-INF/views/common/header.jsp" />

	<main role="main" style="min-height: 100vh;">
		<section class="mt-5 pt-5">
			<div class="container">
				<div class="row">

					<div class="col-sm-10 offset-sm-1 col-md-8 offset-md-2">
						<p style="color: #35c5f0; font-weight: bold;">카테고리</p>
						<h2 class="font-weight-bold mb-5">제목</h2>
						<div class="mb-4 d-sm-flex justify-content-sm-between">
							<a href="#" class="d-inline-flex">
								<div>
									<img src="sea)연어.png" alt="" class="rounded-circle mr-3">
								</div>
								<div>
									<div style="font-weight: bold;">작성자</div>
									<div>작성일</div>
								</div>
							</a>
							<div class="d-none d-sm-block">
								<button type="button" class="btn btn-danger float-right">신고</button>
								<button type="button" class="btn float-right"
									style="color: white; background-color: turquoise;">좋아요</button>
								<button type="button" class="btn btn-info float-right">팔로우</button>
							</div>
						</div>
						<div class="d-sm-none mb-3">
							<button type="button" class="btn btn-info">팔로우</button>
							<button type="button" class="btn"
								style="color: white; background-color: turquoise;">좋아요</button>
							<button type="button" class="btn btn-danger ">신고</button>
						</div>
						<p>설명</p>
						<p>위치</p>
						<!-- 지도 api -->
						<div id="map" style="width:100%; height: 350px;"></div>
						<div class="text-center">
							<img src="sea)연어.png" class="img-fluid">
						</div>
						<p>내용</p>
						<!-- 댓글 -->
						<hr>
						<h4>
							댓글<span class="su">2</span>
						</h4>
						<div class="d-flex mb-3">
							<div class="input-group mb-3">
								<input type="text" class="form-control"
									placeholder="칭찬과 격려의 댓글은 작성자에게 큰 힘이 됩니다:)"
									aria-label="Recipient's username"
									aria-describedby="button-addon2">
								<div class="input-group-append">
									<button class="btn btn-outline-secondary" type="button"
										id="button-addon2">등록</button>
								</div>
							</div>
						</div>
						<div class="d-flex mb-3">
							<div>
								<img src="sea)연어.png" class="rounded-circle mr-3">
							</div>
							<div>
								<div>
									<strong><span>작성자</span></strong> <span>내용</span>
								</div>
								<div>
									<span style="font-size: 14px; color: gray;">몇분전</span>
									<button class="click text-black-50" style="font-weight: bold;">답글
										달기</button>
									<button class="click" style="color: gray; font-size: 14px;">신고</button>
								</div>
							</div>
						</div>
						<div class="d-flex mb-3">
							<div>
								<img src="sea)연어.png" class="rounded-circle mr-3">
							</div>
							<div>
								<div>
									<strong><span>작성자</span></strong> <span>안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕</span>
								</div>
								<div>
									<span style="font-size: 14px; color: gray;">몇분전</span>
									<button class="click text-black-50" style="font-weight: bold;">답글
										달기</button>
									<button class="click" style="color: gray; font-size: 14px;">신고</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</main>
	<style>
.rounded-circle {
	width: 40px;
	height: 40px;
}

.img {
	width: 100%;
}

a {
	color: black;
}

a:hover {
	text-decoration: none;
}

.su {
	color: #35c5f0;
}

button.click:hover {
	text-decoration: underline;
}

button.click {
	background-color: white;
	border: none;
}
</style>
	
	<script>
		var maker;
		var map;
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};

		//지도를 생성합니다    
		map = new kakao.maps.Map(mapContainer, mapOption);

		//주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();

		//주소로 좌표를 검색합니다
		geocoder.addressSearch(
						'제주특별자치도 제주시 첨단로 242',
						function(result, status) {

							// 정상적으로 검색이 완료됐으면 
							if (status === kakao.maps.services.Status.OK) {

								var coords = new kakao.maps.LatLng(result[0].y,
										result[0].x);

								// 결과값으로 받은 위치를 마커로 표시합니다
								 marker = new kakao.maps.Marker({
									map : map,
									position : coords
								});

								// 인포윈도우로 장소에 대한 설명을 표시합니다
								var infowindow = new kakao.maps.InfoWindow(
										{
											content : '<div style="width:150px;text-align:center;padding:6px 0;">어쩌구</div>'	
										});
								infowindow.open(map, marker);

								// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
								map.setCenter(coords);
								
							}
						});
		window.addEventListener('resize', function(){//윈도우창 크기가 변할때
			var markerPosition = marker.getPosition(); 
			map.relayout();
			map.setCenter(markerPosition);
		});
		
	</script>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>