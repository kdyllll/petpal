<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<jsp:include page="/WEB-INF/views/common/commonLink.jsp" />

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.js"></script>
<script>
	$( document ).ready( function() {
		var objs = document.querySelectorAll(".ch");
		var c = 0;
		
		for (var j = 0; j < objs.length; j++) {
            if (objs[j].checked === true) {
              c+=1;
            };
         };
		
         $(".pay").text(c + "개 상품 구매하기").css({"font-weight":"bold"});
	});
	
	$(document).ready(function() {
		var top = $('#adside').offset().top - parseFloat($('#adside').css('marginTop').replace(/auto/, 0));
		$(window).scroll(function(event) {
			var y = $(this).scrollTop() + 400;
			if (y >= top) {
				$('#adside').addClass('fixed');
			} else {
				$('#adside').removeClass('fixed');
			}
		});
	});
	
	$( document ).ready( function() {
        $('#all_select').click( function() {
        	
          $('.ch').prop('checked', this.checked );
          
          totalProduct = 0;
          
          $(".totalProduct").text(totalProduct);
          $(".totalPrice").text(totalProduct+3000);
          
          
          var objs = document.querySelectorAll(".ch");
			var c = 0;
			
			for (var j = 0; j < objs.length; j++) {
	            if (objs[j].checked === true) {
	              c+=1;
	            };
	         };
			
	         $(".pay").text(c + "개 상품 구매하기").css({"font-weight":"bold"});
	         
	       //여기에서 실행-------------------------------------------------------------------------------
	         fn_checkPrice();
        } );
        
        var objs = document.querySelectorAll(".ch");
        
        for(var i=0; i<objs.length ; i++){
          objs[i].addEventListener('click', function(){
            var selectAll = document.querySelector("#all_select");
            for (var j = 0; j < objs.length; j++) {
              if (objs[j].checked === false) {
                selectAll.checked = false;
                return;
              };
            };
            selectAll.checked = true;                                   
        }, false);
        }
      } );
	
	$( document ).ready( function() {
     	var count = 0;
     	var price = 0;
     	var totalProduct = 0;
     	
     	var objs = document.querySelectorAll(".ch");
     	
		<c:forEach items="${list}" var="c">
	     	count = ${c.COUNT};
     		price = ${c.PRICE};
     		totalProduct += count * price;
     		$('.totalProduct').text(totalProduct);
     		$(".totalPrice").text(totalProduct+3000);
     	</c:forEach>
     	
     	
		$(".count").click(function(){
			
			<c:forEach items="${list}" var="c">
		     	count = $(this).val();
	     		price = ${c.PRICE};
     		</c:forEach>
		     	$(this).parent().next($(".price")).text(price * count).append("원");
     		
	     	totalProduct=0;
	     	
	        
	     	$(".price").each((i,item)=>{
	            let priceCal=parseInt($(item).text().trim());
	            totalProduct=totalProduct+priceCal;
	          });
	     	$(".totalProduct").text(totalProduct);
	     	$(".totalPrice").text(totalProduct+3000);
	     	
	     	
	     	
	     	
	     	//여기에서 실행-------------------------------------------------------------------------------
	     	fn_checkPrice();
		});
		
		
		$('.ch').click( function() {
			
			var objs = document.querySelectorAll(".ch");
			var c = 0;
			
			for (var j = 0; j < objs.length; j++) {
	            if (objs[j].checked === true) {
	              c+=1;
	            };
	         };
			
	         $(".pay").text(c + "개 상품 구매하기").css({"font-weight":"bold"});

	         if($(this).prop("checked") === false){
				totalProduct = totalProduct - parseInt($(this).parent().nextAll().find('.price').text().trim());
			}
			$(".totalProduct").text(totalProduct);
			$(".totalPrice").text(totalProduct+3000);
			
			//여기에서 실행-------------------------------------------------------------------------------
			fn_checkPrice();
	     });
		 $('.ch').click( function() {
			if($(this).prop("checked") === true){
				totalProduct = totalProduct + parseInt($(this).parent().nextAll().find('.price').text().trim());
			}
			$(".totalProduct").text(totalProduct);
			$(".totalPrice").text(totalProduct+3000);
	     }); 
		 
 	});
	
	function fn_checkPrice(){
		console.log("총가격함수실행");
		var total=0;
		$("input[name=check]:checked").each((i,item)=>{
			console.log($(item));
			console.log($(item).parents(".proCon").find("span.price").text().trim());
			total=total+parseInt($(item).parents(".proCon").find("span.price").text().trim());
		});
		console.log("총금액"+total);
		
		
	}
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
	
					<div class="order-md-2 ml-3 d-none d-md-block">
						<div id="adsideWrapper">
							<div id="adside">
								<ul class="list-group mb-3" style="width:350px;">
									<li class="pt-4 list-group-item d-flex justify-content-between border-bottom-0">
										<h6>총 상품 금액</h6>
										<h6 class="totalProduct">0</h6>
									</li>
									<li class="list-group-item d-flex justify-content-between border-bottom-0">
										<h6>총 배송비</h6>
										<h6 class="totalFee">3000</h6>
									</li>
									<li class="pt-2 list-group-item d-flex justify-content-between">
										<h3>결제금액</h3>
										<h3 class="totalPrice">0</h3>
									</li>
								</ul>
									<button type="submit" class="pay mt-1 p-3 btn btn-secondary" style="width:350px;"><b>개 상품 구매하기</b></button>
							</div>
						</div>
					</div>
					
					<div class="col-md-8 order-md-1">
						<div class="d-flex align-items-center ml-3 mb-3" style="width:96%;">
							<input type="checkbox" style="width: 20px; height: 20px;" id="all_select" checked>&nbsp;&nbsp;모두선택
							<button type="button" class="ml-auto btn btn-light">선택삭제</button>					
						</div>
					</div>
					
					<div class="col-md-8 order-md-1">
						
						<c:forEach items="${list }" var="c">
							<c:choose>
								<c:when test="${empty list }">
									<p>장바구니가 비었습니다.</p>
								</c:when>
								<c:otherwise>
									<div class="proCon p-3 border border-dark rounded mb-4">
										<div class="checkCon mt-2 d-flex align-items-start float-left" >
											<input type="checkbox" class="ch mr-2" style="width:20px; height: 20px;" name="check" checked>
										</div>
										<div class="d-flex mt-2">
											<div style="width:94%">
												<a href="" class="d-flex">
													<div>
														<img src="${path }/resources/upload/product/detail/${c.FILENAME}" class="rounded" style="width:100px;height:100px">
													</div>
													<div class="ml-3">
														<h5><c:out value="${c.PRODUCTNAME }"/></h5>
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
													<span><c:out value="${c.COLOR }"/> / <c:out value="${c.PRODUCTSIZE }"/></span>
					                             </div>
												<div class="d-flex align-items-start">
													<button type="button" class="btn btn-light"><span>x</span></button>
												</div>
											</div>
											<div class="d-flex p-3 priceCon">
													<div>
						                                <input class="count" type="number" value="${c.COUNT }" min="1" max="100">
						                             </div>
						                             <span class="price ml-auto"><c:out value="${c.COUNT * c.PRICE}"/>원</span>
						                             
						                    </div>
			                    		</div>
					                    <div class="ml-4 mt-3">
					                    	<small><span>옵션 변경 / </span></small> <!-- 모달 -->
					                    	<small><span>바로 구매</span></small>
					                    </div>
									</div>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						
						<div class="d-block d-md-none mt-5">
							<ul class="list-group mb-3" style="width:100%;">
									<li class="pt-4 list-group-item d-flex justify-content-between border-bottom-0">
										<h6>총 상품 금액</h6>
										<h6 class="totalProduct">0</h6>
									</li>
									<li class="list-group-item d-flex justify-content-between border-bottom-0">
										<h6>총 배송비</h6>
										<h6 class="totalFee">3000</h6>
									</li>
									<li class="pt-2 list-group-item d-flex justify-content-between">
										<h3>결제금액</h3>
										<h3 class="totalPrice">0</h3>
									</li>
								</ul>
								<button type="submit" class="pay mt-1 p-3 btn btn-secondary" style="width:100%;"><b>개 상품 구매하기</b></button>
						</div>
						
					</div>
				</div>
				<br><br><br><br><br><br><br><br>
			</div>
		</main>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>