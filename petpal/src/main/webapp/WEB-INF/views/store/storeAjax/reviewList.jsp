<%@page import="com.project.petpal.member.model.vo.Member"%>
<%@page import="com.project.petpal.store.model.vo.Review"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/> 
<%
	List<Review> reviewList=(List) request.getAttribute("reviewList");
	Member loginMember=(Member)session.getAttribute("loginMember");
%>

  <%if(reviewList==null){ %>
          <p>작성된 리뷰가 없습니다</p>
          <!--리뷰창-->
          <%}else{
        	  for(Review r:reviewList) {%>
          
           <article class="px-4 mb-3 pb-3 border-bottom">
             <div class="pl-2 d-flex justify-content-between">
              <div class="row">
                <a href="" class="rounded-circle pr-3">
                  <img src="${path }/resources/upload/member/profile/<%=r.getImg() %>" width="30px;">
                </a>                  
                <div style="font-size: 12px;">
                  <a href="${path }/user/moveUserInfo.do?memberNo="+<%=r.getMemberNo() %> class="my-0 text-black"><%=r.getNickName() %></a>
                  <div >
                    <span class="text-hgh">
                  		<%
                  			int star=r.getStar();
                  			for(int i=0;i<5;i++){
                  				if(i<star){%>
                  					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
								  <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
								</svg>              				
                  				<%}else{%>
                  					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star" viewBox="0 0 16 16">
								  <path fill-rule="evenodd" d="M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.523-3.356c.329-.314.158-.888-.283-.95l-4.898-.696L8.465.792a.513.513 0 0 0-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767l-3.686 1.894.694-3.957a.565.565 0 0 0-.163-.505L1.71 6.745l4.052-.576a.525.525 0 0 0 .393-.288l1.847-3.658 1.846 3.658a.525.525 0 0 0 .393.288l4.052.575-2.906 2.77a.564.564 0 0 0-.163.506l.694 3.957-3.686-1.894a.503.503 0 0 0-.461 0z"/>
								</svg>
                  				<%}
                  			}
                  		%>
                  	</span> 
                  	<span><%=r.getReviewDate() %></span>
                  </div>
                </div>
               </div>
               <%if(loginMember!=null&&r.getMemberNo().equals(loginMember.getMemberNo())){ %>
               <div>
               	<button type="button" class="reviewEdit btn btn-link p-0 pr-1 text-black-50">수정</button>
               	<button type="button" class="reviewDelete btn btn-link p-0 pr-1 text-black-50">삭제</button>
               	<input type="hidden" class="reviewNum" value="<%=r.getReviewNo() %>"/>
               </div>
               <%}else if(loginMember!=null&&(loginMember.getMemberNo()).equals("63")){%>
               <div>
               	<button type="button" class="reviewDelete btn btn-link p-0 pr-1 text-black-50">삭제</button>
               	<input type="hidden" class="reviewNum" value="<%=r.getReviewNo() %>"/>
               </div>
               <%} %>
             </div>
             <div class="my-2"> 
                <%if(r.getColor()!=null ){
             		if(r.getProductSize()!=null){%>
				<%=r.getColor() %> / <%=r.getProductSize() %>
             		<%}else{%>
             			<%=r.getColor() %>
             		<%}
             	}else{
             		if(r.getProductSize()!=null){%>
             			<%=r.getProductSize() %>
             		<%}
             	}%>	
             </div>
             <%if(r.getFileName()!=null){ %>
             	<img src="${path }/resources/upload/store/review/<%=r.getFileName() %>"  width="150px" class="rounded mb-3">
             <%} %>
             <p><%=r.getContent() %></p>
             
               <%if(r.getReviewComment()!=null){ %>
               <div class="text-right">
                <c:if test="${loginMember.memberNo eq '63'}">
                 <a class="replyEdit text-black-50 text-right pb-2 pr-4"  style="font-size: 14px;" style="cursor: pointer;">
		                    답글 수정
		      </a>
                </c:if>
                <a class="replyShow text-hgh text-right pb-2" style="font-size: 14px;" style="cursor: pointer;">
                  <strong>판매자 답글</strong>
                </a>
            </div> 
              <div class="reply collapse py-3 mt-2 pr-3 bg-light rounded text-right">
                <p class="mb-0"><%=r.getReviewComment() %> </p>
              </div>

              <form class="replyEditFrm collapse  mt-2 p-3 pb-0 bg-light rounded text-right">
                <div class="form-group">
                  <textarea class="form-control" rows="2" style="resize:none;"><%=r.getReviewComment() %></textarea>
                  <button type="button" class="replyEditBtn btn btn-primary mt-2">완료</button>
                  <input type="hidden" name="productNo" value="${product.productNo }"/>
                  <input type="hidden" name="reviewNo" value="<%=r.getReviewNo() %>"/>
                </div> 
              </form>
               <%}else{ %>
               <div class="text-right">
                <c:if test="${loginMember.memberNo eq '63'}">
                	<a class="replyWrite text-black-50 text-right pb-2 pr-4"  style="font-size: 14px;" style="cursor: pointer;">답글 작성</a>
                </c:if>
                <a class="text-black-50 text-right pb-2" style="font-size: 14px;" style="cursor: pointer;"><strong>판매자 답글</strong></a>
             </div>
             <form class="replyWriteFrm collapse  mt-2 p-3 pb-0 bg-light rounded text-right" >
                <div class="form-group">
                  <textarea class="form-control" rows="2" style="resize:none;" placeholder=""></textarea>
                  <button type="button" class="replyWriteBtn btn btn-primary mt-2">완료</button>
                  <input type="hidden" name="productNo" value="${product.productNo }"/>
                  <input type="hidden" name="reviewNo" value="<%=r.getReviewNo() %>"/>
                </div> 
              </form>
               <%} %>            
           </article>
			<%}
           };%>
           <div class="mt-3 text-center">${reviewPageBar }</div>
           
