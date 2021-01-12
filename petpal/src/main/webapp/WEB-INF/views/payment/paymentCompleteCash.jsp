<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/> 
 <jsp:include page="/WEB-INF/views/common/commonLink.jsp" />
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>
	#style-2::-webkit-scrollbar-track {
		-webkit-box-shadow: inset 0 0 2px rgba(0,0,0,0.3);
		border-radius: 10px;
		background-color: #FFFFFF;
	}
	
	#style-2::-webkit-scrollbar{
		width: 12px;
		background-color: #FFFFFF;
	}
	
	#style-2::-webkit-scrollbar-thumb {
		border-radius: 10px;
		-webkit-box-shadow: inset 0 0 2px rgba(0,0,0,.3);
		background-color: #f7dad9;
	}
</style>

</head>
<body class="bg-white">
<jsp:include page="/WEB-INF/views/common/header.jsp" />
  
  <main role="main" style="min-height:100vh;">
  	<!-- 위 공간 -->
  	<div style="padding-top:5em;"></div>
  	<div class="container">
		<div class="d-none d-md-block">
	  		<p class="mb-5 text-center">결제가 완료되었습니다.&nbsp;&nbsp;&nbsp; <c:out value="${list[0].POINTPLUS }"/>P가 적립되었습니다.</p>
	  		<h4 class="text-center mb-5">주문번호는 <c:out value="${list[0].ORDERNO }"/>입니다.</h4>
	  		<h4 class="text-center mb-4">입금 계좌 : 신한 - 5429385720</h4>
	  		<div class="row" style="margin:0px auto;">
	  			<div class="col-6" style="width:360px;">
	  				<div class="proCon p-3 border border-dark rounded ml-5 pl-4 mt-3 mb-4 d-block">
		  				<h5 class="mb-4"><strong>결제 정보</strong></h5>
	  					<h6>받는 분 : <c:out value="${list[0].RECEIVERNAME }"/> / 연락처 - <c:out value="${list[0].RECEIVERTEL }"/></h6>
	  					<h6>배송지 - <c:out value="${list[0].L0C }"/></h6>
	  					<h6>이메일 - <c:out value="${list[0].EMAIL }"/></h6>
	  					<h6>사용 포인트 - <c:out value="${list[0].POINTMINUS }"/>P / 남은 포인트 - <c:out value="${point }"/>P</h6>
	  					<h6>결제금액 - <c:out value="${list[0].TOTALPRICE }"/>원 / 결제수단 - <c:out value="${list[0].PAYKIND }"/></h6>
	  					<h6>예금주 - <c:out value="${list[0].REFUNDNAME }"/>  / 환불계좌 - <c:out value="${list[0].REFUNDBANK }"/> <c:out value="${list[0].REFUNDACCOUNT }"/></h6>
	  					<h6></h6>
	  				</div>
	  			</div>
	  		
				<div class="col-6" style="overflow:auto; width:520px; height:200px;" id="style-2">
					<c:set var="i" value="0"/>
			  		<c:forEach items="${list }" var="c">
							<div class="proCon p-3 border border-dark rounded mt-3 mb-2 d-block" style="width:90%; margin:0px auto;">
								<div class="d-flex mt-2">
									<div style="margin:0px auto">
										<div class="d-flex">
											<div>
												<img src="${path }/resources/upload/product/detail/${c.IMGNAME}" class="rounded" style="width:100px;height:100px">
											</div>
											<div class="ml-3">
												<h5><c:out value="${c.PRODUCTNAME }"/></h5>
												<div class="d-flex">
													<h6>배송 </h6>
													<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-slash" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
													  <path fill-rule="evenodd" d="M11.354 4.646a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708l6-6a.5.5 0 0 1 .708 0z"/>
													</svg>
													<h6>택배</h6>
												</div>
												<div class="d-flex">
													<span class="ml-auto"><c:out value="${c.PRICESALE}"/>원</span>
												</div>
											</div>
										</div>
											<div class="mt-3">
												<c:if test="${!empty c.COLOR && !empty c.PRODUCTSIZE}">
													<span class="mr-3"><c:out value="${c.COLOR }"/> / <c:out value="${c.PRODUCTSIZE }"/> / <c:out value="${c.CNT }"/>개</span>
												</c:if>
												<c:if test="${!empty c.COLOR && empty c.PRODUCTSIZE}">
													<span class="mr-3"><c:out value="${c.COLOR }"/> / <c:out value="${c.CNT }"/>개</span>
												</c:if>
												<c:if test="${empty c.COLOR && !empty c.PRODUCTSIZE}">
													<span class="mr-3"><c:out value="${c.PRODUCTSIZE }"/> / <c:out value="${c.CNT }"/>개</span>
												</c:if>
					                            <span><c:out value="${c.PRICESALE * c.CNT}"/>원</span>
					                            <c:set var="i" value="${i+1 }"/>
											</div>
									</div>
								</div>
							</div>
					</c:forEach>
				</div>
	  		</div>
	  		<div class="text-center">
			  	
			</div>
	  	</div>
		<div class="d-md-none d-block">
	  		<p class="mb-5 text-center">결제가 완료되었습니다.&nbsp;&nbsp;&nbsp; <c:out value="${list[0].POINTPLUS }"/>P가 적립되었습니다.</p>
	  		<h4 class="text-center mb-5">주문번호는 <c:out value="${list[0].ORDERNO }"/>입니다.</h4>
	  		<h4 class="text-center mb-4">입금 계좌 : 신한 - 5429385720</h4>
	  		<div class="" style="margin:0px auto;">
	  			<div class="" style="width:100%;">
	  				<div class="proCon p-3 border border-dark rounded mt-3 mb-5 d-block">
		  				<h5 class="mb-4"><strong>결제 정보</strong></h5>
	  					<h6><b>받는 분 : </b> 성함 - <c:out value="${list[0].RECEIVERNAME }"/> / 연락처 - <c:out value="${list[0].RECEIVERTEL }"/></h6>
	  					<h6>배송지 - <c:out value="${list[0].L0C }"/></h6>
	  					<h6>이메일 - <c:out value="${list[0].EMAIL }"/></h6>
	  					<h6>결제금액 - <c:out value="${list[0].TOTALPRICE }"/>원 / 결제수단 - <c:out value="${list[0].PAYKIND }"/></h6>
	  					<h6>예금주 - <c:out value="${list[0].REFUNDNAME }"/>  / 환불계좌 - <c:out value="${list[0].REFUNDBANK }"/> <c:out value="${list[0].REFUNDACCOUNT }"/></h6>
	  					<h6></h6>
	  				</div>
	  			</div>
	  		
				<div class="" style="overflow:auto; width:auto; height:200px;" id="style-2">
					<c:set var="i" value="0"/>
			  		<c:forEach items="${list }" var="c">
							<div class="proCon p-3 border border-dark rounded mt-3 mb-2 d-block" style="width:90%; margin:0px auto;">
								<div class="d-flex mt-2">
									<div style="margin:0px auto">
										<div class="d-flex">
											<div>
												<img src="${path }/resources/upload/product/detail/${c.IMGNAME}" class="rounded" style="width:100px;height:100px">
											</div>
											<div class="ml-3">
												<h5><c:out value="${c.PRODUCTNAME }"/></h5>
												<div class="d-flex">
													<h6>배송 </h6>
													<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-slash" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
													  <path fill-rule="evenodd" d="M11.354 4.646a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708l6-6a.5.5 0 0 1 .708 0z"/>
													</svg>
													<h6>택배</h6>
												</div>
												<div class="d-flex">
													<span class="ml-auto"><c:out value="${c.PRICE}"/>원</span>
												</div>
											</div>
										</div>
											<div class="mt-3">
												<c:if test="${!empty c.COLOR && !empty c.PRODUCTSIZE}">
													<span class="mr-3"><c:out value="${c.COLOR }"/> / <c:out value="${c.PRODUCTSIZE }"/> / <c:out value="${c.CNT }"/>개</span>
												</c:if>
												<c:if test="${!empty c.COLOR && empty c.PRODUCTSIZE}">
													<span class="mr-3"><c:out value="${c.COLOR }"/> / <c:out value="${c.CNT }"/>개</span>
												</c:if>
												<c:if test="${empty c.COLOR && !empty c.PRODUCTSIZE}">
													<span class="mr-3"><c:out value="${c.PRODUCTSIZE }"/> / <c:out value="${c.CNT }"/>개</span>
												</c:if>
					                            <span><c:out value="${c.PRICE * c.CNT}"/>원</span>
					                            <c:set var="i" value="${i+1 }"/>
											</div>
									</div>
								</div>
							</div>
					</c:forEach>
				</div>
	  		</div>
	  		<div class="text-center">
			  	
			</div>
	  	</div>
  	</div>
  </main>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>

</html>