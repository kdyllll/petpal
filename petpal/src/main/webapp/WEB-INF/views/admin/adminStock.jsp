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
				<form id="stockSearchFrm">
				<div class="row align-items-center mb-3">
					<div class="input-group   col-lg-5">						
						<input type="text" class="form-control input-group-sm"
							placeholder="상품이름을 입력해주세요." aria-label="Recipient's username"
							aria-describedby="button-addon2" name="productName">
						<div class="input-group-append">
							<button class="btn btn-outline-secondary" type="button"
								id="stockSearchBtn">검색</button>
						</div>
						
					</div>
					<div class="form-check form-check-inline align-middle">
							<input class="form-check-input" name="cate" type="radio"
								id="dog" value="D" ${cate != null && cate.equals("D") ? "checked":""}> <label
								class="form-check-label" for="dog">강아지</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" name="cate" type="radio"
								id="cat" value="C" ${cate != null && cate.equals("C") ? "checked":""}> <label
								class="form-check-label" for="cat">고양이</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" name="cate" type="radio"
								id="small" value="S" ${cate != null && cate.equals("S") ? "checked":""}> <label
								class="form-check-label" for="small">소동물</label>
						</div>
						<select name="categoryname" class="catename form-check form-check-inline" >
						  <option selected disabled>분류</option>
						  <option value="홈/리빙" ${categoryname != null && categoryname.equals("홈/리빙") ? "selected":""}>홈/리빙</option>
						  <option value="식품" ${categoryname != null && categoryname.equals("식품") ? "selected":""}> 식품</option>
						  <option value="옷" ${categoryname != null && categoryname.equals("옷") ? "selected":""}>옷</option>
						  <option value="용품" ${categoryname != null && categoryname.equals("용품") ? "selected":""}>용품</option>
						  <option value="목욕/미용" ${categoryname != null && categoryname.equals("목욕/미용") ? "selected":""}>목욕/미용</option>
						</select>
					</div>
				</form>
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
							<c:if test="${empty pList }">검색된 조건 [<c:out value="${pdtName }" />]이 없습니다.</c:if>
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
					style="margin-bottom: 150px;"
					class=" d-flex justify-content-center">
					<p class="text-center">${pageBar }</p> 
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
		
		$("#stockSearchBtn").on("click", function() {
			$("#stockSearchFrm").attr("action","${path }/admin/stockSearch.do").submit();
		})
		$("input[name='cate']").on("change", e => {

				$("#stockSearchFrm").attr("action", "${path }/admin/stockSearch.do").submit();			

		})
		$(".catename").on("change", e => {
			$("#stockSearchFrm").attr("action", "${path }/admin/stockSearch.do").submit();			
		})
		
		</script>
</body>

</html>