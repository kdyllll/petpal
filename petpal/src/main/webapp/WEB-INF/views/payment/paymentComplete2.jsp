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
		  		<p>주문결제가 완료되었습니다.</p>
		  		<svg xmlns="http://www.w3.org/2000/svg" width="340" height="340" fill="currentColor" class="bi bi-wallet2" viewBox="0 0 16 16">
				  <path fill-rule="evenodd" d="M12.136.326A1.5 1.5 0 0 1 14 1.78V3h.5A1.5 1.5 0 0 1 16 4.5v9a1.5 1.5 0 0 1-1.5 1.5h-13A1.5 1.5 0 0 1 0 13.5v-9a1.5 1.5 0 0 1 1.432-1.499L12.136.326zM5.562 3H13V1.78a.5.5 0 0 0-.621-.484L5.562 3zM1.5 4a.5.5 0 0 0-.5.5v9a.5.5 0 0 0 .5.5h13a.5.5 0 0 0 .5-.5v-9a.5.5 0 0 0-.5-.5h-13z"/>
				</svg>
		  		<p><i class="bi bi-wallet2" style="font-size:340px; color:gray;"></i></p>
			  	<button class="btn btn-outline-secondary">주문현황보기</button>
	  		</div>
  	</div>
  </main>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>

</html>