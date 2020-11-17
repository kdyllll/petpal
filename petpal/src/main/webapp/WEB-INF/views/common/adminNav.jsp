<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />


<nav id="sidebarMenu"
	class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse ">
	<div class="sidebar-sticky pt-0 pt-md-4">
		<ul class="nav flex-column pt-md-3">
			<li class="nav-item"><a class="nav-link navName1"
				href="${path }/admin/moveAdminPage.do"> 상품관리
			</a></li>
			<li class="nav-item"><a class="nav-link navName2 "
				href="${path}/admin/adminStock.do">
					재고관리
			</a></li>
			<li class="nav-item"><a class="nav-link navName3"  href="#"> 주문내역
			</a></li>
			<li class="nav-item"><a class="nav-link navName4" href="#"> 회원관리
			</a></li> 
			<li class="nav-item"><a class="nav-link navName5" href="#">게시글관리
			</a></li>
			<li class="nav-item"><a class="nav-link navName6" href="#"> 신고관리
			</a></li>
		</ul>
	</div>
</nav>
