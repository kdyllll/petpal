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
				<jsp:param name="nav" value="adminCommunity" />
			</jsp:include>
			<section role="main"
				class="col-md-9 ml-sm-auto col-lg-10 px-md-4 mb-5 "
				style="height: 100vh; overflow-y: auto;">
				<h2 class="my-3">게시글관리</h2>
				<form class="row d-flex align-items-center communityFrm" method="post" >				
					<div class="mb-3  col-lg-2">
						<label class="mr-sm-2 sr-only" for="inlineFormCustomSelect">Preference</label>
						<select class="custom-select mr-sm-2" name="searchType" id="searchType">
							<option selected value="EMAIL">작성자이메일</option>
							<option value="PLACENO">게시글번호</option>
						</select>
					</div>	
					<div class="input-group mb-3  col-lg-5 ">
						<input type="text" class="form-control input-group-sm"
							name="keyword" placeholder="검색어를 입력해주세요">
						<div class="input-group-append">
							<button class="btn btn-outline-secondary communityBtn" type="submit"
								>Button</button>
						</div>
					</div>
					<div class="input-group mb-3  col-lg-5 ">
						<div class="form-check form-check-inline ">
							<input class="form-check-input" name="status" type="radio"
								 value="Y" id="yes" ${status != null && status.equals("Y") ? "checked":""}> <label
								class="form-check-label" for="yes">승인완료</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" name="status" type="radio"
								id="ing" value="N" ${status != null && status.equals("N") ? "checked":""}> <label
								class="form-check-label" for="ing">승인대기</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" name="status" type="radio"
								value="M" id="deny" ${status != null && status.equals("M") ? "checked":""}> <label
								class="form-check-label" for="deny">승인거절</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" name="status" type="radio"
								 value="A" id="com" ${status == null ? "checked":""}> <label
								class="form-check-label" for="com">전체</label>
						</div>
					</div>
				</form>
				<div class="table-responsive" style="min-height: 80vh;">
					<table class="table mb-5">
						<thead>
							<tr>
								<th scope="col" class="text-center align-middle">글번호</th>
								<th scope="col" class="text-center align-middle">글제목</th>
								<th scope="col" class="text-center align-middle">작성자</th>
								<th scope="col" class="text-center align-middle">상세보기</th>
								<th scope="col" class="text-center align-middle">요청일</th>
								<th scope="col" class="text-center align-middle"></th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${not empty pList }">
								<c:forEach var="c" items="${pList }">
									<tr>
										<th scope="row" class=" align-middle text-center"><c:out value="${c.PLACENO }"/></th>
										<td class="text-center align-middle"><c:out value="${c.TITLE }"/></td>
										<td class="align-middle text-center"><c:out value="${c.EMAIL }"/></td>
										<td class="align-middle text-center">
											<input type="hidden"  name="placeNo" value="${c.PLACENO }">
											<a style="cursor:pointer; color:red;" class="placeDetail" >상세보기</a>
										</td>
										<td class="align-middle text-center"><fmt:formatDate value="${c.PLACEDATE }" pattern="yyyy년MM월dd일" /></td>
										<td class="align-middle text-center"><form class="d-inline placeFrm"  method="post">
											<c:choose>
											<c:when test="${c.STATUS eq 'N' }">
											<button type="button"
												class="btn btn-outline-secondary btn-sm  placeAcceptBtn">수락</button>
												<input type="hidden" name="placeNo" value="${c.PLACENO }">
											<button type="button" class="btn  btn-outline-danger btn-sm  placeDenyBtn">거절</button>
											</form>
											</c:when >
											<c:when test="${c.STATUS eq 'Y' }">
												승인완료
											</c:when>
											<c:otherwise>
												승인거절
											</c:otherwise>
											</c:choose>
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
		</div>
	</div>
	<div class="placeModal"></div>
	<script>
    $(function(){
        
        $(".placeDetail").on("click", e => {
        	let placeNo = $(e.target).prev().val();
        	$.ajax({
        		url : "${path}/admin/adminPlaceDetail.do",
        		data : {placeNo : placeNo},
        		dataType: "html",
        		success : (data) => {
        			console.log(data);
        			$(".placeModal").html(data);
        			$("div.modal").modal();
        		}
        	})
        })
        
        $(".placeDenyBtn").on("click", e => {
        	let placeNo = $(e.target).prev().val();
        	$(".placeFrm").attr("action", "${path}/admin/placeDeny.do?placeNum="+placeNo).submit();
        })
        $(".placeAcceptBtn").on("click", e => {
        	let placeNo = $(e.target).next().val();
        	$(".placeFrm").attr("action", "${path}/admin/placeAccept.do?placeNum="+placeNo).submit();
        })
        
   
		$(".communityBtn").on("click", function() {
			$(".communityFrm").attr("action", "${path }/admin/searchCommunity.do").submit();
		})
		
		$("input[type=radio]").on("change", e => {
			if($(e.target).val()=="Y" || $(e.target).val( )== "N" || $(e.target).val()=="M") {
				$(".communityFrm").attr("action", "${path }/admin/searchCommunity.do").submit();		
			} else {
				$(".communityFrm").attr("action", "${path}/admin/adminCommunity.do").submit();	
			}
		})
    
    })

</script>

</body>
</html>