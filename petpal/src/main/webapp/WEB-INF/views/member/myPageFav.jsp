<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />


<jsp:include page="/WEB-INF/views/common/commonLink.jsp" />


<jsp:include page="/WEB-INF/views/common/myPageNav.jsp" >
	<jsp:param name="mpNav" value="fav"/>
</jsp:include>
<input type="hidden" id="memberNo" value="${loginMember.memberNo }"/>
<div class="row py-3" id="container">
<c:if test="${empty list }">
	<div class="col-12 text-center">
		<p>관심상품이 없습니다.</p>
	</div>
</c:if>
<c:if test="${not empty list }">
	<c:forEach items="${list }" var="p">
	<div class="col-xl-3 col-md-4 col-sm-6">
		
		<a href="${path }/store/moveDetail.do?productNo=${p.productNo}" class="product-all">
			<div class="card shadow-sm">
				<img src="${path }/resources/upload/product/detail/${p.imgName}" class="product">
			</div>
		</a>
		<p class=" text-center name"><c:out value="${p.productName }"/><input type="hidden" id="productNo" value="${p.productNo }"/><svg xmlns="http://www.w3.org/2000/svg" width="1.5em" height="1.5em" fill="currentColor" class="bi bi-x-circle x-box ml-1" viewBox="0 0 16 16" >
  <path  d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
  <path  d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
</svg></p>
		
	</div>
	</c:forEach>
</c:if>	
</div>


<style>
.name {
	font-weight: bold;
}

.product-all {
	color: black;
}

.product-all:hover {
	text-decoration: none;
	color:black;
}

.product {
	width: 100%;
	height: 225px;
}
.x-box{
       z-index:10;
       color:gray;
       vertical-align:bottom;
       
}
.x-box:hover{
	cursor:pointer;
}

</style>

</main>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>
<script>
	$(document).on("click",".x-box",e=>{ //x버튼 눌렀을때
		var memberNo=$("#memberNo").val();
		var productNo=$(e.target).prev("#productNo").val();
		 $.ajax({
			url:"${path}/store/deleteFav.do",
			data:{productNo:productNo,memberNo:memberNo},
			success:(data) => {
				$("#container").children().remove();
				$("#container").append(data);
			}
		}); 
	});
</script>

</html>