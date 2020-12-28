<%@page import="org.springframework.ui.Model"%>
<%@page import="java.util.List"%>
<%@page import="com.project.petpal.store.model.vo.Review"%>
<%@page import="com.project.petpal.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	List<Review> reviewList=(List) request.getAttribute("reviewList");
	Member loginMember=(Member)session.getAttribute("loginMember");
%>
<c:set var="path" value="${pageContext.request.contextPath }"/> 
 <jsp:include page="/WEB-INF/views/common/commonLink.jsp" />

</head>
<body class="bg-white">
<jsp:include page="/WEB-INF/views/common/header.jsp" />
  
  <!-- Page Content -->
  <main role="main" class="pt-5" style="min-height:100vh;">
  	  <input type="hidden" id="loginMember" value="${loginMember }"/>
      <form class="payFrm container mt-5 productHeader"> 
 
        <div class="panel-body row">  
          <div class="col-lg-6">
            <!-- 상품 사진 -->
            <div id="carouselExampleIndicators" class="carousel slide" >
              <ol class="carousel-indicators">
              	<c:forEach var="i" items="${imgs }" varStatus="vs">
              		<c:choose>
              			<c:when test="${vs.first }">
              				<li data-target="#carouselExampleIndicators" data-slide-to="${vs.index }"  class="active"></li>
              			</c:when>
              			<c:otherwise>
              				<li data-target="#carouselExampleIndicators" data-slide-to="${vs.index }"></li>
              			</c:otherwise>
              		</c:choose>              
                </c:forEach>
              </ol>
              <div class="carousel-inner rounded">
                <c:forEach var="i" items="${imgs }" varStatus="vs">
					<c:choose>
						<c:when test="${vs.first }">
              				<div class="carousel-item active">
		                  		<img src="${path }/resources/upload/product/detail/${i.imgName}" class="d-block w-100 ">
		                	</div>
              			</c:when>
              			<c:otherwise>
              				<div class="carousel-item">
		                  		<img src="${path }/resources/upload/product/detail/${i.imgName}" class="d-block w-100 ">
		                	</div>
              			</c:otherwise>
					</c:choose>
                </c:forEach>
              </div>
              <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
              </a>
              <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
              </a>
            </div>
          </div>
          <!-- 상품 정보들 -->
          <div class="col-lg-6 ">
          	<input type="hidden" id="productNo" value="${product.productNo }"/>
            <p id="productName" class="h3">               
                  <c:out value="${product.productName}"/>
            </p>
            <div class="px-3 pb-2 border-bottom">
              <div class="row mb-3 mx-2 d-flex justify-content-between"> 
                <a href="#" class="text-dark">★★★☆☆ 00개 리뷰</a>
                <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-heart" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                  <path fill-rule="evenodd" d="M8 2.748l-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z"/>
                </svg>          
              </div>
              	<c:forEach var="i" items="${stockList}" varStatus="vs">
            		<c:if test="${vs.first}">
            			<c:set var="price" value="${i.price }"/>
            		</c:if>
            		<c:if test="${i.price ge price }">
            			<c:remove var="price"/>
            			<c:set var="price" value="${i.price }"/>
            			<c:set var="sale" value="${i.sale }"/>
            		</c:if>
            	</c:forEach>
              <div class="row mb-3">
                <span class="h1 col-3 text-right  text-hgh align-middle"><strong>
                	<c:out value="${sale }"/>%
                </strong></span>
                <span class="col-9">
                  <p class="mb-0"><del>
                  	<fmt:formatNumber value="${price }" pattern="###,###,###"/>원
                  </del></p>
                  <p class="h1"><strong>
                  	<fmt:formatNumber value="${price * (100 - sale) / 100  }" pattern="###,###,###"/>원
                  </strong></p>
                </span>
              </div>
              <p class="">
              		<b class="text-hgh">
              			<fmt:formatNumber value="${price * (100 - sale) / 1000  }" pattern="###,###,###"/>P
              		</b> 적립해드립니다.
              </p>
            </div>
            <div class="px-3 py-3 border-bottom">
              <p>CJ대한통운<br>
              2,500원 (50,000원 이상 구매시 무료배송) <br>
              </p>              
            </div>
            <div class="py-3 px-3">
              <c:if test="${fn:length(stockList) > 1 }">
	              <select id="option" class="form-control mb-1" >
	                <option value="default" disabled selected>옵션 선택</option> 	                 
                	<c:forEach var="s" items="${stockList}">
                		<option value="${s.stockNo }" ${s.stock>0?"":"disabled" }>
                			<c:out value="${s.color }"/> 	
                			&nbsp;
                			<c:out value="${s.productSize }"/> 
							&nbsp;&nbsp; / &nbsp;&nbsp;
                			<c:if test="${s.stock > 0 }">
                				<c:out value="${s.stock }"/>개
                			</c:if>
                			<c:if test="${s.stock < 1 }">
                				(품절)
                			</c:if>
                		</option>
                	</c:forEach>       
                	
	              </select>
              </c:if>

            </div>
            <div id="orderList" class="">
              
            </div>
            <div class="px-4 d-flex justify-content-between">
              <span class="h5"><strong>주문금액</strong></span>
              <span id="totalPrice" class="h3"><strong>0원</strong></span>
            </div>
            <div class="row mx-1 py-3 d-flex justify-content-around">
              <div class="col-6"><button type="button" id="cartBtn" class="btn btn-outline-primary btn-lg btn-block " data-toggle="modal">장바구니</button></div>             
              <div class="col-6"><button type="button" id="payBtn" class="btn btn-primary btn-lg btn-block" data-toggle="modal">바로구매</button></div>
            </div>      
          </div>
        </div>
      </form>
	
     
      <div class="productContainer">
         <!--스티키-->
        <div class="sticky-top d-none d-lg-block" style="top:70px; height:20px;">
          <nav class="navbar mt-3 navbar-expand-lg navbar-light bg-point ">
              <ul class="nav container justify-content-around  d-flex ">
                <li class="nav-item ">
                  <a class="nav-link text-dark" href="#pInfo">상품정보</a>
                </li>
                <li class="nav-item ">
                  <a class="nav-link text-dark" href="#review">리뷰(00개)</a>
                </li>
                <li class="nav-item ">
                  <a class="nav-link text-dark" href="#inquiry">문의(00개)</a>
                </li>
                <li class="nav-item ">
                  <a class="nav-link text-dark" href="#rule">배송/환불</a>
                </li>
              </ul>                     
          </nav>
        </div>
        <div class="sticky-top d-lg-none" style="top:170px; height:20px;">
            <nav class="navbar mt-3 navbar-expand-lg navbar-light bg-point ">
  
                <ul class="nav container justify-content-around  d-flex ">
                  <li class="nav-item ">
                    <a class="nav-link text-dark" href="#">상품정보</a>
                  </li>
                  <li class="nav-item ">
                    <a class="nav-link text-dark" href="#">리뷰(00개)</a>
                  </li>
                  <li class="nav-item ">
                    <a class="nav-link text-dark" href="#">문의(00개)</a>
                  </li>
                  <li class="nav-item ">
                    <a class="nav-link text-dark" href="#">배송/환불</a>
                  </li>
                </ul>                     
            </nav>
          </div>

        <!--상품 상세창-->
        <div class="container mt-5 col-lg-8 col-10 offset-lg-2"> 
          <div class="mb-5">
            <p class="h5 py-4"><strong>유저들의 스타일링 샷</strong> <span class="text-point">0</span></p>
            <div id="carouselExampleControls" class="carousel slide block col-lg-8 offset-lg-2">
              <div class="carousel-inner rounded ">
                <div class="carousel-item active">
                  <img src="" class="d-block w-100" alt="...">
                </div>
                <div class="carousel-item">
                  <img src="" class="d-block w-100" alt="...">
                </div>
                <div class="carousel-item">
                  <img src="" class="d-block w-100" alt="...">
                </div>
              </div>
              <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
              </a>
              <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
              </a>
            </div>
            <!-- <div id="pInfo" style="height:150px;">

            </div> -->
            <!--상품정보-->
            <div id="pInfo">
              <p class="h5 py-4"><strong>상품정보</strong></p>
              <img src="${path }/resources/upload/product/detail/${product.fileName}"  class="col-12">
            </div>
            <p class="h5 py-4"><strong>상품상세정보</strong></p>
            <table class="table ">
              <tbody class="">
                <tr class="">
                  <td class="border-top-0 text-secondary" width="40%">제품 소재</td>
                  <td class="border-top-0">겉감(폴리에스터 100%) / 충전재(폴리에스터 100%)</td>
                </tr>
                <tr>
                  <td class="text-secondary">제조국</td>
                  <td>한국</td>
                </tr>
              </tbody>
            </table>
            <!--리뷰-->
            <div id="review">
              <div class="row d-flex justify-content-between px-3 py-4 mt-5">
                <p class="h5">
                  <strong>리뷰</strong> 
                  <span class="text-point pl-3">0</span>
                  <span class="text-hgh pl-3">★★★☆☆</span>
                </p>
                <button type="button" class="btn btn-link text-black-50" data-toggle="modal" id="reviewBtn" ><strong>리뷰 쓰기</strong></button>
              </div>
              <%if(reviewList==null){ %>
              <p>작성된 리뷰가 없습니다</p>
              <!--리뷰창-->
              <%}else{
            	  for(Review r:reviewList) {%>
              
	              <article class="px-4 mb-3 pb-3 border-bottom">
	                <div class="pl-2 d-flex justify-content-between">
	                 <div class="row">
		                  <a href="" class="rounded-circle pr-3">
		                    <img src="${path }/resources/upload/member/profile/<%=r.getImg() %>" width="30px;">
		                  </a>                  
		                  <div style="font-size: 12px;">
		                    <a href="${path }/user/moveUserInfo.do?memberNo="+<%=r.getMemberNo() %> class="my-0 text-black"><%=r.getNickName() %></a>
		                    <div >
		                      <span class="text-hgh">
		                    		<%
		                    			int star=r.getStar();
		                    			for(int i=0;i<5;i++){
		                    				if(i<star){%>
		                    					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
												  <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
												</svg>              				
		                    				<%}else{%>
		                    					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star" viewBox="0 0 16 16">
												  <path fill-rule="evenodd" d="M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.523-3.356c.329-.314.158-.888-.283-.95l-4.898-.696L8.465.792a.513.513 0 0 0-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767l-3.686 1.894.694-3.957a.565.565 0 0 0-.163-.505L1.71 6.745l4.052-.576a.525.525 0 0 0 .393-.288l1.847-3.658 1.846 3.658a.525.525 0 0 0 .393.288l4.052.575-2.906 2.77a.564.564 0 0 0-.163.506l.694 3.957-3.686-1.894a.503.503 0 0 0-.461 0z"/>
												</svg>
		                    				<%}
		                    			}
		                    		%>
		                    	</span> 
		                    	<span><%=r.getEnrollDate() %></span>
		                    </div>
		                  </div>
	                  </div>
	                  <%if(loginMember!=null&&r.getMemberNo().equals(loginMember.getMemberNo())){ %>
	                  <div>
	                  	<button type="button" class="reviewEdit btn btn-link p-0 pr-1 text-point">수정</button>
	                  	<button type="button" class="reviewDelete btn btn-link p-0 pr-1 text-point">삭제</button>
	                  	<input type="hidden" class="reviewNum" value="<%=r.getReviewNo() %>"/>
	                  </div>
	                  <%}else if(loginMember!=null&&(loginMember.getMemberNo()).equals("63")){%>
	                  <div>
	                  	<button type="button" class="reviewDelete btn btn-link p-0 pr-1 text-point">삭제</button>
	                  	<input type="hidden" class="reviewNum" value="<%=r.getReviewNo() %>"/>
	                  </div>
	                  <%} %>
	                </div>
	                <div class="my-2"> 
	                   <%if(r.getColor()!=null ){
	                		if(r.getProductSize()!=null){%>
								<%=r.getColor() %> / <%=r.getProductSize() %>
	                		<%}else{%>
	                			<%=r.getColor() %>
	                		<%}
	                	}else{
	                		if(r.getProductSize()!=null){%>
	                			<%=r.getProductSize() %>
	                		<%}
	                	}%>	
	                </div>
	                <%if(r.getFileName()!=null){ %>
	                	<img src="${path }/resources/upload/store/review/<%=r.getFileName() %>"  width="150px" class="rounded mb-3">
	                <%} %>
	                <p><%=r.getContent() %></p>
	                
	                  <%if(r.getReviewComment()!=null){ %>
	                  <div class="text-right">
		                  <c:if test="${loginMember.memberNo eq '63'}">
			                  <a class="replyEdit text-point text-right pb-2 pr-4"  style="font-size: 12px;" style="cursor: pointer;">
						                    답글 수정
						      </a>
		                  </c:if>
		                  <a class="replyShow text-hgh text-right pb-2" style="font-size: 12px;" style="cursor: pointer;">
		                    <strong>판매자 답글</strong>
		                  </a>
		              </div> 
		                <div class="reply collapse py-3 mt-2 pr-3 bg-light rounded text-right">
		                  <p class="mb-0"><%=r.getReviewComment() %> </p>
		                </div>
		
		                <form class="replyEditFrm collapse  mt-2 p-3 pb-0 bg-light rounded text-right">
		                  <div class="form-group">
		                    <textarea class="form-control" rows="2" style="resize:none;"><%=r.getReviewComment() %></textarea>
		                    <button type="button" class="replyEditBtn btn btn-primary mt-2">완료</button>
		                    <input type="hidden" name="productNo" value="${product.productNo }"/>
		                    <input type="hidden" name="reviewNo" value="<%=r.getReviewNo() %>"/>
		                  </div> 
		                </form>
	                  <%}else{ %>
	                  <div class="text-right">
		                  <c:if test="${loginMember.memberNo eq '63'}">
		                  	<a class="replyWrite text-point text-right pb-2 pr-4"  style="font-size: 12px;" style="cursor: pointer;">답글 작성</a>
		                  </c:if>
		                  <a class="text-black-50 text-right pb-2" style="font-size: 12px;" style="cursor: pointer;"><strong>판매자 답글</strong></a>
		               </div>
		               <form class="replyWriteFrm collapse  mt-2 p-3 pb-0 bg-light rounded text-right" >
		                  <div class="form-group">
		                    <textarea class="form-control" rows="2" style="resize:none;" placeholder=""></textarea>
		                    <button type="button" class="replyWriteBtn btn btn-primary mt-2">완료</button>
		                    <input type="hidden" name="productNo" value="${product.productNo }"/>
		                    <input type="hidden" name="reviewNo" value="<%=r.getReviewNo() %>"/>
		                  </div> 
		                </form>
	                  <%} %>            
	              </article>
				<%}
               };%>
             
              <div class="mt-3 text-center">페이지바</div>
            </div>

           <!--문의-->

            <div id="qnaCon" class="row d-flex justify-content-between px-3 py-4 mt-5" >
              <p class="h5">
                <strong>문의</strong> 
                <span class="text-point pl-3">0</span>               
              </p>
              <button type="button" id="qnaBtn" class="btn btn-link text-black-50" data-toggle="modal" ><strong>문의 하기</strong></button>
             
            </div>
            <c:forEach var="q" items="${qnaList }">
		            <article class="qna border-bottom py-3">
		              <div class="row d-flex justify-content-between pl-2"> 
		              	
		                <p class="mb-0"style="font-size: 14px;"><c:out value="${q.category }"/> |  
		                <c:if test="${empty q.qnaComment}">
		                	<span class="text-black-50" >답변전</span>
		                </c:if>
		                <c:if test="${not empty q.qnaComment }">
		                	<span class="text-hgh"> 답변완료</span>
		                </c:if>
		                <c:if test="${q.secret eq 'Y' }">
			               	 <span class="text-black-50">
			               	 	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="mb-1 bi bi-lock-fill" viewBox="0 0 16 16">
					                  <path d="M2.5 9a2 2 0 0 1 2-2h7a2 2 0 0 1 2 2v5a2 2 0 0 1-2 2h-7a2 2 0 0 1-2-2V9z"/>
					                  <path fill-rule="evenodd" d="M4.5 4a3.5 3.5 0 1 1 7 0v3h-1V4a2.5 2.5 0 0 0-5 0v3h-1V4z"/>
					            </svg> 
					         </span>
		                </c:if>
		                </p>
		                <c:if test="${(q.memberNo ne loginMember.memberNo) and (loginMember.memberNo eq '63') }">
		                	<div class="text-right mr-4">
				              <button type="button" class="qnaDelete btn btn-link p-0 pr-1 text-black-50">삭제</button>			
			                </div>
		                </c:if>
		                <c:if test="${q.memberNo eq loginMember.memberNo }">
		                 	<div class="text-right mr-4">
			                  <button type="button" class="qnaEdit btn btn-link p-0 pr-1 text-black-50">수정</button>
				              <button type="button" class="qnaDelete btn btn-link p-0 pr-1 text-black-50">삭제</button>			
			                </div>
		                </c:if>			                	                
		              </div>
		              <p class="text-black-50" style="font-size: 12px;"><c:out value="${q.nickName}"/> | <span><c:out value="${q.enrollDate}"/></span></p>
		              
		              <c:choose>
			              <c:when test="${(q.memberNo eq loginMember.memberNo) or (loginMember.memberNo eq '63') or (q.secret eq 'N')}">
				              <div class="row ml-2">
				                <p class="text-hgh mr-3"><strong>Q</strong></p>
				                <pre><c:out value="${q.content}"/></pre>		                  
				              </div> 
				              <c:if test="${(empty q.qnaComment) and (loginMember.memberNo eq '63')}">
					              <a class="answerWrite text-black-50 text-right pb-2 pr-4 mb-1 ml-2" style="font-size: 12px;" role="button" style="cursor: pointer;">답글 달기</a>
					              <form class="answerWriteFrm mt-2 collapse" >
					              	  <input type="hidden" name="productNo" value="${product.productNo }"/>
						              <input type="hidden" class="qnaNo" name="qnaNo" value="${q.qnaNo }"/>
						                <div class="form-group row ml-2">
						                  <p><strong class="text-hgh mr-2">A</strong></p>
						                  <div class="col-11"> 
						                    <textarea class="writeText form-control" name="qnaComment" rows="2" style="resize:none;"></textarea>
						                    <button type="button" class="answerWriteBtn btn bg-hgh text-white mt-2 offset-10 col-2">완료</button>
						                  </div>
						                </div> 
					              </form>
				              </c:if>
				              <c:if test="${(not empty q.qnaComment)}">
					              <div class="answer row ml-2">
					                <p class=""><strong class="text-hgh mr-2">A</strong></p>
					                <div class="col-11"> 
					                  <div class="d-flex justify-content-between mb-2">
					                    <p class="text-black-50 m-0" style="font-size: 12px;"><c:out value="${q.commentDate }"/></p>
					                   	  <c:if test="${loginMember.memberNo eq '63' }">
						                      <div class="row">
						                        <a class="answerEdit text-black-50 mr-2" style="font-size: 12px;" role="button" style="cursor: pointer;">답글 수정</a>
						                        <a class="answerDelete text-black-50 mr-2" style="font-size: 12px;" role="button" style="cursor: pointer;">답글 삭제</a>
						                      </div> 
					                  	  </c:if>
					                  </div>
					                  <pre class="content"><c:out value="${q.qnaComment}"/></pre>
					                </div>
					              </div> 
					              
					                <form class="answerEditFrm collapse" >
					                  <input type="hidden" name="productNo" value="${product.productNo }"/>
					                  <input type="hidden" class="qnaNo" name="qnaNo" value="${q.qnaNo }"/>
					                  <div class="form-group row ml-2">
					                    <p class=""><strong class="text-hgh mr-2">A</strong></p>
					                    <div class="col-11 mt-2"> 
					                      <textarea class="writeText form-control" name="qnaComment" rows="3" style="resize:none;"><c:out value="${q.qnaComment}"/></textarea>
					                      <div class="text-right">
					                        <button type="button" class="editCancel btn btn-link text-hgh mt-2">취소</button>
					                        <button type="button" class="answerEditBtn btn bg-hgh text-white mt-2">완료</button>
					                      </div>
					                    </div>
					                  </div> 
					                </form>
				              </c:if>		              
			              </c:when>
			              <c:otherwise>
			              	 <div class="row ml-2">
				                <p class="text-hgh mr-3"><strong>Q</strong></p>
				                <p class="text-black-50"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-lock-fill" viewBox="0 0 16 16">
				                  <path d="M2.5 9a2 2 0 0 1 2-2h7a2 2 0 0 1 2 2v5a2 2 0 0 1-2 2h-7a2 2 0 0 1-2-2V9z"/>
				                  <path fill-rule="evenodd" d="M4.5 4a3.5 3.5 0 1 1 7 0v3h-1V4a2.5 2.5 0 0 0-5 0v3h-1V4z"/>
				                </svg> </p>
				                <span class="text-black-50 ml-2 pt-1">비밀글 입니다.</span>
				              </div> 
			              </c:otherwise>
		              </c:choose>
		            </article>
            </c:forEach>
          
            <div class="mt-3 text-center">페이지바</div>
            </div>

            <!--배송교환환불-->
            <p id="rule" class="h5 py-4"><strong>배송/교환/환불</strong></p>
            <header class="pb-3" style="font-size: 17px;"><strong>배송</strong></header>
            <table class="table ">
              <tbody class="">
                <tr class="">
                  <td class="border-top-0 text-secondary" width="40%">배송</td>
                  <td class="border-top-0">일반배송</td>
                </tr>
                <tr>
                  <td class="text-secondary">배송비</td>
                  <td>2,500원</td>
                </tr>
                <tr>
                  <td class="border-bottom text-secondary">무료 배송</td>
                  <td class="border-bottom">30,000원 이상 구매시</td>
                </tr>
              </tbody>
            </table>
            <header class="py-3" style="font-size: 17px;"><strong>교환/환불</strong></header>
            <table class="table ">
              <tbody class="">
                <tr class="">
                  <td class="border-top-0 text-secondary" width="40%">반품 배송비</td>
                  <td class="border-top-0">2,500원</td>
                </tr>
                <tr>
                  <td class="text-secondary">교환 배송비</td>
                  <td>5,000원</td>
                </tr>
              </tbody>
            </table>
            <header class="py-3" style="font-size: 17px;"><strong>반품/교환 사유에 따른 요청 가능 기간</strong></header>
            <ul>
              <li>구매자 단순 변심은 상품 수령 후 7일 이내</li>
              <li>표시/광고와 상이, 상품하자의 경우 상품 수령 후 3개월 이내 혹은 표시/광고와 다른 사실을 안 날로부터 30일 이내.
                둘 중 하나 경과 시 반품/교환 불가</li>
            </ul>
            <header class="py-3" style="font-size: 17px;"><strong>반품/교환 불가능 사유</strong></header>
            <ul class="mb-5">
              <li>반품요청기간이 지난 경우</li>
              <li>구매자의 책임 있는 사유로 상품 등이 멸실 또는 훼손된 경우</li>
              <li>포장을 개봉하였으나 포장이 훼손되어 상품가치가 현저히 상실된 경우</li>
              <li>고객주문 확인 후 상품제작에 들어가는 주문제작상품</li>
              <li>구매자의 사용 또는 일부 소비에 의하여 상품의 가치가 현저히 감소한 경우</li>
            </ul>
          </div>
        </div>
      </div>
      <div class="pdtModal"></div>
     
    </main>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>