<script>

//리뷰 collapse 작동
$(".replyEdit").on("click",e=>{
  $(e.target).parents("article").find('form.replyEditFrm').collapse('toggle'); 
  $(e.target).parents("article").find('div.reply').collapse('hide');
});
$(".replyShow").on("click",e=>{
  $(e.target).parents("article").find('div.reply').collapse('toggle'); 
  $(e.target).parents("article").find('form.replyEditFrm').collapse('hide');
});   
$(".replyWrite").on("click",e=>{
  $(e.target).parents("article").find('form.replyWriteFrm').collapse('toggle');
});     

//리뷰 삭제
$(".reviewDelete").on("click",e=>{
	let reviewNo=$(e.target).siblings(".reviewNum").val();
	location.replace("${path}/store/deleteReview.do?reviewNo="+reviewNo+"&productNo="+productNo);
});

//리뷰 답변 작성
$(document).on("click",".replyWriteBtn",e=>{
	if($(e.target).siblings("textarea").val().trim().length==0){
			alert("작성할 내용을 작성해주세요.");
	}else{
		$(e.target).siblings("textarea").attr("name","reviewComment");
		$(e.target).parents(".replyWriteFrm").attr("action","${path}/store/reviewComment.do").submit();
	}
});  

//리뷰 답변 수정
$(document).on("click",".replyEditBtn",e=>{
	if($(e.target).siblings("textarea").val().trim().length==0){
		alert("수정할 내용을 작성해주세요.");
	}else{
		$(e.target).siblings("textarea").attr("name","reviewComment");
		$(e.target).parents(".replyEditFrm").attr("action","${path}/store/reviewComment.do").submit();
	}
});

//리뷰 수정 모달
$(".reviewEdit").on("click",e=>{
	let reviewNo=$(e.target).siblings(".reviewNum").val(); 
	$.ajaxSettings.traditional = true;
		$.ajax({
		url: "${path}/store/moveReviewEdit.do",
		data:{productNo:productNo,reviewNo:reviewNo},
		dataType:"html",
		success:(data) => {
			$(".pdtModal").html(data);
     		$('div.modal').modal(); 
		}
		});       	
});   

</script>