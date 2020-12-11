<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<jsp:include page="/WEB-INF/views/common/commonLink.jsp" />

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.js"></script>
<script>
	$(document).ready(
		function() {
			var top = $('#adside').offset().top - parseFloat($('#adside').css('marginTop').replace(/auto/, 0));
			$(window).scroll(function(event) {
				var y = $(this).scrollTop();
				if (y > top) {
					$('#adside').addClass('fixed');
				} else {
					$('#adside').removeClass('fixed');
				}
			});
		});
	$( document ).ready( function() {
        $( '#all_select' ).click( function() {
          $( '#ch' ).prop( 'checked', this.checked );
        } );
      } );
</script>

<style>
#adsideWrapper {
	position: absolute;
}

#adside.fixed {
	position: fixed;
}
</style>

</head>
<body class="bg-white">
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<main role="main" style="min-height: 100vh;">
		<div class="container">
			<div class="row" style="padding-top: 5em;">

				<div class="order-md-2 ml-3 mt-5 d-none d-md-block">
					<div id="adsideWrapper">
						<div id="adside">
							<ul class="list-group mb-3" style="width:350px;">
								<li class="pt-4 list-group-item d-flex justify-content-between border-bottom-0">
									<h6 class="my-0">총 상품 금액</h6>
									<span><b>$12</b></span>
								</li>
								<li class="list-group-item d-flex justify-content-between border-bottom-0">
									<h6 class="my-0">총 배송비</h6>
									<span><b>$5</b></span>
								</li>
								<li class="list-group-item d-flex justify-content-between border-bottom-0">
									<span>총 할인금액</span>
								</li>
								<li class="mt-2 list-group-item d-flex justify-content-between">
									<h4>결제금액</h4>
									<h4>11111</h4>
								</li>
							</ul>
								<button type="submit" class="mt-1 p-3 btn btn-secondary" style="width:350px;"><b>n개 상품 구매하기</b></button>
						</div>
					</div>
				</div>

				<div class="col-md-8 order-md-1">
					<div class="d-flex align-items-center ml-3 mb-3" style="width:96%;">
						<input type="checkbox" style="width: 20px; height: 20px;" id="all_select">&nbsp;&nbsp;모두선택
						<button type="button" class="ml-auto btn btn-light">선택삭제</button>					
					</div>
					<div class="p-3 border border-dark rounded">
						<div class="mt-2 d-flex align-items-start float-left" >
							<input type="checkbox" class="mr-2" style="width:20px; height: 20px;" id="ch">
						</div>
						<div class="d-flex mt-2">
							<div style="width:94%">
								<a href="" class="d-flex">
									<div>
										<img src="${path }/resources/images/test.jpg" class="rounded" style="width:100px;height:100px">
									</div>
									<div class="ml-3">
										<h5>상품명</h5>
										<div class="d-flex">
											<h6>배송 </h6>
											<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-slash" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
											  <path fill-rule="evenodd" d="M11.354 4.646a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708l6-6a.5.5 0 0 1 .708 0z"/>
											</svg>
											<h6>택배</h6>
										</div>
									</div>
								</a>
							</div>
							<div class="d-flex align-items-start">
								<button type="button" class="btn btn-light">x</button>
							</div>
						</div>
						<div class="ml-4 mt-3 rounded" style="background-color:rgb(245 245 245);">
							<div class="d-flex">
								<div class="mt-3 ml-3" style="width:92%">
									<span>옵션</span>
	                             </div>
								<div class="d-flex align-items-start">
									<button type="button" class="btn btn-light"><span>x</span></button>
								</div>
							</div>
							<div class="d-flex p-3">
									<div>
		                                <select class="form-control" name="amount" style="width:100px;">
		                                        <option>1</option>
		                                        <option>2</option>
		                                        <option>3</option>
		                                        <option>4</option>
		                                        <option>5</option>
		                                        <option>6</option>
		                                        <option>7</option>
		                                        <option>8</option>
		                                </select>
		                             </div>
		                             <span class="ml-auto"><b>가격</b></span>
		                    </div>
	                    </div>
	                    <div class="ml-4 mt-3">
	                    	<span>옵션 변경 / </span> <!-- 모달 -->
	                    	<span>바로 구매</span>
	                    </div>
					</div>
					<div class="d-block d-md-none mt-5">
						<ul class="list-group mb-3" style="width:100%;">
							<li class="pt-4 list-group-item d-flex justify-content-between border-bottom-0">
								<h6 class="my-0">총 상품 금액</h6>
								<span><b>$12</b></span>
							</li>
							<li class="list-group-item d-flex justify-content-between border-bottom-0">
								<h6 class="my-0">총 배송비</h6>
								<span><b>$5</b></span>
							</li>
							<li class="list-group-item d-flex justify-content-between border-bottom-0">
								<span>총 할인금액</span>
							</li>
							<li class="mt-2 list-group-item d-flex justify-content-between">
								<h4>결제금액</h4>
								<h4>11111</h4>
							</li>
						</ul>
						<button type="submit" class="mt-1 p-3 btn btn-secondary" style="width:100%;"><b>n개 상품 구매하기</b></button>
					</div>
				</div>
				
					<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

					<div class="mt-5">
					</div>
				</div>
			</div>

			<div class="my-5 pt-5 text-muted text-center text-small"></div>
	</main>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>

</html>