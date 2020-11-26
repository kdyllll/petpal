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
  	<!-- 위 공간 -->
	<div style="padding-top:5em;"></div>
  
   	<div class="container" style="max-width:940px;">
   		<small>질문과 답변</small>
   		<h3 class="mt-3 mb-5 font-weight-bold">제목</h3>
   		<p>내용</p>
   		<img src="${path }/resources/images/test.jpg" style="width:100%">

		<!-- 댓글 -->
		<div class="mt-5 mb-5">
			<hr>
			<h4>
				댓글<span class="su">2</span>
			</h4>
			<div class="comment-all mb-3">
				<div class="input-group mb-3">
					<input type="text" class="form-control"
						placeholder="칭찬과 격려의 댓글은 작성자에게 큰 힘이 됩니다:)"
						aria-label="Recipient's username"
						aria-describedby="button-addon2">
					<div class="input-group-append">
						<button class="btn btn-outline-secondary" type="button"
							id="button-addon2">등록</button>
					</div>
				</div>
			</div>
			<div class="comment-all mb-3">
				<div>
					<img src="" class="">
				</div>
				<div>
					<div>
						<strong><span>작성자</span></strong> <span>내용</span>
					</div>
					<div>
						<span style="font-size: 14px; color: gray;">몇분전</span>
						<button class="click text-black-50" style="font-weight: bold;">답글
							달기</button>
						<button class="click" style="color: gray; font-size: 14px;">신고</button>
					</div>
				</div>
			</div>
			<div class="comment-all mb-3">
				<div>
					<img src="" class="">
				</div>
				<div>
					<div>
						<strong><span>작성자</span></strong> <span>안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕</span>
					</div>
					<div>
						<span style="font-size: 14px; color: gray;">몇분전</span>
						<button class="click text-black-50" style="font-weight: bold;">답글
							달기</button>
						<button class="click" style="color: gray; font-size: 14px;">신고</button>
					</div>
				</div>
			</div>

				<style>
					.su {
						color: #35c5f0;
					}
					
					.comment-all {
						display: flex;
					}
					
					button.click:hover {
						text-decoration: underline;
					}
					
					button.click {
						background-color: white;
						border: none;
					}
				</style>

			</div>

		</div>
   	
                            
   	
  </main>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>

</html>