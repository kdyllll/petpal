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
  	  <input type="hidden" id="memberNo" value="${loginMember.memberNo }"/>
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
                <a href="#" class="text-dark align-middle">
                <fmt:parseNumber var= "su" integerOnly= "true" value= "${reviewAvg }" />
                <c:forEach begin="0" end="4" varStatus="vs">
	                <span class="text-hgh box float-left position-relative mr-1" style="width: 25px; height:25px;"> 
				      <div class="no m-0 p-0 mx-auto position-absolute d-inline" style="top:0;">
				        <svg xmlns="http://www.w3.org/2000/svg" width="25px" height="25px" fill="currentColor" class="bi bi-star" viewBox="0 0 16 16">
				          <path d="M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.523-3.356c.329-.314.158-.888-.283-.95l-4.898-.696L8.465.792a.513.513 0 0 0-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767l-3.686 1.894.694-3.957a.565.565 0 0 0-.163-.505L1.71 6.745l4.052-.576a.525.525 0 0 0 .393-.288l1.847-3.658 1.846 3.658a.525.525 0 0 0 .393.288l4.052.575-2.906 2.77a.564.564 0 0 0-.163.506l.694 3.957-3.686-1.894a.503.503 0 0 0-.461 0z"/>
				        </svg>    
				      </div>
				      
                	<c:choose>
                		<c:when test="${vs.index lt su}">
                			<div class="yes  m-0 p-0 mx-auto position-absolute overflow-hidden d-inline" style="top:0; width:100%; height:25px;">
                		</c:when>
                		<c:when test="${vs.index eq su }">
                			<c:set var="percent" value="${(reviewAvg-su)*100 }"/>
                			<div class="yes  m-0 p-0 mx-auto position-absolute overflow-hidden d-inline" style="top:0; width:${percent}%; height:25px;">
                		</c:when>
                		<c:otherwise>
                			<div class="yes  m-0 p-0 mx-auto position-absolute overflow-hidden d-inline" style="top:0; width:0%; height:25px;">
                		</c:otherwise>
                	</c:choose>
                	
                		 <svg xmlns="http://www.w3.org/2000/svg" width="25px" height="25px" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
				          <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
				        </svg>
				      </div>
				    </span>
                </c:forEach>
    		<span class="ml-2 align-middle"><c:out value="${reviewCount }"/>개 리뷰</span></a>
    		
    		<div class="heartCon">
    		<!-- 관심상품 버튼 -->
           <!--      <button type="button" class="badge bg-white border-0" id="heart">
                <svg width="2em" height="2em" viewBox="0 0 16 16" class="bi bi-heart" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                  <path fill-rule="evenodd" d="M8 2.748l-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z"/>
                </svg>     
                </button>    -->
               			<c:if test="${fav eq 'fav' }">				
								<button type="button" class="btn heart binHeart d-none" >
									<svg xmlns="http://www.w3.org/2000/svg" width="1.2em" height="1.5em" fill="currentColor" class="bi bi-suit-heart  text-danger" viewBox="0 0 16 16">
									  <path d="M8 6.236l-.894-1.789c-.222-.443-.607-1.08-1.152-1.595C5.418 2.345 4.776 2 4 2 2.324 2 1 3.326 1 4.92c0 1.211.554 2.066 1.868 3.37.337.334.721.695 1.146 1.093C5.122 10.423 6.5 11.717 8 13.447c1.5-1.73 2.878-3.024 3.986-4.064.425-.398.81-.76 1.146-1.093C14.446 6.986 15 6.131 15 4.92 15 3.326 13.676 2 12 2c-.777 0-1.418.345-1.954.852-.545.515-.93 1.152-1.152 1.595L8 6.236zm.392 8.292a.513.513 0 0 1-.784 0c-1.601-1.902-3.05-3.262-4.243-4.381C1.3 8.208 0 6.989 0 4.92 0 2.755 1.79 1 4 1c1.6 0 2.719 1.05 3.404 2.008.26.365.458.716.596.992a7.55 7.55 0 0 1 .596-.992C9.281 2.049 10.4 1 12 1c2.21 0 4 1.755 4 3.92 0 2.069-1.3 3.288-3.365 5.227-1.193 1.12-2.642 2.48-4.243 4.38z"/>
									</svg>
								</button>
								<button type="button" class="btn heart fillHeart" >
									<svg xmlns="http://www.w3.org/2000/svg" width="1.2em" height="1.5em" fill="currentColor" class="bi bi-suit-heart-fill text-danger" viewBox="0 0 16 16">
									  <path class="fillHeart" d="M4 1c2.21 0 4 1.755 4 3.92C8 2.755 9.79 1 12 1s4 1.755 4 3.92c0 3.263-3.234 4.414-7.608 9.608a.513.513 0 0 1-.784 0C3.234 9.334 0 8.183 0 4.92 0 2.755 1.79 1 4 1z"/>
									</svg>
								</button>
						</c:if>
						<c:if test="${fav eq '' }">				
								<button type="button" class="btn heart binHeart" >
									<svg xmlns="http://www.w3.org/2000/svg" width="1.2em" height="1.5em" fill="currentColor" class="bi bi-suit-heart  text-danger" viewBox="0 0 16 16">
									  <path d="M8 6.236l-.894-1.789c-.222-.443-.607-1.08-1.152-1.595C5.418 2.345 4.776 2 4 2 2.324 2 1 3.326 1 4.92c0 1.211.554 2.066 1.868 3.37.337.334.721.695 1.146 1.093C5.122 10.423 6.5 11.717 8 13.447c1.5-1.73 2.878-3.024 3.986-4.064.425-.398.81-.76 1.146-1.093C14.446 6.986 15 6.131 15 4.92 15 3.326 13.676 2 12 2c-.777 0-1.418.345-1.954.852-.545.515-.93 1.152-1.152 1.595L8 6.236zm.392 8.292a.513.513 0 0 1-.784 0c-1.601-1.902-3.05-3.262-4.243-4.381C1.3 8.208 0 6.989 0 4.92 0 2.755 1.79 1 4 1c1.6 0 2.719 1.05 3.404 2.008.26.365.458.716.596.992a7.55 7.55 0 0 1 .596-.992C9.281 2.049 10.4 1 12 1c2.21 0 4 1.755 4 3.92 0 2.069-1.3 3.288-3.365 5.227-1.193 1.12-2.642 2.48-4.243 4.38z"/>
									</svg>
								</button>
								<button type="button" class="btn heart d-none fillHeart" >
									<svg xmlns="http://www.w3.org/2000/svg" width="1.2em" height="1.5em" fill="currentColor" class="bi bi-suit-heart-fill text-danger" viewBox="0 0 16 16">
									  <path class="fillHeart" d="M4 1c2.21 0 4 1.755 4 3.92C8 2.755 9.79 1 12 1s4 1.755 4 3.92c0 3.263-3.234 4.414-7.608 9.608a.513.513 0 0 1-.784 0C3.234 9.334 0 8.183 0 4.92 0 2.755 1.79 1 4 1z"/>
									</svg>
								</button>
						</c:if>
                 
                   </div>
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
                <span class="col-3 text-right text-hgh align-middle pt-2" style="font-size:40px;"><strong>
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
              <p class="m-0">CJ대한통운<br>
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
              <div class="col-6"><button type="button" id="cartBtn" class="btn bg-light btn-lg btn-block " data-toggle="modal">장바구니</button></div>             
              <div class="col-6"><button type="button" id="payBtn" class="btn bg-point btn-lg btn-block" data-toggle="modal">바로구매</button></div>
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
                  <a class="nav-link text-dark" href="#review">리뷰(<c:out value="${reviewCount }"/>개)</a>
                </li>
                <li class="nav-item ">
                  <a class="nav-link text-dark" href="#qna">문의(<c:out value="${qnaCount }"/>개)</a>
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
                    <a class="nav-link text-dark" href="#">리뷰(<c:out value="${reviewCount }"/>개)</a>
                  </li>
                  <li class="nav-item ">
                    <a class="nav-link text-dark" href="#">문의(<c:out value="${qnaCount }"/>개)</a>
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
          
          <!-- 일상과 연결되는 사진들 -->
            <c:if test="${not empty dailyList }">
	            <p class="h5 py-4"><strong>유저들의 스타일링 샷</strong> <span class="text-point"><c:out value="${fn:length(dailyList)}"/></span></p>
	            <div id="carouselExampleControls" class="carousel slide block col-lg-8 offset-lg-2">
	              <div class="carousel-inner rounded ">
	                <c:forEach var="d" items="${dailyList }" varStatus="vs">
	                	<a href="${path }/daily/moveDetail.do?dailyNo=${d.dailyNo}" class="carousel-item ${vs.first?'active':'' }">
		                  <img src="${path }/resources/upload/community/daily/${d.dailyImgName}" class="d-block w-100">
		                </a>
	                </c:forEach>               
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
			 </c:if>


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
                <div class="h5 row pl-3">
                  <strong>리뷰</strong> 
                  <span class="text-point pl-3"><c:out value="${reviewCount }"/></span>
                  <div class="text-hgh pl-3">
                   <fmt:parseNumber var= "su" integerOnly= "true" value= "${reviewAvg }" />
	                <c:forEach begin="0" end="4" varStatus="vs">
		                <span class="box float-left position-relative mr-1" style="width: 20px; height:20px;"> 
					      <div class="no m-0 p-0 mx-auto position-absolute d-inline" style="top:0;">
					        <svg xmlns="http://www.w3.org/2000/svg" width="20px" height="20px" fill="currentColor" class="bi bi-star" viewBox="0 0 16 16">
					          <path d="M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.523-3.356c.329-.314.158-.888-.283-.95l-4.898-.696L8.465.792a.513.513 0 0 0-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767l-3.686 1.894.694-3.957a.565.565 0 0 0-.163-.505L1.71 6.745l4.052-.576a.525.525 0 0 0 .393-.288l1.847-3.658 1.846 3.658a.525.525 0 0 0 .393.288l4.052.575-2.906 2.77a.564.564 0 0 0-.163.506l.694 3.957-3.686-1.894a.503.503 0 0 0-.461 0z"/>
					        </svg>    
					      </div>
					      
	                	<c:choose>
	                		<c:when test="${vs.index lt su}">
	                			<div class="yes  m-0 p-0 mx-auto position-absolute overflow-hidden d-inline" style="top:0; width:100%; height:20px;">
	                		</c:when>
	                		<c:when test="${vs.index eq su }">
	                			<c:set var="percent" value="${(reviewAvg-su)*100 }"/>
	                			<div class="yes  m-0 p-0 mx-auto position-absolute overflow-hidden d-inline" style="top:0; width:${percent}%; height:20px;">
	                		</c:when>
	                		<c:otherwise>
	                			<div class="yes  m-0 p-0 mx-auto position-absolute overflow-hidden d-inline" style="top:0; width:0%; height:20px;">
	                		</c:otherwise>
	                	</c:choose>
	                	
	                		 <svg xmlns="http://www.w3.org/2000/svg" width="20px" height="20px" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
					          <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
					        </svg>
					      </div>
					    </span>
	                </c:forEach>
                  
				  </div>
                </div>
                <button type="button" class="btn btn-link text-black-50" data-toggle="modal" id="reviewBtn" ><strong>리뷰 쓰기</strong></button>
              </div>
              <div id="reviewCon">
            
              </div>

            </div>



           <!--문의-->
			<div id="qna">
	           <div class="row d-flex justify-content-between px-3 py-4 mt-5" >
	              <p class="h5">
	                <strong>문의</strong> 
	                <span class="text-point pl-3"><c:out value="${qnaCount }"/></span>               
	              </p>
	              <button type="button" id="qnaBtn" class="btn btn-link text-black-50" data-toggle="modal" ><strong>문의 하기</strong></button>
	             
	            </div>
	            <div id="qnaCon">
	            
	            </div>	            
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
<style>
	#heart:focus{
		outline:none;
	}
