<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/> 

<div class="modal fade" id="review" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<form id="reviewFrm" action="${path }/store/reviewEnd.do" onsubmit="return fn_complete();" method="post" enctype="multipart/form-data" class="modal-dialog">
	  <div class="modal-content">
	    <div class="modal-header">
	      <h5 class="modal-title pl-3" id="exampleModalLabel">상품 리뷰</h5>
	      <button type="button" class="close" data-dismiss="modal" aria-label="Close" data-backdrop="false">
	        <span aria-hidden="true">&times;</span>
	      </button>
	    </div>
	    <div class="modal-body offset-1 col-10">
	      <div>
	        <div class="form-group pb-3 border-bottom ">
	          
	          <label for="exampleFormControlSelect1">내역 선택</label>
              <select class="form-control col-12" >
                <option disabled selected>구매 내역 선택</option>
                <c:forEach var="s" items="${stockList }">
                	<option value="${s.DETAILNO }">${s.COLOR } ${s.PRODUCTSIZE }  &nbsp;&nbsp;&nbsp; / &nbsp;&nbsp;&nbsp;  <fmt:formatDate value="${s.PAYDATE }" pattern="yy.MM.dd 구매"/></option>
                </c:forEach>
              </select>
              <input type="hidden" name="productNo" value="${product.productNo }"/>
	        </div>
	        
	        <div class="form-group">
	          <label for="recipient-name" class="col-form-label"><strong>별점 평가</strong></label>
	          <div>
	            <ul class="d-flex pl-2" style="list-style-type:none;">
                  <li class="pr-1">
                    <label>
                      <svg id="star1" width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-star-fill text-black-50" fill="currentColor" xmlns="http://www.w3.org/2000/svg" style="font-size: 25px;">
                        <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
                      </svg>
                      <input type="radio" name="star" value="1" class="d-none"/>   
                    </label>
                  </li>
                  <li class="pr-1">
                    <label>		             
                      <svg id="star2" width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-star-fill text-black-50" fill="currentColor" xmlns="http://www.w3.org/2000/svg" style="font-size: 25px;">
                        <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
                      </svg>
                      <input type="radio" name="star" value="2" class="d-none"/>
                    </label>
                  </li>
                  <li class="pr-1">
                    <label>
                      <svg id="star3"  width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-star-fill text-black-50" fill="currentColor" xmlns="http://www.w3.org/2000/svg" style="font-size: 25px;">
                        <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
                      </svg>
                      <input type="radio" name="star" value="3" class="d-none"/>
                    </label>
                  </li>
                  <li class="pr-1">
                    <label>		              
                      <svg id="star4" width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-star-fill text-black-50" fill="currentColor" xmlns="http://www.w3.org/2000/svg" style="font-size: 25px;">
                        <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
                      </svg>
                      <input type="radio" name="star" value="4" class="d-none"/>
                    </label>
                  </li>
                  <li class="pr-1">
                    <label>   
                      <svg id="star5" width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-star-fill text-black-50" fill="currentColor" xmlns="http://www.w3.org/2000/svg" style="font-size: 25px;">
                        <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
                      </svg>
                      <input type="radio" name="star" value="5" class="d-none"/>
                    </label>
                  </li>
                </ul>
		      </div>
		    </div>
		    
		    <div class="form-group">
		      <label for="message-text" class="col-form-label"><strong>사진 첨부</strong> <span class="text-black-50">최대 한장</span></label>
		      <div class="input-group mb-3">
		        <div class="custom-file" id="thumnail">
		          <input type="file" name="reviewImg" class="custom-file-input upload" id="inputGroupFile01" aria-describedby="inputGroupFileAddon01" accept="images/*">
		          <label class="custom-file-label" id="fileName" for="inputGroupFile01">Choose file</label>
		        </div>
		      </div>
		      <div id="imgContainer" class="row bg-light mx-1 d-none">
		        <img id="previewImg" class="col-6 offset-3">
		        <button type="button" class="btn btn-sm btn-outline-dark align-bottom p-0" onclick="fn_delete();" style="height: 20px;">삭제</button>
		      </div>                         
		    </div>
		    
		    <div class="form-group">
		      <label for="message-text" class="col-form-label"><strong>리뷰 작성</strong></label>
		      <textarea name="content" class="form-control" rows="5" id="content" style="resize:none;"></textarea>
          	</div>
          	
        </div>
      </div><!-- modal-body -->
      <div class="modal-footer">
        <button type="button" class="close btn btn-secondary" data-dismiss="modal" data-backdrop="false">취소</button>
        <button type="submit" class="btn btn-primary">완료</button>
      </div>
    </div><!-- modal-content -->
  </form>
</div>

 <script>
 	 //별점 태그 색 바꾸기!
	 //마우스 호버했을 때 별점 태그 색 바꿔주기
	 $("svg").hover(function(e){//마우스 올라갔을때
	   let targetId=$(e.target).attr("id");
	   let flag=true;
	   $("svg").each((i,item)=>{
	     if(flag){//푸른색
	       $(item).attr("class","bi bi-star-fill text-info");
	       if($(item).attr("id")==targetId){ //현재 마우스 올린 태그면 flag전환
	         flag=false;
	       }
	     }else{//검정색
	       $(item).attr("class","bi bi-star-fill text-black-50");
	     }
	   });
	 },function(e){//마우스 벗어났을때
	   fn_checked();
	 });
	
	 $("input[name=star]").on("click",e=>{
	   fn_checked();
	 });
	
	 //체크된 라디오 포함 이전 svg 색 주는 함수
	 function fn_checked(){
	   if($("input[name=star]:checked").length>0){ //체크된 라디오 태그가 있다면
	     let flag=true;
	     $("input[name=star]").each((i,item)=>{
	       if(flag){
	         $(item).prev("svg").attr("class","bi bi-star-fill text-primary");
	         if($(item).prop("checked")){ //체크된 라디오 차례가 되면 flag 전환
	           flag=false;
	         }
	       }else{
	         $(item).prev("svg").attr("class","bi bi-star-fill text-black-50");
	       }
	     });
	   }else{ //체크된 라디오가 없다면
	     $("input[name=star]").each((i,item)=>{
	       $(item).prev("svg").attr("class","bi bi-star-fill text-black-50");
	     });
	   };
	   
	 };
 	
      //사진 업로드
    $(document).on('change','.upload',function(e){      
      //사진 미리보기
      let reader = new FileReader();
      reader.onload = (e) => {
        $("#imgContainer").removeClass("d-none");
        $("#previewImg").attr("src", e.target.result);
        
      };
      reader.readAsDataURL($(e.target)[0].files[0]); //파일의 가상경로를 가져옴	

      //사진 이름
      let filename=$(e.target).prop('files')[0].name;
       $("#fileName").html(filename);
        
    });
	
    //사진 삭제
    function fn_delete(){
      $("#imgContainer").addClass("d-none");
      $("#previewImg").attr("src","");
      $("#fileName").html("Choose file");
      $(".upload").val("");
    };
 	
    
    //작성 유효성 검사
    function fn_complete(){
    	if($("input[name=star]:checked").length==0){
            alert("별점을 입력하세요.");   
            return false;
         }else if($("#content").val().trim().length==0){
        	 alert("후기 내용을 입력하세요.");
         	 return false;
         }else{
        	 return true;
         }
    };
    
     $(document).on("click",".close",e=>{
    	$(".modal").removeClass("fade");
    }); 
 </script>