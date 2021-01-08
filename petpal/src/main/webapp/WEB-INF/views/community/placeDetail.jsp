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
		<section class="">
			<div class="container">
				<div class="row">
				<c:set var="place" value="${list[0] }"/>
					<input type="hidden" name="placeNo" value="${ place.placeNo}" id="placeNo">
					<input type="hidden" name="memberNo" value="${loginMember.memberNo }" id="memberNo">
					<input type="hidden" class="loginMember" value="${loginMember.memberNo }">
					<div class="col-sm-10 offset-sm-1 col-md-8 offset-md-2">
						<div class="d-flex justify-content-between mb-3">
							<span style="color: #35c5f0; font-weight: bold;"><c:out value="${place.category }"/></span>
							<c:if test="${loginMember.memberNo==place.memberNo}">
							<div class="d-flex">
							<button type="button" class="btn btn-outline-secondary" id="update">수정</button>
							<button type="button" class="btn btn-outline-secondary" id="delete">삭제</button>
							</div>
							</c:if>
						</div>
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

								<!-- 팔로우 버튼 -->								
								<button type="button" class="follow followBtn btn btn-info float-right">
		                    		<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-person" viewBox="0 0 16 16">
									  <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z"/>
									</svg>
								</button>
								<button type="button" class="following followBtn btn btn-info float-right" style="background-color:#dfdfdf;">
									<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-person-check-fill" viewBox="0 0 16 16">
									  <path fill-rule="evenodd" d="M15.854 5.146a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 0 1 .708-.708L12.5 7.793l2.646-2.647a.5.5 0 0 1 .708 0z"/>
									  <path d="M1 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
									</svg>
								</button>
								<!-- 좋아요버튼 -->
								
								<c:if test="${not empty like }">				
									<button type="button" class="btn d-none" >
										<svg xmlns="http://www.w3.org/2000/svg" width="1.2em" height="1.5em" fill="currentColor" class="bi bi-suit-heart binHeart text-danger" viewBox="0 0 16 16">
										  <path d="M8 6.236l-.894-1.789c-.222-.443-.607-1.08-1.152-1.595C5.418 2.345 4.776 2 4 2 2.324 2 1 3.326 1 4.92c0 1.211.554 2.066 1.868 3.37.337.334.721.695 1.146 1.093C5.122 10.423 6.5 11.717 8 13.447c1.5-1.73 2.878-3.024 3.986-4.064.425-.398.81-.76 1.146-1.093C14.446 6.986 15 6.131 15 4.92 15 3.326 13.676 2 12 2c-.777 0-1.418.345-1.954.852-.545.515-.93 1.152-1.152 1.595L8 6.236zm.392 8.292a.513.513 0 0 1-.784 0c-1.601-1.902-3.05-3.262-4.243-4.381C1.3 8.208 0 6.989 0 4.92 0 2.755 1.79 1 4 1c1.6 0 2.719 1.05 3.404 2.008.26.365.458.716.596.992a7.55 7.55 0 0 1 .596-.992C9.281 2.049 10.4 1 12 1c2.21 0 4 1.755 4 3.92 0 2.069-1.3 3.288-3.365 5.227-1.193 1.12-2.642 2.48-4.243 4.38z"/>
										</svg>
									</button>
									<button type="button" class="btn " >
										<svg xmlns="http://www.w3.org/2000/svg" width="1.2em" height="1.5em" fill="currentColor" class="bi bi-suit-heart-fill text-danger" viewBox="0 0 16 16">
										  <path class="fillHeart" d="M4 1c2.21 0 4 1.755 4 3.92C8 2.755 9.79 1 12 1s4 1.755 4 3.92c0 3.263-3.234 4.414-7.608 9.608a.513.513 0 0 1-.784 0C3.234 9.334 0 8.183 0 4.92 0 2.755 1.79 1 4 1z"/>
										</svg>
									</button>
								</c:if>
								<c:if test="${empty like }">				
										<button type="button" class="btn " >
											<svg xmlns="http://www.w3.org/2000/svg" width="1.2em" height="1.5em" fill="currentColor" class="bi bi-suit-heart binHeart text-danger" viewBox="0 0 16 16">
											  <path d="M8 6.236l-.894-1.789c-.222-.443-.607-1.08-1.152-1.595C5.418 2.345 4.776 2 4 2 2.324 2 1 3.326 1 4.92c0 1.211.554 2.066 1.868 3.37.337.334.721.695 1.146 1.093C5.122 10.423 6.5 11.717 8 13.447c1.5-1.73 2.878-3.024 3.986-4.064.425-.398.81-.76 1.146-1.093C14.446 6.986 15 6.131 15 4.92 15 3.326 13.676 2 12 2c-.777 0-1.418.345-1.954.852-.545.515-.93 1.152-1.152 1.595L8 6.236zm.392 8.292a.513.513 0 0 1-.784 0c-1.601-1.902-3.05-3.262-4.243-4.381C1.3 8.208 0 6.989 0 4.92 0 2.755 1.79 1 4 1c1.6 0 2.719 1.05 3.404 2.008.26.365.458.716.596.992a7.55 7.55 0 0 1 .596-.992C9.281 2.049 10.4 1 12 1c2.21 0 4 1.755 4 3.92 0 2.069-1.3 3.288-3.365 5.227-1.193 1.12-2.642 2.48-4.243 4.38z"/>
											</svg>
										</button>
										<button type="button" class="btn d-none" >
											<svg xmlns="http://www.w3.org/2000/svg" width="1.2em" height="1.5em" fill="currentColor" class="bi bi-suit-heart-fill text-danger" viewBox="0 0 16 16">
											  <path class="fillHeart" d="M4 1c2.21 0 4 1.755 4 3.92C8 2.755 9.79 1 12 1s4 1.755 4 3.92c0 3.263-3.234 4.414-7.608 9.608a.513.513 0 0 1-.784 0C3.234 9.334 0 8.183 0 4.92 0 2.755 1.79 1 4 1z"/>
											</svg>
										</button>
								</c:if>
								
								
							</div>
						</div>
						<div class="d-sm-none mb-3">
							
							<!-- 팔로우 버튼 -->								
								<button type="button" class="follow followBtn btn btn-info float-right">
		                    		<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-person" viewBox="0 0 16 16">
									  <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z"/>
									</svg>
								</button>
								<button type="button" class="following followBtn btn btn-info float-right" style="background-color:#dfdfdf;">
									<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-person-check-fill" viewBox="0 0 16 16">
									  <path fill-rule="evenodd" d="M15.854 5.146a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 0 1 .708-.708L12.5 7.793l2.646-2.647a.5.5 0 0 1 .708 0z"/>
									  <path d="M1 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
									</svg>
								</button>

							<button type="button" class="btn btn-danger ">신고</button>
							<button><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-suit-heart" viewBox="0 0 16 16">
  <path d="M8 6.236l-.894-1.789c-.222-.443-.607-1.08-1.152-1.595C5.418 2.345 4.776 2 4 2 2.324 2 1 3.326 1 4.92c0 1.211.554 2.066 1.868 3.37.337.334.721.695 1.146 1.093C5.122 10.423 6.5 11.717 8 13.447c1.5-1.73 2.878-3.024 3.986-4.064.425-.398.81-.76 1.146-1.093C14.446 6.986 15 6.131 15 4.92 15 3.326 13.676 2 12 2c-.777 0-1.418.345-1.954.852-.545.515-.93 1.152-1.152 1.595L8 6.236zm.392 8.292a.513.513 0 0 1-.784 0c-1.601-1.902-3.05-3.262-4.243-4.381C1.3 8.208 0 6.989 0 4.92 0 2.755 1.79 1 4 1c1.6 0 2.719 1.05 3.404 2.008.26.365.458.716.596.992a7.55 7.55 0 0 1 .596-.992C9.281 2.049 10.4 1 12 1c2.21 0 4 1.755 4 3.92 0 2.069-1.3 3.288-3.365 5.227-1.193 1.12-2.642 2.48-4.243 4.38z"/>
