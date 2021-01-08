<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/> 
 <jsp:include page="/WEB-INF/views/common/commonLink.jsp" />
</head>
<body class="bg-white">
<jsp:include page="/WEB-INF/views/common/header.jsp" />
  
  <main role="main" style="min-height:100vh;">
   	<div class="album  bg-light">
   	<div class="container my-4 mt-lg-0">
		<div class="row ">
			<jsp:include page="/WEB-INF/views/common/communityNav.jsp" >
				<jsp:param value="tipDetail" name="comNav"/>
			</jsp:include>
		</div>
	</div>
      <div class="my-4 mt-lg-0">

       
	
		<c:forEach items="${imgList }" var="t">
			<c:if test="${not empty t.MAINIMG}">
        <!-- top 이미지 -->
        <img src="${path}/resources/upload/tip/${t.MAINIMG}" class="img-fluid" style="max-height: auto; height : 300px; width : 100%;">
        </c:if>
		</c:forEach>
		
        <div class="container">
          <div class="row ">

            <!-- 왼쪽 -->
            <div class="col-lg-9 col-sm-12">
              <div class="container" id="title">
                <div class="form-inline container mt-5 mb-5">
                	<h5><c:out value="${mainList[0].CATEGORY }"/></h5>
                	<small class="ml-3">#해시태그</small>
                	<small class="ml-3">#해시태그</small>
                	<small class="ml-3">#해시태그</small>
	                
                </div>

                <div class="container">
                	<c:forEach items="${mainList }" var="t">
	                  <h1><c:out value="${t.TITLE }"/></h1>
	                  <div class="form-inline mt-5 mb-5">
	                  <a href="${path }/user/moveUserInfo.do?memberNo=${mainList[0].MEMBERNO}" class="col-7 p-0 d-flex align-items-center ml-2">
	                    <h5><c:out value="${member[0].NICKNAME }"/></h5>
	                  </a>
	                  </div>
	              	</c:forEach>
                  <div>
                  <div class="ml-2">
                  <c:forEach items="${mainList }" var="t">
                    <div class="mt-5 mb-5" style="white-space:pre-line;">
                    	<c:out value="${t.CONTENT1 }"/>
                    </div>
                    </c:forEach>
					
					<c:forEach items="${imgList }" var="t">
					<c:if test="${not empty t.CONTENTIMG }">
						<div>
						<img src="${path }/resources/upload/tip/${t.CONTENTIMG}" width="100%" height="400px">
						</div>
						<div class="mb-5" style="white-space:pre-line;">
						<c:out value="${t.CONTENT}"/>
						</div>
                    </c:if>
                    </c:forEach>
						
						<c:forEach items="${mainList }" var="t">
						<c:if test="${not empty t.CONTENT2 }">
	                    	<div class="mb-5" style="white-space:pre-line;">
	                    		<c:out value="${t.CONTENT2 }"/>
	                    	</div>
	                    </c:if>
	                    </c:forEach>
					</div>
                    <div class="nav navbar-nav d-lg-none d-inline">
                      <button class="btn btn-outline-dark mb-3"><svg width="1em" height="1em" viewBox="0 0 16 16"
                            class="bi bi-heart" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                            <path fill-rule="evenodd"
                              d="M8 2.748l-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z" />
                          </svg></button>
                      <button class="btn btn-outline-dark mb-3"><svg width="1em" height="1em" viewBox="0 0 16 16"
                            class="bi bi-bookmark" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                            <path fill-rule="evenodd"
                              d="M2 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.777.416L8 13.101l-5.223 2.815A.5.5 0 0 1 2 15.5V2zm2-1a1 1 0 0 0-1 1v12.566l4.723-2.482a.5.5 0 0 1 .554 0L13 14.566V2a1 1 0 0 0-1-1H4z" />
                          </svg></button>
                    </div>


                   <!-- 댓글 -->
				                 <div id="commentContainer">

                  </div>
                </div>
              </div>
            </div>

            
          </div>
            <!-- 오른쪽 스티키-->
		        <div class="col-3 d-none d-lg-block sticky-top" style="top:200px; height:100px; margin-top:200px;">
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
		                 <div class="row d-flex justify-content-between mb-2"> 
		                    <a href="${path }/user/moveUserInfo.do?memberNo=${mainList[0].MEMBERNO}" class="col-7 p-0 d-flex align-items-center ml-2">
		                    	<input type="hidden" class="loginMember" value="${memberNo}" />
		                      <div class="col-3 p-0">
			                        <c:if test="${not empty member[0].IMG }">         
	                                	<img src="${path }/resources/upload/member/profile/${member[0].IMG}" class="rounded" style="width:40px; height: 40px;">
	                                </c:if>
	                                <c:if test="${ empty member[0].IMG }">  
	                                	<img src="${path }/resources/upload/member/profile/avatar.webp" class="rounded" style="width:40px; height: 40px;">
	                                </c:if>
		                      </div>
		                      <strong><span class="col-3 p-0 ml-2 align-middle"><c:out value="${member[0].NICKNAME }"/></span></strong>
		                    </a>
		                    <c:if test="${memberNo ne mainList[0].MEMBERNO }">
		                    	<button type="button" id="follow" class="followBtn btn btn-sm bg-point col-4 col-xl-3 mr-2">
		                    		<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-person" viewBox="0 0 16 16">
									  <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z"/>
									</svg>
								</button>
		                    	<button type="button" id="following" class="followBtn btn btn-sm col-4 col-xl-3 mr-2"  style="background-color:#dfdfdf;">
									<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-person-check-fill" viewBox="0 0 16 16">
									  <path fill-rule="evenodd" d="M15.854 5.146a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 0 1 .708-.708L12.5 7.793l2.646-2.647a.5.5 0 0 1 .708 0z"/>
									  <path d="M1 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
									</svg>
								</button>
		                    </c:if>
		                 </div>
		                 <%-- <div class="mt-3">
		                   <pre class="my-1 "><c:out value="${daily.CONTENT }"/></pre>
		                   <div>
		                     <c:forEach var="h" items="${hashList}">
                           		<a href="#">#<c:out value="${h.hashContent }"/></a>				                                    	
                             </c:forEach>
		                   </div>
		                 </div> --%>
		                 <div class="d-flex justify-content-end align-items-center">
		                   <span class="text-secondary" style="font-size:14px;"><c:out value="${mainList[0].TIPDATE }"/></span>
		                   <c:if test="${memberNo ne mainList[0].MEMBERNO }">
		                   	<button type="button" class="btn btn-link text-secondary" style="font-size: 14px;" onclick="fn_claimModal('${mainList[0].TIPNO}');">신고</button>
		                   </c:if>
		                 </div>
		               </div>
		               <c:if test="${memberNo eq mainList[0].MEMBERNO }">
			               <div class="d-flex justify-content-end mr-1">
			                  		<c:forEach items="${imgList }" var="t">
								    <button type="button" class="btn btn-link btn-outline-secondary px-2 py-0 mr-2 text-black-50" onclick="location.replace('${path}/community/tipUpdate.do?tipNo=${t.TIPNO}')">수정</button>
						  	</c:forEach>
			                  	<button type="button" class="btn btn-link btn-outline-secondary px-2 py-0 text-black-50" id="delete">삭제</button>
			               </div>
		               </c:if>
		         </div><!-- 스티키 -->
		         <div class="loginModal"></div>
        </div>
        <input type="hidden" class="tipNo" value="${mainList[0].TIPNO }"> 
      </div>
    </div>
  </main>
  <script>
  	let tipNo = $(".tipNo").val();
	let loginMember=$(".loginMember").val();
 	$(document).ready(function() {
 		$("#delete").on("click", e=>{
 			if(window.confirm("게시글을 삭제하시겠습니까?")){
				 location.href="${path}/community/tipDelete.do?tipNo=${mainList[0].TIPNO}";
 			}
 		});
 	});
 	
 	$(".binHeart").on("click" , e => {
 		if(loginMember==""){//로그인 안되어있다면
 			loginModal();

 		}else {//댓글 내용이 없으면
 			$(e.target).parent().addClass("d-none");
 			$(e.target).parent().next().removeClass("d-none");
 			$.ajax({
 		        url:"${path}/tip/insertLike.do",
 		        data:{tipNo : tipNo},
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
 		        url:"${path}/tip/deleteLike.do",
 		        data:{tipNo : tipNo},
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
			let writerNo = '${writer}';
 	 		$.ajax({
 	 			async: false,
 	 			url: "${path}/user/following.do",
 	 			data: {writerNo : writerNo},
 	 			success:(data) => {
 	 				if(data==10){
 	 					$("#following").show();
 	 					$("#follow").hide();
 	 				}else if(data==20){
 	 					$("#following").hide();
 	 					$("#follow").show();
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
 		let writerNo = '${writer}';
 		$.ajax({
 			async: false,
 			url: "${path}/user/followingCheck.do",
 			data: {writerNo : writerNo},
 			success:(data) => {
 				if(data==10){
 					$("#following").hide();
 					$("#follow").show();
 				}else if(data==20){
 					$("#following").show();
 					$("#follow").hide();
 				}
 				if(data==100){
 					$("#following").hide();
 					$("#follow").show();
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