<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<jsp:include page="/WEB-INF/views/common/commonLink.jsp" />
<script>
 	$(document).ready(function() {
 		$("#delete").on("click", e=>{
 			if(window.confirm("게시글을 삭제하시겠습니까?")){
				 location.href="${path}/board/noticeDelete.do?noticeNo=${mainList[0].NOTICENO}";
 			}
 		});
 	});
 </script>
</head>
<body class="bg-white">
	<jsp:include page="/WEB-INF/views/common/header.jsp" />

	<main role="main" style="min-height: 100vh;">
		<!-- 위 공간 -->
		<div style="padding-top: 5em;"></div>
		<div class="container" style="max-width: 940px;">
			<div class="d-flex">
				<span>공지사항</span>
				<c:if test="${manager eq 'manager'}">
					<div class="dropdown ml-auto">
		             		<div id="imageDropdown" data-toggle="dropdown">
		             			<svg width="2em" height="2em" viewBox="0 0 16 16" class="bi bi-three-dots-vertical" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
		             				<path fill-rule="evenodd" d="M9.5 13a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0zm0-5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0zm0-5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0z"/>
		              			</svg>
		   					</div>
		   					<c:forEach items="${mainList }" var="n">
							    <div class="dropdown-menu dropdown-menu-right">
								    <button class="dropdown-item" type="button" onclick="location.replace('${path}/board/noticeUpdate.do?noticeNo=${n.NOTICENO}')">수정하기</button>
								    <button class="dropdown-item" type="button" id="delete">삭제하기</button>
							  	</div>
						  	</c:forEach>
					</div>
			  	</c:if>
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