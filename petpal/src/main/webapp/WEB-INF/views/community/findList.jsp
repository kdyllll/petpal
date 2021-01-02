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

</style>
</head>
<body class="bg-white">
	<jsp:include page="/WEB-INF/views/common/header.jsp" />

	<main role="main" class="bg-white">
		<div class="album ">
			<div class="container my-4 mt-lg-0">
				<div class="row ">
					<jsp:include page="/WEB-INF/views/common/communityNav.jsp" >
						<jsp:param value="findList" name="comNav"/>
					</jsp:include>
					<div class="form-inline container text-center mb-3">
						<h3>찾습니다</h3>
						<input type="hidden" class="loginMember" value="${loginMember.memberNo }" />
						<button type="button" class="btn btn-outline-secondary ml-auto writeBtn" >글쓰기</button>
						
					</div>
					<div class="form-inline container-xl mb-5">
						<button type="button" class="btn btn-outline-secondary mr-2">전체</button>
						<button type="button" class="btn btn-outline-secondary mr-2">강아지</button>
						<button type="button" class="btn btn-outline-secondary mr-2">고양이</button>
						<button type="button" class="btn btn-outline-secondary mr-2">소동물</button>

						<div class="dropdown ml-auto">
							<button class="btn btn-light dropdown-toggle" type="button"
								id="dropdownMenuButton" data-toggle="dropdown"
								aria-haspopup="true" aria-expanded="false">정렬</button>
							<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
								<button class="dropdown-item">최신순</button>
								<button class="dropdown-item">인기순</button>
								<button class="dropdown-item">팔로워순</button>
								<button class="dropdown-item">스크랩순</button>
							</div>
						</div>
					</div>
				</div>
				<div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 row-cols-xl-4 g-4">
				<c:if test="${not empty list  }">
					<c:forEach var="l" items="${list }">
						<div class="col mb-4">
							<div class="card h-100 border-0 " style="overflow: hidden;">
								<span><c:out value="${l.EMAIL }"/></span> <a href="${path}/community/findDetail.do?findNo=${l.FINDNO}"><img
									src="${path }/resources/upload/find/${l.FILENAME}" alt="..." style="width: 100%; height: 200px;"></a>
								<div class="card-body">
									<h5 class="card-title"><c:out value="${l.TITLE }"/></h5>
									<p class="card-text"><c:out value="${l.CONTENT }"/></p>
									<span class=""><c:out value="${l.ADDRESS }"/></span>
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
	
	</script>
</body>

</html>