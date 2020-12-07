<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<jsp:include page="/WEB-INF/views/common/commonLink.jsp" />
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
input:focus {
	outline: none;
}
</style>
</head>
<body class="bg-white">
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<main role="main" style="min-height: 100vh;">
		<section class="mt-5 pt-5">
			<div class="container">
				<div class="mb-5 mb-lg-1 ">
					<form id="writeFrm" class=" mt-5" method="post"
						action="${path }/community/placePostWriteEnd.do"
						enctype="multipart/form-data">
						<p class="col-12 h2 mb-5 mt-2">
							<strong>장소 후기 올리기</strong>
						</p>
						<div class="row">
							<div class="input-group mb-3 col-12 col-md-8">
								<div class="input-group-prepend" style="height: 45px;">
									<span class="input-group-text font-weight-bold"
										id="basic-addon1">&nbsp;제 목&nbsp;</span>
								</div>
								<input type="text" class="form-control text-center"
									placeholder="제목을 입력해주세요." id="title" name="title"
									style="height: 45px;">
							</div>
							<div class="col-12 col-md-4 mb-3">
								<select class="rounded" id="category"
									style="height: 45px; width: 70%; border: 1px solid #ced4da"
									required>
									<option value="">카테고리를 선택해주세요</option>
									<option>병원</option>
									<option>미용실</option>
									<option>호텔링</option>
									<option>훈련소</option>
									<option>기타</option>
								</select>
							</div>
							<div class="mb-3 col-6 pr-0">
								<input type="text" class="form-control input-lg" name="address"
									id="sample6_address" placeholder="주소" readonly>
							</div>
							<div class="mb-3 col-2 pl-0">
								<input type="button" onclick="sample6_execDaumPostcode()"
									style="width: 100%; height: 38px;"
									class="btn btn-primary btn-sm" value="주소찾기">
							</div>
							<div class="mb-3 col-8">
								<input type="text" class="form-control input-lg" name="address"
									id="sample6_detailAddress" placeholder="상세주소">
							</div>
							<div class="mb-4 col-8">
								<input type="text" placeholder="장소에 대한 설명" class="form-control input-lg">
							</div>
						</div>
						
						<div id="container">
							<div class="row remove" id="default">
								<div class="col-6" id="imgContainer">
									<div id="hide">
										<label id="uploadLabel"
											class="btn rounded bg-light col-12 col-lg-10 border d-flex justify-content-center align-items-center"
											style="height: 206px;"> <input name="pic"
											class="d-none upload" id="upload" type="file"
											accept="images/*" />
											<div>
												<svg width="1em" height="1em" viewBox="0 0 16 16"
													class="bi bi-camera-fill text-secondary"
													fill="currentColor" xmlns="http://www.w3.org/2000/svg"
													style="font-size: 60px;">
                      <path
														d="M10.5 8.5a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0z" />
                      <path fill-rule="evenodd"
														d="M2 4a2 2 0 0 0-2 2v6a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V6a2 2 0 0 0-2-2h-1.172a2 2 0 0 1-1.414-.586l-.828-.828A2 2 0 0 0 9.172 2H6.828a2 2 0 0 0-1.414.586l-.828.828A2 2 0 0 1 3.172 4H2zm.5 2a.5.5 0 1 0 0-1 .5.5 0 0 0 0 1zm9 2.5a3.5 3.5 0 1 1-7 0 3.5 3.5 0 0 1 7 0z" />
                  </svg>
												<br> <span> 사진 올리기 </span>
											</div>
									</div>
									</label>
								</div>

								<!--설명-->
								<div class="col-6" id="cntContainer">
									<textarea class="form-control col-12 col-lg-10 mb-3 content"
										name="content" rows="8" placeholder="설명을 입력해주세요"
										style="resize: none;"></textarea>
								</div>
							</div>
						</div>
						<!--해시태그-->
						<div id="tagCon" class="mt-3 pl-2">
							<div
								class="tagBox bg-light rounded text-secondary d-inline-block pl-1 py-1 ml-1 mb-2">
								#<input name="hashtag"
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
						</div>

					</form>
				</div>
				<div class="mb-5 pb-5" style="height: 30px;"></div>
			</div>
		</section>
	</main>
	<div class="fixed-bottom py-3 d-flex justify-content-end"
		style="background-color: rgba(255, 255, 255, 0.76);">
		<button type="button" id="btn"
			class="btn btn-lg btn-primary mr-5 col-2">작성</button>
	</div>
