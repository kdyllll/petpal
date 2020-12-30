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
/*     .bubble:after {
      bottom: 100%;
      left: 50%;
      border: solid transparent;
      content: "";
      height: 0;
      width: 0;
      position: absolute;
      pointer-events: none;
      border-color: rgba(209, 209, 209, 0);
      border-bottom-color:rgba(255, 255, 255, 0.8);
      border-width: 5px;
      margin-left: -5px;
    } */
      
</style>
</head>
<body class="bg-white">
<jsp:include page="/WEB-INF/views/common/header.jsp" />
  
  <main role="main" style="min-height:100vh;">
  	
    <div class="row mb-5 mb-lg-1">
        <form id="writeFrm" class="container mt-5 col-lg-8" method="post" enctype="multipart/form-data">
        	<c:forEach var="i" items="${imgList }" varStatus="vs">
        		<input type="hidden" class="change" name="${vs.index }" value="none"/>
        	</c:forEach>
            <p class="h2 mb-5 mt-2"><strong>일상 수정하기</strong></p>
            <div class="form-group row px-3" id="imgContainer">  
	             	<!-- 업로드 버튼 -->
	            	<div id="uploadLabel" class="col-12 m-0 d-none">                              
	                   <label class="btn d-flex justify-content-center align-items-center addPic rounded text-center bg-light btn-block mt-3" style="cursor: pointer; height:50px;">
	                     <input name="pic" class="d-none upload" id="upload" type="file" accept="images/*" required/>
	                     <svg width="40px" height="40px" viewBox="0 0 16 16" class="bi bi-camera-fill text-secondary" fill="currentColor" xmlns="http://www.w3.org/2000/svg" style="font-size: 60px;">
		                      <path d="M10.5 8.5a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0z"/>
		                      <path fill-rule="evenodd" d="M2 4a2 2 0 0 0-2 2v6a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V6a2 2 0 0 0-2-2h-1.172a2 2 0 0 1-1.414-.586l-.828-.828A2 2 0 0 0 9.172 2H6.828a2 2 0 0 0-1.414.586l-.828.828A2 2 0 0 1 3.172 4H2zm.5 2a.5.5 0 1 0 0-1 .5.5 0 0 0 0 1zm9 2.5a3.5 3.5 0 1 1-7 0 3.5 3.5 0 0 1 7 0z"/>
		                  </svg>
	                     <span class="h5 text-secondary align-middle mb-0 ml-3"><strong>추가하기</strong></span><span class="text-secondary ml-1">*최대 5장</span>
	                   </label>     
	                 </div>                       
	            
	            
	            <!-- 사진 미리보기 들 -->
	            <c:forEach var="i" items="${imgList }" varStatus="vs">
	            <div class="imgBox position-relative rounded col-12 p-0">    
	            	<input type="hidden" class="picNum" value="${vs.index }"/>            		
	                <img src="${path }/resources/upload/community/daily/${i.dailyImgName}" class="col-12 p-0 rounded" style="width:100%;">	
	                <!-- 사진 수정, 삭제버튼 -->
	                <div class="buttonCon position-absolute rounded" style="bottom:0; left:0; background:linear-gradient(to top,rgba(0, 0, 0, 0.5),rgba(255, 255, 255, 0)); width:100%;">
	                     <button type="button" class="delete btn ml-3">
	                       <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-trash text-white" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
	                         <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
	                         <path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4L4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
	                       </svg>
	                     </button>
	                     <label>
		                     <input name="update" class="d-none updatePic" type="file" accept="images/*" required/>
		                     <button type="button" class="update btn ml-3">
		                     	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-counterclockwise text-white" viewBox="0 0 16 16">
								  <path fill-rule="evenodd" d="M8 3a5 5 0 1 1-4.546 2.914.5.5 0 0 0-.908-.417A6 6 0 1 0 8 2v1z"/>
								  <path d="M8 4.466V.534a.25.25 0 0 0-.41-.192L5.23 2.308a.25.25 0 0 0 0 .384l2.36 1.966A.25.25 0 0 0 8 4.466z"/>
								</svg>
		                     </button>
	                     </label>
	                </div>
	                <script>
	                	$(document).on("click","button.delete",e=>{
	                		var num=$(e.target).parents(".imgBox").find(".picNum").val();
	                		$(".change").each((i,item)=>{
	                			if($(item).attr("name")==num){
	                				$(item).val("delete");
	                			}
	                		});
	                		$(e.target).parents(".imgBox").remove();
	                	});
	                	$(document).on("click","button.update",e=>{
	                		var num=$(e.target).parents(".imgBox").find(".picNum").val();
	                		$(".change").each((i,item)=>{
	                			if($(item).attr("name")==num){
	                				$(item).val("update");
	                			}
	                		});
	                	});
	                	$(".updatePic").on("change",e=>{
	                		 $.each(e.target.files,(i,v)=>{
	                			 let reader=new FileReader();
	                             reader.onload=e=>{                              
	                                 $(e.target).parents(".imgBox").find("img").attr("src",e.target.result);
	                             }
	                             reader.readAsDataURL(v);
	                		 };
	                		 }
	                	});
	                
	                </script>
	                
	                <!-- 이미지와 연결된 상품태그들 -->				                 
					 <c:forEach var="c" items="${coordList }"> 
					 	<c:if test="${c.DAILYIMGNO eq i.dailyImgNo }">       
					 		<c:set var="yy" value="${c.YCODE +5 }"/>  
					 		<c:set var="xx" value="${c.XCODE -15 }"/> 
							<div class="plusTag">
				                <svg class="plusBtn position-absolute" width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-plus-circle-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg"
				                    style="top:${c.YCODE}%; left:${c.XCODE }%;">
				                    <path fill-rule="evenodd" d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM8.5 4.5a.5.5 0 0 0-1 0v3h-3a.5.5 0 0 0 0 1h3v3a.5.5 0 0 0 1 0v-3h3a.5.5 0 0 0 0-1h-3v-3z"/>
				                </svg>
				                <div class="bubble rounded shadow-sm col-4 col-lg-4 position-absolute px-1" style="top:${yy}%; left:${xx }%;">
				                  <div class="row d-flex flex-wrap m-0 py-2" style="width:100%;">
				                  	<c:forEach var="pi" items="${pImgList }">
					                  	<c:if test="${pi.productNo eq c.PRODUCTNO }">
					                    	<img class="col-4 border p-0 m-0 ml-1" src="${path }/resources/upload/product/detail/${pi.imgName}">
					                    </c:if>
				                    </c:forEach>
				                    <div class="p-1 ml-2 mb-0 col-7">
				                    	<p class=""><c:out value="${c.PRODUCTNAME }"/></p>
				                    	<div class="d-flex justify-content-end">
					                    	<button type="button" class="deleteTag btn p-0 row pr-3">
						                      <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-trash text-dark" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
						                        <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
						                        <path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4L4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
						                      </svg>
						                    </button>
					                    </div>
				                    </div>
				                  </div>
				                </div>
				             </div>
	                	</c:if>
	                </c:forEach>
	               </div><!-- relative -->
	              </c:forEach>
	              
	              <label class="addPic rounded text-center bg-light btn btn-block mt-3" style="cursor: pointer; height:50px;">
                     <input name="pic" class="d-none upload" type="file" accept="images/*"/>
                     <p class="h5 text-secondary align-middle mb-0 mt-1"><strong>추가하기</strong></p>
                   </label>
              </div><!-- imgContainer -->
              
              
            <!--설명-->
            <div class="col-12 mt-3 px-0">                        
              <textarea class="form-control" name="content" rows="5" placeholder="내용을 입력해주세요" style="resize: none;" required><c:out value="${daily.CONTENT }"/></textarea>                   
            </div>
                
            <!--해시태그-->
            <div id="tagCon" class="mt-3 pl-2 col-12">
	            <!-- 기존 해시태그 -->
	            <c:forEach var="h" items="${hashList}">                            
	             <div class="tagBox bg-light rounded text-secondary d-inline-block pl-1 py-1 ml-1 mb-2">                                                      
	                  #<input name="hashtag" value="${h.hashContent }" readonly style="box-sizing: content-box;" type="text" class="hashtag border-0 bg-transparent " placeholder="해시태그" >
	                  <span class="delete text-secondary ">
	                      <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-x pb-1 ml-0" style="font-size: 25px; cursor:pointer;" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
	                          <path fill-rule="evenodd" d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
	                      </svg>
	                  </span>
	              </div>
	            </c:forEach>
            
              <!-- 새 해시태그 입력 -->
              <div class="tagBox bg-light rounded text-secondary d-inline-block pl-1 py-1 ml-1 mb-2">                                                      
                  #<input name="hashtag" style="box-sizing: content-box; width: 75px;" onKeypress="javascript:if(event.keyCode==13) {$('.hashtag').focusout()}" type="text" class="hashtag border-0 bg-transparent " placeholder="해시태그" aria-label="해시태그" aria-describedby="basic-addon1">
                  <span class="d-none delete text-secondary ">
                      <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-x pb-1 ml-0" style="font-size: 25px; cursor:pointer;" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                          <path fill-rule="evenodd" d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
                      </svg>
                  </span>
              </div>
            </div>
            
        </form>
    </div>
    <div class="mb-5 pb-5" style="height:30px;"></div>
    <!-- 모달창 -->
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
                <input type="text" class="form-control" id="message-text" placeholder="상품명이나 브랜드를 입력해주세요" list="productData" autocomplete="off">
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

<jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>
<script>
$(".bubble").hide();

//해시태그!
// 글자 수에 따라 input태그 크기 늘어나기
 $('.hashtag').on('keydown',e=>{
    var value = $(e.target).val().trim();
    $("#tagCon").append('<div id="virtual_dom" style="display: inline-block;">' + value + '</div>'); 
    if($('#virtual_dom').width()<$("#tagCon").width()-70){
    var inputWidth =  $('#virtual_dom').width()+15; 
    }else{
      var inputWidth=$("#tagCon").width()-70;
    }
    $(e.target).css('width', inputWidth); 
    $('#virtual_dom').remove();
  });

// 해시태그 작성 후 새 해시태그 추가
$('.hashtag').focusout(function(e) {  
	 let cnt=0;
	 $("input[name=hashtag]").each((i,item)=>{//해시태그 중복 입력 확인
			 if($(item).val().trim()==$(e.target).val().trim()){
				 cnt++;
			 }
	 });
  if($(e.target).val().trim().length==0){
    //아무일도 일어나지 않음!
  }else if(cnt>1){//중복되었다면
	   alert("해시태그는 중복해서 입력할 수 없습니다.");
  	   $(e.target).val("");
  }else if($(e.target).hasClass("hashtag") === true){
    //해시태그 작성 태그 복제
    var clone=$(e.target).parents(".tagBox").clone(true);
    clone.find(".hashtag").val(""); 
    clone.find(".hashtag").css("width","75px");   
    //태그 수정 불가능하게 막음                     
    $(e.target).attr("readonly",true);
    $(e.target).css("width",$(e.target).width()-15);
    //x버튼 보이게
    $(e.target).next("span.delete").removeClass("d-none");
    //새 해시태그 입력창 추가
    $("#tagCon").append(clone);
    $(e.target).removeClass("hashtag");  
    if(e.originalEvent==undefined){//엔터키로 눌렀을때
        $("#tagCon").find(".hashtag").focus();
    } 
  }                                         
});
// 해시태그 x버튼 누르면 삭제
$(".delete").click(function(e){
  $(e.target).parents(".tagBox").remove();
});


//말풍선 호버
    //+에 마우스 올렸을 때/떠났을 때 말풍선 보이고 숨기기
    $(document).on('mouseenter',".plusBtn",e=>{  //동적 처리에는 hover를 못씀	
      //console.log("마우스 들어옴 mouseenter/mouseover");
      $(e.target).siblings(".bubble").show();
    });
    $(document).on('mouseleave',".plusBtn",e=>{
      //console.log("마우스 떠남 mouseleave/mouseout");
      $(e.target).siblings(".bubble").hide();
    });

</script>
</html>