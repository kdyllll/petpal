<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/> 
 <jsp:include page="/WEB-INF/views/common/commonLink.jsp" />
 <script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

</head>
<body class="bg-white">
<jsp:include page="/WEB-INF/views/common/header.jsp" />
  
  <main role="main" style="min-height: 100vh;">
  		<c:set value="${list[0] }" var="place"/>
		<section class="mt-5 pt-5">
			<div class="container">
				<div class="mb-5 mb-lg-1 ">
					<form id="updateFrm" class=" mt-5" method="post" enctype="multipart/form-data"
						action="${path}/place/placeUpdateEnd.do">
						<input type="hidden" value="${place.placeNo}" name="placeNo"/>
						<input type="hidden" value="${place.memberNo}" name="memberNo"/>
						<p class="col-12 h2 mb-5 mt-2">
							<strong>장소 후기 올리기</strong>
						</p>
						<div class="row">
							<div class="input-group mb-3 col-12 col-md-8">
								<div class="input-group-prepend" style="height: 40px;">
									<span class="input-group-text font-weight-bold"
										id="basic-addon1">&nbsp;제 목&nbsp;</span>
								</div>
								<input type="text" class="form-control text-center"
									 id="title" name="title" value="${place.title}"
									style="height: 40px;">
							</div>
							<div class="col-12 col-md-4 mb-3">
								<select class="rounded" id="category" name="category"
									style="height: 40px; width: 70%; border: 1px solid #ced4da"
									required>
									<option value="" disabled>카테고리를 선택해주세요</option>
									<option ${place.category=='병원'?'selected':''}>병원</option>
									<option ${place.category=='미용실'?'selected':''}>미용실</option>
									<option ${place.category=='호텔링'?'selected':''}>호텔링</option>
									<option ${place.category=='훈련소'?'selected':''}>훈련소</option>
									<option ${place.category=='기타'?'selected':''}>기타</option>
								</select>
							</div>	
							<div class="input-group mb-3 col-6 pr-0">
								<div class="input-group-prepend" style="height: 40px;">
									<span class="input-group-text font-weight-bold"
										id="basic-addon1">&nbsp;주 소&nbsp;</span>
								</div>
								<input type="text" class="form-control text-center"
									 id="sample6_address" name="position" value="${place.position[0]}"
									style="height: 40px;"readonly>
							</div>
							<div class="mb-3 col-2 pl-0">
								<input type="button" onclick="sample6_execDaumPostcode()"
									style="width: 100%; height: 40px;"
									class="btn btn-primary btn-sm" value="주소찾기">
							</div>
							<div class="input-group mb-3 col-12 col-md-8">
								<div class="input-group-prepend" style="height: 40px;">
									<span class="input-group-text font-weight-bold"
										id="basic-addon1">&nbsp;상세주소&nbsp;</span>
								</div>
								<input type="text" class="form-control text-center"
									 id="sample6_detailAddress" name="position" value="${place.position[1]}"
									style="height: 40px;">
							</div>
							<div class="input-group mb-4 col-12 col-md-8">
								<div class="input-group-prepend" style="height: 40px;">
									<span class="input-group-text font-weight-bold"
										id="basic-addon1">&nbsp;장소 설명&nbsp;</span>
								</div>
								<input type="text" class="form-control text-center"
									 id="exp" name="explanation" value="${place.explanation}"
									style="height: 40px;">
							</div>
						</div>
						<!-- 이미지,내용 -->
						<div id="container">
							<c:forEach items="${list }" var="p">
							<div class="row remove default">
								<div class="col-6">
								<div class="preview position-relative rounded col-10 mb-3" >
								<input type="hidden" value="${p.fileName}" name="f">
		                         <img src="${path}/resources/upload/place/${p.fileName}" class="previewImg rounded px-0" style="width:100%; height:206px;" data-toggle="modal" data-target="#exampleModal"">
		                         <div class="buttonCon position-absolute rounded" style="bottom:0; left:0; background:linear-gradient(to top,rgba(0, 0, 0, 0.5),rgba(255, 255, 255, 0)); width:100%;">
		                           <button type="button" class="del btn ml-3">
		                             <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-trash text-white" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
		                               <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
		                               <path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4L4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
		                             </svg>
		                           </button>
		                            <label>
			                           <input name="pic" class="d-none updatePic upload" type="file" accept="images/*" required/>
			                           <div class="oriUpdate" style="cursor:pointer;">
				                              <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-counterclockwise text-white update" viewBox="0 0 16 16">
				                          <path fill-rule="evenodd" d="M8 3a5 5 0 1 1-4.546 2.914.5.5 0 0 0-.908-.417A6 6 0 1 0 8 2v1z"/>
				                          <path d="M8 4.466V.534a.25.25 0 0 0-.41-.192L5.23 2.308a.25.25 0 0 0 0 .384l2.36 1.966A.25.25 0 0 0 8 4.466z"/>
				                        </svg>
			                          </div>
		                        	</label>
		                         </div>
                       			</div>
                       </div>
								<div class="col-6" id="cntContainer">
									<textarea class="form-control col-12 col-lg-10 mb-3 content"
										name="content" rows="8" placeholder="설명을 입력해주세요"
										style="resize: none;"><c:out value="${p.content }"/></textarea>
								</div>
							</div>
							</c:forEach>
						</div>
						<!--해시태그-->
						<div id="tagCon" class="mt-3 pl-2">
						<!-- 기존해시태그 -->
						<c:forEach items="${hList }" var="h">
							<div class="tagBox bg-light rounded text-secondary d-inline-block pl-1 py-1 ml-1 mb-2">#<span class="text-dark"><c:out value="${h.hashContent }"/> </span>                                     
                     <input name="hashtag" value="${h.hashContent }" type="text" class="d-none" >
                     <span class="delete text-secondary ">
                         <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-x pb-1 ml-0" style="font-size: 25px; cursor:pointer;" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                             <path fill-rule="evenodd" d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
                         </svg>
                     </span>
                 	</div>

							</c:forEach>
							<!-- 새해시태그 입력 -->
							<div
								class="tagBox bg-light rounded text-secondary d-inline-block pl-1 py-1 ml-1 mb-2">#<input name="hashtag"
									style="box-sizing: content-box; width: 75px;"
									onKeypress="javascript:if(event.keyCode==13) {$('.hashtag').focusout()}"
									type="text" class="hashtag border-0 bg-transparent "
									placeholder="해시태그" aria-label="해시태그"
									aria-describedby="basic-addon1"> <span
									class="d-none delete text-secondary "> <svg width="1em"
										height="1em" viewBox="0 0 16 16" class="bi bi-x pb-1 ml-0"
										style="font-size: 25px; cursor: pointer;" fill="currentColor"
										xmlns="http://www.w3.org/2000/svg">
                          <path fill-rule="evenodd"
											d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z" />
                      </svg>
								</span>
							</div>
						</div><!-- tagCon -->
					</form>
				</div>
				<div class="mb-5 pb-5" style="height: 30px;"></div>
			</div>
			
		</section>
	</main>
	<div class="fixed-bottom py-3 d-flex justify-content-end"
		style="background-color: rgba(255, 255, 255, 0.76);">
		<button type="button" id="btn"
			class="btn btn-lg btn-primary mr-5 col-2">수정</button>
	</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>
