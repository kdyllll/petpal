<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/> 
 <jsp:include page="/WEB-INF/views/common/commonLink.jsp" />
<style>
    input:focus {outline:none;}
    /* 말풍선 모양 css */
    .bubble {
      position: relative;
      background: rgba(255, 255, 255, 0.8);
      z-index: 500;
    }
    .bubble:after {
      bottom: 100%;
      left: 50%;
      border: solid transparent;
      content: "";
      height: 0;
      width: 0;
      position: absolute;
      pointer-events: none;
      border-color: rgba(209, 209, 209, 0);
      border-bottom-color:rgba(255, 255, 255, 0.8);
      border-width: 5px;
      margin-left: -5px;
    }
      
</style>
</head>
<body class="bg-white">
<jsp:include page="/WEB-INF/views/common/header.jsp" />
  
  <main role="main" style="min-height:100vh;">
  <input type="hidden" class="loginMember" value="${loginMember.memberNo }"/>
  <input type="hidden" class="dailyNo" value="${daily.DAILYNO }"/>
   <div class="album py-5">
	   <div class="my-4 mt-lg-0">
	    	<div class="container">
	    	 <div class="col-lg-12 my-5 mt-lg-0 ">
					<div class="mt-3 mt-lg-0 d-lg-flex py-3">
						<a
							class="d-block d-xl-inline text-left mb-0 border-0 px-0 pr-3 py-3 "
							type="button"> 홈 </a> <a href="${path }/daily/moveList.do"
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
	        	<div class="row ">
			         <!-- 왼쪽 -->
			         <div class="col-lg-9 col-sm-12">
			           <div class="container" id="title">	
             
			                <div class="imgCon">
			                	<c:forEach var="i" items="${imgList }" varStatus="vs">			
			                		<div class="position-relative rounded m-1 col-12">                		
					                 <img src="${path }/resources/upload/community/daily/${i.dailyImgName}" class="col-12 mb-1 p-0 rounded">	
					                 <!-- 이미지와 연결된 상품태그들 -->				                 
									 <c:forEach var="c" items="${coordList }"> 
									 	<c:if test="${c.DAILYIMGNO eq i.dailyImgNo }">       
									 		<c:set var="yy" value="${c.YCODE +5 }"/>   
											<div class="plusTag">
								                <svg class="plusBtn position-absolute" width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-plus-circle-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg"
								                    style="top:${c.YCODE}%; left:${c.XCODE }%;">
								                    <path fill-rule="evenodd" d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM8.5 4.5a.5.5 0 0 0-1 0v3h-3a.5.5 0 0 0 0 1h3v3a.5.5 0 0 0 1 0v-3h3a.5.5 0 0 0 0-1h-3v-3z"/>
								                </svg>
								                <div class="bubble rounded shadow-sm col-4 col-lg-4 position-absolute px-1" style="top:${yy}%; left:${c.XCODE }%;">
								                  <div class="row d-flex flex-wrap">
								                  	<c:forEach var="pi" items="${pImgList }">
									                  	<c:if test="${pi.productNo eq c.PRODUCTNO }">
									                    	<img class="col-2 border" src="${path }/resources/upload/product/detail/${pi.imgName}">
									                    </c:if>
								                    </c:forEach>
								                    <p class="p-1 mb-0"><c:out value="${c.PRODUCTNAME }"/></p>
								                  </div>
								                </div>
								             </div>
					                 	</c:if>
					                 </c:forEach>
					                </div><!-- relative -->
					                 <!--화면이 작아지면, 내용과 글쓴이 프로필 등은 첫번째 사진 밑으로!-->
					                 <c:if test="${vs.first}">						      
						                  <div class="d-lg-none mt-5">
						                    <div class="row d-flex justify-content-between">
						                      <div class="row ml-3 d-flex align-items-center">
							                      <a href="${path }/user/moveUserInfo.do" class="p-0 d-flex align-items-center ml-2">
								                      <div class="col-5 p-0">
								                        <c:if test="${not empty daily.IMG }">                
						                                	<img src="${path }/resources/upload/member/profile/${daily.IMG}" class="rounded" style="width:40px; height: 40px;">
						                                </c:if>
						                                <c:if test="${ empty daily.IMG }">  
						                                	<img src="${path }/resources/upload/member/profile/avatar.webp" class="rounded" style="width:40px; height: 40px;">
						                                </c:if>
								                      </div>
					                          	  	  <strong><span class="text-black p-0 ml-2 align-middle"><c:out value="${daily.NICKNAME }"/></span></strong>
					                        	  </a>
					                       		  <button type="button" class="followBtn btn btn-sm bg-testC mr-2 ml-3 text-black-50" style="height: 30px;">팔로우</button>
				                      		  </div>
				                      		  <div class="mr-4">
							                        <button class="btn btn-link mb-3">
							                        	<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-heart" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
							                            	<path fill-rule="evenodd" d="M8 2.748l-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z" />
							                          	</svg>
							                          <span>00</span>
							                        </button>
							                        <button class="btn btn-link mb-3"> 
								                        <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-chat" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
					                                    	<path fill-rule="evenodd" d="M2.678 11.894a1 1 0 0 1 .287.801 10.97 10.97 0 0 1-.398 2c1.395-.323 2.247-.697 2.634-.893a1 1 0 0 1 .71-.074A8.06 8.06 0 0 0 8 14c3.996 0 7-2.807 7-6 0-3.192-3.004-6-7-6S1 4.808 1 8c0 1.468.617 2.83 1.678 3.894zm-.493 3.905a21.682 21.682 0 0 1-.713.129c-.2.032-.352-.176-.273-.362a9.68 9.68 0 0 0 .244-.637l.003-.01c.248-.72.45-1.548.524-2.319C.743 11.37 0 9.76 0 8c0-3.866 3.582-7 8-7s8 3.134 8 7-3.582 7-8 7a9.06 9.06 0 0 1-2.347-.306c-.52.263-1.639.742-3.468 1.105z"/>
					                                	</svg>
							                          <span>00</span>
							                        </button>
				                      		   </div>
				                    		 </div> <!-- row d-flex -->
				                    		 <div class="ml-3 mt-4">
				                      			<p><c:out value="${daily.CONTENT }"/></p>
							                      <div>
						                       		<c:forEach var="h" items="${hashList}">
				                                    		<a href="#">#<c:out value="${h.hashContent }"/></a>				                                    	
				                                    </c:forEach>
							                      </div>
				                    		 </div>
				                    		<c:choose>
					                    		<c:when test="${(loginMember.memberNo eq daily.MEMBERNO) or (loginMember.memberNo eq '63') }">
							                     <div class="d-flex justify-content-between align-items-center my-2 mx-4">
								                     	<div>
								                     		<c:if test="${loginMember.memberNo eq daily.MEMBERNO }">
										                  		<button type="button" onclick="location.href'${path}/daily/updateDaily.do?dailyNo=${daily.DAILYNO }';" class="dailyEdit btn btn-link btn-outline-secondary px-2 py-0 mr-2 text-black-50">수정</button>
										                  	</c:if>
										                  	<button type="button" onclick="location.replace('${path}/daily/deleteDaily.do?dailyNo=${daily.DAILYNO }');" class="dailyDelete btn btn-link btn-outline-secondary px-2 py-0 text-black-50">삭제</button>
										                </div>
										        </c:when>
										        <c:otherwise>
										        	<div class="d-flex justify-content-end align-items-center my-2 mx-4">
										        </c:otherwise>
									        </c:choose>
						                     	<div>
							                      <span class="text-secondary"><c:out value="${daily.ENROLLDATE }"/></span>
							                      <button type="button" class="btn btn-link text-black-50 p-0 ml-2"  onclick="fn_claimModal('${daily.DAILYNO}');">신고</button> 
						                     	</div>
						                     </div>
						                    
					                     </c:if>				              
								</c:forEach>
								</div><!-- imgCon -->
				                 <!-- 댓글 -->
				                 <hr>
				                 <h4>댓글<span class="text-secondary">2</span></h4>
				                 <div class="d-flex mb-3">
				                   <div class="input-group mb-3">
				                     <input type="text" class="form-control" placeholder="칭찬과 격려의 댓글은 작성자에게 큰 힘이 됩니다:)"
				                       aria-label="Recipient's username" aria-describedby="button-addon2">
				                     <div class="input-group-append">
				                       <button class="btn btn-outline-secondary" type="button" id="button-addon2">등록</button>
				                     </div>
				                   </div>
				                 </div>
				                 <div>
					                  <div class="d-flex mb-3">
						                    <a href="#">
						                      <img src="./img/avatar.webp" class="rounded" style="width:40px; height: 40px;">
						                    </a>
						                    <div class="ml-1">
						                        <a href="#"><span class="text-dark align-top mx-1"><strong>닉네임</strong></span></a>
						                        <span>댓글 내용ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ</span>
						                        <div class="d-flex align-items-center ml-1">
						                          <p class="m-0 text-secondary" style="font-size: 12px;">
						                        		    몇분전  
						                          </p>  
						                          <button class="btn text-black-50 p-0 ml-2" style="font-weight:bold; font-size: 12px;">답글 달기</button>
						                        </div>
						                    </div>     
			                  		   </div>
					                  <div class="d-flex mb-3">
					                    <a href="#">
					                      <img src="./img/avatar.webp" class="rounded" style="width:40px; height: 40px;">
					                    </a>
					                    <div class="ml-1">
					                        <a href="#"><span class="text-dark align-top mx-1"><strong>닉네임</strong></span></a>
					                        <span>댓글 내용</span>
					                        <div class="d-flex align-items-center ml-1">
					                          <p class="m-0 text-secondary" style="font-size: 12px;">
					                            몇분전  
					                          </p>  
					                          <button class="btn text-black-50 p-0 ml-2" style="font-weight:bold; font-size: 12px;">답글 달기</button>
					                        </div>
					                    </div>     
					                  </div>   
		                		</div>
		                		<div class="d-flex justify-content-center">댓글페이징바</div>
	               			</div><!-- col-lg-9 -->

	        		</div><!-- container title -->
	         	</div><!-- col-lg-9 sm-12 -->

		         <!-- 오른쪽 스티키-->
		        <div class="col-3 d-none d-lg-block sticky-top" style="top:100px; height:100px;">
		               <button type="button" class="btn btn-link mb-3">
		                  <svg width="1em" height="1em" viewBox="0 0 16 16"
		                   class="bi bi-heart" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
		                   <path fill-rule="evenodd" d="M8 2.748l-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z" />
		                  </svg>
		                  <span>00</span>
		                </button>
		                <button type="button" class="btn btn-link mb-3">
		                	<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-chat" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                            <path fill-rule="evenodd" d="M2.678 11.894a1 1 0 0 1 .287.801 10.97 10.97 0 0 1-.398 2c1.395-.323 2.247-.697 2.634-.893a1 1 0 0 1 .71-.074A8.06 8.06 0 0 0 8 14c3.996 0 7-2.807 7-6 0-3.192-3.004-6-7-6S1 4.808 1 8c0 1.468.617 2.83 1.678 3.894zm-.493 3.905a21.682 21.682 0 0 1-.713.129c-.2.032-.352-.176-.273-.362a9.68 9.68 0 0 0 .244-.637l.003-.01c.248-.72.45-1.548.524-2.319C.743 11.37 0 9.76 0 8c0-3.866 3.582-7 8-7s8 3.134 8 7-3.582 7-8 7a9.06 9.06 0 0 1-2.347-.306c-.52.263-1.639.742-3.468 1.105z"/>
                        	</svg>
		                  <span>00</span>
		                </button>
		               <div>
		                 <div class="row d-flex justify-content-between mb-2"> 
		                    <a href="${path }/user/moveUserInfo.do" class="col-7 p-0 d-flex align-items-center ml-2">
		                      <div class="col-3 p-0">
			                        <c:if test="${not empty daily.IMG }">                
	                                	<img src="${path }/resources/upload/member/profile/${daily.IMG}" class="rounded" style="width:40px; height: 40px;">
	                                </c:if>
	                                <c:if test="${ empty daily.IMG }">  
	                                	<img src="${path }/resources/upload/member/profile/avatar.webp" class="rounded" style="width:40px; height: 40px;">
	                                </c:if>
		                      </div>
		                      <strong><span class="col-3 p-0 ml-2 align-middle"><c:out value="${daily.NICKNAME }"/></span></strong>
		                    </a>
		                    <button type="button" class="followBtn btn btn-sm bg-daily col-4 col-xl-3 mr-2">팔로우</button>
		                 </div>
		                 <div class="mt-2">
		                   <p><c:out value="${daily.CONTENT }"/></p>
		                   <div>
		                     <c:forEach var="h" items="${hashList}">
                           		<a href="#">#<c:out value="${h.hashContent }"/></a>				                                    	
                             </c:forEach>
		                   </div>
		                 </div>
		                 <div class="d-flex justify-content-end align-items-center">
		                   <span class="text-secondary" style="font-size:14px;"><c:out value="${daily.ENROLLDATE }"/></span>
		                   <button type="button" class="btn btn-link text-secondary" style="font-size: 14px;" onclick="fn_claimModal('${daily.DAILYNO}');">신고</button>
		                 </div>
		               </div>
		               <c:if test="${(loginMember.memberNo eq daily.MEMBERNO) or (loginMember.memberNo eq '63') }">
			               <div class="d-flex justify-content-end mr-1">
			               		<c:if test="${loginMember.memberNo eq daily.MEMBERNO }">
			                  		<button type="button" onclick="location.href'${path}/daily/updateDaily.do?dailyNo=${daily.DAILYNO }';" class="dailyEdit btn btn-link btn-outline-secondary px-2 py-0 mr-2 text-black-50">수정</button>
			                  	</c:if>
			                  	<button type="button" onclick="location.replace('${path}/daily/deleteDaily.do?dailyNo=${daily.DAILYNO }');" class="dailyDelete btn btn-link btn-outline-secondary px-2 py-0 text-black-50">삭제</button>
			               </div>
		               </c:if>
		         </div><!-- 스티키 -->
		         
		       </div><!-- row -->
		     </div><!-- container -->
			</div><!-- my-4 -->
		   </div><!-- album -->
			 
 	<jsp:include page="/WEB-INF/views/community/claim.jsp"/>
	<div class="pdtModal"></div>
</main>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>
<script>
let loginMember=$(".loginMember").val();
let dailyNo=$(".dailyNo").val();
$(document).ready(function (){
	$(".bubble").hide();

});

//+버튼 호버하면 상품 보이게
$(".plusBtn").hover(function(e){
	$(e.target).siblings(".bubble").show()
 }, function(e){
	$(e.target).siblings(".bubble").hide();
}); 

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
			$(".pdtModal").html(data);	
        	$('#loginModal').modal(); 
		}
	});
};
 
</script>
</html>