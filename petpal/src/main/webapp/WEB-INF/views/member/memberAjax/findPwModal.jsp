<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/> 

<style>
#password{font-family:맑은고딕, Malgun Gothic, dotum, gulim, sans-serif;}
#password2{font-family:맑은고딕, Malgun Gothic, dotum, gulim, sans-serif;}
</style>
<div class="modal fade" id="pwModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog  modal-dialog-centered">
    <div class="modal-content" onsubmit="return fn_submit();" action="${path }/store/qnaEnd.do">
      <div class="modal-header">
        <h5 class="modal-title pl-3" id="exampleModalLabel">비밀번호 재설정</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      
      <div class="modal-body pwModalBody offset-1 col-10 pb-0 mt-2 mb-4">
       <div>
        
     	   <div class="form-label-group text-left">
              <input type="email" name="email" id="inputEmail" class="email form-control" placeholder="이메일" required autofocus>
              <label for="inputEmail">이메일</label>
            </div>
            <button class="btn btn-lg bg-point btn-block sendNumBtn" type="button">인증번호 전송</button>      
            
            <div class="afterSend">
            <hr>
     		<div class="form-label-group text-left">
              <input type="text" name="number" id="inputNum" class="form-control" placeholder="인증번호" required>
              <label for="inputNum">인증번호</label>
            </div>
            <button class="btn btn-lg bg-point btn-block checkNumBtn" type="button">인증번호 확인</button> 
            </div> 
 
         </div> 
         
       </div>

     </div>
   </div>
 </div>  
 <script>
 	var key;
	var regPw = /^(?=.*?[a-zA-Z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,15}$/;
	var email;
	$(".afterSend").hide();
	//이메일 인증버튼 누르면
 	$(document).on("click",".sendNumBtn",e=>{
 		email=$(".email").val();
 		//인증번호 전송할 때
 		//있는 아이디인지 확인
 		$.ajax({
 			url:"${path}/checkId.do",
 			data:{email:email},
 			success:(data)=>{
 				//sns가입아이디가 아니면서 해당 이메일과 일치하는 멤버번호의 개수 리턴
 				if(data>0){//그런 계정이 있으면 
 					//이메일로 인증번호 보내고 인증번호 리턴받기
 			 		$.ajax({
 			 			url:"${path}/sendEmail.do",
 			 			data:{email:email},
 			 			success:(data)=>{
 			 				if(data!=null){//인증번호가 잘 전송됐다면
 			 					key=data; //인증번호를 변수에 저장하고
 			 					$(".afterSend").show(); //인증번호를 입력하는 란을 보여주고 
 			 					$(".sendNumBtn").val("인증번호 재전송"); //재전송으로 버튼 이름을 바꾸기
 			 				}
 			 			},
 						error:(request,status,error)=>{
 			                alert("올바르지 않은 주소입니다.");
 			             }
 			 		
 			 		})
 				}else{//계정이 없으면
 					alert("가입되지 않은 계정입니다.");
 				}
 			}
 		}) 
 		
 	});
 	
 	//인증번호 확인 버튼 누르면
 	$(document).on("click",".checkNumBtn",e=>{
 		var num=$("#inputNum").val();
 		if(num==key){//인증번호와 입력번호가 같으면
 			//비밀번호 변경 화면으로 넘기기
 			var change=` 			
 			<form>
            <div class="form-label-group text-left">
				<input type="password" name="password" id="password" class="password form-control input-lg" placeholder="비밀번호(숫자,문자,특수문자 혼용 8~15글자)">
				<label for="password">새로운 비밀번호</label>
				<p id="pw"></p>
			</div>
			<div class="form-label-group text-left">
				<input type="password" name="password2" id="password2" class="password2 form-control input-lg" placeholder="비밀번호 확인">
				<label for="password2">비밀번호 확인</label>
				<p id="pw2"></p>
			</div>
			<button class="btn btn-lg bg-point btn-block changePw" type="button">비밀번호 변경</button> 
            </form>`;
 			$(".pwModalBody").html(change);
 		}else{
 			alert("인증번호가 일치하지 않습니다.");
 		}
 		
 	})
 	
 	//비밀번호 변경 누르면
 	$(document).on("click",".changePw",e=>{
 		var pw = $(".password").val();//비밀번호값
 		var pw2 = $(".password2").val();//비밀번호확인값
		if(pw==""||pw2==""){//비밀번호,비밀번호확인 둘중 하나라도 입력안했을때
			alert("비밀번호를 입력해주세요.");
			return;
		}else if(!(pw==pw2&&regPw.test(pw))){//두개가 일치하지 않거나, 정규표현식을 따르지 않을때
			alert("비밀번호를 확인해주세요.");
			return;
		}else{
			//비밀번호 변경
			location.replace('${path}/changePw.do?email='+email+'&password='+pw);
		}
 		
 	});
 	
 	//비밀번호 입력
 	 $(document).on("keyup",".password",e=>{
 		var pw = $(".password").val();//비밀번호값
 		var pw2 = $(".password2").val();//비밀번호확인값
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
 	//비밀번호 일치 확인
 	$(document).on("keyup",".password2",e=>{
 		var pw = $(".password").val();
 		var pw2 = $(".password2").val();
 		if(pw!=pw2){
 			$("#pw2").attr("style","color:red;font-size:12px;");
 			$("#pw2").html("비밀번호가 일치하지 않습니다.");
 		}else{
 			$("#pw2").attr("style","color:green;font-size:12px;");
 			$("#pw2").html("비밀번호가 일치합니다.");
 		}
 		
 	});
 </script>