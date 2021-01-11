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

<script>
let count = 0;
function stock(){
   let stockNo=[];
      $("input[name=stockNo]").each((i,item)=>{
         stockNo.push(item.value);
      });
      let cnt=[];
      $("input[name=cnt]").each((i,item)=>{
         cnt.push(item.value);
      });
      let productName=[];
      $("input[name=productName]").each((i,item)=>{
         productName.push(item.value);
      });
      let productSize=[];
      $("input[name=productSize]").each((i,item)=>{
         productSize.push(item.value);
      });
      let color=[];
      $("input[name=color]").each((i,item)=>{
         color.push(item.value);
      });
      
      //동적으로 재고 개수 확인하기
         $.ajaxSettings.traditional = true;
         $.ajax({
      url: "${path}/payment/selectStock.do",
      data:{stockNo:stockNo},
      dataType:"json",         
      success:function(data){         
         $.each(data, function(idx, val) {
            if(val < cnt[idx]){
               alert(productName[idx] + " " + color[idx]  + " " + productSize[idx] + " "  +  "상품의 재고가 부족합니다.     장바구니를 확인해주세요!");
               count++;
               $("#stock").show();
               $("#payment").hide();
            }
         });
             if(count == 0){
                swal("상품 구매 가능", "구매가 가능한 상품들입니다.", "success");
                $("#stock").hide();
                $("#payment").show();
             }
      },
      error:function(data, status, opt)
       {
           alert("code:"+data.status+"\n"+"message:"+data.responseText+"\n"+"error:"+opt);
       }
   });
}
   
function check(){
   //결제 API 실행 전 유효성 검사
   if($("#name").val()===""){
      swal("받으실 분의 성함을 입력해주세요", "", "warning");
      $('#name').focus();
   }else if($("#address").val()===""){
      swal("배송지 주소를 입력해주세요", "", "warning");
      $('#address').focus();
   }else if($("#detailAddress").val()===""){
      swal("상세 주소를 입력해주세요", "", "warning");
      $('#detailAddress').focus();
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
   }else if($("#cash").is(":checked")){
      if($("#holder").val()===""){
         swal("예금주 명을 입력해주세요", "", "warning");
         $('#holder').focus();
      }else if($("select[name=bankSelect]").val()===null){
         swal("은행명을 입력해주세요", "", "warning");
         $('#holder').focus();
      }else if($("#bank").val()===""){
         swal("은행명을 입력해주세요", "", "warning");
         $('#holder').focus();
      }else if($("#account").val()===""){
         swal("환불 받으실 계좌번호를 입력해주세요", "", "warning");
         $('#account').focus();
      }else{
         swal("정보 입력 완료", "결제를 진행합니다.", "success");
         frm.submit();
      }
   }else{
         swal("정보 입력 완료", "결제를 진행합니다.", "success");
         frm.submit();
      
      /* if($("input:radio[id='credit']").is(":checked")){
             var IMP = window.IMP;
         IMP.init('imp77627307');

         IMP.request_pay({
             pg : 'inicis', // version 1.1.0부터 지원.
             pay_method : 'card',
             merchant_uid : 'merchant_' + new Date().getTime(),
             name : '주문명:결제테스트',
             amount : $("#total").html(),
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
 
      return false;
      }else{
         frm.submit();
      } */
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
      $("#stock").show();
      $("#payment").hide();
   });
   
   //주소찾기 API
   function sample6_execDaumPostcode() {
      document.getElementById("postcode").value="";
      document.getElementById("address").value="";
      document.getElementById("detailAddress").value="";
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
                    document.getElementById("extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("detailAddress").focus();
            }
        }).open();
    }
   
   //핸드폰 번호 입력 시 '-' 자동으로 입력
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
      location.replace('${path}/cart/cart.do');
   }
   
   $(document).on("keyup", "#point", function() {
      if($(this).val() > ${point}){
         alert("사용 가능한 포인트보다 더 많은 포인트를 입력하셨습니다.");
         document.getElementById("point").value=${point};
      }else{
         document.getElementById("pointMinus").value=$(this).val();
      }
   });
   
   $(function(){
      $("#point").blur(function(){
         let usePoint = $(this).val()%100;
         if(usePoint!=0){
            document.getElementById("point").value="";
            alert("포인트는 100P단위부터 사용 가능합니다.");
         }else{
            $("#usePoint").text($(this).val()+"P");
            $("#total").text((${list[0].totalPrice } - $(this).val() ));
            document.getElementById("pointMinus").value=$(this).val();
            
            let expoint = parseInt((${list[0].totalPrice } - $(this).val()) * 0.1);
            
            let totalP = ${list[0].totalPrice } - $(this).val();
            $("#totalP").val(totalP);
            
            $("#expectation").text(expoint + "P");
         }
      });
   });
   
   function getAddress(){
      let memberNo = $("#memberNo").val();
      //배송지 주소 가져오기
          $.ajaxSettings.traditional = true;
          $.ajax({
         url: "${path}/payment/getAddress.do",
         data:{memberNo:memberNo},
         success:function(data){
            document.getElementById("name").value=data.memberName;
            document.getElementById("phone").value=data.phone;
            document.getElementById("postcode").value=data.post;
            document.getElementById("address").value=data.address;
            document.getElementById("detailAddress").value=data.detail;
            document.getElementById("email").value=data.email;
         },
         error:function(data, status, opt)
          {
              alert("code:"+data.status+"\n"+"message:"+data.responseText+"\n"+"error:"+opt);
          }
      });
   }
   
   $(document).ready(function() {
      let expoint = parseInt((${list[0].totalPrice } - $(this).val()) * 0.1);
      $("#expectation").text(expoint + "P");
      $(".refund").hide();
      $("#cre").show();
   });
   
   $(function(){
      $('#cash').click(function(){
         $(".refund").show();
         $("#cre").hide();
      });
      $('#credit').click(function(){
         $(".refund").hide();
         $("#cre").show();
      });
   });
   
   $(document).on("change","select.bankSelect",e=>{
      if($(e.target).val()=="기타"){//6+를 선택하면
          let box=$(e.target).parents(".bankBox")
          $(e.target).remove();
          let input=`<input type="text" id="bank" class="refund bankSelect form-control" name="bank">`;
          box.prepend(input);
          box.children(".bankSelect").focus();
      }
   });
