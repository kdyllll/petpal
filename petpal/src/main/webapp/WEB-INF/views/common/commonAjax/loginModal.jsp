<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/> 

<div class="modal fade" id="loginModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
      	<div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body offset-1 col-10">
          <div class="row d-flex justify-content-center">
            <div class="form-signin">
                <div class="text-center mb-4">
                  <h1 class="h3 mb-3 font-weight-normal">로그인이 필요합니다</h1>                
                </div>
                <div class="form-label-group text-left">
                  <label for="inputEmail">Email address</label>
                  <input type="email" id="inputEmail" class="form-control" placeholder="Email address" required autofocus>
                </div>
                <div class="form-label-group text-left">
                  <label for="inputPassword">Password</label>
                  <input type="password" id="inputPassword" class="form-control" placeholder="Password" required>
                </div>
              
                <div class="checkbox mb-3 text-left">
                  <div class="mt-3">
                    <a class="mr-5 text-dark" href="#">아이디 찾기</a>
                    <a class="mr-5 text-dark" href="#">비밀번호 재설정</a>
                    <a class="text-dark" href="${path }/member/moveJoin.do">회원가입</a>
                  </div>
                </div>
                <button id="loginBtn" class="btn btn-lg btn-primary btn-block" type="submit">로그인</button>       
                <div class="d-flex justify-content-around my-2">  
                  <button class="btn btn-lg rounded my-1" type="button">
                    <img src="./img/avatar.webp" style="width: 70px; height: 70px;" alt="">
                  </button>
                  <button class="btn btn-lg rounded-circle mt-0 mb-1" type="button">
                    <img src="./img/avatar.webp" style="width: 70px; height: 70px;" alt="">
                  </button>
                  <button class="btn btn-lg rounded-circle mt-0" type="button">
                    <img src="./img/avatar.webp" style="width: 70px; height: 70px;" alt="">
                  </button>
                </div>
              </div>              
          </div>      
       </div>
     </div>
   </div>  
   <script>
 	$("#loginBtn").on("click",e=>{
 	    console.log("로그인시도");
  		let email=$("#inputEmail").val();
  		let password=$("#inputPassword").val();
  		$.ajax({
  				url: "${path}/login/loginModal.do",
  				data:{email:email,password:password},
  				success:(data) => {
  			  		if(data==true){
  			    		//모달닫고 새로고침
  			  			location.reload();
  			    	}else{
  			            alert("로그인에 실패했습니다.");
  			    	};
  				}
  			});
  		
  	});
  	</script>