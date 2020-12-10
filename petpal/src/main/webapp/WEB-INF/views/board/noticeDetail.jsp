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
			<small>공지사항</small>
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