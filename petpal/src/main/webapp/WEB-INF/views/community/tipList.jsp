<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<jsp:include page="/WEB-INF/views/common/commonLink.jsp" />

<script>

$(document).ready(function() {
	let loginMember=$(".loginMember").val();

	$(".writeBtn").on("click",e=>{
		if(loginMember!=""){
			location.href="${path}/community/tipWrite.do";
		}else{ //로그인 안되어 있으면 로그인 모달 띄우기           
			loginModal();
		};
	});
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
	$(document).ready(function(){
		$(".img").click( function() {
			let tipNo = $(this).prev().val();
			location.href="${path}/community/tipDetail.do?tipNo=" + tipNo;
		});
	})
</script>

</head>
<body class="bg-white">
	<jsp:include page="/WEB-INF/views/common/header.jsp" />

	<main role="main" style="min-height: 100vh;">
		<div class="album bg-light">
			<div class="container my-4 mt-lg-0">
				<div class="row ">
					<jsp:include page="/WEB-INF/views/common/communityNav.jsp" >
						<jsp:param value="tipList" name="comNav"/>
					</jsp:include>
					<div class="form-inline container text-center mb-3">
						<h3>테마별 노하우</h3>
						<input type="hidden" class="loginMember" value="${memberNo }" />
						<button type="button" class="btn btn-outline-secondary ml-auto writeBtn">글쓰기</button>
					</div>
					<div class="form-inline container-xl mb-5">
						<button type="button" class="btn btn-outline-secondary mr-2">전체</button>
						<button type="button" class="btn btn-outline-secondary mr-2">훈련</button>
						<button type="button" class="btn btn-outline-secondary mr-2">수제간식</button>
						<button type="button" class="btn btn-outline-secondary mr-2">DIY 옷</button>
						<button type="button" class="btn btn-outline-secondary mr-2">DIY 가구</button>
						<button type="button" class="btn btn-outline-secondary mr-2">건강</button>
						<button type="button" class="btn btn-outline-secondary mr-2">팁</button>
						<button type="button" class="btn btn-outline-secondary mr-2">기타</button>
						
						<div class="dropdown ml-auto">
							<button class="btn btn-light dropdown-toggle" type="button"
								id="dropdownMenuButton" data-toggle="dropdown"
								aria-haspopup="true" aria-expanded="false">정렬</button>
							<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
								<button class="dropdown-item" >최신순</button>
								<button class="dropdown-item" >인기순</button>
								<button class="dropdown-item" >팔로워순</button>
							</div>
						</div>
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
						</style>
					</div>
					
					<c:forEach items="${list }" var="t">
						<c:if test="${not empty t.MAINIMG }">
						<div class="col-xl-3 col-lg-4 col-md-6" style="cursor:pointer">
							<div class="card mb-4 bg-transparent border-0"  >
								<input type="hidden" class="tipNo" value="${t.TIPNO }">
								<div class="img test">
									<img src="${path}/resources/upload/tip/${t.MAINIMG}"  id="scale" width="100%" height="225">
								</div>
								<div class="card-body">
								
									<!-- 하트 있는 부분 여기~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
									~~~~~~~~~~~~~~~~~~~~~~~~
									~~~~~~~~~~~~~~~~~~~~~~~
									 -->
									<div class="d-flex justify-content-between">
			                            <button class="btn btn-link">
			                                <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-heart text-dark" fill="currentColor" xmlns="http://www.w3.org/2000/svg" style="font-size:25px;">
			                                    <path fill-rule="evenodd" d="M8 2.748l-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z"/>
			                                </svg>
			                                <span class="text-dark mx-1">0</span>
			                            </button>
			                            
			                            <button class="btn btn-link">
			                                <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-chat text-dark" fill="currentColor" xmlns="http://www.w3.org/2000/svg" style="font-size:25px;">
			                                    <path fill-rule="evenodd" d="M2.678 11.894a1 1 0 0 1 .287.801 10.97 10.97 0 0 1-.398 2c1.395-.323 2.247-.697 2.634-.893a1 1 0 0 1 .71-.074A8.06 8.06 0 0 0 8 14c3.996 0 7-2.807 7-6 0-3.192-3.004-6-7-6S1 4.808 1 8c0 1.468.617 2.83 1.678 3.894zm-.493 3.905a21.682 21.682 0 0 1-.713.129c-.2.032-.352-.176-.273-.362a9.68 9.68 0 0 0 .244-.637l.003-.01c.248-.72.45-1.548.524-2.319C.743 11.37 0 9.76 0 8c0-3.866 3.582-7 8-7s8 3.134 8 7-3.582 7-8 7a9.06 9.06 0 0 1-2.347-.306c-.52.263-1.639.742-3.468 1.105z"/>
			                                </svg>
			                                <span class="text-dark mx-1 align-text-middle">0</span>
			                            </button>
		                      	  	</div>
									<p class="card-text"><c:out value="${t.TITLE }"/></p>
									<div class="d-flex justify-content-between align-items-center">
									</div>
								</div>
							</div>
						</div>						
						</c:if>
					</c:forEach>
					
					
					<style>
					.test {
						width:100%;
						height:225px;
						overflow:hidden;
					}
					
					#scale {
						transition:all 0.5s;
					}
					#scale:hover {
					  transform: scale(1.1);
					  -webkit-transform: scale(1.1);
					  -moz-transform: scale(1.1);
					  -ms-transform: scale(1.1);
					  -o-transform: scale(1.1);
					}
					</style>
					
					
				</div>
			</div>
		</div>
	<div class="loginModal"></div>
	</main>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>

</html>