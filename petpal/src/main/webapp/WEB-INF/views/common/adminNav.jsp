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
			<li class="nav-item"><a class="nav-link" href="#"> <span
					data-feather="home"></span> 상품관리
			</a></li>
			<li class="nav-item"><a class="nav-link active"
				href="${path}/admin/adminStock.do"> <span data-feather="home"></span>
					재고관리
			</a></li>
			<li class="nav-item"><a class="nav-link" href="#"> <span
					data-feather="users"></span> 주문내역
			</a></li>
			<li class="nav-item"><a class="nav-link" href="#"> <span
					data-feather="file"></span> 회원관리
			</a></li>
			<li class="nav-item"><a class="nav-link" href="#"> <span
					data-feather="shopping-cart"></span> 게시글관리
			</a></li>
			<li class="nav-item"><a class="nav-link" href="#"> <span
					data-feather="bar-chart-2"></span> 신고관리
			</a></li>
		</ul>
	</div>
</nav>