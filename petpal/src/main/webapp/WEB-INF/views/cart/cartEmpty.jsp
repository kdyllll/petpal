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
		<div class="row" style="padding-top: 5em;">
			장바구니가 비었습니다.
		</div>
	</main>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>

</html>