<script>
$(document).ready(function() {//페이지를 불러올때
	 if($(".preview").lenth!=5){//사진이 5개가 아니면 추가하기버튼 생성
		 fn_add();
	 }
	 });
 var path="${path}";
 var clone;
	$(document).on('click','.upload',e=>{//사진추가하기나 기존사진 변경눌렀을때
	 clone=$(e.target).clone(true);
	});
//사진!!
 //사진 미리보기
 $(document).on('change','.upload',function(e){//사진추가하기나 기존사진 바뀌었을때
	 if (e.target.value.length==0) {//파일취소 눌렀을떄 
		 console.log("파일취소");
		 /* if($(e.target).parent("label").length!=0){//기존사진 변경 누르고 파일취소 눌렀을때
			 console.log("기존사진 변경 파일취소");
			 $(e.target).parent("label").prepend(clone);
		 } else{//사진추가 한것에 변경 누르고 파일취소 눌렀을때
			 console.log("사진추가 변경 파일취소")
			 let label=$(e.target).parents(".addPic");
			 label.prepend(clone);
		 }  */
		 $(e.target).parent("label").prepend(clone);
		 $(e.target).remove();//값이 없어지기때문에 해당 파일태그 지움
        }else{//취소가 아닌 파일선택했을때
        	 var f=e.target;
        	 var file=$(e.target);
       $.each(e.target.files,(i,v)=>{//미리보기 로직 
           let reader=new FileReader();
           reader.onload=e=>{ 
               let img=`<div class="preview position-relative rounded col-10 mb-3" >
                         <img src="`+e.target.result+`" class="previewImg rounded px-0" style="width:100%; height:206px;" data-toggle="modal" data-target="#exampleModal"">
                         <div class="buttonCon position-absolute rounded" style="bottom:0; left:0; background:linear-gradient(to top,rgba(0, 0, 0, 0.5),rgba(255, 255, 255, 0)); width:100%;">
                           <button type="button" class="del btn ml-3">
                             <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-trash text-white" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                               <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
                               <path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4L4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
                             </svg>
                           </button>
                           <label>
                           <div class="oriUpdate" style="cursor:pointer;">
	                              <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-counterclockwise text-white update" viewBox="0 0 16 16">
	                          <path fill-rule="evenodd" d="M8 3a5 5 0 1 1-4.546 2.914.5.5 0 0 0-.908-.417A6 6 0 1 0 8 2v1z"/>
	                          <path d="M8 4.466V.534a.25.25 0 0 0-.41-.192L5.23 2.308a.25.25 0 0 0 0 .384l2.36 1.966A.25.25 0 0 0 8 4.466z"/>
	                        </svg>
                          </div>
                    	</label>
                         </div>
                       </div>`;
                       if(file.hasClass("updatePic")){//기존사진이면
                    	   file.parents(".preview").find("img").attr("src",e.target.result);//기존사진을 변경한것으로 바꿈
                    	   file.parents(".preview").find("input[name=f]").remove();//사진이 변경되면 기존 히든태그를 지움
                       }else{//기존사진이 아닐때
                    	   if(file.parents(".addPic").next(".remove").length!=0){//사진 추가한것에서 변경눌렀을때
                    		   file.parents(".addPic").next(".remove").find("img").attr("src",e.target.result);
                    	   }else{//사진 추가하기 눌렀을때
                    		   let content=`<textarea class="form-control col-12 col-lg-10 mb-3 content" name="content" rows="8"
              						placeholder="설명을 입력해주세요" style="resize: none;"></textarea>`;
                         		$("#container").append(`<div class="row remove"><div class="col-6">`+img+`</div><div class="col-6">`+content+`</div></div>`);
              				 fn_add();
                    	   }
                    	   
                       }
				 	
           }
           reader.readAsDataURL(v);
           
       });
        }
   });
 //사진 추가하기 버튼 추가하는 로직
 function fn_add(){
   $("#container").find(".addPic").hide();
   if($(".preview").length!=5){  
     let label=`<label class="addPic rounded text-center bg-light btn btn-block mt-3 col-12" style="height:50px;">
                 <input name="pic" class="d-none upload" type="file" accept="images/*"/>
                 <p class="h5 text-secondary align-middle mb-0 mt-1"><strong>추가하기</strong></p>
               </label>`;
           
     $("#container").append(label);
   };
 };
