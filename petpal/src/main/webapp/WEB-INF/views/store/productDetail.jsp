<%@page import="com.project.petpal.member.model.vo.Member"%>
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
  
  <!-- Page Content -->
  <main role="main" class="pt-5" style="min-height:100vh;">
  	  <input type="hidden" id="loginMember" value="${loginMember }"/>
      <form class="payFrm container mt-5 productHeader"> 
        <!-- <nav aria-label="breadcrumb ">
          <ol class="breadcrumb bg-transparent">
            <li class="breadcrumb-item"><a href="#">강아지</a></li>
            <li class="breadcrumb-item"><a href="#">가구</a></li>
          </ol>
        </nav> -->
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
          	
            <p id="productName" class="h3">               
                  <c:out value="${product.productName}"/>
            </p>
            <div class="px-3 pb-2 border-bottom">
              <div class="row mb-3 mx-2 d-flex justify-content-between"> 
                <a href="#" class="">★★★☆☆ 00개 리뷰</a>
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
                <span class="h1 col-3 text-right text-info align-middle"><strong><c:out value="${sale }"/>%</strong></span>
                <span class="col-9">
                  <p class="mb-0"><del>
                  	
                  	<c:out value="${price }"/>
                  </del></p>
                  <p class="h1"><strong>
                  	<c:out value="${price * sale * 0.001 }"/>
                  </strong></p>
                </span>
              </div>
              <p class=""><b class="text-info"><c:out value="${price * sale * 0.001 * 0.1}"/>P</b> 적립해드립니다.</p>
            </div>
            <div class="px-3 py-3 border-bottom">
              <p>CJ대한통운<br>
              2,500원 (50,000원 이상 구매시 무료배송) <br>
                <span class="pl-1 text-muted">도서산간지역 추가금액 발생 가능</span>
              </p>              
            </div>
            <div class="py-3 px-3">
              <c:if test="${not empty colors }">
	              <select id="color" class="form-control mb-1" >
	                <option disabled selected>색상</option>  
                	<c:forEach var="i" items="${colors}">
                		<option value="${i }"><c:out value="${i }"/></option>
                	</c:forEach>       
	              </select>
              </c:if>
              <c:if test="${not empty sizes }">
	              <select id="size" class="form-control" >
	                <option disabled selected>크기</option>
	                <c:forEach var="i" items="${sizes }">
	                	<option value="${i }"><c:out value="${i }"/></option>
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
          <nav class="navbar mt-3 navbar-expand-lg navbar-light bg-light ">
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
            <nav class="navbar mt-3 navbar-expand-lg navbar-light bg-light ">
  
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
            <p class="h5 py-4"><strong>유저들의 스타일링 샷</strong> <span class="text-info">0</span></p>
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
                  <span class="text-info pl-3">0</span>
                  <span class="text-info pl-3">★★★☆☆</span>
                </p>
                <button type="button" class="btn btn-link text-info" data-toggle="modal" ><strong>리뷰 쓰기</strong></button>
              </div>
              <!--리뷰창-->
              <article class="px-4 mb-3 pb-3 border-bottom">
                <div class="row pl-2">
                  <a href="" class="rounded-circle pr-3">
                    <img src="./img/avatar.webp" width="30px;">
                  </a>                  
                  <div style="font-size: 12px;">
                    <p class="my-0">작성자</p>
                    <div ><span class="text-info">★★★☆☆</span> <span>구매날짜</span></div>
                  </div>
                </div>
                <div class="my-2"> 옵션 </div>
                <img src=""  width="150px" class="rounded mb-3">
                <p>똥강아지 너무 좋아하고 좀 큰거 같은데 넘 편해보이고 좋으네요 한번 잘 써보겠습니다</p>
                <div class="text-right">
                  <a class="text-info text-right pb-2 pr-4"  style="font-size: 12px;" data-toggle="collapse" href="#replyWrite" role="button" aria-expanded="false" aria-controls="collapseExample">답글 수정(판매자만)</a>
                  <a class="text-info text-right pb-2"  style="font-size: 12px;" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
                    <strong>판매자 답글</strong>
                  </a>
                </div>
                <div class="collapse py-3 mt-2 pr-3 bg-light rounded text-right" id="collapseExample">
                  <p class="mb-0">구매해주셔서 감사합니다. </p>
                </div>
                <form class="collapse  mt-2 p-3 pb-0 bg-light rounded text-right" id="replyWrite">
                  <div class="form-group">
                    <textarea class="form-control" rows="2" style="resize:none;" placeholder="구매해주셔서 감사합니다."></textarea>
                    <button type="button" class="btn btn-primary mt-2">완료</button>
                  </div> 
                </form>               
              </article>

              <article class="px-4 mb-3 pb-3 border-bottom">
                <div class="row pl-2">
                  <a href="" class="rounded-circle pr-3">
                    <img src="./img/avatar.webp" width="30px;">
                  </a>                  
                  <div style="font-size: 12px;">
                    <p class="my-0">작성자</p>
                    <div ><span class="text-info">★★★☆☆</span> <span>구매날짜</span></div>
                  </div>
                </div>
                <div class="my-2"> 옵션 </div>
                <img src="" width="150px" class="rounded mb-3">
                <p>똥강아지 너무 좋아하고 좀 큰거 같은데 넘 편해보이고 좋으네요 한번 잘 써보겠습니다</p>
                <div class="text-right">
                  <a class="text-info text-right pb-2 pr-4"  style="font-size: 12px;" data-toggle="collapse" href="#replyWrite2" role="button" aria-expanded="false" aria-controls="collapseExample">답글 달기(판매자만)</a>
                  <a class="text-black-50 text-right pb-2" style="font-size: 12px;" data-toggle="collapse" href="" role="button" aria-expanded="false" aria-controls="collapseExample">
                    <strong>판매자 답글</strong>
                  </a>
                </div>
                <form class="collapse  mt-2 p-3 pb-0 bg-light rounded text-right" id="replyWrite2">
                  <div class="form-group">
                    <textarea class="form-control" rows="2" style="resize:none;" placeholder=""></textarea>
                    <button type="button" class="btn btn-primary mt-2">완료</button>
                  </div> 
                </form>
                
              </article>
              <div class="mt-3 text-center">페이지바</div>
            </div>

            <!--문의-->
            <div id="inquiry" class="row d-flex justify-content-between px-3 py-4 mt-5" >
              <p class="h5">
                <strong>문의</strong> 
                <span class="text-info pl-3">0</span>               
              </p>
              <button type="button" class="btn btn-link text-info" data-toggle="modal" ><strong>문의 하기</strong></button>
            <!--문의-->
            <article class="border-bottom py-3">
              <div class="row d-flex justify-content-between pl-2"> 
                <p class="mb-0"style="font-size: 14px;">구매 | 배송 | <span class="text-secondary"> 답변전</span></p>
                <a class="text-info text-right pb-2 pr-4"  style="font-size: 12px;" data-toggle="collapse" href="#replyWrite3" role="button" aria-expanded="false" aria-controls="collapseExample">답글 달기(판매자만)</a>
              </div>
              <p class="text-black-50" style="font-size: 12px;">작성자 | <span>작성일</span></p>
              <div class="row ml-2">
                <p class="text-info mr-3"><strong>Q</strong></p>
                <p>11/6 부터 순차발송된다 메세지받았는데
                  아직 배송정보가 안잡힙니다
                  언제출고되나요?</p>
              </div> 
              <form class="collapse" id="replyWrite3">
                <div class="form-group row ml-2">
                  <p class=""><strong class="text-info mr-2">A</strong></p>
                  <div class="col-11"> 
                    <textarea class="form-control" rows="2" style="resize:none;" placeholder=""></textarea>
                    <button type="button" class="btn btn-primary mt-2 offset-10 col-2">완료</button>
                  </div>
                </div> 
              </form>
              
            </article>
            <article class="inquiry border-bottom py-3">
              <div class="row d-flex justify-content-between pl-2"> 
                <p class="mb-0"style="font-size: 14px;">구매 | 배송 | <span class="text-info"> 답변완료</span></p>
                <a class="text-info text-right pb-2 pr-4 updateReply" style="font-size: 12px;">답글 수정(판매자만)</a>
              </div>
              <p class="text-black-50" style="font-size: 12px;">작성자 | <span>작성일</span></p>
              <div class="row ml-2">
                <p class="text-info mr-3"><strong>Q</strong></p>
                <p >11/6 부터 순차발송된다 메세지받았는데
                  아직 배송정보가 안잡힙니다
                  언제출고되나요?</p>
              </div> 
              <div class="oriReply row ml-2">
                <p class=""><strong class="text-info mr-2">A</strong></p>
                <div class="col-11"> 
                  <span class="text-black-50" style="font-size: 12px;">답글작성날짜</span>
                  <p class="content">안녕하세요 그날 오후 즈음 입고가되서 순차적 배송 작업하다보니 일부출고되고 또나머지는 어제부터 발송 처리중이며 이번주 수목 기준은 예상하시면 될듯합니다. 많이 기다려주셔서 너무나 감사합니다</p>
                </div>
              </div> 
              
                <form class="writeFrm d-none" id="replyWrite4">
                  <div class="form-group row ml-2">
                    <p class=""><strong class="text-info mr-2">A</strong></p>
                    <div class="col-11 mt-2"> 
                      <textarea class="writeText form-control" rows="3" style="resize:none;" placeholder=""></textarea>
                      <button type="button" class="btn btn-primary mt-2 offset-10 col-2">완료</button>
                    </div>
                  </div> 
                </form>
              
            </article>
            <script>
              $(".updateReply").click(function(e){       
                var ori=$(e.target).parents(".inquiry").find("div.oriReply");
                var write=ori.next(".writeFrm");
                var content=ori.find("p.content").html();
                //console.log(write);
                ori.toggleClass("d-none");
                write.find("textarea.writeText").html(content);
                write.toggleClass("d-none");
              });
            </script>
            <div class="mt-3 text-center">페이지바</div>

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
                  <td class="border-bottom text-secondary">도서산간지역 추가 배송비</td>
                  <td class="border-bottom">5,000원</td>
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
            <ul>
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
		let loginMember=$("#loginMember").val();
		//수량 선택
		//옵션이 없다면 바로 수량체크할 수 있게
		if($("#color").length==0&&$("#size").length==0){
		  fn_select();
		  $(".delete").hide();
		}
		$(document).on("change","#color",e=>{
		  fn_select();
		});
		$(document).on("change","#size",e=>{
		  fn_select();
		});
		
		//선택한 옵션 제품 수량 선택박스 && 총금액 계산
		function fn_select(){
		  let color=$("#color option:selected").val();
		  let size=$("#size option:selected").val();
		  let option="";
		  let price="";
		  let stockNo="";
		  let stockList=${jsonStock};
		 	  
		  let flag=true;
          //유효성 검사
          $(".orderBox").each((i,item)=>{
            if($("#color").length!=0){
              if(color==$(item).find(".color").val()){
                if($("#size").length!=0&&size==$(item).find(".size").val()){
                  alert("이미 선택한 옵션입니다.");     
                  flag=false;        
                }else{
                  alert("이미 선택한 옵션입니다.");
                  flag=false;  
                };
              };
            }else{
              if(size==$(item).find(".size").val()){
                alert("이미 선택한 옵션입니다.");
                flag=false;  
              };
            };
          });
          if(flag==false){
            return;
          }
		  //oo ox xo xx
		  if($("#color").length!=0){
		    if($("#size").length!=0){
		      option=color + " / " + size;
		      for(let s in stockList){
		    	  if(stockList[s].color==color&&stockList[s].productSize==size){
		    		  price=stockList[s].price;
		    		  stockNo=stockList[s].stockNo;
		    	  }
		      }
		    }else{
		      option=color;
		      for(let s in stockList){
		    	  if(stockList[s].color==color&&stockList[s].productSize==size){
		    		  price=stockList[s].price;
		    		  stockNo=stockList[s].stockNo;
		    	  }
		      }
		    }
		  }else{
		    if($("#size").length!=0){
		      option=size;
		      for(let s in stockList){
		    	  if(stockList[s].color==color&&stockList[s].productSize==size){
		    		  price=stockList[s].price;
		    		  stockNo=stockList[s].stockNo;
		    	  }
		      }
		    }else{
		      option=$("#productName").text().trim();
		      price=stockList[0].price;
		      stockNo=stockList[s].stockNo;
		    }
		  }
		
		  if(color!="색상" && size!="크기"){
		    let optionTag=`<article class="orderBox rounded bg-light m-3 pl-3 pr-1 py-2">
		              <div class="d-flex justify-content-between align-items-center mb-3">
		                <p class="m-0">`+option+`</p>
		                <input type="hidden" class="stockNo" name="stockNo" value="`+stockNo+`"/>
		                <button type="button" class="delete btn p-0 m-0 ">
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
		    $("#orderList").append(optionTag);
		    fn_total();
		  };
		  
		};
		//수량 입력하면 금액 바뀌게
		//수량 6+선택하면 직접입력할 수 있게
		$(document).on("change","select.cntSelect",e=>{ 
		  if($(e.target).val()=="next"){
		    let box=$(e.target).parents(".cntBox")
		    $(e.target).remove();
		    let input=`<input type="text" name="cnt" value="1" class="cnt cntSelect form-control col-5"/>`;
		    box.prepend(input);
		    box.children(".cntSelect").focus();
		  }else{
			  let oriPrice=parseInt($(e.target).siblings(".eachPrice").text());
              let newPrice=oriPrice * ($(e.target).val());
              $(e.target).next(".price").text(newPrice+"원");
              fn_total();
          };  
		});
		$(document).on("focusout","input.cntSelect",e=>{
			let oriPrice=parseInt($(e.target).siblings(".eachPrice").text());
            let newPrice=oriPrice * ($(e.target).val());
            $(e.target).next(".price").text(newPrice+"원");
            fn_total();
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
            	$.ajaxSettings.traditional = true;
            	$.ajax({
    				url: "${path}/store/insertCart.do",
    				data:{stockNo:stockNo,cnt:cnt},
    				dataType:"html",			
    				success:(data) => {
    					//console.log(data);					
    					$(".pdtModal").html(data);	
    	         		$('div.modal').modal(); 
    				},
    				error:(request,status,error)=>{
                       alert("장바구니에 상품을 담지 못했습니다.");
                    }
    			});
              	
            }
          });
        //결제 모달
        $("#payBtn").on("click",e=>{
            if($(".orderBox").length==0){
              alert("상품을 선택하세요.");
              return;
            }else{
            	//로그인 되어 있으면 바로 결제로 넘김
            	if(loginMember!=null){
            		$(".payFrm").attr("action","${path}/payment/payment.do").submit();
            	}else{
            		console.log("로그인안됨");
		            //로그인 안되어 있으면 로그인 모달 띄우기
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
        
        //문의 작성 모달
        
        function ajaxModal(path, subData){
			$.ajax({
				url: path,
				data:subData,
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