</body>
<script>
	 $(function(){
		
	 }); 
	  //사진!!
	  //사진 미리보기
	  $(document).on('change','.upload',function(e){
		  var f=e.target;
		$("#hide").remove(); // 사진 등록 창 안보이게
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
	                          </div>
	                        </div>`;
					if(f.id!="upload"){ //사진라벨이 아닐떄
					 	let content=`<textarea class="form-control col-12 col-lg-10 mb-3 content" name="content" rows="8"
							placeholder="설명을 입력해주세요" style="resize: none;"></textarea>`;
	            		$("#container").append(`<div class="row remove"><div class="col-6">`+img+`</div><div class="col-6">`+content+`</div></div>`);
		               	 //$("#container").append(content);
	            	 }else{//사진라벨일때
	            		
	                $("#imgContainer").append(img);
	            	} 
	                fn_add(); //사진 추가하기 버튼 추가
	                
	            }
	            
	            reader.readAsDataURL(v);
	        });              
	    });
	  
	    //사진 추가하기 버튼 추가하는 로직
	    function fn_add(){
	      $("#container").find(".addPic").remove();
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
	    	previewDiv.remove();//div삭제
	    	
	    	if($(".remove").length==0){//사진추가한것이 없을때
	    		  let df=`<div class="row remove" id="default">
					<div class="col-6" id="imgContainer">
					<div id="hide">
						<label id="uploadLabel"
							class="btn rounded bg-light col-12 col-lg-10 border d-flex justify-content-center align-items-center"
							style="height: 206px;"> <input name="pic"
							class="d-none upload" id="upload" type="file"
							accept="images/*"/>
							<div>
								<svg width="1em" height="1em" viewBox="0 0 16 16"
									class="bi bi-camera-fill text-secondary" fill="currentColor"
									xmlns="http://www.w3.org/2000/svg" style="font-size: 60px;">
          <path
										d="M10.5 8.5a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0z" />
          <path fill-rule="evenodd"
										d="M2 4a2 2 0 0 0-2 2v6a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V6a2 2 0 0 0-2-2h-1.172a2 2 0 0 1-1.414-.586l-.828-.828A2 2 0 0 0 9.172 2H6.828a2 2 0 0 0-1.414.586l-.828.828A2 2 0 0 1 3.172 4H2zm.5 2a.5.5 0 1 0 0-1 .5.5 0 0 0 0 1zm9 2.5a3.5 3.5 0 1 1-7 0 3.5 3.5 0 0 1 7 0z" />
      </svg>
								<br> <span> 사진 올리기 </span>
							</div>
					</div>
					</label>
				</div>

				<!--설명-->
				<div class="col-6" id="cntContainer">
					<textarea class="form-control col-12 col-lg-10 mb-3 content"
						name="content" rows="8" placeholder="설명을 입력해주세요"
						style="resize: none;"></textarea>
				</div>
				</div>`;   
	    		$("#container").append(df);
	    		$(".addPic").remove();
	    	} 
	    }); 
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
	        //console.log(inputWidth);
	        $(e.target).css('width', inputWidth); 
	        $('#virtual_dom').remove();
	      });

	    // 해시태그 작성 후 새 해시태그 추가
	    $('.hashtag').focusout(function(e) {  
	      if($(e.target).val().trim().length==0){
	        //아무일도 일어나지 않음!
	      }else if($(e.target).hasClass("hashtag") === true){
	        //해시태그 작성 태그 복제
	        var clone=$(e.target).parents(".tagBox").clone(true);
	        clone.find(".hashtag").val(""); 
	        clone.find(".hashtag").css("width","75px");   
	        //태그 수정 불가능하게 막음                     
	        $(e.target).attr("readonly",true);
	        //$(e.target).css("width",$(e.target).width()-15);
	        //x버튼 보이게
	        $(e.target).next("span.delete").removeClass("d-none");
	        //새 해시태그 입력창 추가
	        $("#tagCon").append(clone);
	       //$("#tagCon").find(".hashtag").last().trigger('focus'); 
	       // clone.trigger('focus');
	       // clone.focus();
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
	    
	    $("#btn").on("click",e=>{ 
	       //등록 누르면 사진 인풋태그에 id 순서대로 부여
	      /* if($("#title").val().trim()==""){
	    	  alert("제목을 입력해주세요");
	    	  return;
	      }
	      if($("#sample6_address").val()==""||($("#sample6_detailAddress").val()).trim()==""){
				alert("주소를 다시 입력해주세요.");
				return;
			} 
	    	if($("#category").val()==""){
	    	  alert("카테고리를 선택해주세요");
	      }
	      if($(".previewImg").length==0){
	    	  alert("사진을 올려주세요.");
	      }*/
	      
	    	
	       //등록 누르면 form 전송
	       //$("#writeFrm").submit();
	      
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
</html>