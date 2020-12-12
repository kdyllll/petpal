<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/> 
 <jsp:include page="/WEB-INF/views/common/commonLink.jsp" />

<div class="pdtModal"></div>

<!-- include에서 글번호 받아서 인풋 히든 태그로 해서 밸류 받아서 데이터에 넣을지
     버튼에서 함수호출할때 글번호 보내게 할지 두번째로 하자-->
<script>
	//스크립트 문은 메인화면에서 불러서 실행됨
	function fn_claimModal(no) {
		console.log("글번호 스크립트로 보냄"+no);
		$.ajax({
			url: "${path}/claim/moveClaimModal.do",
			data:{no:no},
			dataType:"html",
			success:(data) => {
				$(".pdtModal").html(data);
         		$('div.modal').modal(); 
			}
		});
	 };
</script>