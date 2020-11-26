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
  	
  	<!-- lg -->
  	<div class="container mb-5 border d-none d-lg-block" style="border:black;">
        <div class="form-inline ml-5" role="form" style="justify-content: center; padding: 15px 0 15px 0;">
            <button class="btn"><div class="text-center">
                <div class="bold">
                    입금대기
                </div>
                <label>0</label>
            </div></button>
            <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-chevron-right ml-4 mr-4" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                <path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
            </svg>
            <div class="text-center mr-5">
                <button class="btn"><div class="text-center">
                <div class="bold">
                    결제완료
                </div>
                <label>0</label>
            </div></button>
            <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-chevron-right ml-4 mr-4" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                <path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
            </svg>
            <button class="btn"><div class="text-center">
                <div class="bold">
                    배송준비
                </div>
                <label>0</label>
            </div></button>
            <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-chevron-right ml-4 mr-4" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                <path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
            </svg>
            <button class="btn"><div class="text-center">
                <div class="bold">
                    배송중
                </div>
                <label>0</label>
            </div></button>
            <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-chevron-right ml-4 mr-4" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                <path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
            </svg>
            <button class="btn"><div class="text-center">
                <div class="bold">
                    배송완료
                </div>
                <label>0</label>
            </div></button>
            <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-chevron-right ml-4 mr-4" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                <path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
            </svg>
            <button class="btn"><div class="text-center">
                <div class="bold">
                    구매확정
                </div>
                <label>0</label>
            </div></button>
        </div>
    </div>
    </div>
    
    <!-- md -->
  	<div class="container mb-5 border d-none d-md-block d-lg-none" style="border:black;">
        <div class="form-inline" role="form" style="justify-content: center; padding: 15px 0 15px 0">
            <button class="btn"><div class="text-center">
                <div>
                    입금대기
                </div>
                <label>0</label>
            </div></button>
            <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-chevron-right ml-2 mr-2" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                <path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
            </svg>
            <button class="btn"><div class="text-center">
                <div >
                    결제완료
                </div>
                <label>0</label>
            </div></button>
            <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-chevron-right ml-2 mr-2" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                <path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
            </svg>
            <button class="btn"><div class="text-center">
                <div >
                    배송준비
                </div>
                <label>0</label>
            </div></button>
            <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-chevron-right ml-2 mr-2" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                <path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
            </svg>
            <button class="btn"><div class="text-center">
                <div >
                    배송중
                </div>
                <label>0</label>
            </div></button>
            <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-chevron-right ml-2 mr-2" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                <path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
            </svg>
            <button class="btn"><div class="text-center">
                <div >
                    배송완료
                </div>
                <label>0</label>
            </div></button>
            <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-chevron-right ml-2 mr-2" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                <path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
            </svg>
            <button class="btn"><div class="text-center">
                <div >
                    구매확정
                </div>
                <label>0</label>
            </div></button>
        </div>
    </div>
    
    <!-- sm -->
  	<div class="container mb-5 border d-lg-none d-md-none d-block" style="border:black;">
        <div class="form-inline" role="form" style="justify-content: center; padding: 15px 0 15px 0">
            <button class="btn" style="padding:5px;"><div class="text-center">
                <div>
                    <small>입금대기</small>
                </div>
                <small><label>0</label></small>
            </div></button>
            <small><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-chevron-right" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                <path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
            </svg></small>
            <button class="btn" style="padding:5px;"><div class="text-center">
                <div >
                    <small>결제완료</small>
                </div>
                <small><label>0</label></small>
            </div></button>
            <small><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-chevron-right" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                <path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
            </svg></small>
            <button class="btn" style="padding:5px;"><div class="text-center">
                <div >
                    <small>배송준비</small>
                </div>
                <small><label>0</label></small>
            </div></button>
            <small><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-chevron-right" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                <path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
            </svg></small>
            <button class="btn" style="padding:5px;"><div class="text-center">
                <div >
                    <small>배송중</small>
                </div>
                <small><label>0</label></small>
            </div></button>
            <small><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-chevron-right" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                <path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
            </svg></small>
            <button class="btn" style="padding:5px;"><div class="text-center">
                <div >
                    <small>배송완료</small>
                </div>
                <small><label>0</label></small>
            </div></button>
            <small><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-chevron-right" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                <path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
            </svg></small>
            <button class="btn" style="padding:5px;"><div class="text-center">
                <div >
                    <small>구매확정</small>
                </div>
                <small><label>0</label></small>
            </div></button>
        </div>
    </div>
    
    
    <div class="container mb-5 border" style="border:black;">
        <div style="padding: 15px 0 15px 0">
    		<div class="dropdown d-inline">
				<button class="btn btn-light dropdown-toggle mb-3" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">기간</button>
				<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
					<button class="dropdown-item" >1개월 전</button>
					<button class="dropdown-item" >3개월 전</button>
					<button class="dropdown-item" >6개월 전</button>
					<button class="dropdown-item" >1년 전</button>
					<button class="dropdown-item" >2년 전</button>
					<button class="dropdown-item" >3년 전</button>
				</div>
			</div>

			<style>
				.dropdown-menu {
					display: none;
					
					transition: all 400ms ease;
				}
				
				.dropdown:hover .dropdown-menu {
					display: block;
					opacity: 1;
				}
			</style>

			<div class="d-flex border p-4 mb-1" style="border: black;">
				<div class="form-inline" style="width: 50%">
					<img src="${path }/resources/images/test.jpg" class="mr-2" style="height: 100px; width: 100px;"> <label>상품명어쩌구저쩌구</label>
				</div>
				<div style="width: 50%;">
					<div class="d-block">
						<label>옵션</label>
					</div>
					<div class="d-block">
						<label>가격</label>
						<label>수량</label>
					</div>
					<div class="d-block">
						<label>결제상태</label>
					</div>
				</div>
			</div>

		</div>
    </div>
    
    
    
  </main>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>

</html>