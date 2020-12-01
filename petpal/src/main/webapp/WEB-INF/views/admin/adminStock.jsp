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

			<jsp:include page="/WEB-INF/views/common/adminNav.jsp">
				<jsp:param name="nav" value="adminStock" />
			</jsp:include>
			<section role="main"
				class="col-md-9 ml-sm-auto col-lg-10 px-md-4 mb-5 "
				style="height: 100vh; overflow-y: auto;">
				<h2 class="my-3">재고관리</h2>
				<div class="row align-items-center mb-3">
					<div class="input-group   col-lg-5">
						<input type="text" class="form-control input-group-sm"
							placeholder="상품번호를 입력해주세요." aria-label="Recipient's username"
							aria-describedby="button-addon2">
						<div class="input-group-append">
							<button class="btn btn-outline-secondary" type="button"
								id="button-addon2">Button</button>
						</div>
					</div>
				</div>
				<div class="table-responsive" style="min-height: 80vh;">
					<table class="table mb-5">
						<thead>
							<tr>
								<th scope="col" class="text-center align-middle">상품번호</th>
								<th scope="col" class="text-center align-middle">상품사진</th>
								<th scope="col" class="text-center align-middle">상품이름</th>
								<th scope="col" class="text-center align-middle">카테고리</th>
								<th scope="col" class="text-center align-middle">등록일</th>
								<th scope="col" class="text-center align-middle"></th>
							</tr>
						</thead>
						<tbody>
						
							<c:if test="${not empty pList }">
							<c:forEach var="pdt" items="${pList }" varStatus="s">
							
							<tr class="productList">
								<th scope="row" class="align-middle text-center pdtNo"><c:out value="${pdt.PRODUCTNO }" /></th>
								<td class="text-center"><img
									style="width: 100px; height: 100px;" src="${path }/resources/upload/product/detail/${pdt.IMGNAME}"></td>
								<td class="align-middle text-center"><c:out value="${pdt.PRODUCTNAME }" /></td>
								<td class="align-middle text-center"><c:out value="${pdt.CATEGORYNAME }" /></td>
								<td class="align-middle text-center"><c:out value="${pdt.ENROLLDATE }" /></td>
								<td class="align-middle text-center">
									<button type="button" class="btn btn-outline-secondary btn-sm updatePrice"
										data-toggle="modal">가격수정</button>
									<button type="button" class="btn btn-outline-secondary btn-sm updateStock"
										data-toggle="modal">재고수정</button>	

										<button type="button" class="btn btn-outline-danger btn-sm deleteStock"
										data-toggle="modal">재고삭제</button>
										
								</td>
							</tr>
							</c:forEach>
							</c:if>
						</tbody>
					</table>
				</div>
				<nav aria-label="Page navigation example"
					style="margin-bottom: 120px;"
					class=" d-flex justify-content-center">
					<ul class="pagination">
						<li class="page-item"><a class="page-link text-dark" href="#"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a></li>
						<li class="page-item"><a class="page-link text-dark" href="#">1</a></li>
						<li class="page-item"><a class="page-link text-dark" href="#">2</a></li>
						<li class="page-item"><a class="page-link text-dark" href="#">3</a></li>
						<li class="page-item"><a class="page-link text-dark" href="#"
							aria-label="Next"> <span aria-hidden="true">&raquo;</span>
						</a></li>
					</ul>
				</nav>
			</section>
			<div class="pdtModal"></div>
		</div>
	</div>
	<script>
		$(function(){	
			$(".updatePrice").on("click", e => {
				let productNo = $(e.target).parents(".productList").children("th").html();
				 ajaxModal("${path}/admin/updatePrice.do", productNo);
		      });
			
			$(".updateStock").on("click", e=>{
				let productNo = $(e.target).parents(".productList").children("th").html();
				 ajaxModal("${path}/admin/updateStock.do", productNo);
			})
			$(".deleteStock").on("click", e=>{
				let productNo = $(e.target).parents(".productList").children("th").html();
				 ajaxModal("${path}/admin/deleteStock.do", productNo);
			})
		})
		
		function ajaxModal(path, productNo){
			$.ajax({
				url: path,
				data:{productNo : productNo },
				dataType:"html",
				success:(data) => {
					console.log(data);
					$(".pdtModal").html(data);
	         		$('div.modal').modal(); 
				}
			});
		}
	</script>
</body>

</html>