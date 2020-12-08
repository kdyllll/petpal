<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/> 

	<div class="modal fade" id="cartModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered">
	    <div class="modal-content">
	     
	      <div class="modal-body offset-1 col-10">
	        <div class="">
	          <p class="offset-2 col-8">장바구니에 상품이 담겼습니다.</p>
	          <button type="button" id="goCart" class="btn btn-block btn-lg bg-light">장바구니로 이동</button>
	          <button type="button" id="noCart" class="btn btn-block btn-lg bg-light">계속 쇼핑</button>
	        </div> 
	      </div>                 
	    </div>
	  </div>
	</div>  
	
	<script>
		$("#goCart").on("click",e=>{
			location.replace("${path}/cart/cart.do");
		});
		$("#noCart").on("click",e=>{
			location.reload();
		});
	</script>