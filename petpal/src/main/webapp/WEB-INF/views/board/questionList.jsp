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
      			<h2 class="font-weight-bold ml-2">질문과 답변</h2>
      			<button type="button" class="btn btn-outline-secondary ml-auto" onclick="location.replace('${path}/board/questionWrite.do')">질문하기</button>
      		</div>
      		
      		
	   		<div class="border-top form-inline pt-4 pb-4">
	   			<div class="col-sm-10 col-8">
		   			<a href="${path }/board/questionDetail.do" style="color:black">
			   			<h5 class="font-weight-bold">제목</h5>
			   			<div class="d-sm-inline d-none">
			   			<p class="small">
			   			아기 상어뚜 루루 뚜루귀여운뚜 루루 뚜루바닷속뚜 루루 뚜루아기 상어!엄마 상어뚜 루루 뚜루어여쁜뚜 루루 뚜루
			   			바닷속뚜 루루 뚜루엄마 상어!아빠 상어뚜 루루 뚜루힘이 센뚜 루루 뚜루바닷속뚜 루루 뚜루아빠 상어!
			   			할머니 상어뚜 루루 뚜루자상한뚜 루루 뚜루바닷속뚜 루루 뚜루할머니 상어!할아버지 상어뚜 루루 뚜루
			   			멋있는뚜 루루 뚜루바닷속뚜 루루 뚜루할아버지 상어!우리는뚜 루루 뚜루바다의뚜 루루 뚜루사냥꾼뚜 루루 뚜루
			   			상어 가족!asdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdf
			   			</p>
		   				</div>
		   			</a>
			   		<h6 class="d-inline mr-3">작성자</h6>
			   		<h6 class="d-inline small mr-5">작성시간</h6>
			   		<div class="d-block d-sm-inline">
			   			<h6 class="d-inline small mr-3">#해시태그</h6>
			   			<h6 class="d-inline small mr-3">#해시태그</h6>
			   			<h6 class="d-inline small mr-3">#해시태그</h6>
		   			</div>
	   			</div>
	   			<div class="image col-sm-2 col-2">
	   				<img src="${path }/resources/images/test.jpg" width="130px" height="130px">
	   			</div>
	   		</div>
	   		<div class="border-top form-inline pt-4 pb-4">
	   			<div class="col-sm-10 col-8">
		   			<a href="${path }/board/questionDetail.do" style="color:black">
			   			<h5 class="font-weight-bold">제목</h5>
			   			<div class="d-sm-inline d-none">
			   			<p class="small">
			   			아기 상어뚜 루루 뚜루귀여운뚜 루루 뚜루바닷속뚜 루루 뚜루아기 상어!엄마 상어뚜 루루 뚜루어여쁜뚜 루루 뚜루
			   			바닷속뚜 루루 뚜루엄마 상어!아빠 상어뚜 루루 뚜루힘이 센뚜 루루 뚜루바닷속뚜 루루 뚜루아빠 상어!
			   			할머니 상어뚜 루루 뚜루자상한뚜 루루 뚜루바닷속뚜 루루 뚜루할머니 상어!할아버지 상어뚜 루루 뚜루
			   			멋있는뚜 루루 뚜루바닷속뚜 루루 뚜루할아버지 상어!우리는뚜 루루 뚜루바다의뚜 루루 뚜루사냥꾼뚜 루루 뚜루
			   			상어 가족!asdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdf
			   			</p>
		   				</div>
		   			</a>
			   		<h6 class="d-inline mr-3">작성자</h6>
			   		<h6 class="d-inline small mr-5">작성시간</h6>
			   		<div class="d-block d-sm-inline">
			   			<h6 class="d-inline small mr-3">#해시태그</h6>
			   			<h6 class="d-inline small mr-3">#해시태그</h6>
			   			<h6 class="d-inline small mr-3">#해시태그</h6>
		   			</div>
	   			</div>
	   			<div class="image col-sm-2 col-2">
	   				<img src="${path }/resources/images/test.jpg" width="130px" height="130px">
	   			</div>
	   		</div>
	   		
	   		
	   		<style>
				body p {
					white-space: nowrap;
					overflow: hidden;
					text-overflow: ellipsis;		
					white-space: normal;
					text-align: left;
					word-wrap: break-word;
					display: -webkit-box;
					-webkit-line-clamp: 2;
					-webkit-box-orient: vertical;
				}
			</style>

		</div>
  </main>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>

</html>