<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/> 

<c:forEach var="q" items="${qnaList }">
    <article class="qna border-bottom py-3">
      <div class="row d-flex justify-content-between pl-2"> 
      	
        <p class="mb-0"style="font-size: 14px;"><c:out value="${q.category }"/> |  
        <c:if test="${empty q.qnaComment}">
        	<span class="text-black-50" >답변전</span>
        </c:if>
        <c:if test="${not empty q.qnaComment }">
        	<span class="text-hgh"> 답변완료</span>
        </c:if>
        <c:if test="${q.secret eq 'Y' }">
        	 <span class="text-black-50">
        	 	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="mb-1 bi bi-lock-fill" viewBox="0 0 16 16">
             <path d="M2.5 9a2 2 0 0 1 2-2h7a2 2 0 0 1 2 2v5a2 2 0 0 1-2 2h-7a2 2 0 0 1-2-2V9z"/>
             <path fill-rule="evenodd" d="M4.5 4a3.5 3.5 0 1 1 7 0v3h-1V4a2.5 2.5 0 0 0-5 0v3h-1V4z"/>
       </svg> 
    		</span>
        </c:if>
        </p>
        <c:if test="${(q.memberNo ne loginMember.memberNo) and (loginMember.memberNo eq '63') }">
        	<div class="text-right mr-4">
        <button type="button" class="qnaDelete btn btn-link p-0 pr-1 text-black-50">삭제</button>			
         </div>
        </c:if>
        <c:if test="${q.memberNo eq loginMember.memberNo }">
         	<div class="text-right mr-4">
           <button type="button" class="qnaEdit btn btn-link p-0 pr-1 text-black-50">수정</button>
        <button type="button" class="qnaDelete btn btn-link p-0 pr-1 text-black-50">삭제</button>			
         </div>
        </c:if>			                	                
      </div>
      <p class="text-black-50" style="font-size: 12px;"><c:out value="${q.nickName}"/> | <span><c:out value="${q.qnaDate}"/></span></p>
      
      <c:choose>
       <c:when test="${(q.memberNo eq loginMember.memberNo) or (loginMember.memberNo eq '63') or (q.secret eq 'N')}">
        <div class="row ml-2">
          <p class="text-hgh mr-3"><strong>Q</strong></p>
          <pre><c:out value="${q.content}"/></pre>		                  
        </div> 
        <c:if test="${(empty q.qnaComment) and (loginMember.memberNo eq '63')}">
         <a class="answerWrite text-black-50 text-right pb-2 pr-4 mb-1 ml-2" style="font-size: 12px;" role="button" style="cursor: pointer;">답글 달기</a>
         <form class="answerWriteFrm mt-2 collapse" >
         	  <input type="hidden" name="productNo" value="${product.productNo }"/>
          <input type="hidden" class="qnaNo" name="qnaNo" value="${q.qnaNo }"/>
            <div class="form-group row ml-2">
              <p><strong class="text-hgh mr-2">A</strong></p>
              <div class="col-11"> 
                <textarea class="writeText form-control" name="qnaComment" rows="2" style="resize:none;"></textarea>
                <button type="button" class="answerWriteBtn btn bg-hgh text-white mt-2 offset-10 col-2">완료</button>
              </div>
            </div> 
         </form>
        </c:if>
        <c:if test="${(not empty q.qnaComment)}">
         <div class="answer row ml-2">
           <p class=""><strong class="text-hgh mr-2">A</strong></p>
           <div class="col-11"> 
             <div class="d-flex justify-content-between mb-2">
               <p class="text-black-50 m-0" style="font-size: 12px;"><c:out value="${q.commentDate }"/></p>
              	  <c:if test="${loginMember.memberNo eq '63' }">
                  <div class="row">
                    <a class="answerEdit text-black-50 mr-2" style="font-size: 12px;" role="button" style="cursor: pointer;">답글 수정</a>
                    <a class="answerDelete text-black-50 mr-2" style="font-size: 12px;" role="button" style="cursor: pointer;">답글 삭제</a>
                  </div> 
             	  </c:if>
             </div>
             <pre class="content"><c:out value="${q.qnaComment}"/></pre>
           </div>
         </div> 
         
           <form class="answerEditFrm collapse" >
             <input type="hidden" name="productNo" value="${product.productNo }"/>
             <input type="hidden" class="qnaNo" name="qnaNo" value="${q.qnaNo }"/>
             <div class="form-group row ml-2">
               <p class=""><strong class="text-hgh mr-2">A</strong></p>
               <div class="col-11 mt-2"> 
                 <textarea class="writeText form-control" name="qnaComment" rows="3" style="resize:none;"><c:out value="${q.qnaComment}"/></textarea>
                 <div class="text-right">
                   <button type="button" class="editCancel btn btn-link text-hgh mt-2">취소</button>
                   <button type="button" class="answerEditBtn btn bg-hgh text-white mt-2">완료</button>
                 </div>
               </div>
             </div> 
           </form>
        </c:if>		              
       </c:when>
       <c:otherwise>
       	 <div class="row ml-2">
          <p class="text-hgh mr-3"><strong>Q</strong></p>
          <p class="text-black-50"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-lock-fill" viewBox="0 0 16 16">
            <path d="M2.5 9a2 2 0 0 1 2-2h7a2 2 0 0 1 2 2v5a2 2 0 0 1-2 2h-7a2 2 0 0 1-2-2V9z"/>
            <path fill-rule="evenodd" d="M4.5 4a3.5 3.5 0 1 1 7 0v3h-1V4a2.5 2.5 0 0 0-5 0v3h-1V4z"/>
          </svg> </p>
          <span class="text-black-50 ml-2 pt-1">비밀글 입니다.</span>
        </div> 
       </c:otherwise>
      </c:choose>
    </article>
  </c:forEach>
  <div class="mt-3 text-center">${qnaPageBar }</div>
  
  
  <script>
