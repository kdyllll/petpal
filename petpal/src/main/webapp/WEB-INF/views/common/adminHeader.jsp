<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>


      <header>
        <nav class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0 shadow py-lg-2 py-md-2 d-flex align-items-center">
          <a class="navbar-brand col-md-3 col-lg-2 mr-0 px-3" href="${path }">
         	<img src="${path }/resources/images/logoWhite.png" style="height:40px;">
        	</a>
          <button class="navbar-toggler position-absolute d-md-none collapsed" type="button" data-toggle="collapse" data-target="#sidebarMenu" aria-controls="sidebarMenu" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          
        </nav>
    </header>