</style>
</body>
<script>
		let productNo=$("#productNo").val();
		let loginMember=$("#loginMember").val();
		let stockList=${jsonStock};
		reviewCall();//리뷰 리스트
		qnaCall();//문의 리스트
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
	        		 if(stockList[s].color!=null){
	        			 option=stockList[s].color;
	        		 }
	        		 if(stockList[s].productSize!=null){
	        			 option=option+" "+stockList[s].productSize;
	        		 }
	        		// option=stockList[s].color+" "+stockList[s].productSize;
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
        
        //관심상품 버튼
   $(document).on("click",".heart",e=>{ 
	if(loginMember==""){//로그인 안되어있다면
		loginModal();
	}else {
		var memberNo=$("#memberNo").val();
		$.ajax({
			url:"${path}/store/insertFav.do",
			data:{productNo:productNo,memberNo:memberNo},
			success:(data) => {
				if(data==1){
					alert('관심상품을 담았습니다.');
					$(e.target).parents(".heartCon").find("button.binHeart").addClass("d-none");
					$(e.target).parents(".heartCon").find("button.fillHeart").removeClass("d-none");
				}else{
					$(e.target).parents(".heartCon").find("button.fillHeart").addClass("d-none");
					$(e.target).parents(".heartCon").find("button.binHeart").removeClass("d-none");
					alert("관심상품을 삭제하였습니다.");
				}
			},
			error:(request,status,error)=>{
                alert("관심상품을 담지 못하였습니다.다시 시도해주세요.");
             }
		})

	}
	
})
/* $(document).on("click","#heart",e=>{ 
			if(loginMember==""){
				alert("로그인 후 관싱상품을 담을 수 있습니다.");
				return;
			}else{
				var memberNo=$("#memberNo").val();
			$.ajax({
				url:"${path}/store/insertFav.do",
				data:{productNo:productNo,memberNo:memberNo},
				success:(data) => {
					if(data==1){
						alert('관심상품을 담았습니다.')
					}else{
						alert("관심상품을 삭제하였습니다.")
					}
				},
				error:(request,status,error)=>{
                    alert("관심상품을 담지 못하였습니다.다시 시도해주세요.");
                 }
			})
			}
		}); */


        
        
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
        $(document).on("click","#payBtn",e=>{
        	console.log("클릭");
            if($(".orderBox").length==0){
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
          			  				//리뷰 작성 모달
          			  				$.ajaxSettings.traditional = true;
	          			  			$.ajax({
		          						url: "${path}/store/moveReview.do",
		          						data:{productNo:productNo,details:JSON.stringify(data)},
		          						dataType:"html",
		          						success:(data) => {
		          							$(".pdtModal").html(data);
		          			         		$('div.modal').modal(); 
		          						}
		          					});  			  			
          			     	}else{//구매내역이 없으면
          			            alert("구매 내역이 없습니다.");
          			    	};
          				}
          			}); 
            	}else{//로그인 안되어 있으면 로그인 모달 띄우기		            
            		loginModal();
            	};
            
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
		
		//리뷰 부르기 Ajax
		function reviewCall(){
			$.ajax({
				url: "${path}/store/reviewList.do",
				data:{productNo:productNo},
				dataType:"html",
				success:(data) => {
					$("#reviewCon").html(data);
				}
			});
		}
		
		//문의 부르기 Ajax
		function qnaCall(){
			$.ajax({
				url: "${path}/store/qnaList.do",
				data:{productNo:productNo},
				dataType:"html",
				success:(data) => {
					$("#qnaCon").html(data);
				}
			});
		}
		
        
</script>

</html>