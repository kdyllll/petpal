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
				<c:set var="place" value="${list[0] }"/>
					<div class="col-sm-10 offset-sm-1 col-md-8 offset-md-2">
						<p style="color: #35c5f0; font-weight: bold;"><c:out value="${place.category }"/></p>
						<h2 class="font-weight-bold mb-5"><c:out value="${place.title }"/></h2>
						<div class="mb-4 d-sm-flex justify-content-sm-between">
							<a href="#" class="d-inline-flex">
								<div>
									<img src="${path }/resources/upload/member/profile/${place.img}" alt="" class="rounded-circle mr-3">
								</div>
								<div>
									<div style="font-weight: bold;"><c:out value="${place.nickName }"/></div>
									<!-- String으로 가져온 날짜를 Date형으로 바꿈(parseDate) -->
									<fmt:parseDate value="${place.placeDate }" var="pd" pattern="yyyy-MM-dd HH:mm"/>
									<div><fmt:formatDate value="${pd }" pattern="yyyy년MM월dd일 HH:mm"/></div>
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
						<h5 class="font-weight-bold">장소 설명</h5>
						<p><c:out value="${place.explanation }"/></p>
						<h5 class="font-weight-bold">위치</h5>
						<p><c:out value="${place.position[0]}${place.position[1]}"/></p>
						<!-- 지도 api -->
						<div id="map" style="width:80%; height:300px;" class="mb-5"></div>
						<c:forEach var="p" items="${list }">
						<div>
							<img src="${path }/resources/upload/place/${p.fileName}" class="img-fluid" style="width:80%;">
						</div>
						<p style="width:80%;"><c:out value="${p.content }"/></p>
						</c:forEach>
						<!-- 댓글 -->
						<hr>
						<h4>
							댓글<span class="su"><c:out value="count"/></span>
						</h4>
						<form method="post" action="">
						<div class="d-flex mb-3">
							<div class="input-group mb-3">
								<input type="hidden" name="commentLevel" value="1">
								<input type="hidden" name="memberNo" value="${loginMember.memberNo }" id="member">
								<input type="hidden" name="placeNo" value="${ place.placeNo}">
								<input type="hidden" name="commentRef" value="0">
								<input type="text" class="form-control" name="placeComment" id="comment" 
									placeholder="칭찬과 격려의 댓글은 작성자에게 큰 힘이 됩니다:)"
									aria-label="Recipient's username"
									aria-describedby="button-addon2">
								<div class="input-group-append">
									<button class="btn btn-outline-secondary" type="button"
										id="write">등록</button>
								</div>
							</div>
						</div>
						</form>
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
	$(function(){//로그인 안되어있을때 댓글창 누르면 손가락표시
		if($("#member").val()==""){
			$("#comment").css({"cursor":"pointer"});
		}
	});
	$(document).on(
			'click',
			'#comment',
			function(e) {//댓글창 눌렀을때
				if($("#member").val()==""){//로그인 안되어있다면
					location.replace('${path}//member/moveLogin.do');
				}
			});
	$(document).on(
			'click',
			'#write',
			function(e) {//댓글 등록 눌렀을때
				if($("#member").val()==""){//로그인 안되어있다면
					location.replace('${path}//member/moveLogin.do');
				}else if($("#comment").val().trim()==""){
					alert("내용을 입력해주세요.");
				}
			
			});
	
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
						'${place.position[0]}',
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