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
                            <a class="move allA nav-link text-secondary" href='javascript:void(0);' onclick="fn_Follower();"><strong>팔로워</strong></a>
                        </li>
                        <li class="nav-item ">
                            <a class="move dailyA nav-link text-secondary" href='javascript:void(0);' onclick="fn_Following();"><strong>팔로잉</strong></a>
                        </li>
                    </ul>                     
                </nav>
            </div>
            <div class="sticky-top d-lg-none" style="top:170px; height:20px;">
                <nav class="navbar mt-3 navbar-expand-lg navbar-light bg-point ">
                    <ul class="nav container justify-content-around">
                        <li class="nav-item ">
                            <a class="move allA nav-link text-secondary" href='javascript:void(0);' onclick="fn_Follower();"><strong>팔로워</strong></a>
                        </li>
                        <li class="nav-item ">
                            <a class="move dailyA nav-link text-secondary" href='javascript:void(0);' onclick="fn_Following();"><strong>팔로잉</strong></a>
                        </li>
                    </ul>                     
                </nav>
            </div>
        
        <div class="container mt-5">
            <div class="row pt-5">
                <!--프로필-->
                <!-- <div class="col-12 col-lg-3"> -->
                <div class="myInfo d-lg-none col-12 mb-5" style="cursor:pointer">
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
                          <span class="border-right pr-2" style="font-size:14px;">팔로워 <strong><c:out value="${follower }"/></strong></span>
                          <span style="font-size:14px;">팔로잉 <strong><c:out value="${following}"/></strong></span>
                        </div>
                        <p class="text-left d-none d-sm-block"><c:out value="${member.info }"/></p>
                      </div>
                  </div>
                </div>
                <div class="myInfo d-none d-lg-block col-lg-3" style="cursor:pointer">
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
                          <span class="border-right pr-2" style="font-size:14px;">팔로워 <strong><c:out value="${follower }"/></strong></span>
                          <span style="font-size:14px;">팔로잉 <strong><c:out value="${following}"/></strong></span>
                        </div>
                        <p class="text-center"><c:out value="${member.info }"/></p>
                      </div>
                  </div>
                </div>
                <!--글목록들-->
                <div class="postCon col-12 ml-lg-5 col-lg-8"> 
                  <!-- 일상 -->
                 
                </div>
            </div>
        </div>
       
  </main>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>
<script>
let userNo=$(".userNo").val();
fn_Following();

function fn_Following(){
	fn_move("${path}/user/moveFollowing.do");
}

function fn_Follower(){
	fn_move("${path}/user/moveFollower.do");
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
	$(".myInfo").click(function(){
		location.href="${path }/member/moveMyPage.do";
	});
</script>
</html>