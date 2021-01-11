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

.title {
	font-size: 16px;
}

.content {
	font-size: 14px;
}

.address {
	font-size: 12px;
}
</style>
</head>
<body class="bg-white">
	<jsp:include page="/WEB-INF/views/common/header.jsp" />

	<main role="main" class="bg-white">
		<div class="album ">
			<div class="container my-4 mt-lg-0">
				<div class="row ">
					<jsp:include page="/WEB-INF/views/common/communityNav.jsp">
						<jsp:param value="findList" name="comNav" />
					</jsp:include>
					<div class="form-inline container text-center mb-3">
						<h3>찾습니다</h3>
						<input type="hidden" class="loginMember"
							value="${loginMember.memberNo }" />
						<button type="button"
							class="btn btn-outline-secondary ml-auto writeBtn">글쓰기</button>

					</div>
					<form action="${path }/community/findList.do"
						class="form-inline container-xl mb-5" method="get">
						<button type="submit"
							class="btn btn-outline-secondary mr-2 allBtn">전체</button>
						<button type="submit"
							class="btn btn-outline-secondary mr-2 dogBtn">강아지</button>
						<button type="submit"
							class="btn btn-outline-secondary mr-2 catBtn">고양이</button>
						<button type="submit"
							class="btn btn-outline-secondary mr-2 smallBtn">소동물</button>
						<div class="cate"></div>
					</form>
				</div>
				<div
					class="row row-cols-1 row-cols-md-2 row-cols-lg-3 row-cols-xl-4 g-4">
					<c:if test="${empty list }">
						<div class="mx-auto">
							<p class="">글이 없습니다.</p>
						</div>
					</c:if>
					<c:if test="${not empty list  }">
						<c:forEach var="t" items="${list}">
							<div class="col-xl-3 col-lg-4 col-md-6 mb-5">
								<div class="card mb-4 bg-transparent border-0">
									<div class="px-3 row mb-2">
										<c:if test="${not empty t.IMG }">
											<a
												href="${path }/user/moveUserInfo.do?memberNo=${t.MEMBERNO}"><img
												src="${path }/resources/upload/member/profile/${t.IMG}"
												style="width: 40px; height: 40px; border-radius: 50%;"></a>
										</c:if>
										<c:if test="${ empty t.IMG }">
											<a
												href="${path }/user/moveUserInfo.do?memberNo=${t.MEMBERNO}"><img
												src="${path }/resources/upload/member/profile/avatar.webp"
												style="width: 40px; height: 40px; border-radius: 50%;"></a>
										</c:if>
										<div class="ml-1">
											<a
												href="${path }/user/moveUserInfo.do?memberNo=${t.MEMBERNO}"><span
												class="text-dark align-top mx-1"><strong><c:out
															value="${t.NICKNAME }" /></strong></span></a> <span><strong>
													· </strong></span> <span><button
													class="btn btn-link text-point p-0 align-top">
													
														
														<c:set var="flag" value="false" />
															<c:if test="${not empty loginMember }">
																<c:if test="${not empty following }">
																	<c:forEach var = "f" items="${following }">
																		<c:if test="${f.WRITERNO eq t.MEMBERNO }">
																			<c:set var="flag" value="true" />
																		</c:if>
																	</c:forEach>
																</c:if>
															</c:if>
															
														
														
														
														
														<c:if test="${empty loginMember }">
																<strong onclick="follow(event);"> 팔로우</strong>
															</c:if>
															
															<c:choose>
																<c:when test="${!empty loginMember }">
																	<c:choose>
																		<c:when test="${loginMember.memberNo eq t.MEMBERNO }">
																			<strong> 작성자</strong>
																		</c:when>
																		<c:when test="${loginMember.memberNo ne t.MEMBERNO }">
																			<c:choose>
																				<c:when test="${flag eq false }">
																					<strong onclick="follow(event);"> 팔로우</strong>
																					<input type="hidden" value="${t.MEMBERNO }">
																				</c:when>
																				<c:when test="${flag eq true }">
																					<strong class="text-muted" onclick="follow(event);"> 팔로잉</strong>
																					<input type="hidden" value="${t.MEMBERNO }">
																				</c:when>
																			</c:choose>
																		</c:when>
																	</c:choose>
																</c:when>
															</c:choose>
												</button></span>

										</div>
									</div>

									<a class="d-inline-block"
										href="${path}/community/findDetail.do?findNo=${t.FINDNO}">
										<img src="${path }/resources/upload/find/${t.FILENAME}"
										class="rounded" style="width: 100%; height: 250px;"> <input
										type="hidden" value="${t.FINDNO }" />
									</a>

									<c:set var="flag2" value="false" />
									<c:if test="${not empty like }">
										<c:forEach var="l" items="${like }">
											<c:if test="${l eq t.FINDNO }">
												<c:set var="flag2" value="true" />
											</c:if>
										</c:forEach>

									</c:if>
									
									<div class="d-flex justify-content-between mx-1 my-1">
										<div class="likeFrm" method="post">
											<c:if test="${empty loginMember }">
												<button type="button" class="btn btn-sm">
													<svg xmlns="http://www.w3.org/2000/svg" width="20px"
														height="20px" fill="currentColor"
														class="bi heartBtnLine bi-suit-heart  text-dark"
														viewBox="0 0 16 16">
											  <path
															d="M8 6.236l-.894-1.789c-.222-.443-.607-1.08-1.152-1.595C5.418 2.345 4.776 2 4 2 2.324 2 1 3.326 1 4.92c0 1.211.554 2.066 1.868 3.37.337.334.721.695 1.146 1.093C5.122 10.423 6.5 11.717 8 13.447c1.5-1.73 2.878-3.024 3.986-4.064.425-.398.81-.76 1.146-1.093C14.446 6.986 15 6.131 15 4.92 15 3.326 13.676 2 12 2c-.777 0-1.418.345-1.954.852-.545.515-.93 1.152-1.152 1.595L8 6.236zm.392 8.292a.513.513 0 0 1-.784 0c-1.601-1.902-3.05-3.262-4.243-4.381C1.3 8.208 0 6.989 0 4.92 0 2.755 1.79 1 4 1c1.6 0 2.719 1.05 3.404 2.008.26.365.458.716.596.992a7.55 7.55 0 0 1 .596-.992C9.281 2.049 10.4 1 12 1c2.21 0 4 1.755 4 3.92 0 2.069-1.3 3.288-3.365 5.227-1.193 1.12-2.642 2.48-4.243 4.38z" />
											</svg>
												</button>

											</c:if>
											<c:if test="${not empty loginMember }">
												<c:if test="${flag2 eq false }">
													<input type="hidden" name="findNum" value="${t.FINDNO }">

													<button type="button" class="btn btn-sm">
														<svg xmlns="http://www.w3.org/2000/svg" width="20px"
															height="20px" fill="currentColor"
															class="bi heartBtnLine bi-suit-heart  text-dark"
															viewBox="0 0 16 16">
											  <path
																d="M8 6.236l-.894-1.789c-.222-.443-.607-1.08-1.152-1.595C5.418 2.345 4.776 2 4 2 2.324 2 1 3.326 1 4.92c0 1.211.554 2.066 1.868 3.37.337.334.721.695 1.146 1.093C5.122 10.423 6.5 11.717 8 13.447c1.5-1.73 2.878-3.024 3.986-4.064.425-.398.81-.76 1.146-1.093C14.446 6.986 15 6.131 15 4.92 15 3.326 13.676 2 12 2c-.777 0-1.418.345-1.954.852-.545.515-.93 1.152-1.152 1.595L8 6.236zm.392 8.292a.513.513 0 0 1-.784 0c-1.601-1.902-3.05-3.262-4.243-4.381C1.3 8.208 0 6.989 0 4.92 0 2.755 1.79 1 4 1c1.6 0 2.719 1.05 3.404 2.008.26.365.458.716.596.992a7.55 7.55 0 0 1 .596-.992C9.281 2.049 10.4 1 12 1c2.21 0 4 1.755 4 3.92 0 2.069-1.3 3.288-3.365 5.227-1.193 1.12-2.642 2.48-4.243 4.38z" />
											</svg>
													</button>
													<button type="button" class="btn btn-sm d-none">
														<svg xmlns="http://www.w3.org/2000/svg" width="20px"
															height="20px" fill="currentColor"
															class="bi bi-suit-heart-fill text-danger "
															viewBox="0 0 16 16">
											  <path class="heartBtnFill"
																d="M4 1c2.21 0 4 1.755 4 3.92C8 2.755 9.79 1 12 1s4 1.755 4 3.92c0 3.263-3.234 4.414-7.608 9.608a.513.513 0 0 1-.784 0C3.234 9.334 0 8.183 0 4.92 0 2.755 1.79 1 4 1z" />
											</svg>
													</button>
												</c:if>
												<c:if test="${flag2 eq true }">

													<input type="hidden" name="findNum" value="${t.FINDNO }">
													<button type="button" class="btn btn-sm d-none">
														<svg xmlns="http://www.w3.org/2000/svg" width="20px"
															height="20px" fill="currentColor"
															class="bi heartBtnLine bi-suit-heart  text-dark"
															viewBox="0 0 16 16">
											  <path
																d="M8 6.236l-.894-1.789c-.222-.443-.607-1.08-1.152-1.595C5.418 2.345 4.776 2 4 2 2.324 2 1 3.326 1 4.92c0 1.211.554 2.066 1.868 3.37.337.334.721.695 1.146 1.093C5.122 10.423 6.5 11.717 8 13.447c1.5-1.73 2.878-3.024 3.986-4.064.425-.398.81-.76 1.146-1.093C14.446 6.986 15 6.131 15 4.92 15 3.326 13.676 2 12 2c-.777 0-1.418.345-1.954.852-.545.515-.93 1.152-1.152 1.595L8 6.236zm.392 8.292a.513.513 0 0 1-.784 0c-1.601-1.902-3.05-3.262-4.243-4.381C1.3 8.208 0 6.989 0 4.92 0 2.755 1.79 1 4 1c1.6 0 2.719 1.05 3.404 2.008.26.365.458.716.596.992a7.55 7.55 0 0 1 .596-.992C9.281 2.049 10.4 1 12 1c2.21 0 4 1.755 4 3.92 0 2.069-1.3 3.288-3.365 5.227-1.193 1.12-2.642 2.48-4.243 4.38z" />
											</svg>
													</button>
													<button type="submit" class="btn btn-sm">
														<svg xmlns="http://www.w3.org/2000/svg" width="20px"
															height="20px" fill="currentColor"
															class="bi bi-suit-heart-fill text-danger "
															viewBox="0 0 16 16">
											  <path class="heartBtnFill"
																d="M4 1c2.21 0 4 1.755 4 3.92C8 2.755 9.79 1 12 1s4 1.755 4 3.92c0 3.263-3.234 4.414-7.608 9.608a.513.513 0 0 1-.784 0C3.234 9.334 0 8.183 0 4.92 0 2.755 1.79 1 4 1z" />
											</svg>
													</button>

												</c:if>

											</c:if>
											<c:set var="ct" value="0" />
											<c:forEach var="cnt" items="${count }">
												<c:if test="${cnt.FINDNO eq t.FINDNO }">
													<c:set var="ct" value="${cnt.CNT }" />
												</c:if>
											</c:forEach>
											<span class="text-dark mx-1"><c:out value="${ct }"/></span>

										</div>

										<div>
											<button class="btn btn-link btn-sm">
												<svg xmlns="http://www.w3.org/2000/svg" width="20px"
													height="20px" fill="currentColor"
													class="bi bi-chat text-dark" viewBox="0 0 16 16">
											  <path
														d="M2.678 11.894a1 1 0 0 1 .287.801 10.97 10.97 0 0 1-.398 2c1.395-.323 2.247-.697 2.634-.893a1 1 0 0 1 .71-.074A8.06 8.06 0 0 0 8 14c3.996 0 7-2.807 7-6 0-3.192-3.004-6-7-6S1 4.808 1 8c0 1.468.617 2.83 1.678 3.894zm-.493 3.905a21.682 21.682 0 0 1-.713.129c-.2.032-.352-.176-.273-.362a9.68 9.68 0 0 0 .244-.637l.003-.01c.248-.72.45-1.548.524-2.319C.743 11.37 0 9.76 0 8c0-3.866 3.582-7 8-7s8 3.134 8 7-3.582 7-8 7a9.06 9.06 0 0 1-2.347-.306c-.52.263-1.639.742-3.468 1.105z" />
											</svg>
											</button>
											<span class="text-dark mx-1 align-text-middle"><c:out value="${t.commentCnt }"/></span>
										</div>
									</div>
									<div class="card-body p-0 px-1">
										<h5 class="card-title title">
											<strong><c:out value="${t.TITLE }" /></strong>
										</h5>
										<p class="card-text content">
											<c:out value="${fn:substring(t.CONTENT,0,10) }" />
											<c:if test="${fn:length(t.CONTENT)>10 }"> ... </c:if>
										</p>
										<span class="address text-muted">장소 : <c:out
												value="${t.ADDRESS }" /></span>
									</div>

								</div>
							</div>
						</c:forEach>

					</c:if>
				</div>
				 <p class="text-center">${pageBar }</p> 
			</div>
		</div>
		<div class="loginModal"></div>
	</main>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	<script>
	$(function() {
		let loginMember=$(".loginMember").val();

		//팔로우 버튼 누르면
		$(".writeBtn").on("click",e=>{
			if(loginMember!=""){ //로그인 되어 있으면 팔로우
				location.href="${pageContext.request.contextPath}/community/findWrite.do";
			}else{ //로그인 안되어 있으면 로그인 모달 띄우기           
				loginModal();
			};
		});


		//로그인 모달
		function loginModal(){
			console.log("실행");
			$.ajax({
				url: "${path}/login/moveLogin.do",
				dataType:"html",
				success:(data) => {
					$(".loginModal").html(data);	
		        	$('#loginModal').modal(); 
				}
			});
		};
		
		//검색
		$(".dogBtn").on("click", e => {
			search("dog");
		})
		$(".catBtn").on("click", e => {
			search("cat");
		})
		$(".smallBtn").on("click", e => {
			search("small");
		})
		
		$(".new").on("click", e => {
			order("ENROLLDATE");
		})
		
		$(".like").on("click", e=>{
			order("like");
		})
		
		$(".heartBtnLine").on("click", e => {
			if(loginMember!=""){ //로그인 되어 있으면 팔로우
				let findNo = $(e.target).parent().prev().val();
				$(e.target).parent().addClass("d-none");
				$(e.target).parent().next().removeClass("d-none");
				$.ajax({
                     url:"${path}/find/insertLike.do",
                     data:{findNo : findNo},
                     success: (data) => {
                    	 if(data == true) {
                       		 location.reload();
                       	 } else {
                       		 alert("좋아요 추가 실패");
                       	 }
                     }
                  })
			}else{ //로그인 안되어 있으면 로그인 모달 띄우기           
				loginModal();
			};
			
		})
		
		$(".heartBtnFill ").on("click", e => {
			if(loginMember!=""){ //로그인 되어 있으면 팔로우
				let findNo = $(e.target).parent().parent().prev().prev().val();
				$(e.target).parent().parent().addClass("d-none");
				$(e.target).parent().parent().prev().removeClass("d-none");
				$.ajax({
                    url:"${path}/find/deleteLike.do",
                    data:{findNo : findNo},
                    success: (data) => {
                   	 if(data == true) {
                   		 location.reload();
                   	 } else {
                   		 alert("좋아요 삭제 실패");
                   	 }
                    }
                 })
			}else{ //로그인 안되어 있으면 로그인 모달 띄우기           
				loginModal();
			};
			
		})

		
		function search(cate) {
			$(".cate").html("");
			let input = $("<input>").attr({"type" : "hidden", "name" : "cate", "class":"cate","value" : cate});
			$(".cate").html(input);
		}
	})
	
	//로그인 모달
		function loginModal(){
			console.log("실행");
			$.ajax({
				url: "${path}/login/moveLogin.do",
				dataType:"html",
				success:(data) => {
					$(".loginModal").html(data);	
		        	$('#loginModal').modal(); 
				}
			});
		};
	
	//팔로우
	 	function follow(event){
		let loginMember=$(".loginMember").val();
		if(loginMember!=""){
			let writerNo = $(event.target).next().val();
 	 		$.ajax({
 	 			async: false,
 	 			url: "${path}/user/following.do",
 	 			data: {writerNo : writerNo},
 	 			success:(data) => {
 	 				if(data==10){
 	 					$(".following").show();
 	 					$(".follow").hide();
 	 					location.reload();
 	 				}else if(data==20){
 	 					$(".following").hide();
 	 					$(".follow").show();
 	 					location.reload();
 	 				}
 	 				location.reload();
 	 			},error:function(request, status, error){
 	 				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
 	 			}
 	 		});
		}else{ //로그인 안되어 있으면 로그인 모달 띄우기
			loginModal();
		};
 	};
	
	</script>
</body>

</html>