<script>
		let productNo=$("#productNo").val();
		let loginMember=$("#loginMember").val();
		let stockList=${jsonStock};
		//수량 선택
		if(stockList.length<2){
			fn_select();
		}
		$("#option").on("change",e=>{
			fn_select();
		});
	
		//선택한 옵션 제품 수량 선택박스 && 총금액 계산
		function fn_select(){
		  let stockNo=$("#option option:selected").val();
		  let option="";
		  let price="";		  
		  let stock="";
 		  let display="";
		  let flag=true;
          //유효성 검사
          $(".orderBox").each((i,item)=>{
        	  if($("#option").val()==$(item).find(".stockNo").val()){
        		  alert("이미 선택한 옵션입니다.");
        		  flag=false;
        	  }
          });
          if(flag==false){
        	  return;
          }
		  //oo ox xo xx(옵션(컬러/사이즈)가 존재하는지에 따라 출력할 방식 조절)
		  //옵션이름, 재고번호, 금액 넣기	
		  if(stockList.length>1){
	         for(let s in stockList){
	        	 if(stockList[s].stockNo==stockNo){
	        		 price=stockList[s].price * (100-stockList[s].sale) / 100;
	        		 option=stockList[s].color+" "+stockList[s].productSize;
	        		 stock=stockList[s].stock;
	        		 
	        	 }
	         }
		  }else{
			 price=stockList[0].price * (100-stockList[0].sale) / 100;
     		 option=$("#productName").text()+"  /  (재고 "+stockList[0].stock+"개)";
     		 stock=stockList[0].stock;
     		 stockNo=stockList[0].stockNo;
     		 display="d-none";
		  }
		  /*상품선택박스에 옵션 표시 */
		    let orderBox=`<article class="orderBox rounded bg-light m-3 pl-3 pr-1 py-2">
		              <div class="d-flex justify-content-between align-items-center mb-3">
		                <p class="m-0">`+option+`</p>
		                <input type="hidden" class="stockNo" name="stockNo" value="`+stockNo+`"/>
		                <input type="hidden" class="stockCnt" value="`+stock+`"/>
		                <button type="button" class="delete btn p-0 m-0 `+display+`">
		                  <svg width="2em" height="2em" viewBox="0 0 16 16" class="bi bi-x" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
		                    <path fill-rule="evenodd" d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
		                  </svg>
		                </button>
		              </div>
		              <div class="cntBox row d-flex justify-content-between align-items-center pl-4 pr-5">
		                <select name="cnt" class="cnt cntSelect form-control col-5">
		                  <option value="1">1</option>
		                  <option value="2">2</option>
		                  <option value="3">3</option>
		                  <option value="4">4</option>
		                  <option value="5">5</option>
		                  <option value="next">6+</option>
		                </select>
		                <p class="h5 price">`+price+`원</p>
		                <p class="d-none eachPrice">`+price+`</p>
		              </div>
		            </article>`
		    $("#orderList").append(orderBox);
		    fn_total();
		  };
		  

		//수량 입력하면 금액 바뀌게
		//수량 6+선택하면 직접입력할 수 있게
		//셀렉트일때
		$(document).on("change","select.cntSelect",e=>{ 
			let stockCnt=parseInt($(e.target).parents(".orderBox").find(".stockCnt").val()); //재고 개수
			let cnt=parseInt($(e.target).val()); //선택한 개수
			if($(e.target).val()!="next"&&cnt>stockCnt){ //재고보다 많은 양을 선택하면
				alert("재고가 부족합니다.");
				$(e.target).val('1').prop("selected",true);
		        fn_total();
				return; 
				let oriPrice=parseInt($(e.target).siblings(".eachPrice").text());
	              let newPrice=oriPrice * ($(e.target).val());
	              $(e.target).next(".price").text(newPrice+"원");
	              fn_total();
			}			  
			  if($(e.target).val()=="next"){//6+를 선택하면
				    if(stockCnt<6){//재고가 6보다 작으면 
				        alert("재고가 부족합니다.");
				        $(e.target).val('1').prop("selected",true);
				        fn_total();
				    }else{//많으면 인풋태그로 변환해주기
					    let box=$(e.target).parents(".cntBox")
					    $(e.target).remove();
					    let input=`<input type="text" name="cnt" value="1" class="cnt cntSelect form-control col-5"/>`;
					    box.prepend(input);
					    box.children(".cntSelect").focus();
				    }
			  }else{//다른 개수를 선택하면
				  let oriPrice=parseInt($(e.target).siblings(".eachPrice").text());
	              let newPrice=oriPrice * ($(e.target).val());
	              $(e.target).next(".price").text(newPrice+"원");
	              fn_total();
	          };  
		});
		//인풋일때
		$(document).on("focusout","input.cntSelect",e=>{
			let stockCnt=parseInt($(e.target).parents(".orderBox").find(".stockCnt").val());//재고 개수
			let oriPrice=parseInt($(e.target).siblings(".eachPrice").text());//개당 가격
			let cnt=parseInt($(e.target).val());//선택한 개수
			if($(e.target).val()==""){//아무것도 입력하지 않으면 1로 돌리기
				$(e.target).val(1);
				$(e.target).next(".price").text(oriPrice+"원");
				fn_total(); 
			}else{		
	            if(cnt>stockCnt){//재고보다 많이 입력하면 alert 띄우고 1로 돌리기
					alert("재고가 부족합니다.");
					$(e.target).val(1);
					$(e.target).next(".price").text(oriPrice+"원");
					fn_total(); 
				}else{	//다른 개수를 입력하면 금액 계산해서 써주기
		            let newPrice=oriPrice * (cnt);
		            $(e.target).next(".price").text(newPrice+"원");
		            fn_total(); 
				}
			}        
		});
		//x누르면 선택박스 사라지게
		$(document).on("click",".delete",e=>{
			$(e.target).parents(".orderBox").remove();
            fn_total();
		});
		 //총금액 변경 함수
        function fn_total(){
          let totalPrice=0;
          $(".price").each((i,item)=>{
            let priceCal=parseInt($(item).text().trim());
            totalPrice=totalPrice+priceCal;
          });
          $("#totalPrice").text(totalPrice);
        };
        
		//리뷰
        //리뷰 collapse 작동
        $(".replyEdit").on("click",e=>{
          $(e.target).parents("article").find('form.replyEditFrm').collapse('toggle'); 
        });
        $(".replyShow").on("click",e=>{
          $(e.target).parents("article").find('div.reply').collapse('toggle'); 
        });   
        $(".replyWrite").on("click",e=>{
          $(e.target).parents("article").find('form.replyWriteFrm').collapse('toggle');
        });     
        
        //리뷰 삭제
        $(".reviewDelete").on("click",e=>{
        	let reviewNo=$(e.target).siblings(".reviewNum").val();
        	location.replace("${path}/store/deleteReview.do?reviewNo="+reviewNo+"&productNo="+productNo);
        });
        
        //리뷰 답변 작성
        
		$(document).on("click",".replyWriteBtn",e=>{
			if($(e.target).siblings("textarea").val().trim().length==0){
      			alert("작성할 내용을 작성해주세요.");
      		}else{
				$(e.target).siblings("textarea").attr("name","reviewComment");
				$(e.target).parents(".replyWriteFrm").attr("action","${path}/store/reviewComment.do").submit();
      		}
		});   
      	//리뷰 답변 수정
      	$(document).on("click",".replyEditBtn",e=>{
      		if($(e.target).siblings("textarea").val().trim().length==0){
      			alert("수정할 내용을 작성해주세요.");
      		}else{
				$(e.target).siblings("textarea").attr("name","reviewComment");
				$(e.target).parents(".replyEditFrm").attr("action","${path}/store/reviewComment.do").submit();
      		}
		});
      	
      	//문의
      	//문의 collapse 작동
      	 $(".answerWrite").on("click",e=>{              
            $(e.target).parents("article").find('form.answerWriteFrm').collapse('toggle'); 
          });
          $(".answerEdit").on("click",e=>{
            $(e.target).parents("article").find("div.answer").toggleClass("d-none");
            $(e.target).parents("article").find('form.answerEditFrm').collapse('toggle'); 
          });   
          $(".editCancel").on("click",e=>{
            $(e.target).parents("article").find("div.answer").toggleClass("d-none");
            $(e.target).parents("article").find('form.answerEditFrm').collapse('toggle'); 
          }); 
          
        //문의 삭제
        $(".qnaDelete").on("click",e=>{
        	let qnaNo=$(e.target).parents("article.qna").find("input.qnaNo").val();
        	location.replace("${path}/store/deleteQna.do?productNo="+productNo+"&qnaNo="+qnaNo);
        });
        
        //문의 답변 달기
		$(".answerWriteBtn").on("click",e=>{
			if($(e.target).siblings(".writeText").val().trim().length==0){
				alert("답변 내용을 입력하세요.")
			}else{
				$(e.target).parents("form.answerWriteFrm").attr("action","${path}/store/writeQnaComment.do").submit();
			}	
		});	
        
        //문의 답변 수정
          $(".answerEditBtn").on("click",e=>{
        	  let frm=$(e.target).parents(".answerEditFrm");
        	  if(frm.find(".writeText").val().trim().length==0){
  				alert("수정할 답변 내용을 입력하세요.")
  			}else{
  				frm.attr("action","${path}/store/editQnaComment.do").submit();
  			}
          });
        
        //문의 답변 삭제
        $(".answerDelete").on("click",e=>{
        	let qnaNo=$(e.target).parents("article.qna").find("input.qnaNo").val();
        	location.replace("${path}/store/deleteQnaComment.do?productNo="+productNo+"&qnaNo="+qnaNo);
        });
        
        //재고 개수 동적으로 처리하기
        function fn_stock(){
        	let stockNo=[];
        	$("input[name=stockNo]").each((i,item)=>{
        		stockNo.push(item.value);
        	});
        	let cnt=[];
        	$(".cntSelect").each((i,item)=>{
        		 cnt.push(item.value);
        	});
        	let flag=true;
        	$.ajaxSettings.traditional = true;
        	$.ajax({
				url: "${path}/store/stockCheck.do",
				async: false,  //에이작스의 실행을 기다렸다가 결과를 리턴하도록 비동기식으로 설정
				data:{productNo:productNo,stockNo:stockNo,cnt:cnt},
				dataType:"json",			
				success:(data) => {	//재고수량보다 많이 선택한 상품의 옵션 이름 list
					if(data.length>0){//더 많이 선택한 것이 있다면
						flag=false;
						let msg="";
						for(let i in data){
							msg=msg+data[i]+"의 재고가 부족합니다. \n";							
						}
						alert(msg);					
					}
				}
			});
        	return flag;
        }
        
        
        //모달즈
        
        //장바구니 모달
        $("#cartBtn").on("click",e=>{
            if($(".orderBox").length==0){
              alert("상품을 선택하세요.");
              return;
            }else{       	
            	//장바구니에 삽입 - 삽입 성공하면 데이터 반환(모달주소)
            	//재고번호 input name stockNo
            	//수량 input name cnt
            	let stockNo=[];
            	$("input[name=stockNo]").each((i,item)=>{
            		stockNo.push(item.value);
            	});
            	let cnt=[];
            	$(".cntSelect").each((i,item)=>{
            		 cnt.push(item.value);
            	});
            	//동적으로 재고 개수 확인하기
            	let flag=fn_stock();
            	if(flag==true){
            		//삽입하기
	            	$.ajaxSettings.traditional = true;
	            	$.ajax({
	    				url: "${path}/store/insertCart.do",
	    				data:{stockNo:stockNo,cnt:cnt},
	    				dataType:"html",			
	    				success:(data) => {				
	    					$(".pdtModal").html(data);	
	    	         		$('div.modal').modal(); 
	    				},
	    				error:(request,status,error)=>{
	                       alert("장바구니에 상품을 담지 못했습니다.");
	                    }
	    			}); 
            	}  
    
            }
          });
        
        //결제 모달
        $("#payBtn").on("click",e=>{
            if($(".orderBox").length==0){
              alert("상품을 선택하세요.");
              return;
            }else{
            	if(loginMember!=""){ //로그인 되어 있다면
            		//재고 개수 동적으로 처리하기
		            	//재고번호 input name stockNo
		            	//수량 input name cnt
		            	let flag=fn_stock();
		        		if(flag==true){    	
            				$(".payFrm").attr("action","${path}/payment/payment.do").submit();
		        		} 
            	}else{ //로그인 안되어 있으면 로그인 모달 띄우기(결제로그인모달)	           
            		function loginModal(){
            			$.ajax({
            				url: "${path}/store/movePayLogin.do",
            				dataType:"html",
            				success:(data) => {
            					$(".pdtModal").html(data);	
            	         		$('div.modal').modal(); 
            				}
            			});
            		};
            	};
            };
          });
        //리뷰 작성 모달
        $("#reviewBtn").on("click",e=>{                    	
            	if(loginMember!=""){ //로그인 되어 있으면 바로 리뷰모달로 넘김
            		//이 물건을 구매한 사용자인지 확인(이것도 에이작스해야할듯)
             		$.ajax({
          				url: "${path}/store/payCheck.do",
          				data:{productNo:productNo},
          				success:(data) => {//data는 list임
          			  		if(data.length!=0){//2주안에 리뷰를 안 쓴 구매내역이 있으면 
          			  			if(data.length>1){//구매내역이 여러개라면 
          			  				//어떤 내역을 쓸건지 선택하는 모달
          			  				$.ajaxSettings.traditional = true;
	          			  			$.ajax({
		          						url: "${path}/store/moveReviewSelect.do",
		          						data:{productNo:productNo,details:JSON.stringify(data)},
		          						dataType:"html",
		          						success:(data) => {
		          							$(".pdtModal").html(data);
		          			         		$('div.modal').modal(); 
		          						}
		          					});
          			  			}else{//구매내역이 한개라면
          			  				//리뷰 작성 모달
          			  				fn_reviewWrite(productNo,data[0]);
          			  			}         			  			
          			     	}else{//구매내역이 없으면
          			            alert("구매 내역이 없습니다.");
          			    	};
          				}
          			}); 
            	}else{//로그인 안되어 있으면 로그인 모달 띄우기		            
            		loginModal();
            	};
            
          });
        
        //리뷰 수정 모달
        $(".reviewEdit").on("click",e=>{
        	let reviewNo=$(e.target).siblings(".reviewNum").val(); 
			$.ajaxSettings.traditional = true;
  			$.ajax({
				url: "${path}/store/moveReviewEdit.do",
				data:{productNo:productNo,reviewNo:reviewNo},
				dataType:"html",
				success:(data) => {
					$(".pdtModal").html(data);
	         		$('div.modal').modal(); 
				}
  			});       	
        });        
        
        
        
        //문의 작성 모달
        $("#qnaBtn").on("click",e=>{
        	if(loginMember!=""){//로그인되어있으면 문의 모달 띄우기 
        		$.ajax({
    				url: "${path}/store/moveQna.do",
    				data:{productNo:productNo},
    				dataType:"html",
    				success:(data) => {
    					$(".pdtModal").html(data);
    	         		$('div.modal').modal(); 
    				}
    			});
        	}else{//로그인 안되어있으면 로그인 모달 띄우기
        		loginModal();
        	}
        });
        //문의 수정 모달
        $(".qnaEdit").on("click",e=>{
        	let qnaNo=$(e.target).parents("article.qna").find("input.qnaNo").val();
        	$.ajaxSettings.traditional = true;
	  		$.ajax({
				url: "${path}/store/moveQnaEdit.do",
				data:{productNo:productNo, qnaNo:qnaNo},
				dataType:"html",
				success:(data) => {
					$(".pdtModal").html(data);
	         		$('div.modal').modal(); 
				}
			});
        });
        

		//로그인모달
		function loginModal(){
			$.ajax({
				url: "${path}/login/moveLogin.do",
				dataType:"html",
				success:(data) => {
					$(".pdtModal").html(data);	
	         		$('div.modal').modal(); 
				}
			});
		};
		
		//리뷰작성모달
		function fn_reviewWrite(pNo,dNo){
			$.ajaxSettings.traditional = true;
	  		$.ajax({
				url: "${path}/store/moveReview.do",
				data:{productNo:pNo, detailNo:dNo},
				dataType:"html",
				success:(data) => {
					$(".pdtModal").html("");
					$(".pdtModal").html(data);
	         		$('div.modal').modal(); 
				}
			});
		};
        
</script>

</html>