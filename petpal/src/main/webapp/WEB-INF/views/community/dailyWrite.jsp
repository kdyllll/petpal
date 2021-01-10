<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/> 
 <jsp:include page="/WEB-INF/views/common/commonLink.jsp" />
<style>
    input:focus {outline:none;}
    /* 말풍선 모양 css */
    .bubble {
      position: relative;
      background: rgba(255, 255, 255, 0.8);
      z-index: 500;
    }

</style>
</head>
<body class="bg-white">
<jsp:include page="/WEB-INF/views/common/header.jsp" />
  
  <main role="main" style="min-height:100vh;" class="pt-5">
    <div class="row mb-5 mb-lg-1">
        <form id="writeFrm" class="container mt-5 col-lg-8" method="post" enctype="multipart/form-data">
            <p class="h2 mb-5 mt-2"><strong>일상 올리기</strong></p>
            <div class="form-group row px-3" id="imgContainer">  
               
            </div>
            
            <!--설명-->
            <div class="col-12 mt-3 px-0">                        
              <textarea class="content form-control" name="content" rows="5" placeholder="설명을 입력해주세요" style="resize: none;" required></textarea>                   
            </div>
                
            <!--해시태그-->
            <div id="tagCon" class="mt-3 pl-2 col-12">
              <div class="tagBox bg-light rounded text-secondary d-inline-block pl-1 py-1 ml-1 mb-2">                                                      
                  #<input name="hashtag" style="box-sizing: content-box; width: 75px;" onKeypress="javascript:if(event.keyCode==13) {$('.hashtag').focusout()}" type="text" class="hashtag border-0 bg-transparent " placeholder="해시태그" aria-label="해시태그" aria-describedby="basic-addon1">
                  <span class="d-none delete text-secondary ">
                      <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-x pb-1 ml-0" style="font-size: 25px; cursor:pointer;" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                          <path fill-rule="evenodd" d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
                      </svg>
                  </span>
              </div>
            </div>
            
        </form>`
    </div>
    <div class="mb-5 pb-5" style="height:30px;"></div>
    <!-- 모달창 -->
    <div class="modal fade" id="plusTagModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">상품등록</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <form>
              <div class="form-group">
                <label for="message-text" class="col-form-label">상품명:</label>
                <input type="text" class="form-control" id="productNameInput" placeholder="상품명이나 브랜드를 입력해주세요" list="productData" autocomplete="off">
                <datalist id="productData"></datalist>
              </div>
            </form>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
            <button type="button" class="btn btn-primary" id="insert" data-dismiss="modal">등록</button>
          </div>
        </div>
      </div>
    </div>
 </main>
 <div class="fixed-bottom py-3 d-flex justify-content-end" style="background-color: rgba(255, 255, 255, 0.76);">
    <button type="button" id="btn" class="btn btn-lg btn-primary mr-5 col-2">작성</button>
 </div>
</body>
<script>
 var path="${path}";
</script>
<script src="${path }/resources/js/hashtag.js"></script>
<script src="${path }/resources/js/plusTag.js"></script>
<script src="${path }/resources/js/daily.js"></script>
<script>                      
 $(function(){
   fn_add();
   
   
     $("#btn").on("click",e=>{ 

    	 //등록 누르면 form 전송
    	 //유효성 검사
    	 //사진 있는지, 글 있는지
    	   if($(".imgBox").length==0){
	    	  alert("사진을 올려주세요.");
    	   }else if($(".content").val().trim()==""){
    		  alert("내용을 입력하세요.");
    	   }else{
    	       $("input[type=file]").each((i,item)=>{        
    	           if(item.value.length!=0){         
    	            //등록 누르면 사진 별 +버튼의 상품 이름 input태그에 몇번째 사진의 좌표인지 name 부여
    	            var imgBox=$(item).parent("label").next(".imgBox");
    	            imgBox.find("input[name=index]").each((j,item2)=>{        
    	              $(item2).val(i);           
    	            });          
    	           };
    	           
    	         });
    	      	 $(".hashtag").attr("name","");
    	      	 
    		  $("#writeFrm").attr("action","${path }/daily/dailyWriteEnd.do").submit();
    	   }
         
     });

 
 });

</script>
</html>