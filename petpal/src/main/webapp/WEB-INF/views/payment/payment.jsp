<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<script>
	function pay(){
		if($("#name").val()===""){
			swal("받으실 분의 성함을 입력해주세요", "", "warning");
			$('#name').focus();
		}else if($("#address").val()===""){
			swal("배송지 주소를 입력해주세요", "", "warning");
			$('#address').focus();
		}else if($("#phone").val()===""){
			swal("받으실 분의 휴대폰 번호를 입력해주세요", "", "warning");
			$('#phone').focus();
		}else if($("#rname").val()===""){
			swal("주문자 이름을 입력해주세요", "", "warning");
			$('#rname').focus();
		}else if($("#email").val()===""){
			swal("이메일을 입력해주세요", "", "warning");
			$('#email').focus();
		}else if($("#rphone").val()===""){
			swal("주문자의 휴대폰 번호를 입력해주세요", "", "warning");
			$('#rphone').focus();
		}
		else{
			swal("정보 입력 완료", "결제를 진행합니다.", "success");
			frm.submit();
		/* var IMP = window.IMP;
		IMP.init('imp77627307');
		
		IMP.request_pay({
		    pg : 'inicis', // version 1.1.0부터 지원.
		    pay_method : 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : '주문명:결제테스트',
		    amount : 100,
		    buyer_email : 'gusngus@naver.com',
		    buyer_name : '구매자이름',
		    buyer_tel : '010-1234-5678',
		    buyer_addr : '서울특별시 강남구 삼성동',
		    buyer_postcode : '123-456',
		}, function(rsp) {
		    if ( rsp.success ) {
		        var msg = '결제가 완료되었습니다.';
		        msg += '고유ID : ' + rsp.imp_uid;
		        msg += '상점 거래ID : ' + rsp.merchant_uid;
		        msg += '결제 금액 : ' + rsp.paid_amount;
		        msg += '카드 승인번호 : ' + rsp.apply_num;
		        alert(msg);
		        frm.submit();
		    } else {
		        var msg = '결제에 실패하였습니다.';
		        msg += '에러내용 : ' + rsp.error_msg;
		        alert(msg);    
		        return false;
		    }
		});
		
		return false; */
		}
	}
	
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
</script>

	<c:set var="path" value="${pageContext.request.contextPath }"/> 
	 <jsp:include page="/WEB-INF/views/common/commonLink.jsp" />
	 
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

	<main role="main" style="min-height:100vh;">
  		<div class="container">
        	<div class="row"  style="padding-top:5em;">
        	
            	<div class="order-md-2 d-none d-md-block ml-3">
        			<div id="adsideWrapper">
    					<div id="adside">
			                <h4 class="d-flex justify-content-between align-items-center mb-3">
			                    <span class="text-muted">장바구니</span>
			                    <span class="badge badge-secondary badge-pill">${fn:length(list)}</span>
			                </h4>
			                <ul class="list-group mb-3"  style="width:350px;">
			                	<c:forEach items="${list }" var="c">
			                    <li class="list-group-item d-flex justify-content-between lh-condensed">
			                        <div>
			                            <h6 class="my-0">${c.productName }</h6>
			                            <small class="text-muted">${c.productSize } / ${c.color } / ${c.count }</small>
			                        </div>
			                        <span class="">${c.price }</span>
			                    </li>
			                    </c:forEach>
			                    <li class="list-group-item d-flex justify-content-between">
			                        <span>총 가격</span>
			                        <strong><c:out value="${list[0].totalPrice }"/></strong>
			                    </li>
			                </ul>
           				 </div>
            		</div>
            	</div>

           		<div class="col-md-8 order-md-1">
                	<form class="needs-validation" id="frm" name="payment" action="${path }/payment/paymentComplete.do" method="post">
                		<c:forEach items="${list }" var="c">
                			<input type="hidden" name="cnt" value="${c.count }">
                			<input type="hidden" name="stockNo" value="${c.stockNo }">
                		</c:forEach>
                		<input type="hidden" name="totalPrice" value="${list[0].totalPrice }">
                    	<div>
                        	<h3>배송지</h3>
                        	<hr>
                        	<div class="row">
                            	<div class="col-md-12 mb-3">
                                	<label for="firstName">이름</label>
                                	<input type="text" class="form-control" id="name" name="receiverName" placeholder="" value="" required>
                                	<div class="invalid-feedback">
                                    	이름을 입력해주세요.
                                	</div>
                            	</div>
                        	</div>

                        <div class="mb-3">
                            <label for="address">우편번호</label>
                            <input type="text" class="form-control" id="address" name="loc" placeholder="" required>
                            <div class="invalid-feedback">
                                	우편번호를 입력해주세요.
                            </div>
                        </div>

                        <div class="mb-3">
                            <label for="phone">휴대폰번호</label>
                            <input type="text" class="form-control" name="receiverTel" id="phone" placeholder="010-0000-0000" required>
                            <div class="invalid-feedback">
                                	휴대폰번호를 입력해주세요.
                            </div>
                        </div>
                    </div>

                    <div>
                        <div class="row justify-content-between mt-5">
                            <div class="col-4">
                                <h3>주문자</h3>
                            </div>
                            <div class="mr-4 d-flex align-items-center ">
                                <input type="checkbox" style="width: 20px; height: 20px;">&nbsp;배송지 정보와 동일
                            </div>
                        </div>
                        <hr>
                        <div class="row">
                            <div class="col-md-12 mb-3">
                                <label for="firstName">이름</label>
                                <input type="text" class="form-control" name="name" id="rname" placeholder="" value="" required>
                                <div class="invalid-feedback">
                                	이름을 입력해주세요.
                                </div>
                            </div>
                        </div>

                        <div class="mb-3">
                            <label for="email">이메일</label>
                            <input type="text" class="form-control" name="email" id="email" placeholder="" required>
                            <div class="invalid-feedback">
                               	 이메일 입력해주세요.
                            </div>
                        </div>

                        <div class="mb-3">
                            <label for="phone">휴대폰번호</label>
                            <input type="text" class="form-control" name="tel" id="rphone" placeholder="010-0000-0000" required>
                            <div class="invalid-feedback">
                            	휴대폰번호를 입력해주세요.
                            </div>
                        </div>
                    </div>

                    <div class="mt-5">
                        <h3>결제수단</h3>
                        <hr>
                        <div class="d-block my-3">
                            <div>
                                <input id="credit" name="payKind" type="radio" value="신용카드" checked required>
                                <label for="credit">신용카드</label>
                            </div>
                            <div>
                                <input id="cash" name="payKind" type="radio" value="무통장" required>
                                <label for="cash">무통장 입금</label>
                            </div>
                        </div>
                    </div>
                    
                    <input class="mt-5 btn btn-dark btn-lg btn-block" type="button" id="payment" value="결제하기" onclick="pay();"></input>
                    
                    <br><br><br><br><br><br>
                </form>
            </div>
        </div>
    </div>
  </main>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>

</html>