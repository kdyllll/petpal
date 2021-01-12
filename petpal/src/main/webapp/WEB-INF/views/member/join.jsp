<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<jsp:include page="/WEB-INF/views/common/commonLink.jsp" />
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body class="bg-white">
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<main role="main" style="min-height: 100vh;">
		<section class="my-5 pt-5">
			<div class="container-fluid">
				<div class="container">
					<h2 class="text-center font-weight-bold" id="title">회원가입</h2>
					<div class="text-center">
						<a href="${naverUrl }"><img src="${path }/resources/images/naver.PNG"
							style="width: 80px; height: 80px;" alt=""></a> <a href="${kakaoUrl }"><img
							src="${path }/resources/images/kakao.jpg"
							style="width: 80px; height: 80px;" alt=""></a> <a href="${googleUrl }"><img
							src="${path }/resources/images/google.png"
							style="width: 80px; height: 80px;" alt=""></a>
					</div>
					<hr>
					<div class="row">

						<div class="col-md-6 offset-md-3 col-sm-10 offset-sm-1">
							<form role="form" method="post" enctype="multipart/form-data"
								 id="frm">
								<fieldset>
									<p class="text-uppercase pull-center font-weight-bold">기본정보</p>
									<div class="input-group mb-4">
										<input type="text" class="form-control input-lg"
											placeholder="이메일" name="email" id="email">
										<div class="input-group-append">
											<button type="button" class="btn btn-secondary rounded-right" id="auth">이메일인증</button>
										</div>
										<!-- 모달 영역 -->
										<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-header">
														<h4 class="modal-title" id="myModalLabel">이메일 인증</h4>
														<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
														<input type="hidden" id="checked2" value="0">
													</div>
													<div class="modal-body">
														<p>이메일로 인증번호를 전송하였습니다.인증번호를 입력해주세요.</p>
														<span>인증번호</span><input type="text" id="key">
														<button type="button" class="btn btn-outline-secondary" id="check3">인증번호확인</button>
														<input type="hidden" id="key2">
													</div>
													<div class="modal-footer">
														<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
													</div>
												</div>
											</div>
										</div>


									</div>
									<div class="mb-4">
										<input type="password" name="password" id="password"
											class="form-control input-lg"
											placeholder="비밀번호(숫자,문자,특수문자 혼용 8~15글자)">
										<p id="pw"></p>
									</div>
									<div class="mb-4">
										<input type="password" name="password2" id="password2"
											class="form-control input-lg" placeholder="비밀번호 확인">
										<p id="pw2"></p>
									</div>
									<div class="mb-4">
										<input type="text" name="memberName" id="membername"
											class="form-control input-lg" placeholder="이름">
									</div>
									<div class="mb-4">
										<input type="hidden" class="checked" value="0">
										<input type="text" name="nickName" id="nickName" style="width:75%;"
											class="form-control input-lg d-inline" placeholder="닉네임" >
											<button type="button" class="btn btn-outline-secondary" id="check">중복확인</button>
									</div>
									<div class="mb-4">
										<input type="text" id="sample6_postcode" name="address"
											class="form-control input-lg" placeholder="우편번호" readonly>
										<input type="button" onclick="sample6_execDaumPostcode()"
											class="btn btn-primary btn-sm" value="우편번호 찾기">
									</div>
									<div class="mb-4">
										<input type="text" class="form-control input-lg"
											name="address" id="sample6_address" placeholder="주소" readonly>
									</div>
									<div class="mb-4">
										<input type="text" class="form-control input-lg"
											name="address" id="sample6_detailAddress" placeholder="상세주소">
									</div>
									<div class="mb-4">
										<input type="text" name="phone" id="phone"
											class="form-control input-lg"
											placeholder="핸드폰번호('-'없이 입력해주세요)">
									</div>
									<h5 class="font-weight-bold">프로필 사진</h5>
									<div class="col-8 mb-3" id="imgContainer">
										<div id="hide">
											<label id="uploadLabel"
												class="btn rounded bg-light col-12 col-lg-10 border d-flex justify-content-center align-items-center"
												style="height: 206px;"> <input name="f"
												class="d-none upload" id="upload" type="file"
												accept="images/*" />
												<div>
													<svg width="1em" height="1em" viewBox="0 0 16 16"
														class="bi bi-camera-fill text-secondary"
														fill="currentColor" xmlns="http://www.w3.org/2000/svg"
														style="font-size: 60px;">
                      <path
															d="M10.5 8.5a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0z" />
                      <path fill-rule="evenodd"
															d="M2 4a2 2 0 0 0-2 2v6a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V6a2 2 0 0 0-2-2h-1.172a2 2 0 0 1-1.414-.586l-.828-.828A2 2 0 0 0 9.172 2H6.828a2 2 0 0 0-1.414.586l-.828.828A2 2 0 0 1 3.172 4H2zm.5 2a.5.5 0 1 0 0-1 .5.5 0 0 0 0 1zm9 2.5a3.5 3.5 0 1 1-7 0 3.5 3.5 0 0 1 7 0z" />
                  </svg>
													<br> <span> 사진 올리기(선택) </span>
												</div>
												</label>
										</div>
										
									</div>
									<h5 class="font-weight-bold">이용약관</h5>
									<div class="mb-1">
										<label><input type="checkbox" id="allcheck"
											class="d-none"> <svg width="1.5em" height="1.5em"
												viewBox="0 0 16 16" class="bi bi-check2-square"
												fill="currentColor" xmlns="http://www.w3.org/2000/svg">
										<path fill-rule="evenodd"
													d="M15.354 2.646a.5.5 0 0 1 0 .708l-7 7a.5.5 0 0 1-.708 0l-3-3a.5.5 0 1 1 .708-.708L8 9.293l6.646-6.647a.5.5 0 0 1 .708 0z" />
										<path fill-rule="evenodd"
													d="M1.5 13A1.5 1.5 0 0 0 3 14.5h10a1.5 1.5 0 0 0 1.5-1.5V8a.5.5 0 0 0-1 0v5a.5.5 0 0 1-.5.5H3a.5.5 0 0 1-.5-.5V3a.5.5 0 0 1 .5-.5h8a.5.5 0 0 0 0-1H3A1.5 1.5 0 0 0 1.5 3v10z" />
									</svg> 전체동의 </label>
									</div>
									<div class="mb-1">
										<label><input type="checkbox" class="check d-none"
											id="check1"> <svg width="1.5em" height="1.5em"
												viewBox="0 0 16 16" class="bi bi-check2-square"
												fill="currentColor" xmlns="http://www.w3.org/2000/svg">
										<path fill-rule="evenodd"
													d="M15.354 2.646a.5.5 0 0 1 0 .708l-7 7a.5.5 0 0 1-.708 0l-3-3a.5.5 0 1 1 .708-.708L8 9.293l6.646-6.647a.5.5 0 0 1 .708 0z" />
										<path fill-rule="evenodd"
													d="M1.5 13A1.5 1.5 0 0 0 3 14.5h10a1.5 1.5 0 0 0 1.5-1.5V8a.5.5 0 0 0-1 0v5a.5.5 0 0 1-.5.5H3a.5.5 0 0 1-.5-.5V3a.5.5 0 0 1 .5-.5h8a.5.5 0 0 0 0-1H3A1.5 1.5 0 0 0 1.5 3v10z" />
									</svg> (필수) 이용약관에 동의합니다. </label>
									</div>
									<div>
										<label><input type="checkbox" class="check d-none"
											id="check2"> <svg width="1.5em" height="1.5em"
												viewBox="0 0 16 16" class="bi bi-check2-square"
												fill="currentColor" xmlns="http://www.w3.org/2000/svg">
										<path fill-rule="evenodd"
													d="M15.354 2.646a.5.5 0 0 1 0 .708l-7 7a.5.5 0 0 1-.708 0l-3-3a.5.5 0 1 1 .708-.708L8 9.293l6.646-6.647a.5.5 0 0 1 .708 0z" />
										<path fill-rule="evenodd"
													d="M1.5 13A1.5 1.5 0 0 0 3 14.5h10a1.5 1.5 0 0 0 1.5-1.5V8a.5.5 0 0 0-1 0v5a.5.5 0 0 1-.5.5H3a.5.5 0 0 1-.5-.5V3a.5.5 0 0 1 .5-.5h8a.5.5 0 0 0 0-1H3A1.5 1.5 0 0 0 1.5 3v10z" />
									</svg> (필수) 개인정보처리방침에 동의합니다. </label>
									</div>
									<div>
										<input type="button" class="btn btn-lg btn-primary"
											value="회원가입" onclick="join();">
									</div>
								</fieldset>
							</form>
						</div>

						<div class="col-md-3">
							<!-- null -->
						</div>


					</div>
				</div>

			</div>

		</section>
	</main>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>
