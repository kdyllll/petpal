<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />


<jsp:include page="/WEB-INF/views/common/commonLink.jsp" />


<!-- Custom styles for this template -->
<link href="${path }/resources/css/admin/adminPage.css" rel="stylesheet">

</head>

<body style="overflow: hidden;">
	<jsp:include page="/WEB-INF/views/common/adminHeader.jsp" />

	<div class="container-fluid">
		<div class="row">
			<jsp:include page="/WEB-INF/views/common/adminNav.jsp" >
			<jsp:param name="nav" value="memberList" />
			</jsp:include>
			<section role="main"
				class="col-md-9 ml-sm-auto col-lg-10 px-md-4 mb-5 "
				style="height: 100vh; overflow-y: auto;">
				<h2 class="my-3">회원정보</h2>
				<form  method="post" action="${path }/admin/searchMember.do" class="row align-items-center">
					<div class="mb-3  col-lg-2">
						<label class="mr-sm-2 sr-only" for="inlineFormCustomSelect">Preference</label>
						<select class="custom-select mr-sm-2" name="searchType">
							<option selected value="EMAIL">이메일</option>
							<option value="MEMBERNAME">이름</option>
							<option value="PHONE">전화번호</option>
							<option value="ADDRESS">주소</option>
						</select>
					</div>
					<div class="input-group mb-3  col-lg-5">
						<input type="text" class="form-control input-group-sm"
							name="keyword" placeholder="검색어를 입력해주세요">
						<div class="input-group-append">
							<button class="btn btn-outline-secondary" type="submit"
								id="button-addon2">Button</button>
						</div>
					</div>
					
				</form>

				<div class="table-responsive" style="min-height: 80vh;">
					<table class="table mb-5">
						<thead>
							<tr>
								<th scope="col" class="text-center align-middle">회원이름</th>
								<th scope="col" class="text-center align-middle">이메일</th>
								<th scope="col" class="text-center align-middle">전화번호</th>
								<th scope="col" class="text-center align-middle">주소</th>
								<th scope="col" class="text-center align-middle">닉네임</th>
								<th scope="col" class="text-center align-middle">가입일</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${not empty mList }">	
							<c:forEach var="c" items="${mList }">	
							<tr>
								<th scope="row" class="align-middle text-center"><c:out value="${c.MEMBERNAME }" /></th>
								<th scope="row" class="align-middle text-center"><a href="${path }/user/moveUserInfo.do?memberNo=${c.MEMBERNO}"><c:out value="${c.EMAIL }"/></a></th>
								<td class="align-middle text-center"><c:out value="${c.PHONE }"/></td>
								<td class="align-middle text-center"><c:out value="${c.ADDRESS }" /></td>
								<td class="align-middle text-center"><c:out value="${c.NICKNAME }"/></td>
								<td class="align-middle text-center"><fmt:formatDate value="${c.ENROLLDATE }" pattern="yyyy년MM월dd일"/></td>
							</tr>
							</c:forEach>
							</c:if>
						</tbody>
					</table>
				</div>
				<nav aria-label="Page navigation example"
					style="margin-bottom: 150px;"
					class=" d-flex justify-content-center">
					<p class="text-center">${pageBar }</p> 
				</nav>
			</section>
			<div class="orderModal"></div>
		</div>
	</div>

</body>
</html>
