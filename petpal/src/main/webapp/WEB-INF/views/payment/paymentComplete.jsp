<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/> 
 <jsp:include page="/WEB-INF/views/common/commonLink.jsp" />
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<body class="bg-white">
<jsp:include page="/WEB-INF/views/common/header.jsp" />
  
  <main role="main" style="min-height:100vh;">
  	<!-- 위 공간 -->
  	<div style="padding-top:5em;"></div>
  	<div class="container">
  			<div class="text-center">
		  		<p class="mb-5">결제가 완료되었습니다! &nbsp;&nbsp;&nbsp;주문해주셔서 감사합니다.</p>
		  		
		  		<c:forEach items="${list }" var="c">
						<div class="proCon p-3 border border-dark rounded mb-4 d-block" style="width:50%; margin:0px auto;">
							<div class="d-flex mt-2">
								<div style="margin:0px auto">
									<a href="" class="d-flex">
										<div>
											<img src="${path }/resources/upload/product/detail/${c.IMGNAME}" class="rounded" style="width:100px;height:100px">
										</div>
										<div class="ml-5">
											<h5><c:out value="${c.PRODUCTNAME }"/></h5>
											<div class="d-flex">
												<h6>배송 </h6>
												<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-slash" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
												  <path fill-rule="evenodd" d="M11.354 4.646a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708l6-6a.5.5 0 0 1 .708 0z"/>
												</svg>
												<h6>택배</h6>
											</div>
										</div>
									</a>
										<div class="mt-3">
											<span class="mr-3"><c:out value="${c.COLOR }"/> / <c:out value="${c.PRODUCTSIZE }"/></span>
				                            <span><c:out value="${c.TOTALPRICE}"/>원</span>
										</div>
								</div>
							</div>
						</div>
						</c:forEach>
		  		
		  		
			  	<button class="btn btn-outline-secondary">주문현황보기</button>
	  		</div>
  	</div>
  </main>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>

</html>