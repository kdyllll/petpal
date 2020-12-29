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
	<input type="hidden" class="findNo" value="${fDetail.FINDNO }" />
	<main role="main" style="min-height: 100vh;">
		<div class="container my-4 mt-lg-0">
			<div class="row ">
				<div class="col-lg-12 my-5 mt-lg-0 ">
					<div class="mt-3 mt-lg-0 d-lg-flex py-3">
						<a
							class="d-block d-xl-inline text-left mb-0 border-0 px-0 pr-3 py-3 "
							type="button"> 홈 </a> <a
							class="d-block d-xl-inline text-left mb-0 border-0 px-0 pr-3 py-3 "
							type="button"> 사진 </a> <a
							class="d-block d-xl-inline text-left collapsed mb-0 border-0 px-0 pr-3 py-3"
							type="button"> 노하우 </a> <a
							class="d-block d-xl-inline text-left collapsed mb-0 border-0 px-0 pr-3 py-3"
							type="button"> 장소 </a> <a href="${path }/community/findList.do"
							class="d-block d-xl-inline text-left collapsed mb-0 border-0 px-0 py-3"
							type="button"> 찾아주세요 </a>
					</div>
				</div>
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
					<button type="button" class="btn btn-link mb-3">
						<svg width="1em" height="1em" viewBox="0 0 16 16"
							class="bi bi-heart" fill="currentColor"
							xmlns="http://www.w3.org/2000/svg">
		                   <path fill-rule="evenodd"
								d="M8 2.748l-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z" />
		                  </svg>
						<span>00</span>
					</button>
					<button type="button" class="btn btn-link mb-3">
						<svg width="1em" height="1em" viewBox="0 0 16 16"
							class="bi bi-chat" fill="currentColor"
							xmlns="http://www.w3.org/2000/svg">
                            <path fill-rule="evenodd"
								d="M2.678 11.894a1 1 0 0 1 .287.801 10.97 10.97 0 0 1-.398 2c1.395-.323 2.247-.697 2.634-.893a1 1 0 0 1 .71-.074A8.06 8.06 0 0 0 8 14c3.996 0 7-2.807 7-6 0-3.192-3.004-6-7-6S1 4.808 1 8c0 1.468.617 2.83 1.678 3.894zm-.493 3.905a21.682 21.682 0 0 1-.713.129c-.2.032-.352-.176-.273-.362a9.68 9.68 0 0 0 .244-.637l.003-.01c.248-.72.45-1.548.524-2.319C.743 11.37 0 9.76 0 8c0-3.866 3.582-7 8-7s8 3.134 8 7-3.582 7-8 7a9.06 9.06 0 0 1-2.347-.306c-.52.263-1.639.742-3.468 1.105z" />
                        	</svg>
						<span>00</span>
					</button>
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
							<button type="button"
								class="followBtn btn btn-sm bg-daily col-4 col-xl-3 mr-2">팔로우</button>
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
						<div class="d-flex justify-content-end mr-1">
							<c:if test="${loginMember.memberNo eq fDetail.MEMBERNO }">
								<button type="button"
									onclick="location.href'${path}/find/updateFind.do?findNo=${fDetail.FINDNO }';"
									class="dailyEdit btn btn-link btn-outline-secondary px-2 py-0 mr-2 text-black-50">수정</button>
							</c:if>
							<button type="button"
								onclick="location.replace('${path}/find/deleteFind.do?findNo=${fDetail.FINDNO }');"
								class="dailyDelete btn btn-link btn-outline-secondary px-2 py-0 text-black-50">삭제</button>
						</div>
					</c:if>
				</div>
			</div>
			<div class="row mb-5">댓글부분</div>
		</div>
		<!-- 작은사이즈 positon bottom에 fixed -->
		<div class="col-lg-3 d-block d-lg-none fixed-bottom"
			style="background-color: white; border-top: 1px solid #dfe6e9;">
			<button type="button" class="btn btn-link mb-3">
				<svg width="1em" height="1em" viewBox="0 0 16 16"
					class="bi bi-heart" fill="currentColor"
					xmlns="http://www.w3.org/2000/svg">
                  <path fill-rule="evenodd"
						d="M8 2.748l-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z" />
                 </svg>
				<span>00</span>
			</button>
			<button type="button" class="btn btn-link mb-3">
				<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-chat"
					fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                         <path fill-rule="evenodd"
						d="M2.678 11.894a1 1 0 0 1 .287.801 10.97 10.97 0 0 1-.398 2c1.395-.323 2.247-.697 2.634-.893a1 1 0 0 1 .71-.074A8.06 8.06 0 0 0 8 14c3.996 0 7-2.807 7-6 0-3.192-3.004-6-7-6S1 4.808 1 8c0 1.468.617 2.83 1.678 3.894zm-.493 3.905a21.682 21.682 0 0 1-.713.129c-.2.032-.352-.176-.273-.362a9.68 9.68 0 0 0 .244-.637l.003-.01c.248-.72.45-1.548.524-2.319C.743 11.37 0 9.76 0 8c0-3.866 3.582-7 8-7s8 3.134 8 7-3.582 7-8 7a9.06 9.06 0 0 1-2.347-.306c-.52.263-1.639.742-3.468 1.105z" />
                     	</svg>
				<span>00</span>
			</button>
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
					<button type="button"
						class="followBtn btn btn-sm bg-daily col-3 mr-2">팔로우</button>
				</div>
				<div class="d-flex justify-content-end align-items-center">
					<span class="text-secondary" style="font-size: 14px;"><c:out
							value="${fDetail.ENROLLDATE }" /></span>
					<button type="button" class="btn btn-link text-secondary"
						style="font-size: 14px;"
						onclick="fn_claimModal('<c:out value="${fDetail.FINDNO}" />');">신고하기</button>
					<c:if test="${(loginMember.memberNo eq fDetail.MEMBERNO) or (loginMember.memberNo eq '63') }">
						
							<c:if test="${loginMember.memberNo eq fDetail.MEMBERNO }">
								<button type="button"
									onclick="location.href'${path}/find/updateFind.do?findNo=${fDetail.FINDNO }';"
									class="dailyEdit btn btn-link btn-outline-secondary px-2 py-0 mr-2 text-black-50">수정</button>
							</c:if>
							<button type="button"
								onclick="location.replace('${path}/find/deleteFind.do?findNo=${fDetail.FINDNO }');"
								class="dailyDelete btn btn-link btn-outline-secondary px-2 py-0 text-black-50">삭제</button>
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


//팔로우 버튼 누르면
$(".followBtn").on("click",e=>{
	if(loginMember!=""){ //로그인 되어 있으면 팔로우

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
 
</script>
</body>

</html>