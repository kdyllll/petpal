<%@page import="com.project.petpal.store.model.vo.Stock"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/> 
<%
	List<String> detailNoList=(List)request.getAttribute("detailNoList");
	List<Stock> stockList=(List)request.getAttribute("stockList");
%>
 <div class="modal fade" id="reviewSelect" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title pl-3" id="exampleModalLabel">상품 리뷰</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body offset-1 col-10"  >
        <p class="h5 col-12 border-bottom pb-3 mb-3">리뷰를 작성할 구매 내역을 선택하세요.</p>
         <% for(int i=0;i<detailNoList.size();i++){%>
	          <div class="border-bottom">
	            <label class="form-group row pb-3 d-flex align-items-center ml-4 mb-0 mt-2">
	              <input type="radio" name="check" value="강아지" class="form-check-input"/>
	              <img src="${path }/resources/upload/product/detail/${img.imgName}" class="rounded d-block w-100 col-4">
	              <div class="align-middle">
	                <p class="mb-0"><c:out value="${product.productName }"/></p>
	                <p class="mb-0">${stockList.get(i).color } ${stockList.get(i).productSize }</p>
	              </div>
	              <input type="hidden" class="productNo" value="<%=stockList.get(i).getProductNo()%>"/>
	              <input type="hidden" class="detailNo" value="<%=detailNoList.get(i) %>"/>
	            </label>
	          </div>  
     	 <%} %>
          <div class="modal-footer">
            <button type="button" class="close btn btn-secondary" data-dismiss="modal">취소</button>
            <button type="button" class="btn btn-primary" onclick="fn_goReview();">선택</button>
          </div>
        </div>
      </div>
    </div>
    <script>
      function fn_goReview(){
        if($("input[name=check]:checked").length==0){
          alert("후기를 남길 상품을 선택하세요.")
        }else{
          let radio=$("input[name=check]:checked");
          let pNo=radio.siblings(".productNo").val();
          let dNo=radio.siblings(".detailNo").val();
          $('#reviewSelect').modal('hide');      
          fn_reviewWrite(pNo,dNo);
        };
      };

    </script>