//문의 collapse 작동
$(".answerWrite").on("click",e=>{              
     $(e.target).parents("article").find('form.answerWriteFrm').collapse('toggle'); 
});
$(".answerEdit").on("click",e=>{
     $(e.target).parents("article").find("div.answer").toggleClass("d-none");
     $(e.target).parents("article").find('form.answerEditFrm').collapse('toggle'); 
});   
$(".editCancel").on("click",e=>{
     $(e.target).parents("article").find("div.answer").toggleClass("d-none");
     $(e.target).parents("article").find('form.answerEditFrm').collapse('toggle'); 
}); 
   
//문의 삭제
$(".qnaDelete").on("click",e=>{
 	let qnaNo=$(e.target).parents("article.qna").find("input.qnaNo").val();
 	location.replace("${path}/store/deleteQna.do?productNo="+productNo+"&qnaNo="+qnaNo);
});
 
//문의 답변 달기
$(".answerWriteBtn").on("click",e=>{
	if($(e.target).siblings(".writeText").val().trim().length==0){
		alert("답변 내용을 입력하세요.")
	}else{
		$(e.target).parents("form.answerWriteFrm").attr("action","${path}/store/writeQnaComment.do").submit();
	}	
});	
 
//문의 답변 수정
  $(".answerEditBtn").on("click",e=>{
 	  let frm=$(e.target).parents(".answerEditFrm");
 	  if(frm.find(".writeText").val().trim().length==0){
			alert("수정할 답변 내용을 입력하세요.")
		}else{
			frm.attr("action","${path}/store/editQnaComment.do").submit();
		}
 });
 
 //문의 답변 삭제
 $(".answerDelete").on("click",e=>{
 	let qnaNo=$(e.target).parents("article.qna").find("input.qnaNo").val();
 	location.replace("${path}/store/deleteQnaComment.do?productNo="+productNo+"&qnaNo="+qnaNo);
 });
 
 
  </script>