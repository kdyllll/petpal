<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>
	//결제 API 실행 전 유효성 검사
	function pay(){
		if($("#name").val()===""){
			swal("받으실 분의 성함을 입력해주세요", "", "warning");
			$('#name').focus();
		}else if($("#sample6_address").val()===""){
			swal("배송지 주소를 입력해주세요", "", "warning");
			$('#sample6_address').focus();
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
			frm.submit();
			//모든 정보가 다 담겨 있으면 결제 API 실행
			swal("정보 입력 완료", "결제를 진행합니다.", "success");
			/* 	var IMP = window.IMP;
			IMP.init('imp77627307');

			IMP.request_pay({
			    pg : 'inicis', // version 1.1.0부터 지원.
			    pay_method : 'card',
			    merchant_uid : 'merchant_' + new Date().getTime(),
			    name : '주문명:결제테스트',
			    amount : 100,
			}, function(rsp) {
			    if ( rsp.success ) {
			    	//결제에 성공하면 form 전송
			        frm.submit();
			    } else {
			    	//결제 실패하면 메세지 띄우고 페이지에 머무름
			        var msg = '결제에 실패하였습니다.';
			        msg += '에러내용 : ' + rsp.error_msg;
			        alert(msg);    
			        return false;
			    }
			});
 
		return false;*/
		}
	}
	
	//장바구니 부분 사이드 div 스크롤에 따라 위치 변경
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
	
	
	
	//주소찾기 API
	function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
	
	//우편번호에 문자가 들어가지  않도록 정규표현식으로 체크
	$(document).on("keyup", ".phoneNumber", function() { 
		$(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-") ); 
	});
	
	//배송지 정보와 동일하게 정보 채우기
	function fill(){
		var name = $("#name").val();
		var phone = $("#phone").val();

		$("#rname").val(name);
		$("#rphone").val(phone);
	}
	
	//장바구니 버튼 누르면 장바구니 페이지로 이동
	function cart(){
		location.replace('/petpal/cart/cart.do');
	}
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
				                        <span class="">${c.price }원</span>
				                    </li>
			                    </c:forEach>
			                    <li class="list-group-item d-flex justify-content-between">
			                        <span>배송비</span>
			                        <c:out value="${list[0].fee }"/>원
			                    </li>
			                    <li class="list-group-item d-flex justify-content-between">
			                        <strong><span>총 가격</span></strong>
			                        <strong><c:out value="${list[0].totalPrice }"/>원</strong>
			                    </li>
			                </ul>
			                <div class="d-flex">
			                	<button type="button" class="btn btn-dark ml-auto" onclick="cart();">장바구니로</button>
			                </div>
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

                        <label for="address">주소</label>
                        <div class="d-flex mb-3">
                            <input type="text" class="mr-2 form-control" id="sample6_postcode" placeholder="우편번호" style="width:20%" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
							<button type="button" class="btn btn-dark" onclick="sample6_execDaumPostcode()">주소찾기</button>
						</div>
						<div class="d-flex mb-3">
							<input type="text" class="form-control" id="sample6_address" name="loc" placeholder="주소를 입력하세요"><br>
						</div>
						<div class="d-flex mb-3">
							<input type="text" class="mr-2 form-control" id="sample6_detailAddress" name="locDetail" placeholder="상세주소" style="width:50%">
							<input type="text" class="form-control" id="sample6_extraAddress" placeholder="참고항목" style="width:49%">
                            
                            
                            <div class="invalid-feedback">
                                	주소를 입력해주세요.
                            </div>
                        </div>

                        <div class="mb-3">
                            <label for="phone">휴대폰번호</label>
                            <input type="text" class="phoneNumber form-control" name="receiverTel" id="phone" placeholder="" required>
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
                                <button type="button" class="btn btn-dark" onclick="fill()">배송지 정보와 동일</button>
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
                            <input type="text" class="phoneNumber form-control" name="tel" id="rphone" placeholder="" required>
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