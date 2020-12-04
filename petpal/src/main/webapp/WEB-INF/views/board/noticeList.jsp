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
   	<div class="container" style="max-width:940px">
		   	<!-- 위 공간 -->
		  	<div style="padding-top:5em;"></div>
      		
      		<div class="form-inline mb-5">
      			<h2 class="font-weight-bold ml-2">공지사항</h2>
      			<button type="button" class="btn btn-outline-secondary ml-auto" onclick="location.replace('${path}/board/noticeWrite.do')">작성하기</button>
      		</div>
     		
   			<c:if test="${fn:length(list) == 0}">
   				<div class="border-top form-inline pt-4 pb-4">
		   			<div class="col-sm-10 col-8">
			   			<h6 class="font-weight-bold">공지사항이 없습니다.</h6>
		   			</div>
   				</div>	
   			</c:if>
   			
	   		<c:forEach items="${list }" var="n">
	   			<div class="border-top form-inline pt-4 pb-4">
		   			<div class="col-sm-10 col-8">
			   			<a href="${path }/board/noticeDetail.do?noticeNo=${n.NOTICENO}" style="color:black">
				   			<h6 class="font-weight-bold"><c:out value="${n.TITLE }"/></h6>
			   			</a>
		   			</div>
	   			</div>	
	   		</c:forEach>

		</div>
  </main>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>

</html>