//사진 삭제
 $(document).on('click','.del',function(e){
 	 let previewDiv=$(e.target).parents("div.remove");
 	previewDiv.prev(".addPic").remove();//input file태그 삭제
 	previewDiv.remove();//div삭제
 	if($(".preview").length==4){
 		fn_add();
 	}
 }); 
 $(document).on('click','.update',function(e){//사진변경하는거
 	
 	var update=e.target;
 	if($(e.target).parents("div.preview").find(".updatePic").length==0){//추가된 사진일떄
 		$(e.target).parents("div.remove").prev(".addPic").find(".upload").click();
 	}else{//기존 사진일때
 		
 	}
 });
 $("#btn").on("click",e=>{ 
     //등록 누르면 사진 인풋태그에 id 순서대로 부여
      /* if($("#title").val().trim()==""){
  	  alert("제목을 입력해주세요.");
  	  return;
    }
    if($("#sample6_address").val()==""||($("#sample6_detailAddress").val()).trim()==""){
			alert("주소를 다시 입력해주세요.");
			return;
		} 
    if($("#exp").val().trim()==""){
  	  alert("장소설명을 입력해주세요.")
  	  return;
    }
  	if($("#category").val()==""){
  	  alert("카테고리를 선택해주세요");
  	  return;
    } */
  /*   if($(".previewImg").length==0){
  	  alert("사진을 올려주세요.");
  	  return;
    }else if($(".previewImg").length!=5&&$(".upload").last().val()==""){//인풋 파일태그 마지막 값 지움
  	  $(".addPic").last().remove();
    } 
   if($("input[name=hashtag]").last().val().trim()==""){//해쉬태그 마지막이 값이없으면 지워버림
  	 $("input[name=hashtag]").last().remove()
   } */
   
     
       /*  $.each($("input[name=pic]"),(i,v)=>{
      	console.log(i);
      	console.log(v.value);
      });   */
    //등록 누르면 form 전송
    $("#updateFrm").submit();
    
  });
//주소api
 function sample6_execDaumPostcode() {
     new daum.Postcode({
         oncomplete: function(data) {
             // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

             // 각 주소의 노출 규칙에 따라 주소를 조합한다.
             // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
             var addr = ''; // 주소 변수

             //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
             if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                 addr = data.roadAddress;
             } else { // 사용자가 지번 주소를 선택했을 경우(J)
                 addr = data.jibunAddress;
             }

             // 우편번호와 주소 정보를 해당 필드에 넣는다.
             
             document.getElementById("sample6_address").value = addr;
             // 커서를 상세주소 필드로 이동한다.
             document.getElementById("sample6_detailAddress").focus();
         }
     }).open();
 } 
</script>
<!-- 해시태그 js -->
<script src="${path }/resources/js/hashtag.js"></script> 
