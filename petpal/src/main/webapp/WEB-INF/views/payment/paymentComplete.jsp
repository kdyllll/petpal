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
  	<div style="padding-top:5em;"></div>
  	<div class="container mb-5 border d-none d-lg-block" style="border:black;">
        <div class="form-inline" role="form" style="justify-content: center; padding: 15px 0 15px 0">
            <div class="text-center mr-5">
                <div>
                    입금대기
                </div>
                <label>0</label>
            </div>
            <svg width="1em" height="1em" viewBox="0 04 16 16" class="bi bi-chevron-right mr-5" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                <path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
            </svg>
            <div class="text-center mr-5">
                <div >
                    결제완료
                </div>
                <label>0</label>
            </div>
            <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-chevron-right mr-5" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                <path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
            </svg>
            <div class="text-center mr-5">
                <div >
                    배송준비
                </div>
                <label>0</label>
            </div>
            <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-chevron-right mr-5" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                <path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
            </svg>
            <div class="text-center mr-5">
                <div >
                    배송중
                </div>
                <label>0</label>
            </div>
            <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-chevron-right mr-5" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                <path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
            </svg>
            <div class="text-center mr-5">
                <div >
                    배송완료
                </div>
                <label>0</label>
            </div>
            <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-chevron-right mr-5" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                <path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
            </svg>
            <div class="text-center">
                <div >
                    구매확정
                </div>
                <label>0</label>
            </div>
        </div>
    </div>
    
  	<div class="container mb-5 border d-none d-md-block d-lg-none" style="border:black;">
        <div class="form-inline" role="form" style="justify-content: center; padding: 15px 0 15px 0">
            <div class="text-center mr-3">
                <div>
                    입금대기
                </div>
                <label>0</label>
            </div>
            <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-chevron-right mr-3" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                <path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
            </svg>
            <div class="text-center mr-3">
                <div >
                    결제완료
                </div>
                <label>0</label>
            </div>
            <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-chevron-right mr-3" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                <path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
            </svg>
            <div class="text-center mr-3">
                <div >
                    배송준비
                </div>
                <label>0</label>
            </div>
            <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-chevron-right mr-3" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                <path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
            </svg>
            <div class="text-center mr-3">
                <div >
                    배송중
                </div>
                <label>0</label>
            </div>
            <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-chevron-right mr-3" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                <path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
            </svg>
            <div class="text-center mr-3">
                <div >
                    배송완료
                </div>
                <label>0</label>
            </div>
            <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-chevron-right mr-3" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                <path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
            </svg>
            <div class="text-center">
                <div >
                    구매확정
                </div>
                <label>0</label>
            </div>
        </div>
    </div>
    
  	<div class="container mb-5 border d-lg-none d-md-none d-block" style="border:black;">
        <div class="form-inline" role="form" style="justify-content: center; padding: 15px 0 15px 0">
            <div class="text-center mr-2">
                <div>
                    <small>입금대기</small>
                </div>
                <small><label>0</label></small>
            </div>
            <small><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-chevron-right mr-2" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                <path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
            </svg></small>
            <div class="text-center mr-2">
                <div >
                    <small>결제완료</small>
                </div>
                <small><label>0</label></small>
            </div>
            <small><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-chevron-right mr-2" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                <path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
            </svg></small>
            <div class="text-center mr-2">
                <div >
                    <small>배송준비</small>
                </div>
                <small><label>0</label></small>
            </div>
            <small><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-chevron-right mr-2" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                <path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
            </svg></small>
            <div class="text-center mr-2">
                <div >
                    <small>배송중</small>
                </div>
                <small><label>0</label></small>
            </div>
            <small><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-chevron-right mr-2" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                <path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
            </svg></small>
            <div class="text-center mr-2">
                <div >
                    <small>배송완료</small>
                </div>
                <small><label>0</label></small>
            </div>
            <small><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-chevron-right mr-2" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                <path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
            </svg></small>
            <div class="text-center">
                <div >
                    <small>구매확정</small>
                </div>
                <small><label>0</label></small>
            </div>
        </div>
    </div>
  </main>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>

</html>