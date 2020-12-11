<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/> 


<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
      
      <!-- 로그인 모달 -->
      <c:if test="${empty loginMember }">
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
                    <a class="text-dark" href="#">회원가입</a>
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
      </c:if>
      
      <!-- 신고 모달 -->
      <c:if test="${not empty loginMember }">
        <div class="modal-header">
          <h5 class="modal-title pl-3" id="exampleModalLabel">신고 하기</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body offset-1 col-10 pb-0">

          <form id="claimFrm" class="mb-3"> 
            <div class="form-group mt-3">
              <input type="hidden" name="no" value="${no }"/>
              <label for="exampleFormControlSelect1">신고사유</label>
              <select name="claimCategory" class="form-control col-5" id="exampleFormControlSelect1">
                <option disabled selected>사유 선택</option>
                <option value="주제와 맞지 않는 게시물">주제와 맞지 않는 게시물</option>
                <option value="지나친 광고성 게시물">지나친 광고성 게시물</option>
                <option value="도배 및 중복 게시물">도배 및 중복 게시물</option>
                <option value="욕설/비방/외설적인 게시물">욕설/비방/외설적인 게시물</option>
                <option value="저작권 침해 게시물">저작권 침해 게시물</option>
                <option value="기타">기타</option>
              </select>
            </div>
            <div class="form-group mb-3">
              <label for="exampleFormControlTextarea1">신고내용</label>
              <textarea name="claimContent" class="form-control" id="exampleFormControlTextarea1" rows="5" style="resize:none;"></textarea>
            </div>
            <div class="d-flex justify-content-end">
                <button type="button" class="btn btn-secondary mb-2 close" data-dismiss="modal" aria-label="Close">취소</button>
                <button id="claimBtn" type="button" class="btn btn-primary mb-2 ml-3">신고</button>
            </div>
          </form>
        </div>
	  </c:if>




       </div>
     </div>
   </div>  
   
   <script>
 	$("#loginBtn").on("click",e=>{
  		//로그인 됐는지 확인
  		let email=$("#inputEmail").val();
  		let password=$("#inputPassword").val();
  		$.ajax({
  				url: "${path}/login/loginModal.do",
  				data:{email:email,password:password},
  				dataType:"text",
  				success:(data) => {
  			  		if(data===true){
  			    		//모달닫고 새로고침
  			    	}else{
  			            alert("로그인에 실패했습니다.");
  			    	};
  				}
  			});
  		
  	});
   
	/* 아... 폼 안보내고 에이작스로 폼데이터 보내고 싶다...→ 쌉가능 */
	$("#claimBtn").on("click",e=>{
		$.ajax({
			url: "${path}/claim/claimEnd.do",
			data:$("#claimFrm").serialize(), 
			success:(data) => {
				//신고 성공했으면? 성공 알림 띄우고 모달 닫고.. 새로고침?
						
				
			}
		});
		
		
	});

   </script>