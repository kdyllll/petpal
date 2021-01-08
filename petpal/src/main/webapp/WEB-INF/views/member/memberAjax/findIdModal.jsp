<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/> 

<div class="modal fade" id="idModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog  modal-dialog-centered">
    <div class="modal-content" onsubmit="return fn_submit();" action="${path }/store/qnaEnd.do">
      <div class="modal-header">
        <h5 class="modal-title pl-3" id="exampleModalLabel">아이디 찾기</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      
      <div class="modal-body idModalBody offset-1 col-10 pb-0 mt-2 mb-4">
       <div>
        
     		<div class="form-label-group text-left">
              <input type="text" name="name" id="inputName" class="form-control" placeholder="이름" required autofocus>
              <label for="inputName">이름</label>
            </div>
     		<div class="form-label-group text-left">
              <input type="text" name="phone" id="inputPhone" class="form-control" placeholder="전화번호" required>
              <label for="inputPhone">전화번호</label>
            </div>
            <button class="btn btn-lg bg-point btn-block findIdBtn" type="button">아이디 찾기</button>       

           
         </div> 
         
       </div>

     </div>
   </div>
 </div>  
 <script>
 $(document).on("click",".findIdBtn",e=>{
	 var name=$("input[name=name]").val().trim();
	 var phone=$("input[name=phone]").val().trim();
	 //유효성검사
	 if(name.length==0||phone.length==0){
		 alert("내용을 입력해주세요.");
	 }else{
	 //에이작스로 아이디 가져오기
	 $.ajax({
		 url:"${path}/findIdCheck.do",
		 data:{name:name,phone:phone},
		 dataType:"html",
		 success:(data)=>{//데이터는 *처리된 이메일
			 if(data!=""){
				 var idResult=`<div class="border rounded mb-3">
				 				<p class="mt-2">회원님의 아이디</p>
				 				<p>`+data+`</p>
				 				</div>`;				 
			 	$(".idModalBody").html(idResult);
			 }else{
				alert("가입되지 않은 정보입니다.");
			 }
		 }
	 });
	 
	 
	 
	 }
 });
 
 </script>