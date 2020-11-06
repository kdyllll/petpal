<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>


 <jsp:include page="/WEB-INF/views/common/commonLink.jsp">

  <!-- Custom styles for this template -->
   <link href="/css/album.css" rel="stylesheet">
 
</head>

<body>
<jsp:include page="/WEB-INF/views/common/header.jsp">
  
  <!-- Page Content -->
  <main role="main">
   
  </main>

<jsp:include page="/WEB-INF/views/common/footer.jsp">

</body>

</html>