</script>
   
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
                             <button type="button" class="btn btn-dark mr-auto" onclick="stock();">재고확인</button>
                             <span class="badge badge-secondary badge-pill">${fn:length(list)}</span>
                         </h4>
                         <ul class="list-group mb-3"  style="width:350px;">
                            <c:forEach items="${list }" var="c">
                                <li class="list-group-item d-flex justify-content-between lh-condensed">
                                    <div>
                                        <h6 class="my-0">${c.productName }</h6>
                                        <c:if test="${!empty c.color && !empty c.productSize}">
                                    <small class="text-muted">${c.color } / ${c.productSize } / ${c.count }</small>
                                 </c:if>
                                 <c:if test="${!empty c.color && empty c.productSize}">
                                    <small class="text-muted">${c.color } / ${c.count }</small>
                                 </c:if>
                                 <c:if test="${empty c.color && !empty c.productSize}">
                                    <small class="text-muted">${c.productSize } / ${c.count }</small>
                                 </c:if>
                                    </div>
                                    <span class="">${c.price }원</span>
                                </li>
                             </c:forEach>
                             <li class="list-group-item d-flex justify-content-between">
                                 <span>배송비</span>
                                 <c:out value="${list[0].fee }"/>원
                             </li>
                             <li class="list-group-item d-flex justify-content-between">
                                 <span>상품 가격</span>
                                 <c:out value="${list[0].totalPrice }"/>원
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
                         <input type="hidden" name="price" value="${c.price }">
                         <input type="hidden" name="productName" value="${c.productName }">
                         <input type="hidden" name="color" value="${c.color }">
                         <input type="hidden" name="productSize" value="${c.productSize }">
                      </c:forEach>
                      <input type="hidden" name="totalPrice" value="${list[0].totalPrice }">
                       <div>
                           <div class="row justify-content-between">
                               <div class="col-4">
                                 <h3>배송지</h3>
                               </div>
                               <div class="mr-4 d-flex align-items-center ">
                                   <button type="button" class="btn btn-dark" onclick="getAddress()">배송지 정보 갖고 오기</button>
                               </div>
                           </div>
                           <hr>
                           <div class="row">
                               <div class="col-md-12 mb-3">
                                   <label for="firstName">이름</label>
                                   <input type="text" class="form-control" id="name" name="receiverName" placeholder="" value="" required>
                               </div>
                           </div>

                        <label for="address">주소</label>
                        <div class="d-flex mb-3">
                            <input type="text" class="mr-2 form-control" id="postcode" placeholder="우편번호" style="width:20%" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
                     <button type="button" class="btn btn-dark" onclick="sample6_execDaumPostcode()">주소찾기</button>
                  </div>
                  <div class="d-flex mb-3">
                     <input type="text" class="form-control" id="address" name="loc" placeholder="주소를 입력하세요">
                  </div>
                  <div class="d-flex mb-3">
                     <input type="text" class="form-control" id="detailAddress" name="locDetail" placeholder="상세주소">
                     <input type="hidden" class="form-control" id="extraAddress" placeholder="참고항목" style="width:49%">
                        </div>

                        <div class="mb-3">
                            <label for="phone">휴대폰번호</label>
                            <input type="text" class="phoneNumber form-control" name="receiverTel" id="phone" placeholder="" required>
                        </div>
                    </div>

                    <div>
                        <div class="row justify-content-between mt-5">
                            <div class="col-4">
                                <h3>주문자</h3>
                            </div>
                            <div class="mr-4 d-flex align-items-center">
                                <button type="button" class="btn btn-dark" onclick="fill()">배송지 정보와 동일</button>
                            </div>
                        </div>
                        <hr>
                        <div class="row">
                            <div class="col-md-12 mb-3">
                                <label for="firstName">이름</label>
                                <input type="text" class="form-control" name="name" id="rname" placeholder="" value="" required>
                            </div>
                        </div>

                        <div class="mb-3">
                            <label for="email">이메일</label><small class="ml-3">주문번호가 발송될 예정입니다. 정확한 이메일을 입력해주세요</small>
                            <input type="text" class="form-control" name="email" id="email" placeholder="" required>
                        </div>

                        <div class="mb-3">
                            <label for="phone">휴대폰번호</label>
                            <input type="text" class="phoneNumber form-control" name="tel" id="rphone" placeholder="" required>
                        </div>
                    </div>
                    
                    <div class="mt-5">
                        <h3>결제</h3>
                        <div class="mt-4 d-flex align-items-center">
                           <h5 class="mr-3">포인트</h5><small>포인트는 100P단위로 사용 가능합니다. (1P당 1원)</small>
                        </div>
                        <hr>
                        <div class="mt-4 d-flex align-items-center">
                           <input type="text" class="mr-2 form-control" id="point" value="0" style="width:20%" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">P
                           <input type="hidden" name="pointMinus" id="pointMinus" value="0">
                        </div>
                        <small>사용 가능한 포인트 <c:out value="${point }"/>P</small>
                        <input type="hidden" name="point" value="${point }">
                        
                        <div class="mt-5 d-flex align-items-center">
                           <h5 class="mr-3">예상 적립 포인트</h5><small>결제금액의 10%가 포인트로 적립됩니다.</small>
                        </div>
                        <hr>
                        <div class="mt-4 d-flex align-items-center">
                           <h6 id="expectation">0P</h6>
                        </div>
                        
                        
                        <h5 class="mt-4">총 결제금액</h5>
                        <hr>
                        <div class="d-block my-3">
                           <ul class="mb-3"  style="width:100%; padding-left:0px;">
                             <li class="d-flex justify-content-between">
                                 <span>총 상품금액</span>
                                 <span><c:out value="${list[0].totalProduct }"/>원</span>
                             </li>
                             <li class="d-flex justify-content-between">
                                 <span>배송비</span>
                                 <span><c:out value="${list[0].fee }"/>원</span>
                             </li>
                             <li class="d-flex justify-content-between">
                                 <span>사용 포인트</span>
                                 <span id="usePoint">0P</span>
                             </li>
                             <li class="d-flex justify-content-between mt-4">
                                 <span></span>
                                 <div class="d-flex">
                                  <h4 id="total"><c:out value="${list[0].totalPrice }"/></h4><h4>원</h4>
                                  <input type="hidden" id="totalP" value="">
                                  </div>
                             </li>
                         </ul>
                        
                           <input type="hidden" id="memberNo" value="${memberNo }">
                        </div>
                    </div>
                    
                    <div class="mt-5">
                        <h3>결제수단</h3>
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
                    
                      
                      <div class="d-flex justify-content-center mb-3">
                          <h5 class="refund">환불 요청 시 환불될 계좌의 정보를 입력해주세요.</h5>
                    </div>
                      <div class="d-flex align-items-center mb-3">
                         <span class="refund mr-2">예금주</span>
                          <input type="text" class="refund form-control" id="holder" style="width:35%;" name="holder" oninput="this.value = this.value.replace(/[^a-zA-Zㄱ-ㅎㅏ-ㅣ가-힣]/g, '').replace(/(\..*)\./g, '$1');">
                      </div>
                    <div class="d-flex">
                         <div class="refund d-flex align-items-center mr-3">
                            <span class="refund mr-3" style="width:40px;">은행</span>
                            <div class="bankBox" style="width:80%;">
                               <select name="bankSelect" class="refund bank bankSelect form-control">
                                  <option value="bank" selected disabled></option>
                           <option value="신한">신한</option>
                           <option value="국민">국민</option>
                           <option value="농협">농협</option>
                           <option value="우리">우리</option>
                           <option value="카카오">카카오</option>
                           <option value="기타">기타</option>
                            </select>
                         </div>
                         </div>
                         <div class="d-flex align-items-center">
                            <span class="refund mr-3" style="width:30%;">환불 계좌</span>
                             <input type="text" class="refund form-control" id="account" style="width:80%;" name="account" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
                       </div>
                    </div>
                    
                    <div id="cre">
                       <input type="hidden" name="holder">
                       <input type="hidden" name="bankSelect">
                       <input type="hidden" name="bank">
                       <input type="hidden" name="account">
                    </div>
                    
                    <input class="mt-5 btn btn-dark btn-lg btn-block" type="button" id="payment" value="결제하기" onclick="check();"></input>
                    
                    <div class="mt-5 d-block" style="text-align: center;">
                       <span id="stock" style="font-size:20px;color:red;">재고를 확인해주세요!</span>
                    </div>
                    
                    
                </form>
                <br><br><br><br><br><br>
            </div>
        </div>
    </div>
  </main>

   <jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>

</html>