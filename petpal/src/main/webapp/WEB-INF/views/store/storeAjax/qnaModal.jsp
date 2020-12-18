<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/> 

<div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title pl-3" id="exampleModalLabel">상품 문의</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body offset-1 col-10 pb-0">
        <form>
          <div class="form-group row pb-3 border-bottom d-flex align-items-center">
            <img src="../final/img/cc.webp" class="rounded d-block w-100 col-4">
            <p class="align-middle mb-0">강아지 고양이 기절 댕냥쿠션</p>
            <input type="hidden" name="productNo"/>
          </div>
          <div class="form-group">
            <label for="message-text" class="col-form-label"><strong>문의 분류</strong></label>
            <select class="form-control col-3" id="exampleFormControlSelect1">
              <option disabled selected>분류</option>
              <option>상품</option>
              <option>배송</option>
              <option>반품</option>
              <option>교환</option>
              <option>환불</option>
              <option>기타</option>                          
            </select>
          </div>
          <div class="form-group">
            <label for="message-text" class="col-form-label"><strong>문의 내용</strong></label>
            <textarea class="form-control" rows="5" id="message-text" style="resize:none;"></textarea>
           </div>
           <div class="form-group d-flex justify-content-end">
           <label class=""><input type="checkbox" class="mr-2 form-check-input"/>비밀글</label>
           </div>
         </form>
       </div>
       <div class="modal-footer">
         <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
         <button type="button" class="btn btn-primary">완료</button>
       </div>
     </div>
   </div>
 </div>  
