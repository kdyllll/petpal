<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<jsp:include page="/WEB-INF/views/common/commonLink.jsp" />

</head>
<body class="bg-white">
	<jsp:include page="/WEB-INF/views/common/header.jsp" />

	<main role="main" style="min-height: 100vh;">
		<!-- 위 공간 -->
		<div style="padding-top: 5em;"></div>

		<div class="container" style="max-width: 940px;">
			<div class="d-flex">
				<span>공지사항</span>
				
				<div class="dropdown ml-auto">
	             		<div href="#" id="imageDropdown" data-toggle="dropdown">
	             			<svg width="2em" height="2em" viewBox="0 0 16 16" class="bi bi-three-dots-vertical" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
	             				<path fill-rule="evenodd" d="M9.5 13a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0zm0-5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0zm0-5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0z"/>
	              		</svg>
	   					</div>
	   					<c:if test="${manager eq 'manager'}">
						    <div class="dropdown-menu dropdown-menu-right">
						    <%-- onclick="location.replace('${path}/community/tipUpdate.do?tipNo=${t.TIPNO}')" --%>
							    <button class="dropdown-item" type="button" >수정하기</button>
							    <button class="dropdown-item" type="button" id="delete">삭제하기</button>
						  	</div>
				  	</c:if>
				</div>
			</div>
			
			
			<c:forEach items="${mainList }" var="n">
				<h3 class="mt-3 mb-5 font-weight-bold"><c:out value="${n.TITLE}"/></h3>
				<p><c:out value="${n.CONTENT1 }"/></p>
			</c:forEach>
			
			<c:forEach items="${imgList }" var="n">
				<c:if test="${not empty n.CONTENTIMG }">
					<div>
						<img src="${path }/resources/upload/board/notice/${n.CONTENTIMG}" width="100%" height="400px">
					</div>
					<div class="mb-5" style="white-space: pre-line;">
						<c:out value="${n.CONTENT}" />
					</div>
				</c:if>
			</c:forEach>

			<c:forEach items="${mainList }" var="n">
				<c:if test="${not empty n.CONTENT2 }">
					<div class="mb-5" style="white-space: pre-line;">
						<c:out value="${n.CONTENT2 }" />
					</div>
				</c:if>
			</c:forEach>

		</div>




	</main>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>

</html>