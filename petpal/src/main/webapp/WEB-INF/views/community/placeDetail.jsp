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
		<div class="container my-4 mt-lg-0">
			<div class="row ">
				<jsp:include page="/WEB-INF/views/common/communityNav.jsp" >
					<jsp:param value="placeDetail" name="comNav"/>
				</jsp:include>
			</div>
		</div>
		<section class="mt-5 pt-5">
			<div class="container">
				<div class="row">
				<c:set var="place" value="${list[0] }"/>
					<input type="hidden" name="placeNo" value="${ place.placeNo}" id="placeNo">
					<input type="hidden" name="memberNo" value="${loginMember.memberNo }" id="memberNo">
					<div class="col-sm-10 offset-sm-1 col-md-8 offset-md-2">
						<p style="color: #35c5f0; font-weight: bold;"><c:out value="${place.category }"/></p>
						<h2 class="font-weight-bold mb-5"><c:out value="${place.title }"/></h2>
						<div class="mb-4 d-sm-flex justify-content-sm-between">
							<a href="${path }/user/moveUserInfo.do" class="d-inline-flex">
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
						<!-- 해쉬태그 -->
						<div id="hashtagContainer">
							<ul >
								<c:forEach items="${hList }" var="h">
								<li class="d-inline-flex mr-3 hashtag rounded">#<a href="#"><c:out value="${h.hashContent }"/></a></li>
								</c:forEach>
							</ul>
						</div>	
						<!-- 댓글 -->
						<hr class="my-5">
						
						<div id="commentContainer">
						<h4>
							댓글<span class="su"><c:out value="${count }"/></span>
						</h4>
						<!-- 댓글등록 -->
						<div class="d-flex mb-3 editor">
							<div class="input-group mb-3">
								<input type="hidden" name="commentLevel" value="1">
								<input type="hidden" name="commentRef" value="" >
								<input type="text" class="form-control rounded" name="placeComment" 
									placeholder="칭찬과 격려의 댓글은 작성자에게 큰 힘이 됩니다:)"
									aria-label="Recipient's username"
									aria-describedby="button-addon2">
								<div class="input-group-append">
									<button class="btn btn-outline-secondary write" type="button"
										>등록</button>
								</div>
							</div>
						</div>
							<c:forEach items="${cList }" var="c">
								<c:if test="${c.commentLevel eq 1 }">
							<div class="d-flex mb-3 comment level1">
								<a href="#">
								<div>
									<img src="${path }/resources/upload/member/profile/${c.img }" class="rounded-circle mr-3">
								</div>
								<div>
									<div>
										<strong><span><c:out value="${c.nickName }"/></span></strong></a> <span><c:out value="${c.placeComment }"/></span>
									</div>
									<div>
										<span style="font-size: 14px; color: gray;">
										<c:set var="today" value="<%=new java.util.Date()%>" />
										<fmt:parseNumber value="${(today.time-c.writeDate.time)/(1000*60) }" var="cha" integerOnly="true"/>
										 <c:choose>
										 	<c:when test="${cha<60 }">${cha}분 전</c:when>
										    <c:when test="${cha>=60&&cha<1440}"><fmt:formatNumber value="${cha/60 }" type="number" maxFractionDigits="0"/>시간 전</c:when>
										 	<c:when test="${cha>=1440&&cha<43200 }"><fmt:formatNumber value="${cha/60/24 }" type="number" maxFractionDigits="0"/>일 전</c:when>
										 	<c:otherwise><c:out value="${c.writeDate }"/></c:otherwise>
										 </c:choose>
										</span>
										<button class="reply click text-black-50" style="font-weight: bold;" value="${c.placeCommentNo }">답글
											달기</button>
										<button class="click" style="color: gray; font-size: 14px;">신고</button>
									</div>
								</div>
							</div>
							</c:if>
							
							
							<c:if test="${c.commentLevel eq 2 }">
							<div class="d-flex mb-3 comment level2 ml-5 rounded">
								<a href="#">
								<div>
									<img src="${path }/resources/upload/member/profile/${c.img }" class="rounded-circle mr-3">
								</div>
								<div>
									<div>
										<strong><span><c:out value="${c.nickName }"/></span></strong></a> <span><c:out value="${c.placeComment }"/></span>
									</div>
									<div>
										<span style="font-size: 14px; color: gray;">
										<c:set var="today" value="<%=new java.util.Date()%>" />
										<fmt:parseNumber value="${(today.time-c.writeDate.time)/(1000*60) }" var="cha" integerOnly="true"/>
										 <c:choose>
										 	<c:when test="${cha<60 }">${cha}분 전</c:when>
										    <c:when test="${cha>=60&&cha<1440}"><fmt:formatNumber value="${cha/60 }" type="number" maxFractionDigits="0"/>시간 전</c:when>
										 	<c:when test="${cha>=1440&&cha<43200 }"><fmt:formatNumber value="${cha/60/24 }" type="number" maxFractionDigits="0"/>일 전</c:when>
										 	<c:otherwise><c:out value="${c.writeDate }"/></c:otherwise>
										 </c:choose>
										</span>
										<button class="click" style="color: gray; font-size: 14px;">신고</button>
									</div>
								</div>
							</div>
							</c:if>
							</c:forEach>
							<div>${pageBar }</div>
						</div>
					</div>
				</div>
			</div>
			<div class="pdtModal"></div>
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
	color:black;
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
ul li{
	list-style-type:none;
}
.hashtag:hover{
	background-color:#e2e2e2;
}
.hashtag{
	color:gray;
}
</style>
	
	
	<script>
	//로그인모달
     function loginModal(){
       $.ajax({
          url: "${path}/login/moveLogin.do",
          dataType:"html",
          success:(data) => {
             $(".pdtModal").html(data);   
             $('div.modal').modal(); 
          }
       });
    }; 
	$(function(){//로그인 안되어있을때 댓글창 누르면 손가락표시
		if($("#memberNo").val()==""){
			$("[name=placeComment]").css({"cursor":"pointer"});
		}
	});
	$(document).on(//댓글창 눌렀을떄
			'click',
			'[name=placeComment]',
			function(e) {
				if($("#memberNo").val()==""){
					loginModal();
				}
			
			});
	$(document).on(
			'click',
			'.reply',
			function(e) {//답글달기 눌렀을때
				if($("#memberNo").val()==""){
					loginModal();
					return;
				}
				var comment=$(e.target).parents("div.comment");//답글달기의 댓글
				
				if($("div.editor").length==2&&!comment.next().hasClass("editor")){//댓글달기 창이 두개이고 
					var flag=confirm("다른 댓글에서 작성하고 있던 내용이 유실됩니다. 정말 이 댓글로 전환하시겠습니까?")
					if(flag==true){//확인 눌렀을때
						$("#commentContainer").find("div.subComment").remove();
					}else{//취소 눌렀을때 변화없음
						
					}
				}
				if($("div.editor").length==1){//댓글달기창이 하나일때
				var editor=$("div.editor").clone();
				editor.addClass("ml-5");
				editor.addClass("subComment");
				editor.find("[name=commentLevel]").val("2");
				editor.find("[name=placeComment]").val("");
				editor.find("[name=commentRef]").val($(e.target).val());
				comment.after(editor);//
				}
					
				
			});
	
	$(document).on(
			'click',
			'.write',
			function(e) {//댓글 등록 버튼 눌렀을때
				if($("#memberNo").val()==""){//로그인 안되어있다면
					loginModal();
				return;
				}else if($(e.target).parents("div.editor").find("[name=placeComment]").val().trim()==""){//댓글 내용이 없으면
					alert("내용을 입력해주세요.");
					return;
				}
				var memberNo=$("#memberNo").val();
				var placeNo=$("#placeNo").val();
				var placeComment=$(e.target).parents("div.editor").find("[name=placeComment]").val();
				var commentLevel=$(e.target).parents("div.editor").find("[name=commentLevel]").val();
				var commentRef=$(e.target).parents("div.editor").find("[name=commentRef]").val();
				$.ajax({
					url:"${path}/place/commentWrite.do",
					data:{placeComment:placeComment,commentLevel:commentLevel,memberNo:memberNo,placeNo:placeNo,commentRef:commentRef,},
					success:data=>{
						$("#commentContainer").children().remove();
						$("#commentContainer").append(data);
					},
					error:function(){
						alert("댓글 등록에 실패하였습니다.");
					}
				})
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