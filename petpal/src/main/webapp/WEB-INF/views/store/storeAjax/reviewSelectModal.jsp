<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/> 
 <jsp:include page="/WEB-INF/views/common/commonLink.jsp" />

 <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title pl-3" id="exampleModalLabel">상품 리뷰</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <form class="modal-body offset-1 col-10" onsubmit="return fn_radio();" action="" >
          <div class="border-bottom">
            <label class="form-group row pb-3 d-flex align-items-center ml-5 mb-0 mt-2">
              <input type="radio" name="check" value="강아지" class="form-check-input"/>
              <img src="../final/img/cc.webp" class="rounded d-block w-100 col-4">
              <div class="align-middle">
                <p class="mb-0">강아지 고양이 기절 댕냥쿠션</p>
                <p class="mb-0">회색 스몰</p>
              </div>
              <input type="hidden" class="productNo"/>
              <input type="hidden" class="detailNo"/>
            </label>
          </div>  
          <div class="border-bottom">
            <label class="form-group row pb-3 d-flex align-items-center ml-5 mb-0 mt-2">
              <input type="radio" name="check" value="강아지" class="form-check-input"/>
              <img src="../final/img/cc.webp" class="rounded d-block w-100 col-4">
              <div class="align-middle">
                <p class="mb-0">강아지 고양이 기절 댕냥쿠션</p>
                <p class="mb-0">회색 스몰</p>
              </div>
              <input type="hidden" class="productNo"/>
              <input type="hidden" class="detailNo"/>
            </label>
          </div> 
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
            <button type="submit" class="btn btn-primary">선택</button>
          </div>
        </form>
      </div>
    </div>
    <script>
      function fn_radio(){
        if($("input[name=check]:checked").length==0){
          alert("후기를 남길 상품을 선택하세요.")
          return false;
        }else{
          let radio=$("input[name=check]:checked");
          let pNo=radio.siblings(".productNo");
          let dNo=radio.siblings(".detailNo");
          pNo.attr("name",pNo.attr("class"));
          dNo.attr("name",dNo.attr("class"));
          return true;
        };
      };

    </script>