<style>
#sample6_postcode {
	width: 50%;
	display: inline-block;
}

input[type="checkbox"]+svg {
	color: gray;
}

input[type="checkbox"]:checked+svg {
	color: #00CC00;
}
#password{font-family:맑은고딕, Malgun Gothic, dotum, gulim, sans-serif;}
#password2{font-family:맑은고딕, Malgun Gothic, dotum, gulim, sans-serif;}
</style>

<script>
	
	
	//체크박스 하나씩 체크하거나 풀때
	$(".check").click(e=>{
		
		if($("#check1").prop("checked")==true&&$("#check2").prop("checked")==true){
			$("#allcheck").prop("checked",true);
		}else {
			$("#allcheck").prop("checked",false);
		}
	});
	$("#check3").click(e=>{
		if($("#key").val()==$("#key2").val()){
			alert('인증이 확인되었습니다.');
			$("#checked2").val(1);
			$('.modal').modal('hide');
		}else{
			alert('인증번호가 맞지않습니다.다시 입력해주세요.');
		}
	});
	//전체동의 눌렀을때
	$("#allcheck").click(e=>{
		if($(e.target).prop("checked")==true){
			
			$(".check").prop("checked",true);
		}else{
			
			$(".check").prop("checked",false);
		}
	});
	//회원가입버튼 눌렀을때
	function join(){
		
		var phone=$("#phone").val();//핸드폰번호값
		var regphone=/^010([0-9]{8})$/;//핸드폰번호 정규표현식
		var regPw = /^(?=.*?[a-zA-Z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,15}$/;
		var pw = $("#password").val();//비밀번호값
		var pw2 = $("#password2").val();//비밀번호확인값

		if($("#email").val()==""){//이메일이 공백일때
			alert("이메일을 입력해주세요.");
			return;
		}
		if($("#checked2").val()==0){
			alert("이메일을 인증해주세요.");
			return;
		}
		if(pw==""||pw2==""){//비밀번호,비밀번호확인 둘중 하나라도 입력안했을때
			alert("비밀번호를 입력해주세요.");
			return;
		}else if(!(pw==pw2&&regPw.test(pw))){//공백이 아니고 정상적이지 않을때
			alert("비밀번호를 확인해주세요.");
			return;
		}
		if($("#membername").val()==""){//이름이 공백일때
			alert("이름을 입력해주세요.");
			return;
		}
		if(($("#nickName").val().trim())==""){//닉네임이 공백일때
			alert("닉네임은 빈칸이거나 공백으로만 할 수 없습니다. 다시 입력해주세요");
			$("#nickName").val($("#nickName").val().trim());
			return;
		}
		if($(".checked").val()==0){
			alert("닉네임 중복확인 해주세요");
			return;
		}
		if($("#sample6_postcode").val()==""||$("#sample6_address").val()==""||($("#sample6_detailAddress").val()).trim()==""){
			alert("주소를 다시 입력해주세요.");
			return;
		}
		if(regphone.test(phone)!=true){//핸드폰번호가 형식이 맞지않으면
			alert("핸드폰번호를 확인해주세요.");
			return;
		}
		if($("#allcheck").prop("checked")==false){//전체동의가 체크되지 않으면
			alert("약관의 동의해주세요");
			return;
		}
		
		$("#nickName").val($("#nickName").val().trim());//닉네임 양쪽 공백제거하여 보냄 
		$("#frm").attr("action","${path }/insertMember.do").submit();
	}
	 $("#password").keyup(e=>{//비밀번호 입력할때
		var pw= $("#password").val();
		var pw2 = $("#password2").val();
		var regPw = /^(?=.*?[a-zA-Z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,15}$/;
		if(regPw.test(pw)!=true){
			$("#pw").attr("style","color:red;font-size:12px;");
			$("#pw").html("문자,숫자,특수기호를 혼용하여 8~15글자로 입력해주세요.");
		}else{
			$("#pw").attr("style","color:green;font-size:12px;");
			$("#pw").html("사용가능합니다.");
		}
		if(pw!=pw2){
			$("#pw2").attr("style","color:red;font-size:12px;");
			$("#pw2").html("비밀번호가 일치하지 않습니다.");
		}else{
			$("#pw2").attr("style","color:green;font-size:12px;");
			$("#pw2").html("비밀번호가 일치합니다.");
		}
	});
	$("#password2").keyup(e=>{//비밀번호 확인 입력할때
		var pw = $("#password").val();
		var pw2 = $("#password2").val();
		var regPw = /^.*(?=^.{4,13})(?=.*\d)(?=.*[a-zA-Z]).*$/;
		if(pw!=pw2){
			$("#pw2").attr("style","color:red;font-size:12px;");
			$("#pw2").html("비밀번호가 일치하지 않습니다.");
		}else{
			$("#pw2").attr("style","color:green;font-size:12px;");
			$("#pw2").html("비밀번호가 일치합니다.");
		}
		
	});
	$("#membername").keyup(e=>{//이름입력할때
		$("#membername").val($("#membername").val().trim());//이름에 공백못들어가게함
	});
	$("#email").keyup(e=>{//이메일입력할때
		$("#email").val($("#email").val().trim());//이메일에 공백못들어가게함
		$("#checked2").val(0);
	}); 
	$("#nickName").keyup(e=>{//이메일입력할때
		$(".checked").val(0);
		
	}); 
	//사진!!
	  //사진 미리보기
	  $(document).on('change','.upload',function(e){
		  var f=e.target;
		$("#hide").hide(); // 사진 등록 창 안보이게
	        $.each(e.target.files,(i,v)=>{//미리보기 로직     
	            let reader=new FileReader();
	            reader.onload=e=>{ 
	                let img=`<div class="preview position-relative rounded col-10 mb-3" >
	                          <img src="`+e.target.result+`" class="previewImg rounded px-0" style="width:100%; height:206px;" data-toggle="modal" data-target="#exampleModal"">
	                          <div class="buttonCon position-absolute rounded" style="bottom:0; left:0; background:linear-gradient(to top,rgba(0, 0, 0, 0.5),rgba(255, 255, 255, 0)); width:100%;">
	                            <button type="button" class="del btn ml-3">
	                              <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-trash text-white" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
	                                <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
	                                <path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4L4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
	                              </svg>
	                            </button>
	                          </div>
	                        </div>`;
	                $("#imgContainer").append(img);
	               
	                
	            }
	            
	            reader.readAsDataURL(v);
	        });              
	    });
	//사진 삭제
    $(document).on('click','.del',function(e){
    	 let previewDiv=$(e.target).parents(".preview");
    	previewDiv.remove();//미리보기div삭제
    	$("#hide").show();//미리보기가 삭제되었으니 사진 등록창 보이게
    }); 
    $(document).on('click','#auth',function(e){//이메일 인증
    	var email=$("#email").val();
    	$.ajax({
    		url:"${path}/sendEmail.do",
    		data:{email:email},
    		success:data=>{
    			if(data==""){
    				alert("형식에 맞지 않는이메일입니다.");
    				return;
    			}
    			$("#key2").val(data);
    			$("div.modal").modal();
			}
    	})
    });
	
	$(document).on('click','#check',function(e){//닉네임 중복확인
		var nickName=$("#nickName").val().trim();
		if(nickName==""){
			alert("닉네임을 입력해주세요");
			return;
		}
		$.ajax({
			url:"${path}/member/checkNickName.do",
			data:{nickName:nickName},
			success:data=>{
				if(data==true){
					alert("사용가능합니다.");
					$(".checked").val(1);
				}else{
					alert("이미 있는 닉네임입니다.");
				}
			}
		});
	});
	
	
	//주소api
     function sample6_execDaumPostcode() {
         new daum.Postcode({
             oncomplete: function(data) {
                 // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                 // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                 // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                 var addr = ''; // 주소 변수

                 //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                 if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                     addr = data.roadAddress;
                 } else { // 사용자가 지번 주소를 선택했을 경우(J)
                     addr = data.jibunAddress;
                 }

                 // 우편번호와 주소 정보를 해당 필드에 넣는다.
                 document.getElementById('sample6_postcode').value = data.zonecode;
                 document.getElementById("sample6_address").value = addr;
                 // 커서를 상세주소 필드로 이동한다.
                 document.getElementById("sample6_detailAddress").focus();
             }
         }).open();
     } 
     $('.modal').on('hidden.bs.modal', function (e) {
    	    $(this).find('#key').val("");
    	});
</script>

</html>