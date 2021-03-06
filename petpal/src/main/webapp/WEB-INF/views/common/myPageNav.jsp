<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
 
 <link rel="stylesheet" href="${path }/resources/css/member/myPageProfile.css">  

</head>
<%
	String mpNav = request.getParameter("mpNav");
%>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
  
  <!-- Page Content -->
<main role="main" class="container">
<div class="row d-flex py-3 mb-3 mt-5 text-white-50 rounded shadow-sm justify-content-center " style="background-color:#eae1d8;">
    <div class="py-2">
      <a href="${path }/member/moveMyPage.do" class="mb-0 <%=mpNav.equals("profile") ? "text-dark" : "text-muted" %> lh-100 px-3">프로필</a>
      <a href="${path }/member/myPageShop.do" class="mb-0 <%=mpNav.equals("shop") ? "text-dark" : "text-muted" %> lh-100 px-3">쇼핑</a>
      <a href="${path }/member/myPageModify.do" class="mb-0 <%=mpNav.equals("modify") ? "text-dark" : "text-muted" %> lh-100 px-3">개인정보수정</a>
      <a href="${path }/member/myPageFav.do?memberNo=${loginMember.memberNo}" class="mb-0 <%=mpNav.equals("fav") ? "text-dark" : "text-muted" %> lh-100 px-3">관심상품</a>
    </div>
  </div>