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
	<input type="hidden" class="loginMember"
		value="${loginMember.memberNo }" />
	<input type="hidden" class="findNo" name="findNo" value="${fDetail.FINDNO }" />
	<input type="hidden" class="writeMember" value="${fDetail.MEMBERNO }"/>
	<main role="main" style="min-height: 100vh;">
		<div class="container my-4 mt-lg-0">
			<div class="row ">
				<jsp:include page="/WEB-INF/views/common/communityNav.jsp">
					<jsp:param value="findDetail" name="comNav" />
				</jsp:include>
			</div>

			<div class="row mx-3 mb-5">
				<!-- 왼쪽 -->
				<div class="col-lg-9 pr-lg-5 col-sm-12">
					<p style="font-size: 22px;">
						<c:choose>
							<c:when test="${fDetail.STATUS eq 'N' }">[찾는중]</c:when>
							<c:otherwise>
							[찾음]
						</c:otherwise>
						</c:choose>
						<strong><c:out value="${fDetail.TITLE }" /></strong>
					</p>
					<div class="imgCon">
						<div class="position-relative rounded">
							<img src="${path }/resources/upload/find/${fDetail.FILENAME}"
								class="col-12 mb-1 p-0 rounded">
						</div>
					</div>
					<p>
						<c:out value="${fDetail.CONTENT }" />
					</p>

					<p>
						잃어버린 장소 :
						<c:out value="${fDetail.ADDRESS }" />
					</p>
					<c:if test="${not empty findPics }">
						<div class="my-5"
							style="height: 1px; width: 100%; background: #dfe6e9;"></div>
						<c:forEach var="p" items="${findPics }">
							<div class="imgCon mt-5">
								<div class="position-relative rounded">
									<img src="${path }/resources/upload/find/${p.FILENAME}"
										class="col-12 mb-1 p-0 rounded">
								</div>
							</div>

						</c:forEach>
					</c:if>
				</div>
				<!-- 오른쪽 스티키-->
				<div class="col-lg-3 d-none d-lg-block sticky-top py-0 "
					style="top: 250px; height: 200px;">
					<div class="d-flex mb-3">
						<div  class="d-flex align-items-center">
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
						
							<span>00</span>
						</div>
						<div class="d-flex align-items-center ml-2">
							<button type="button" class="btn btn-link">
							<svg width="1.2em" height="1.2em" viewBox="0 0 16 16"
								class="bi bi-chat" fill="currentColor"
								xmlns="http://www.w3.org/2000/svg">
	                            <path fill-rule="evenodd"
									d="M2.678 11.894a1 1 0 0 1 .287.801 10.97 10.97 0 0 1-.398 2c1.395-.323 2.247-.697 2.634-.893a1 1 0 0 1 .71-.074A8.06 8.06 0 0 0 8 14c3.996 0 7-2.807 7-6 0-3.192-3.004-6-7-6S1 4.808 1 8c0 1.468.617 2.83 1.678 3.894zm-.493 3.905a21.682 21.682 0 0 1-.713.129c-.2.032-.352-.176-.273-.362a9.68 9.68 0 0 0 .244-.637l.003-.01c.248-.72.45-1.548.524-2.319C.743 11.37 0 9.76 0 8c0-3.866 3.582-7 8-7s8 3.134 8 7-3.582 7-8 7a9.06 9.06 0 0 1-2.347-.306c-.52.263-1.639.742-3.468 1.105z" />
	                        	</svg>
							
							</button>
							<span>00</span>
						</div>
					</div>
					<div>
						<div class="row d-flex justify-content-between mb-2">
							<a
								href="${path }/user/moveUserInfo.do?memberNo=${fDetail.MEMBERNO}"
								class="col-7 p-0 d-flex align-items-center ml-2">
								<div class="col-3 p-0">
									<c:if test="${not empty fDetail.IMG }">
										<img
											src="${path }/resources/upload/member/profile/${fDetail.IMG}"
											class="rounded"
											style="width: 40px; height: 40px; border-radius: 50%;">
									</c:if>
									<c:if test="${ empty fDetail.IMG }">
										<img
											src="${path }/resources/upload/member/profile/avatar.webp"
											class="rounded" style="width: 40px; height: 40px;">
									</c:if>
								</div> <strong><span class="col-3 p-0 ml-2 align-middle"><c:out
											value="${fDetail.NICKNAME }" /></span></strong>
							</a>
							<!-- <button type="button" class="followBtn btn btn-sm bg-daily col-4 col-xl-3 mr-2">팔로우</button> -->
							
							<c:if test="${loginMember.memberNo ne fDetail.MEMBERNO }">
		                    	<button type="button" class="follow followBtn btn btn-sm bg-point col-4 col-xl-4 mr-2">팔로우
		                    		<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-person" viewBox="0 0 16 16">
									  <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z"/>
									</svg>
								</button>
		                    	<button type="button" class="following followBtn btn btn-sm col-4 col-xl-4 mr-2"  style="background-color:#dfdfdf;">팔로워
									<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-person-check-fill" viewBox="0 0 16 16">
									  <path fill-rule="evenodd" d="M15.854 5.146a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 0 1 .708-.708L12.5 7.793l2.646-2.647a.5.5 0 0 1 .708 0z"/>
									  <path d="M1 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
									</svg>
								</button>
		                    </c:if>
							
						</div>
						<div class="mt-2">
							<p>
								<c:out value="${fDetail.CONTENT }" />
							</p>

						</div>
						<div class="d-flex justify-content-end align-items-center">
							<span class="text-secondary" style="font-size: 14px;"><c:out
									value="${fDetail.ENROLLDATE }" /></span>
							<button type="button" class="btn btn-link text-secondary"
								style="font-size: 14px;"
								onclick="fn_claimModal('<c:out value="${fDetail.FINDNO}" />');">신고</button>
						</div>
					</div>
					<c:if
						test="${(loginMember.memberNo eq fDetail.MEMBERNO) or (loginMember.memberNo eq '63') }">
						<form id="findDetailFrm" class="d-flex justify-content-end mr-1"
							method="post">
							<c:if test="${loginMember.memberNo eq fDetail.MEMBERNO }">

								<button type="button"
									class="findEdit btn btn-link btn-outline-secondary px-2 py-0 mr-2 text-black-50">수정</button>
								<input type="hidden" class="findNo" name="findNo"
									value="${fDetail.FINDNO }" />
								<button type="button"
									class="findDelete btn btn-link btn-outline-secondary px-2 py-0 text-black-50">삭제</button>
							</c:if>
						</form>
					</c:if>
				</div>
			</div>
			<!-- 댓글 -->
			<div id="commentContainer" class="mt-5">
				
			</div>

			<!-- 작은사이즈 positon bottom에 fixed -->
			<div class="col-lg-3 d-block d-lg-none fixed-bottom"
				style="background-color: white; border-top: 1px solid #dfe6e9;">
				<div class="d-flex mb-3">
						<div  class="d-flex align-items-center">
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
						
							<span>00</span>
						</div>
						<div class="d-flex align-items-center ml-2">
							<button type="button" class="btn btn-link">
							<svg width="1.2em" height="1.2em" viewBox="0 0 16 16"
								class="bi bi-chat" fill="currentColor"
								xmlns="http://www.w3.org/2000/svg">
	                            <path fill-rule="evenodd"
									d="M2.678 11.894a1 1 0 0 1 .287.801 10.97 10.97 0 0 1-.398 2c1.395-.323 2.247-.697 2.634-.893a1 1 0 0 1 .71-.074A8.06 8.06 0 0 0 8 14c3.996 0 7-2.807 7-6 0-3.192-3.004-6-7-6S1 4.808 1 8c0 1.468.617 2.83 1.678 3.894zm-.493 3.905a21.682 21.682 0 0 1-.713.129c-.2.032-.352-.176-.273-.362a9.68 9.68 0 0 0 .244-.637l.003-.01c.248-.72.45-1.548.524-2.319C.743 11.37 0 9.76 0 8c0-3.866 3.582-7 8-7s8 3.134 8 7-3.582 7-8 7a9.06 9.06 0 0 1-2.347-.306c-.52.263-1.639.742-3.468 1.105z" />
	                        	</svg>
							
							</button>
							<span>00</span>
						</div>
					</div>
				<div class="px-3 pb-3">
					<div class="row d-flex justify-content-between mb-2">
						<a
							href="${path }/user/moveUserInfo.do?memberNo=${fDetail.MEMBERNO}"
							class="col-7 p-0 d-flex align-items-center ml-2">
							<div class="col-3 p-0">
								<c:if test="${not empty fDetail.IMG }">
									<img
										src="${path }/resources/upload/member/profile/${fDetail.IMG}"
										class="rounded"
										style="width: 40px; height: 40px; border-radius: 50%;">
								</c:if>
								<c:if test="${ empty fDetail.IMG }">
									<img src="${path }/resources/upload/member/profile/avatar.webp"
										class="rounded" style="width: 40px; height: 40px;">
								</c:if>
							</div> <strong><span class="col-3 p-0 ml-2 align-middle"><c:out
										value="${fDetail.NICKNAME }" /></span></strong>
						</a>
						<!-- <button type="button" class="followBtn btn btn-sm bg-daily col-4 col-xl-3 mr-2">팔로우</button> -->
							
							<c:if test="${loginMember.memberNo ne fDetail.MEMBERNO }">
		                    	<button type="button" class="follow followBtn btn btn-sm bg-point col-4 col-xl-3 mr-2">팔로우
		                    		<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-person" viewBox="0 0 16 16">
									  <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z"/>
									</svg>
								</button>
		                    	<button type="button" class="following followBtn btn btn-sm col-4 col-xl-3 mr-2"  style="background-color:#dfdfdf;">팔로워
									<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-person-check-fill" viewBox="0 0 16 16">
									  <path fill-rule="evenodd" d="M15.854 5.146a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 0 1 .708-.708L12.5 7.793l2.646-2.647a.5.5 0 0 1 .708 0z"/>
									  <path d="M1 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
									</svg>
								</button>
		                    </c:if>
					</div>
					<div class="d-flex justify-content-end align-items-center">
						<span class="text-secondary" style="font-size: 14px;"><c:out
								value="${fDetail.ENROLLDATE }" /></span>
						<button type="button" class="btn btn-link text-secondary"
							style="font-size: 14px;"
							onclick="fn_claimModal('<c:out value="${fDetail.FINDNO}" />');">신고하기</button>
						<c:if
							test="${(loginMember.memberNo eq fDetail.MEMBERNO) or (loginMember.memberNo eq '63') }">
							<form id="findDetailFrm" class="d-flex justify-content-end mr-1"
								method="post">
								<c:if test="${loginMember.memberNo eq fDetail.MEMBERNO }">

									<button type="button"
										class="findEdit btn btn-link btn-outline-secondary px-2 py-0 mr-2 text-black-50">수정</button>
									<input type="hidden" class="findNo" name="findNo"
										value="${fDetail.FINDNO }" />
									<button type="button"
										class="findDelete btn btn-link btn-outline-secondary px-2 py-0 text-black-50">삭제</button>
								</c:if>
							</form>
						</c:if>
					</div>
				</div>

			</div>
	</main>
	<div class="loginModal"></div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	<script>
		let loginMember=$(".loginMember").val();
		let findNo=$(".findNo").val();
		commentAjax();
		
		//댓글
		function commentAjax(){
			let writeMember=$(".writeMember").val();
			$.ajax({
				url: "${path}/find/findComment.do",
				dataType:"html",
				data:{findNo:findNo,writeMember:writeMember},
				success:(data) => {
					$("#commentContainer").html(data);
				}
			});
		};
		
		//댓글 삭제
		function commentDelete(path,data){
			$.ajax({
				url:path,
				data:{findCommentNo:data},
				success:data=>{
					if(data===true){
						alert("댓글이 삭제되었습니다.");
						commentAjax();
					}else{
						alert("댓글 삭제에 실패하였습니다.");
					}
				},
				error:function(){
					alert("댓글 삭제에 실패하였습니다.");
				}
			})
		}
		
		//답글등록창 생성
		$(document).on('click','.reply',function(e) {
			if(loginMember==""){
				loginModal();
				return;
			}
			var comment=$(e.target).parents("div.comment");//답글달기의 댓글
			
			if($("div.editor").length==2&&!comment.next().hasClass("editor")){//댓글달기 창이 두개이고 
				var flag=confirm("다른 댓글에서 작성하고 있던 내용이 유실됩니다. 정말 이 댓글로 전환하시겠습니까?")
				if(flag==true){//확인 눌렀을때
					$("#commentContainer").find("div.subComment").remove();
				}else{
					//취소 눌렀을때 변화없음
				}
			}
			if($("div.editor").length==1){//댓글달기창이 하나일때
				var editor=$("div.editor").clone();
				editor.addClass("ml-5");
				editor.addClass("subComment");
				editor.find("[name=commentLevel]").val("2");
				editor.find("[name=findComment]").val("");
				editor.find("[name=commentRef]").val($(e.target).val());
				comment.after(editor);//
			}
		});
		
		//댓글 등록
		$(document).on('click','.findWrite',function(e) {//댓글 등록 버튼 눌렀을때
			if(loginMember==""){//로그인 안되어있다면
				loginModal();
				return;
			}else if($(e.target).parents("div.editor").find("[name=findComment]").val().trim()==""){//댓글 내용이 없으면
				alert("내용을 입력해주세요.");
				return;
			}
			var findComment=$(e.target).parents("div.editor").find("[name=findComment]").val();
			var commentLevel=$(e.target).parents("div.editor").find("[name=commentLevel]").val();
			var commentRef=$(e.target).parents("div.editor").find("[name=commentRef]").val();
			$.ajax({
				url:"${path}/find/commentWrite.do",
				data:{findComment:findComment,commentLevel:commentLevel,memberNo:loginMember,findNo:findNo,commentRef:commentRef},
				success:data=>{
					if(data===true){
						alert("댓글이 등록되었습니다.");
						commentAjax();
					}else{
						alert("댓글 등록에 실패하였습니다.");
					}
				},
				error:function(){
					alert("댓글 등록에 실패하였습니다.");
				}
			})
		});
		
		//댓글 삭제
		$(document).on("click",".commentDelete",e=>{
			//댓글 삭제 눌렀을 때 (댓글은 업뎃 대댓글은 삭제)
			commentDelete("${path}/find/commentDelete.do",$(e.target).val());	
		});
		
		//대댓글 삭제
		$(document).on("click",".comment2Delete",e=>{
			//대댓글 삭제 눌렀을 때 (대댓글은 삭제)
			commentDelete("${path}/find/comment2Delete.do",$(e.target).val())	
		});
		

		//팔로우 버튼 누르면
		$(".followBtn").on("click",e=>{
			if(loginMember!=""){ //로그인 되어 있으면 팔로우
		
			}else{ //로그인 안되어 있으면 로그인 모달 띄우기           
				loginModal();
			};
		});
		
		$(".binHeart").on("click" , e => {
			if(loginMember!=""){ //로그인 되어 있으면 팔로우
				$(e.target).parent().addClass("d-none");
				$(e.target).parent().next().removeClass("d-none");
				$.ajax({
	                url:"${path}/find/insertLike.do",
	                data:{findNo : $(".findNo").val()},
	                success: (data) => {
	               	 console.log(data); 
	                }
	             })
			}else{ //로그인 안되어 있으면 로그인 모달 띄우기           
				loginModal();
			};
			
		})
		
		$(".fillHeart").on("click" , e => {
			if(loginMember!=""){ //로그인 되어 있으면 팔로우
				$(e.target).parent().parent().addClass("d-none");
				$(e.target).parent().parent().prev().removeClass("d-none");
				$.ajax({
	                url:"${path}/find/deleteLike.do",
	                data:{findNo :  $(".findNo").val()},
	                success: (data) => {
	               	 console.log(data); 
	                }
	             })
			}else{ //로그인 안되어 있으면 로그인 모달 띄우기           
				loginModal();
			};
			
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
		 
		$(".findEdit").on("click", e => {
			$("#findDetailFrm").attr("action","${path}/find/findUpdate.do").submit();
		})
		$(".findDelete").on("click", e => {
			$("#findDetailFrm").attr("action","${path}/find/findDelete.do").submit();
		})
		
		//팔로우 체크
		$(document).ready(function(){
	 		let writerNo = '${fDetail.MEMBERNO}';
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
	 	
	 	//팔로우
	 	$(".followBtn").on('click',function() {
		if(loginMember!=""){
			let writerNo = '${fDetail.MEMBERNO}';
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
 	 				if(data==100){
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

</script>
</body>

</html>