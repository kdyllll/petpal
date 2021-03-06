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
				<jsp:param name="nav" value="adminPage" />
			</jsp:include>
			<section role="main"
				class="col-md-9 ml-sm-auto col-lg-10 px-md-4 mb-5 "
				style="height: 100vh; overflow-y: auto;">
				<h2 class="my-3">상품관리</h2>
				<form method="post" id="productSearchFrm" class="row align-items-center mb-3">
					<button type="button" class="btn btn-outline-secondary col-lg-1 ml-3" id="searchAll">전체검색</button>
					<div class="input-group   col-lg-5">
						<input type="text" class="form-control input-group-sm"
							placeholder="상품이름을 입력해주세요." aria-label="Recipient's username"
							aria-describedby="button-addon2" name="productName">
						<div class="input-group-append">
							<button class="btn btn-outline-secondary" type="button"
								id="productSearchBtn">검색</button>
						</div>
					</div>
					<button type="button"
						class="btn btn-outline-secondary col-lg-1 mx-3"
						data-toggle="modal" data-target="#staticBackdrop">상품등록</button>

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
								<c:forEach var="pdt" items="${pList }">
									<tr>
										<th scope="row" class="align-middle text-center"><c:out value="${pdt.PRODUCTNO }"/></th>
										<td class="text-center"><img
											style="width: 100px; height: 100px;"
											src="${path }/resources/upload/product/detail/${pdt.IMGNAME}"></td>
										<td class="align-middle text-center"><c:out value="${pdt.PRODUCTNAME }"/></td>
										<td class="align-middle text-center"><c:out value="${pdt.CATEGORYNAME }"/></td>
										<td class="align-middle text-center"><fmt:formatDate value="${pdt.ENROLLDATE }" pattern="yyyy년MM월dd일" /></td>
										<td class="align-middle text-center"><form method="post"
												class="pdtFrm mb-0">
												<input type="submit"
													value="삭제"
													class="btn btn-outline-danger align-middle btn-sm deleteProductBtn" />
												<button type="button"
													class="btn btn-outline-secondary btn-sm updateProductBtn" >수정</button>
													<input type="hidden" class="productNo" name="productNo"
													value="${pdt.PRODUCTNO }" /> 
											</form></td>

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
			<form class="modal fade pdtModal1" id="staticBackdrop" tabindex="-1"
				method="post" enctype="multipart/form-data"
				aria-labelledby="exampleModalLabel" data-backdrop="static"
				aria-hidden="true" action="${path }/admin/productInsertEnd.do">
				<div
					class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">상품등록</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<div class="row mb-2 mx-3">
								<div class="custom-control custom-radio custom-control-inline">
									<input type="radio" id="dog" value="dog" name="firstCate"
										class="custom-control-input" required> <label
										class="custom-control-label" for="dog">강아지</label>
								</div>
								<div class="custom-control custom-radio custom-control-inline">
									<input type="radio" id="cat" value="cat" name="firstCate"
										class="custom-control-input" required> <label
										class="custom-control-label" for="cat">고양이</label>
								</div>
								<div class="custom-control custom-radio custom-control-inline">
									<input type="radio" value="smallAni" id="smallAni"
										name="firstCate" class="custom-control-input" required>
									<label class="custom-control-label" for="smallAni">소동물</label>
								</div>
							</div>
							<div id="dogCate" class="row d-none secondCateCon mx-3">
								<select name="categoryNo" class="custom-select mr-sm-2 col-4 ">
									<option selected disabled>강아지Category</option>
									<option value="D1">홈/리빙</option>
									<option value="D2">식품</option>
									<option value="D3">옷</option>
									<option value="D4">용품</option>
									<option value="D5">목욕/미용</option>
								</select>
							</div>
							<div id="catCate" class="row d-none secondCateCon mx-3">
								<select name="categoryNo" class="custom-select mr-sm-2 col-4 ">
									<option selected disabled>고양이Category</option>
									<option value="C1">홈/리빙</option>
									<option value="C2">식품</option>
									<option value="C3">옷</option>
									<option value="C4">용품</option>
									<option value="C5">목욕/미용</option>
								</select>
							</div>
							<div id="smallCate" class="row d-none secondCateCon mx-3">
								<select name="categoryNo" class="custom-select mr-sm-2 col-4">
									<option selected disabled>소동물Category</option>
									<option value="S1">햄스터</option>
									<option value="S2">토끼</option>
									<option value="S3">물고기</option>
									<option value="S4">새</option>
								</select>
							</div>
							<div class="row m-3 d-none" id="thirdCateCon">
								<span>상품 <strong>소분류</strong>를 입력해주세요.
								</span> <input type="text" class="form-control input-group-sm"
									name="subCate" id="thirdCate" style="font-size: 13px;" required>
							</div>
							<div class="row m-3 d-none" id="pdtNameCon">
								<span>상품 <strong>이름</strong>을 입력해주세요.
								</span> <input type="text" class="form-control input-group-sm"
									name="productName" id="pdtName" style="font-size: 13px;"
									required>
							</div>
							<div class="row m-3 d-none" id="pdtPicturesCon">
								<span>상품 <strong>사진</strong>을 추가해주세요(다중선택가능/최대5장).
								</span> <input multiple="multiple" type="file" maxlength="5"
									name="pdtPictures" class="form-control input-group-sm"
									id="pdtPictures" style="font-size: 13px;" accept="image/*"
									required>
							</div>
							<div class="row m-3 d-none" id="imgsContainer"></div>
							<div class="row m-3 d-none" id="pdtContentCon">
								<span>상품 <strong>설명사진</strong>을 추가해주세요.
								</span> <input type="file" class="form-control input-group-sm"
									name="fName" id="pdtContent" style="font-size: 13px;"
									accept="image/*" required />
							</div>
							<p class="row mx-3 d-none" id="optionTitle">
								상품<strong> 옵션 </strong> 선택
							</p>
							<div class="row mb-2 mx-3 d-none" id="pdtOptionChoiceOne">
								<div class="custom-control custom-radio custom-control-inline">
									<input type="radio" value="size" id="size" name="pdtSizeOption"
										class="custom-control-input" required> <label
										class="custom-control-label" for="size">사이즈</label>
								</div>
								<div class="custom-control custom-radio custom-control-inline">
									<input type="radio" value="sizeNo" id="sizeNo"
										name="pdtSizeOption" class="custom-control-input" required>
									<label class="custom-control-label" for="sizeNo">선택안함</label>
								</div>
							</div>
							<div class="row mx-3 d-none mb-2" id="sizeInputCon">
								<input type="text" class="form-control input-group-sm"
									placeholder="ex) S,M,L " id="sizeInput" name="productSize">
							</div>
							<div class="row mb-2 mx-3 d-none" id="pdtOptionChoiceTwo">
								<div class="custom-control custom-radio custom-control-inline">
									<input type="radio" value="color" id="color"
										name="pdtColorOption" class="custom-control-input" required>
									<label class="custom-control-label" for="color">색상선택</label>
								</div>
								<div class="custom-control custom-radio custom-control-inline">
									<input type="radio" value="colorNo" id="colorNo"
										name="pdtColorOption" class="custom-control-input" required>
									<label class="custom-control-label" for="colorNo">선택안함</label>
								</div>
							</div>
							<div class="row mx-3 d-none mb-2" id="colorInputCon">
								<input type="text" class="form-control input-group-sm"
									placeholder="ex) 빨강,노랑,... " id="colorInput" name="color">
							</div>
						</div>
						<div class="modal-footer ">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Close</button>
							<input type="submit" value="상품등록" class="btn btn-primary">
						</div>
					</div>
				</div>
			</form>
			<div class="pdtModal"></div>
		</div>
	</div>
	<script>
  $(function() {
      $("input[name='firstCate']").on("change", e =>{
        const value = $(e.target).val();
        $(".secondCateCon").addClass("d-none");
        if(value=="dog") {
          $("#dogCate").removeClass("d-none");
          $("#thirdCate").val("");
          $("#thirdCate").attr("readonly", false);
        } else if(value=="cat") {
          $("#catCate").removeClass("d-none");
          $("#thirdCate").val("");
          $("#thirdCate").attr("readonly", false);
        } else if(value=="smallAni") {
          $("#smallCate").removeClass("d-none");
          $("#thirdCate").val("no");
          $("#thirdCate").attr("readonly", true);
        }
      });

      $("select[name='categoryNo']").on("change", e => {
        $("#thirdCateCon").removeClass("d-none");
        $("#pdtNameCon").removeClass("d-none");
        $("#pdtContentCon").removeClass("d-none");
        $("#pdtContentCon").removeClass("d-none");
        $("#optionTitle").removeClass("d-none");
        $("#pdtOptionChoice").removeClass("d-none");
        $("#pdtOptionChoiceTwo").removeClass("d-none");
        $("#pdtOptionChoiceOne").removeClass("d-none");
        $("#pdtPicturesCon").removeClass("d-none");
        $("#imgsContainer").removeClass("d-none");
      });
      $("input[name='pdtColorOption']").on("change", e => {
        let colorTarget = $(e.target).val();
        if(colorTarget == "color") {
          $("#colorInputCon").removeClass("d-none");
        } else {
          $("#colorInput").attr("value", "");
          $("#colorInputCon").addClass("d-none");
        }
      });
      $("input[name='pdtSizeOption']").on("change", e => {
        let sizeTarget = $(e.target).val();
        if(sizeTarget == "size") {
          $("#sizeInputCon").removeClass("d-none");
        } else {
        	$("#sizeInput").attr("value", "");	
          $("#sizeInputCon").addClass("d-none");
        }
      });
      
      $("#pdtPictures").on("change", (e) => {
          $("#imgsContainer").html("");
          $.each(e.target.files, (i, v) => {
            let reader = new FileReader();
            reader.onload = (e) => {
               let img=$("<img>",{src:e.target.result,width:100,height:100});
               $("#imgsContainer").append(img);
            };
            reader.readAsDataURL(v);
          });
        });
      $(".deleteProductBtn").on("click", function() {
			$(".pdtFrm").attr("action","${path}/admin/deleteProductEnd.do").submit();
		})
		
		$(".updateProductBtn").on("click", e => {
			let productNo = $(e.target).next().val();
			$.ajax({
				url: "${path}/admin/updateProduct.do",
				data:{productNo : productNo },
				dataType:"html",
				success:(data) => {
					console.log(data);
					$(".pdtModal").html(data);
	         		$('div.modalP').modal(); 
				}
			}) ;
		})
		
		$("#productSearchBtn").on("click", function() {
			$("#productSearchFrm").attr("action", "${path}/admin/productSearch.do").submit();
		})
		
		$("#searchAll").on("click", function() {
			$("#productSearchFrm").attr("action", "${path}/admin/moveAdminPage.do").submit();
		})
  })
</script>
</body>

</html>