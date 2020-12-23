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
			  	<button class="btn btn-outline-secondary">주문현황보기</button>
	  		</div>
  	</div>
  </main>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>

</html>