</svg></button>
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
						
						<!-- 로그인모달 -->
						<div class="loginModal"></div>
						
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
	$(document).on(
			'click',
			'#update',
			function(e) {//수정버튼 눌렀을때
				var placeNo=$("#placeNo").val();
				location.assign('${path}/place/movePlaceUpdate.do?placeNo='+placeNo);
			});
	$(document).on(
			'click',
			'#delete',
			function(e) {//삭제버튼 눌렀을때
				var placeNo=$("#placeNo").val();
				location.assign('${path}/place/movePlaceDelete.do?placeNo='+placeNo);
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
											content : '<div style="width:150px;text-align:center;padding:6px 0;">장소 위치</div>'	
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
		
		let loginMember=$(".loginMember").val();
		
		$(".binHeart").on("click" , e => {
	 		if(loginMember==""){//로그인 안되어있다면
	 			loginModal();

	 		}else {//댓글 내용이 없으면
	 			$(e.target).parent().addClass("d-none");
	 			$(e.target).parent().next().removeClass("d-none");
	 			$.ajax({
	 		        url:"${path}/place/insertLike.do",
	 		        data:{placeNo : $("#placeNo").val()},
	 		        success: (data) => {
	 		       	 console.log(data); 
	 		        }
	 			})
	 		} 		
	 	})

	 	$(".fillHeart").on("click" , e => {
	 		if(loginMember==""){//로그인 안되어있다면
	 			loginModal();
	 		}else {//댓글 내용이 없으면
	 			$(e.target).parent().parent().addClass("d-none");
	 			$(e.target).parent().parent().prev().removeClass("d-none");
	 			$.ajax({
	 		        url:"${path}/place/deleteLike.do",
	 		        data:{placeNo :  $("#placeNo").val()},
	 		        success: (data) => {
	 		       	 console.log(data); 
	 		        }
	 		     })
	 		}
	 		
	 	})
		
		//로그인 모달
		function loginModal(){
			$.ajax({
				url: "${path}/login/moveLogin.do",
				dataType:"html",
				success:(data) => {
					$(".loginModal").html(data);	
		        	$('#loginModal').modal(); 
				}
			});
		};
		
		$(".followBtn").on('click',function() {
			if(loginMember!=""){
				let writerNo = '${place.memberNo}';
	 	 		$.ajax({
	 	 			async: false,
	 	 			url: "${path}/user/following.do",
	 	 			data: {writerNo : writerNo},
	 	 			success:(data) => {
	 	 				if(data==10){
	 	 					$(".following").show();
	 	 					$(".follow").hide();
	 	 				}else if(data==20){
	 	 					$(".following").hide();
	 	 					$(".follow").show();
	 	 				}
	 	 			},error:function(request, status, error){
	 	 				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	 	 			}
	 	 		});
			}else{ //로그인 안되어 있으면 로그인 모달 띄우기
				loginModal();
			};
	 	});
	 	
	 	$(document).ready(function(){
	 		let writerNo = '${place.memberNo}';
	 		$.ajax({
	 			async: false,
	 			url: "${path}/user/followingCheck.do",
	 			data: {writerNo : writerNo},
	 			success:(data) => {
	 				if(data==10){
	 					$(".following").hide();
	 					$(".follow").show();
	 				}else if(data==20){
	 					$(".following").show();
	 					$(".follow").hide();
	 				}
	 				if(data==100){
	 					$(".following").hide();
	 					$(".follow").show();
	 				}
	 			},error:function(request, status, error){
	 				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	 			}
	 		});
	 	})
		
		
	</script>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>