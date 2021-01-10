<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/> 
 <jsp:include page="/WEB-INF/views/common/commonLink.jsp" />

<div class="modal fade" id="pwModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
              <input type="text" name="email" id="inputEmail" class="form-control" placeholder="이메일" required autofocus>
              <label for="inputEmail">이메일</label>
            </div>
            <button class="btn btn-lg bg-point btn-block findIdBtn" type="button">인증번호 전송</button>      
            <hr>
     		<div class="form-label-group text-left">
              <input type="text" name="number" id="inputNum" class="form-control" placeholder="인증번호" required>
              <label for="inputNum">인증번호</label>
            </div>
            

           
         </div> 
         
       </div>

     </div>
   </div>
 </div>  