<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<jsp:include page="/WEB-INF/views/common/commonLink.jsp" />

<style>
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
		
		$(".heartBtnLine").on("click", e => {
			if(loginMember!=""){ //로그인 되어 있으면 팔로우
				let tipNo = $(e.target).parent().prev().val();
				$(e.target).parent().addClass("d-none");
				$(e.target).parent().next().removeClass("d-none");
				 $.ajax({
	                 url:"${path}/tip/insertLike.do",
	                 data:{tipNo : tipNo},
	                 success: (data) => {
	                	
	                 }
	              }) 
	              var likeCntSpan=$(e.target).parents(".likeCon").find("span.likeCount");
		            likeCntSpan.text(Number(Number(likeCntSpan.html()) + 1));
			}else{ //로그인 안되어 있으면 로그인 모달 띄우기           
				loginModal();
			};
		})
		
		$(".heartBtnFill ").on("click", e => {
			if(loginMember!=""){ //로그인 되어 있으면 팔로우
				let tipNo = $(e.target).parent().parent().prev().prev().val();
				$(e.target).parent().parent().addClass("d-none");
				$(e.target).parent().parent().prev().removeClass("d-none");
				 $.ajax({
	                url:"${path}/tip/deleteLike.do",
	                data:{tipNo : tipNo},
	                success: (data) => {
	               	 
	                }
	             }) 
	             var likeCntSpan=$(e.target).parents(".likeCon").find("span.likeCount");
		            likeCntSpan.text(Number(Number(likeCntSpan.html()) - 1));
			}else{ //로그인 안되어 있으면 로그인 모달 띄우기           
				loginModal();
			};
			
		})
	
		
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
 	 					location.reload();
 	 				}else if(data==20){
 	 					location.reload();
 	 				}
 	 				location.reload();
 	 			}
 	 		});
		}else{ //로그인 안되어 있으면 로그인 모달 띄우기
			loginModal();
		};
 	};
</script>
</head>
<body class="bg-white">
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<main role="main" style="min-height: 100vh;">
		<div class="album">
			<div class="container my-4 mt-lg-0">
				<div class="row ">
					<jsp:include page="/WEB-INF/views/common/communityNav.jsp">
						<jsp:param value="tipList" name="comNav" />
					</jsp:include>
					<div class="form-inline container text-center mb-3">
						<h3>테마별 노하우 <c:out value="${search eq 'search'?' 검색결과':'' }"/></h3>
						<input type="hidden" class="loginMember" value="${memberNo }" />
						<button type="button" class="btn btn-outline-secondary ml-auto writeBtn mr-5">글쓰기</button>
					</div>
					<c:if test="${search ne 'search' }">
					<div class="form-inline container-xl mb-3">
						<div class="d-none d-lg-block">
						<button type="button" class="btn btn-outline-secondary mr-2">전체</button>
						<button type="button" class="btn btn-outline-secondary mr-2">훈련</button>
						<button type="button" class="btn btn-outline-secondary mr-2">수제간식</button>
						<button type="button" class="btn btn-outline-secondary mr-2">DIY 옷</button>
						<button type="button" class="btn btn-outline-secondary mr-2">DIY 가구</button>
						<button type="button" class="btn btn-outline-secondary mr-2">건강</button>
						<button type="button" class="btn btn-outline-secondary mr-2">팁</button>
						<button type="button" class="btn btn-outline-secondary mr-2">기타</button>
						</div>
						<div class="d-lg-none d-block">
							<div class="d-flex mb-3">
								<button type="button" class="btn btn-outline-secondary mr-2">전체</button>
								<button type="button" class="btn btn-outline-secondary mr-2">훈련</button>
								<button type="button" class="btn btn-outline-secondary mr-2">수제간식</button>
								<button type="button" class="btn btn-outline-secondary mr-2">DIY 옷</button>
							</div>
							<div class="d-flex">
								<button type="button" class="btn btn-outline-secondary mr-2">건강</button>
								<button type="button" class="btn btn-outline-secondary mr-2">팁</button>
								<button type="button" class="btn btn-outline-secondary mr-2">DIY 가구</button>
								<button type="button" class="btn btn-outline-secondary mr-2">기타</button>
							</div>
						</div>

						
					</div>
					</c:if>
					<div class="postCon">
					
					</div>

				</div>
			</div>
		</div>
		<div>${pageBar }</div>
	</main>
	<div class="loginModal"></div>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>

</html>