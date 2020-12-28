<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<jsp:include page="/WEB-INF/views/common/commonLink.jsp" />

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
	$( document ).ready( function() {
		var objs = document.querySelectorAll(".ch");
		var c = 0;
		
		for (var j = 0; j < objs.length; j++) {
            if (objs[j].checked === true) {
              c+=1;
            }
        }
		
		var check = 0;
		
		for(var i=0;i<objs.length;i++){
			if(objs[i].checked===true){
				check++;
			}
		}
		if(check==0){
			$(".pay").hide();
			$(".noPay").show();
		}else{
			$(".pay").show();
			$(".noPay").hide();
		}
		
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
          
          var objs = document.querySelectorAll(".ch");
			var c = 0;
			
			var check = 0;
			
			for(var i=0;i<objs.length;i++){
				if(objs[i].checked===true){
					check++;
				}
			}
			if(check==0){
				$(".pay").hide();
				$(".noPay").show();
			}else{
				$(".pay").show();
				$(".noPay").hide();
			}
			
			
			for (var j = 0; j < objs.length; j++) {
	            if (objs[j].checked === true) {
	              c+=1;
	            };
	         };
			
	         $(".pay").text(c + "개 상품 구매하기").css({"font-weight":"bold"});
	         
	         if(totalProduct !=0 && totalProduct<=50000){
	        	 $(".totalFee").text(2500);
		         $('.totalProduct').text(totalProduct);
		         $('.totalPrice').text(Number(totalProduct) + 2500);
	         }else{
	        	 $(".totalFee").text(0);
	        	 $('.totalProduct').text(totalProduct);
		         $('.totalPrice').text(totalProduct);
	         }
	         
	         
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
     	var amount = 0;
     	var price = 0;
     	var totalProduct = 0;
     	
     	var objs = document.querySelectorAll(".ch");
     	
     	<c:set var="i" value="0"/>
		<c:forEach items="${list}" var="c">
	     	amount = ${amount[i]}
     		price = ${c.PRICE};
     		totalProduct += amount * price;
     		$('.totalProduct').text(totalProduct);
     		$('.totalPrice').text(totalProduct);
     		<c:set var="i" value="${i + 1}" />
     	</c:forEach>
     	
     	if(totalProduct !=0 && totalProduct<=50000){
       	 $(".totalFee").text(2500);
	          $('.totalProduct').text(totalProduct);
	         $('.totalPrice').text(Number(totalProduct) + 2500);
        }else{
       	 $(".totalFee").text(0);
       	 $('.totalProduct').text(totalProduct);
	         $('.totalPrice').text(totalProduct);
        }
     	
     	
		$(".count").click(function(){
			count = $(this).val();
			$(this).parent().next().next().text(price * count).append("원");
			fn_checkPrice();
		});
		
		
		$('.ch').click( function() {
			
			var objs = document.querySelectorAll(".ch");
			var c = 0;
			
			
			var check = 0;
			
			for(var i=0;i<objs.length;i++){
				if(objs[i].checked===true){
					check++;
				}
			}
			if(check==0){
				$(".pay").hide();
				$(".noPay").show();
			}else{
				$(".pay").show();
				$(".noPay").hide();
			}
			
			
			for (var j = 0; j < objs.length; j++) {
	            if (objs[j].checked === true) {
	              c+=1;
	            };
	         };
			
	         $(".pay").text(c + "개 상품 구매하기").css({"font-weight":"bold"});

	         if($(this).prop("checked") === false){
				totalProduct = totalProduct - parseInt($(this).parent().nextAll().find('.price').text().trim());
			}
	         if(totalProduct !=0 && totalProduct<=50000){
	        	 $(".totalFee").text(2500);
		         $('.totalProduct').text(totalProduct);
		         $('.totalPrice').text(Number(totalProduct) + 2500);
	         }else{
	        	 $(".totalFee").text(0);
	        	 $('.totalProduct').text(totalProduct);
		         $('.totalPrice').text(totalProduct);
	         }
			
			//여기에서 실행-------------------------------------------------------------------------------
			fn_checkPrice();
	     });
		$('.ch').click( function() {
			if($(this).prop("checked") === true){
				totalProduct = $(".totalProduct").html();
			}
			if(totalProduct !=0 && totalProduct<=50000){
	        	 $(".totalFee").text(2500);
		          $('.totalProduct').text(totalProduct);
		         $('.totalPrice').text(Number(totalProduct) + 2500);
	         }else{
	        	 $(".totalFee").text(0);
	        	 $('.totalProduct').text(totalProduct);
		         $('.totalPrice').text(totalProduct);
	         }
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
		if(total !=0 && total<=50000){
       	 	$(".totalFee").text(2500);
       	 	$('.totalProduct').text(total);
       	 	$('.totalPrice').text(Number(total) + 2500);
        }else{
       	 $(".totalFee").text(0);
       	 $('.totalProduct').text(total);
	         $('.totalPrice').text(total);
        }
		
		
	}
	
	function submitCheck(){
		var objs = document.querySelectorAll(".ch");
		var c = 0;
		
		
		for(var i=0;i<objs.length;i++){
			if(objs[i].checked===true){
				c++;
				$("#preview").append("<input class=\"click\" id=\"click\" type=\"hidden\" name=\"click\" value=\"1\">");
			}else{
				$("#preview").append("<input class=\"click\" id=\"click\" type=\"hidden\" name=\"click\" value=\"0\">");
			}
		}
		
			frm.submit();
	}
	
	function noBuy(){
		swal("상품을 선택해주세요", "", "warning");
	}
	
	function cartDelete(){
		//alert로 진짜 지울건지 물어보고 안 지우면 그냥 창 닫고 지우면 
		//체크 되어 있는 애의 재고번호를 받아서( ?stockNo 이런걸로 해서  ) 컨트롤러로 넘기고
		//컨트롤러에서 해당 재고번호의 상품을 지우고 지운 후의 리스트를 다시 쏴주고
		swal({
			title:'장바구니에서 삭제하시겠습니까?',
			icon : 'warning',
			closeOnClickOutside: false,
			buttons : {
				cancle : {
					text : '취소',
					value : false,
				},
				confirm : {
					text : '삭제',
					value : true,
				}
			}
		}).then((result) => {
			if(result){
				let deleteCart=[];
				
				var objs = document.querySelectorAll(".ch");
				
				for(var i=0;i<objs.length;i++){
					if(objs[i].checked===true){
						deleteCart.push("1");
					}else{
						deleteCart.push("0");
					}
				}
				$.ajaxSettings.traditional = true;
			    $.ajax({
			        url:"${path}/cart/deleteCart.do",
			        data : {deleteCart:deleteCart},
			        success: function(){
			        	swal('상품이 삭제되었습니다.', '', 'success');
			        },
			        error: function() {
			        	swal('실패', '', 'warning');
			        }  
			    });
				
			}
		});
	}
	
	/* $("#checkDelete").click(function(){
	    $.ajax({
	        type:"POST",
	        url:"./book.jsp",
	        data : {name : "홍길동"},
	        dataType : "xml",
	        success: function(xml){
	            console.log(xml);
	        },
	        error: function(xhr, status, error) {
	            alert(error);
	        }  
	    });
	}); */

	
	
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
			<!-- 회원번호 없음 -->
				<form class="needs-validation" id="frm" name="cart" action="${path }/payment/payment.do" method="post">
				<div class="row" style="padding-top: 5em;">
	
					<div class="order-md-2 ml-3 d-none d-md-block">
						<div id="adsideWrapper">
							<div id="adside">
								<ul class="list-group mb-3" style="width:350px;">
									<li class="pt-4 list-group-item d-flex justify-content-between border-bottom-0">
										<h6>총 상품 금액</h6>
										<h6 class="totalProduct ml-auto">0</h6><h6>원</h6>
									</li>
									<li class="list-group-item d-flex justify-content-between border-bottom-0">
										<div>
											<h6>총 배송비</h6>
											<small>( 5만원 이상 결제 시 무료 )</small>
										</div>
										<h6 class="totalFee ml-auto">0</h6><h6>원</h6>
									</li>
									<li class="pt-2 list-group-item d-flex justify-content-between">
										<h3>결제금액</h3>
										<h3 class="totalPrice ml-auto">0</h3><h3>원</h3>
									</li>
								</ul>
								<button type="button" class="pay mt-1 p-3 btn btn-secondary" style="width:350px;" onclick="submitCheck();"><b>개 상품 구매하기</b></button>
								<button type="button" class="noPay mt-1 p-3 btn btn-secondary" style="width:350px;" onclick="noBuy();"><b>구매하기</b></button>
							</div>
						</div>
					</div>
					
					<div class="col-md-8 order-md-1">
						<div class="d-flex align-items-center ml-3 mb-3" style="width:96%;">
							<input type="checkbox" style="width: 20px; height: 20px;" id="all_select" checked>&nbsp;&nbsp;모두선택
							<button type="button" class="ml-auto btn btn-light" id="checkDelete" onclick="cartDelete();">선택삭제</button>					
						</div>
					</div>
					
					<div class="col-md-8 order-md-1">
						<c:set var="i" value="0"/>
						<c:forEach items="${list }" var="c" begin="0" end="${list.size()-1 }">
							<div class="proCon p-3 border border-dark rounded mb-4">
								<div class="checkCon mt-2 d-flex align-items-start float-left" >
									<input type="checkbox" class="ch mr-2" style="width:20px; height: 20px;" name="check" checked>
								</div>
								<div class="d-flex mt-2">
									<div style="width:94%">
										<a href="" class="d-flex">
											<div>
												<img src="${path }/resources/upload/product/detail/${c.IMGNAME}" class="rounded" style="width:100px;height:100px">
											</div>
											<div class="ml-3">
												<input type="hidden" name="stockNo" value="${c.STOCKNO }">
												
												<input type="hidden" name="productName" value="${c.PRODUCTNAME }">
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
											<input type="hidden" name="color" value="${c.COLOR }">
											<input type="hidden" name="size" value="${c.PRODUCTSIZE }">
											<span><c:out value="${c.COLOR }"/> / <c:out value="${c.PRODUCTSIZE }"/></span>
			                             </div>
										<div class="d-flex align-items-start">
											<button type="button" class="btn btn-light"><span>x</span></button>
										</div>
									</div>
									<div class="d-flex p-3 priceCon">
											<div id="count">
				                                <input class="count" type="number" name="count" value="${amount[i]}" min="1" max="100">
				                             </div>
				                             <input type="hidden" name="price" value="${c.PRICE}">
				                             <span class="price ml-auto"><c:out value="${amount[i] * c.PRICE}"/>원</span>
				                             <input id="stockNo" type="hidden" value="${c.STOCKNO }">
				                             <div id="preview"></div>
				                    </div>
	                    		</div>
			                    <div class="ml-4 mt-3">
			                    	<small><span>옵션 변경</span></small> <!-- 모달 -->
			                    </div>
							</div>
	                           <c:set var="i" value="${i + 1}" />
						</c:forEach>
						
						<div class="d-block d-md-none mt-5">
							<ul class="list-group mb-3" style="width:100%;">
									<li class="pt-4 list-group-item d-flex justify-content-between border-bottom-0">
										<h6>총 상품 금액</h6>
										<h6 class="totalProduct ml-auto">0</h6><h6>원</h6>
									</li>
									<li class="list-group-item d-flex justify-content-between border-bottom-0">
										<div>
											<h6>총 배송비</h6>
											<small>( 5만원 이상 결제 시 무료 )</small>
										</div>
										<h6 class="totalFee ml-auto">0</h6><h6>원</h6>
									</li>
									<li class="pt-2 list-group-item d-flex justify-content-between">
										<h3>결제금액</h3>
										<h3 class="totalPrice ml-auto">0</h3>원
									</li>
								</ul>
								<button type="button"class="pay mt-1 p-3 btn btn-secondary" style="width:100%;" onclick="submitCheck();"><b>개 상품 구매하기</b></button>
								<button type="button" class="noPay mt-1 p-3 btn btn-secondary" style="width:100%;" onclick="noBuy();"><b>구매하기</b></button>
						</div>
						
					</div>
				</div>
				<br><br><br><br><br>
				
				</form>
			</div>
		</main>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>