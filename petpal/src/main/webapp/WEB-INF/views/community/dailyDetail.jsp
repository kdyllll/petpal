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
    <div class="album py-5 bg-light">
   <div class="my-4 mt-lg-0">

     <div class="col-lg-12 my-5 mt-lg-0 ">
       <div class="container mt-4 mt-lg-0 d-lg-flex  ">
         <a class="d-block d-xl-inline text-left mb-0 border-0 px-0 pr-3 py-3 " type="button">
           사진
         </a>
         <a class="d-block d-xl-inline text-left collapsed mb-0 border-0 px-0 py-3" type="button">
           노하우
         </a>
       </div>
     </div>

     
     <div class="container">
       <div class="row ">
         <!-- 왼쪽 -->
         <div class="col-lg-9 col-sm-12">
           <div class="container" id="title">

             <div class="container">
               
                <div>
                 <img src="../final/img/cc.webp" class="col-12 mb-1 rounded">
                 <!--작을 때 옆에 떠다니던 것은 이쪽으로-->
                  <div class="d-lg-none mt-5">
                    <div class="row d-flex justify-content-between">
                      <div class="row ml-3 d-flex align-items-center">
                        <a href="#" class="col-4 p-0 d-flex align-items-center ml-2">
                          <div class="col-5 p-0">
                            <img src="./img/avatar.webp" class="rounded col-12 p-0 m-0" >
                          </div>
                          <strong><span class="col-4 p-0 ml-2 align-middle">작성자</span></strong>
                        </a>
                        <button type="button" class="btn btn-sm btn-primary col-3 mr-2" style="height: 30px;">팔로우</button>
                      </div>
                      <div class="mr-4">
                        <button class="btn btn-link mb-3"><svg width="1em" height="1em" viewBox="0 0 16 16"
                            class="bi bi-heart" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                            <path fill-rule="evenodd"
                              d="M8 2.748l-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z" />
                          </svg>
                          <span>00</span>
                        </button>

                        <button class="btn btn-link mb-3"><svg width="1em" height="1em" viewBox="0 0 16 16"
                            class="bi bi-bookmark" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                            <path fill-rule="evenodd"
                              d="M2 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.777.416L8 13.101l-5.223 2.815A.5.5 0 0 1 2 15.5V2zm2-1a1 1 0 0 0-1 1v12.566l4.723-2.482a.5.5 0 0 1 .554 0L13 14.566V2a1 1 0 0 0-1-1H4z" />
                          </svg>
                          <span>00</span>
                        </button>
                      </div>
                    </div>
                    <div class="ml-3 mt-4">
                      <p>내용</p>
                      <div>
                        해시태그
                      </div>
                    </div>
                    <div class="d-flex justify-content-end align-items-center my-2 mr-4">
                      <span class="text-secondary">몇분전</span>
                      <button type="button" class="btn btn-link text-black-50 p-0 ml-2" >신고</button> 
                    </div>
                  
                  </div>
                <img src="../final/img/cc.webp" class="col-12 mb-1 rounded">
                <img src="../final/img/cc.webp" class="col-12 mb-1 rounded">
                <img src="../final/img/cc.webp" class="col-12 mb-1 rounded">


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
               </div>
             </div>
           </div>
         </div>

         <!-- 오른쪽 -->
        <div class="col-3 d-none d-lg-block sticky-top" style="top:100px; height:100px;">
               <button type="button" class="btn btn-link mb-3">
                  <svg width="1em" height="1em" viewBox="0 0 16 16"
                   class="bi bi-heart" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                   <path fill-rule="evenodd" d="M8 2.748l-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z" />
                  </svg>
                  <span>00</span>
                </button>
                <button type="button" class="btn btn-link mb-3"><svg width="1em" height="1em" viewBox="0 0 16 16"
                   class="bi bi-bookmark" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                   <path fill-rule="evenodd" d="M2 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.777.416L8 13.101l-5.223 2.815A.5.5 0 0 1 2 15.5V2zm2-1a1 1 0 0 0-1 1v12.566l4.723-2.482a.5.5 0 0 1 .554 0L13 14.566V2a1 1 0 0 0-1-1H4z" />
                  </svg>
                  <span>00</span>
                </button>
               <div>
                 <div class="row d-flex justify-content-between mb-2"> 
                    <a href="#" class="col-7 p-0 d-flex align-items-center ml-2">
                      <div class="col-3 p-0">
                        <img src="./img/avatar.webp" class="rounded col-12 p-0 m-0" >
                      </div>
                      <strong><span class="col-3 p-0 ml-2 align-middle">작성자</span></strong>
                    </a>
                    <button type="button" class="btn btn-sm btn-primary col-4 col-xl-3 mr-2">팔로우</button>
                 </div>
                 <div class="mt-2">
                   <p>내용</p>
                   <div>
                     해시태그
                   </div>
                 </div>
                 <div class="d-flex justify-content-end align-items-center">
                   <span class="text-secondary" style="font-size:14px;">몇분전</span>
                   <button type="button" class="btn btn-link text-secondary" style="font-size: 14px;">신고</button>
                 </div>
               </div>
         </div>
         
       </div>
     </div>

   </div>
 </div>
</main>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>
<script>

	
	function fn_claimModal() {
		
		//로그인 안되어있다면 로그인 모달 호출
		
		//로그인 되어있다면 신고하기 모달 호출
		$.ajax({
			url: "${path}/claim/moveClaimModal.do",
			data:{no:"147"},
			dataType:"html",
			success:(data) => {
				console.log(data);
				$(".pdtModal").html(data);
         		$('div.modal').modal(); 
			}
		});
	 }
</script>
</html>