<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/> 
<jsp:include page="/WEB-INF/views/common/commonLink.jsp" />

</head>
<style>
a{color:black;}	
a:hover{text-decoration:none;}

</style>
<body class="bg-white">
<jsp:include page="/WEB-INF/views/common/header.jsp" />
  
  <!-- Page Content -->
   <main role="main" style="min-height:100vh;" class="">  
   <input type="hidden" class="loginMember" value="${loginMember.memberNo }"/>    
   <input type="hidden" class="userNo" value="${member.memberNo }"/>
        <!--스티키-->
            <div class="sticky-top d-none d-lg-block" style="top:70px; height:20px;">
                <nav class="navbar mt-3 navbar-expand-lg navbar-light bg-point ">
                    <ul class="nav container justify-content-around d-flex col-6 offset-3">
                        <li class="nav-item ">
                            <a class="move allA nav-link text-secondary" href='javascript:void(0);' onclick="fn_All();"><strong>모두 보기</strong></a>
                        </li>
                        <li class="nav-item ">
                            <a class="move dailyA nav-link text-secondary" href='javascript:void(0);' onclick="fn_Daily();"><strong>일상</strong></a>
                        </li>
                        <li class="nav-item ">
                            <a class="move tipA nav-link text-secondary" href='javascript:void(0);' onclick="fn_Tip();"><strong>노하우</strong></a>
                        </li>
                        <li class="nav-item ">
                            <a class="move placeA nav-link text-secondary" href='javascript:void(0);' onclick="fn_Place();"><strong>후기</strong></a>
                        </li>
                        <li class="nav-item ">
                            <a class="move findA nav-link text-secondary" href='javascript:void(0);' onclick="fn_Find();"><strong>찾아주세요</strong></a>
                        </li>
                    </ul>                     
                </nav>
            </div>
            <div class="sticky-top d-lg-none" style="top:170px; height:20px;">
                <nav class="navbar mt-3 navbar-expand-lg navbar-light bg-point ">
                    <ul class="nav container justify-content-around">
                        <li class="nav-item ">
                            <a class="move allA nav-link text-secondary" href='javascript:void(0);' onclick="fn_All();"><strong>모두 보기</strong></a>
                        </li>
                        <li class="nav-item ">
                            <a class="move dailyA nav-link text-secondary" href='javascript:void(0);' onclick="fn_Daily();"><strong>일상</strong></a>
                        </li>
                        <li class="nav-item ">
                            <a class="move tipA nav-link text-secondary" href='javascript:void(0);' onclick="fn_Tip();"><strong>노하우</strong></a>
                        </li>
                        <li class="nav-item ">
                            <a class="move placeA nav-link text-secondary" href='javascript:void(0);' onclick="fn_Place();"><strong>후기</strong></a>
                        </li>
                        <li class="nav-item ">
                            <a class="move findA nav-link text-secondary" href='javascript:void(0);' onclick="fn_Find();"><strong>찾아주세요</strong></a>
                        </li>
                    </ul>                     
                </nav>
            </div>
        
        <div class="container mt-5">
            <div class="row pt-5">
                <!--프로필-->
                <!-- <div class="col-12 col-lg-3"> -->
                <div class="d-lg-none col-12 mb-5">
                  <div class="img-thumbnail mt-5 mx-0 px-2 py-3 row shadow-sm">
                      <div class="my-2 d-none d-sm-block col-sm-3">
                      <c:if test="${not empty member.img}">                
                      	<img src="${path }/resources/upload/member/profile/${member.img}" class="rounded" style="width:100%;">
                      </c:if>
                      <c:if test="${ empty member.img}">  
                      	<img src="${path }/resources/upload/member/profile/avatar.webp" class="rounded" style="width:100%;">
                      </c:if>
                          
                      </div>
                      <div class="col-5">
                        <p class="h3 text-left pt-2 my-0"><strong><c:out value="${member.nickName }"/></strong></p>                      
                        <div class="text-left">
                          <span class="border-right pr-2" style="font-size:12px;"><a href="#" class="text-dark">팔로워 <strong><c:out value="${follower }"/></strong></a></span>
                          <span style="font-size:12px;"><a href="#" class="text-dark">팔로잉 <strong><c:out value="${following}"/></strong></a></span>
                        </div>
                        <form>
                          <div class="form-group text-left mt-2">
                            <input type="hidden" value="유저넘버"/>
                            <!-- <button class="btn bg-point" style="width:120px;">팔로우</button> -->
                            <c:if test="${loginMember.memberNo ne member.memberNo }">
		                    	<button type="button" class="follow followBtn btn btn-sm bg-point" style="width:120px;">팔로우
		                    		<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-person" viewBox="0 0 16 16">
									  <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z"/>
									</svg>
								</button>
		                    	<button type="button" class="following followBtn btn btn-sm bg-point"  style="width:120px;background-color:#dfdfdf;">팔로잉
									<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-person-check-fill" viewBox="0 0 16 16">
									  <path fill-rule="evenodd" d="M15.854 5.146a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 0 1 .708-.708L12.5 7.793l2.646-2.647a.5.5 0 0 1 .708 0z"/>
									  <path d="M1 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
									</svg>
								</button>
		                    </c:if>
                          </div>
                        </form>
                        <p class="text-left d-none d-sm-block"><c:out value="${member.info }"/></p>
                      </div>
                  </div>
                </div>
                <div class="d-none d-lg-block col-lg-3">
                  <div class="img-thumbnail px-5">
                      <div class="my-2">
	                      <c:if test="${not empty member.img}">                
	                      	<img src="${path }/resources/upload/member/profile/${member.img}" class="rounded col-lg-10 offset-lg-1 col-3">
	                      </c:if>
	                      <c:if test="${ empty member.img}">  
	                      	<img src="${path }/resources/upload/member/profile/avatar.webp" class="rounded col-lg-10 offset-lg-1 col-3">
	                      </c:if>     
                      </div>
                      <div>
                        <p class="h2 text-center pt-2"><strong><c:out value="${member.nickName }"/></strong></p>                      
                        <div class="text-center">
                          <span class="border-right pr-2" style="font-size:12px;"><a href="#" class="text-dark">팔로워 <strong><c:out value="${follower }"/></strong></a></span>
                          <span style="font-size:12px;"><a href="#" class="text-dark">팔로잉 <strong><c:out value="${following}"/></strong></a></span>
                        </div>
                        <form>
                          <div class="form-group text-center mt-2">
                            <!-- <button class="btn bg-point" style="width:120px;">팔로우</button> -->
                            <c:if test="${loginMember.memberNo ne member.memberNo }">
		                    	<button type="button" class="follow followBtn btn btn-sm bg-point" style="width:120px;"><span style="font-size:16px;">팔로우</span>
		                    		<svg xmlns="http://www.w3.org/2000/svg" width="23" height="23" fill="currentColor" class="bi bi-person" viewBox="0 0 16 16">
									  <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z"/>
									</svg>
								</button>
		                    	<button type="button" class="following followBtn btn btn-sm bg-point"  style="width:120px;background-color:#dfdfdf;"><span style="font-size:16px;">팔로잉</span>
									<svg xmlns="http://www.w3.org/2000/svg" width="23" height="23" fill="currentColor" class="bi bi-person-check-fill" viewBox="0 0 16 16">
									  <path fill-rule="evenodd" d="M15.854 5.146a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 0 1 .708-.708L12.5 7.793l2.646-2.647a.5.5 0 0 1 .708 0z"/>
									  <path d="M1 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
									</svg>
								</button>
		                    </c:if>
                          </div>
                        </form>
                        <p class="text-center"><c:out value="${member.info }"/></p>
                      </div>
                  </div>
                </div>
                <!--글목록들-->
                <div class="postCon col-12 ml-lg-5 col-lg-8"> 
                  <!-- 일상 -->
                </div>
                  <div class="loginModal"></div>
            </div>
        </div>
       
  </main>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>
<script>
let userNo=$(".userNo").val();
fn_All();

function fn_All(){
	fn_move("${path}/user/moveAll.do");
}

function fn_Daily(){
	fn_move("${path}/user/moveDaily.do");
}

function fn_Tip(){
	fn_move("${path}/user/moveTip.do");
}

function fn_Place(){
	fn_move("${path}/user/movePlace.do");
}

function fn_Find(){
	fn_move("${path}/user/moveFind.do");
}

function fn_move(path){
	$.ajax({
		url: path,
		data: {memberNo:userNo},
		dataType:"html",
		success:(data) => {
			$(".postCon").html(data);	
		}
	});
};

function fn_color(){
	$(".move").removeClass("text-hgh");
	
}

let loginMember=$(".loginMember").val();
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
			let writerNo = '${member.memberNo}';
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
		let writerNo = '${member.memberNo}';
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
</html>