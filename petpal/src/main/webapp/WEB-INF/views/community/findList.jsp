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
	font-size:16px;
}

.content {
	font-size : 14px;
}

.address{
	font-size : 12px;
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
					<form action="${path }/community/findList.do" class="form-inline container-xl mb-5" method="get">
						<button type="submit" class="btn btn-outline-secondary mr-2 allBtn">전체</button>
						<button type="submit" class="btn btn-outline-secondary mr-2 dogBtn">강아지</button>
						<button type="submit" class="btn btn-outline-secondary mr-2 catBtn">고양이</button>
						<button type="submit" class="btn btn-outline-secondary mr-2 smallBtn">소동물</button>
						<div class="cate"></div>						
						<div class="order"></div>
						<div class="dropdown ml-auto">
							<button class="btn btn-light dropdown-toggle" type="button"
								id="dropdownMenuButton" data-toggle="dropdown"
								aria-haspopup="true" aria-expanded="false">정렬</button>
							<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
								<button type="submit"  class="dropdown-item new">최신순</button>
								<button type="submit"  class="dropdown-item best">인기순</button>
							</div>
						</div>
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
		                                	<a href="${path }/user/moveUserInfo.do?memberNo=${t.MEMBERNO}"><img src="${path }/resources/upload/member/profile/${t.IMG}" style="width:40px; height: 40px; border-radius:50%;"></a>
		                                </c:if>
		                                <c:if test="${ empty t.IMG }">  
		                                	<a href="${path }/user/moveUserInfo.do?memberNo=${t.MEMBERNO}"><img src="${path }/resources/upload/member/profile/avatar.webp" style="width:40px; height: 40px; border-radius:50%;"></a>
		                                </c:if>
		                                <div class="ml-1">
		                                    <a href="${path }/user/moveUserInfo.do?memberNo=${t.MEMBERNO}"><span class="text-dark align-top mx-1"><strong><c:out value="${t.NICKNAME }"/></strong></span></a>
		                                    <span><strong> · </strong></span>
		                                    <span><button class="btn btn-link text-point p-0 align-top"><strong> 팔로우</strong></button></span>

		                                </div>                    
		                        </div>

		                        	<a class="d-inline-block" href="${path}/community/findDetail.do?findNo=${t.FINDNO}">                        
	                        			<img src="${path }/resources/upload/find/${t.FILENAME}" class="rounded" style="width:100%; height:250px;">
	                        			<input type="hidden" value="${t.FINDNO }"/>
		                        	</a>	

		                        <div class="d-flex justify-content-between mx-1 my-1">
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
		                        <div class="card-body p-0 px-1">
		                           <h5 class="card-title title">
											<strong><c:out value="${t.TITLE }" /></strong>
										</h5>
										<p class="card-text content">
											<c:out value="${fn:substring(t.CONTENT,0,10) }" /><c:if test="${fn:length(t.CONTENT)>10 }"> ... </c:if>
										</p>
										<span class="address text-muted">장소 : <c:out value="${t.ADDRESS }" /></span>		                            
		                        </div>
		                        
		                    </div>
		                </div>
	               </c:forEach>

					</c:if>
				</div>
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

		
		function order(cate){
			$(".order").html("");
			let input = $("<input>").attr({"type" : "hidden", "name" : "order", "class":"order","value" : cate});
			$(".order").html(input);
		}
		
		function search(cate) {
			$(".cate").html("");
			let input = $("<input>").attr({"type" : "hidden", "name" : "cate", "class":"cate","value" : cate});
			$(".cate").html(input);
		}
	})
	
	
	</script>
</body>

</html>