<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/> 
 <jsp:include page="/WEB-INF/views/common/commonLink.jsp" />
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<script>
	
	$(document).ready(function() {
		$(".detail").click(function(){
			let noticeNo = $(this).next().val();
			location.href="${path }/board/noticeDetail.do?noticeNo=" + noticeNo;
		})
	})

</script>
</head>
<body class="bg-white">
<jsp:include page="/WEB-INF/views/common/header.jsp" />
  
  <main role="main" style="min-height:100vh;">
   	<div class="container" style="max-width:940px">
		   	<!-- 위 공간 -->
		  	<div style="padding-top:5em;"></div>
      		
      		<div class="form-inline mb-5">
      			<h2 class="font-weight-bold ml-3">공지사항</h2>
      			<c:if test="${manager eq 'manager'}">
      				<button type="button" class="btn btn-outline-secondary ml-auto" onclick="location.replace('${path}/board/noticeWrite.do')">작성하기</button>
      			</c:if>
      		</div>
     		
   			<c:if test="${fn:length(list) == 0}">
   				<div class="border-top form-inline pt-4 pb-4">
		   			<div class="col-sm-10 col-8">
			   			<h6 class="font-weight-bold">공지사항이 없습니다.</h6>
		   			</div>
   				</div>	
   			</c:if>
   			
	   		<c:forEach items="${list }" var="n">
	   			<div class="detail border-top form-inline pt-4 pb-4">
		   			<div class="col-sm-10 col-8 d-flex justify-content-between">
			   			<div class="d-flex" style="color:black; cursor:pointer">
				   			<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-bell" viewBox="0 0 16 16">
							  <path d="M8 16a2 2 0 0 0 2-2H6a2 2 0 0 0 2 2zM8 1.918l-.797.161A4.002 4.002 0 0 0 4 6c0 .628-.134 2.197-.459 3.742-.16.767-.376 1.566-.663 2.258h10.244c-.287-.692-.502-1.49-.663-2.258C12.134 8.197 12 6.628 12 6a4.002 4.002 0 0 0-3.203-3.92L8 1.917zM14.22 12c.223.447.481.801.78 1H1c.299-.199.557-.553.78-1C2.68 10.2 3 6.88 3 6c0-2.42 1.72-4.44 4.005-4.901a1 1 0 1 1 1.99 0A5.002 5.002 0 0 1 13 6c0 .88.32 4.2 1.22 6z"/>
							</svg>
				   			<h6 class="ml-3 font-weight-bold"><c:out value="${n.TITLE }"/></h6>
			   			</div>
		   			</div>
	   			</div>	
	   			<input type="hidden" id="noticeNo" value="${n.NOTICENO }">
	   		</c:forEach>
			<div>${pageBar }</div>
		</div>
  </main>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>

</html>