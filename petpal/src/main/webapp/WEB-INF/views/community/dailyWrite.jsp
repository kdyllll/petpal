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
    .bubble:after {
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
    }
      
</style>
</head>
<body class="bg-white">
<jsp:include page="/WEB-INF/views/common/header.jsp" />
  
  <main role="main" style="min-height:100vh;" class="pt-5">
    <div class="row mb-5 mb-lg-1">
        <form id="writeFrm" class="container mt-5 col-lg-8" method="post" enctype="multipart/form-data">
            <p class="h2 mb-5 mt-2"><strong>일상 올리기</strong></p>
            <div class="form-group row" id="imgContainer">               
              <label id="uploadLabel" class="btn rounded bg-light ml-1 col-lg-5 col-12" style="height: 300px;">          
                  <input name="pic" class="d-none upload" id="upload" type="file" accept="images/*" required/>                                    
                  <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-camera-fill text-secondary" fill="currentColor" xmlns="http://www.w3.org/2000/svg" style="font-size: 60px;">
                      <path d="M10.5 8.5a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0z"/>
                      <path fill-rule="evenodd" d="M2 4a2 2 0 0 0-2 2v6a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V6a2 2 0 0 0-2-2h-1.172a2 2 0 0 1-1.414-.586l-.828-.828A2 2 0 0 0 9.172 2H6.828a2 2 0 0 0-1.414.586l-.828.828A2 2 0 0 1 3.172 4H2zm.5 2a.5.5 0 1 0 0-1 .5.5 0 0 0 0 1zm9 2.5a3.5 3.5 0 1 1-7 0 3.5 3.5 0 0 1 7 0z"/>
                  </svg>
                  <br>
                  <span>
                      사진 올리기
                      <br>
                      *최대 5장까지
                  </span>
              </label>                                    
            </div>
            
            <!--설명-->
            <div class="col-12 mt-3 px-0">                        
              <textarea class="form-control" name="content" rows="5" placeholder="설명을 입력해주세요" style="resize: none;" required></textarea>                   
            </div>
                
            <!--해시태그-->
            <div id="tagCon" class="mt-3 pl-2">
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
 <div class="fixed-bottom py-3 d-flex justify-content-end" style="background-color: rgba(255, 255, 255, 0.76);">
    <button type="button" id="btn" class="btn btn-lg btn-primary mr-5 col-2">작성</button>
 </div>
</body>
<script>                      
 $(function(){
   //사진!!
   //사진 미리보기
   $(document).on('change','.upload',function(e){                 
         $("#uploadLabel").hide(); // 사진 등록 창 안보이게
         
         $.each(e.target.files,(i,v)=>{//미리보기 로직         
             let reader=new FileReader();
             reader.onload=e=>{                              
                 let img=`<div class="preview position-relative rounded col-lg-5 ml-lg-5 mt-5 col-12 px-0" >
                           <img src="`+e.target.result+`" class="previewImg rounded px-0" style="width:100%; height:auto;" data-toggle="modal" data-target="#exampleModal"">
                           <div class="buttonCon position-absolute rounded" style="bottom:0; left:0; background:linear-gradient(to top,rgba(0, 0, 0, 0.5),rgba(255, 255, 255, 0)); width:100%;">
                             <button type="button" class="delete btn ml-3">
                               <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-trash text-white" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                 <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
                                 <path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4L4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
                               </svg>
                             </button>
                           </div>
                         </div>`;
                 $("#imgContainer").append(img);
                 fn_add(); //사진 추가하기 버튼 추가
             }
             reader.readAsDataURL(v);
         });              
     });
     //사진 추가하기 버튼 추가하는 로직
     function fn_add(){
       $("#imgContainer").find(".addPic").hide();
       if($(".preview").length!=5){  
         let label=`<label class="addPic rounded text-center bg-light btn btn-block mt-3 mx-3" style="cursor: pointer; height:50px;">
                     <input name="pic" class="d-none upload" type="file" accept="images/*"/>
                     <p class="h5 text-secondary align-middle mb-0 mt-1"><strong>추가하기</strong></p>
                   </label>`;
         $("#imgContainer").append(label);
       };
     };
     //사진 삭제
     $(document).on('click','.delete',function(e){
       let previewDiv=$(e.target).parents(".preview");
       let picInput=previewDiv.prev("label.addPic");
       previewDiv.remove();
       picInput.remove();
       if($(".preview").length==4){
    	   //사진이 5개였던 상태에서 삭제하면 → 사진추가하기 버튼 보이게
         fn_add();
       }else if($(".preview").length==0){
    	   //사진을 전부 삭제했다면 → 초기의 사진 등록버튼 보이게
         $("#uploadLabel").show();
         $("#upload").val("");
         $(".addPic").remove();
       };                  
     }); 
     
     //+태그!
    
    $('.modal').on('shown.bs.modal', function(){
      //모달 켜지면 상품입력 태그에 포커스
      $('#message-text').trigger('focus');
    });

    var percentX;
    var percentY;
    var xx;
    var yy;
    var target;
    $(document).on('click','.previewImg',e=>{
      target=$(e.target);
      var clickX=e.offsetX;//클릭한 위치X좌표
      var clickY=e.offsetY;//클릭한 위치Y좌표
      var x=target.width();//클릭한 이미지의 높이
      var y=target.height();//클릭한 이미지의 넓이
      percentX=clickX/x*100;//클릭한 위치의 상대적인 퍼센트X좌표값
      percentY=clickY/y*100;//클릭한 위치의 상대적인 퍼센트Y좌표값
      xx=percentX-15;
      yy=percentY+10;
    });

    //var productJson='${productJson}';
    $("#insert").on("click",e=>{//등록버튼 눌렀을때
        console.log("좌표등록");
        var name=$("#message-text").val();
        var img="";
        //입력한 상품 이름이 있는 상품이 아니면 등록 못하게 유효성 검사하기

        //여기서 에이작스 처리해야함!!!
        //input hidden 태그에도 상품번호로 변경하기!!
        
        $.ajax({
			url:"${path}/daily/dailyProduct.do",
			data:{name:name},
			success:data => {	
				img=`<div>
	                  <svg class="plusBtn position-absolute" width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-plus-circle-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg"
                    style="top:`+percentY+`%; left:`+percentX+`%;">
                    <path fill-rule="evenodd" d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM8.5 4.5a.5.5 0 0 0-1 0v3h-3a.5.5 0 0 0 0 1h3v3a.5.5 0 0 0 1 0v-3h3a.5.5 0 0 0 0-1h-3v-3z"/>
                </svg>
                <input type="hidden" name="coord" value="`+data.productNo+`,`+percentX+`,`+percentY+`"/>
                <div class="bubble rounded shadow-sm col-4 col-lg-4 position-absolute px-1" style="top:`+yy+`%; left:`+xx+`%;">
                  <div class="row d-flex flex-wrap">
                    <img class="col-2 border" src="${path }/resources/upload/community/daily/`+data.imgName+`">
                    <p class="p-1 mb-0">`+name+`</p>
                  </div>
                  <div class="d-flex justify-content-end">
                    <button type="button" class="deleteTag btn p-0 row pr-3">
                      <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-trash text-dark" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                        <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
                        <path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4L4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
                      </svg>
                    </button>
                  </div>
                </div>
              </div>`;
				target.parent("div.preview").append(img);
		        $(".bubble").hide();
			},
			error:(request,status,error)=>{
                alert("잘못된 상품 정보입니다.");
            }
		})
        
      });
    
    //상품이름 자동완성
    $("#message-text").keyup(e=>{
    	console.log("작성");
    	console.log($(e.target).val());
			$.ajax({
            url:"${path}/daily/autoCompleteAjax.do",
            data:{key:$(e.target).val()},
            success:data => { 
            	console.log(data);
                $("#productData").html("");
                for(let d in data){
                	console.log(data[d].productName);
                	$("#productData").append($("<option>").html(data[d].productName));
                }
            }
        });
	});
    
    //+에 마우스 올렸을 때/떠났을 때 말풍선 보이고 숨기기
    $(document).on('mouseenter',".plusBtn",e=>{ 	
      //console.log("마우스 들어옴");
      $(e.target).siblings(".bubble").show();
    });
    $(document).on('mouseleave',".plusBtn",e=>{
      //console.log("마우스 떠남");
      $(e.target).siblings(".bubble").hide();
    });
    
    //모달창 닫힐때 form 초기화
    $('.modal').on('hidden.bs.modal', function (e) {
      $(this).find('form')[0].reset()
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
     
    
     
     $("#btn").on("click",e=>{ 
    	 //등록 누르면 사진 인풋태그에 id 순서대로 부여
       $("input[type=file]").each((i,item)=>{                     
         if(item.value.length!=0){         
           //let name="pic"+i;
           //$(item).attr("id",name);
           
          //등록 누르면 사진 별 +버튼의 상품 이름 input태그에 몇번째 사진의 좌표인지 name 부여
          var plusCon=$(item).parent("label").next("div.preview");
          plusCon.find("input[type=hidden]").each((j,item2)=>{
        	let oriVal=$(item2).val();
            let newVal=oriVal+","+i;
            $(item2).val(newVal);
          });          
         };                     
       });
    	 
    	 //등록 누르면 form 전송
    	 $("#writeFrm").attr("action","${path }/daily/dailyWriteEnd.do").submit();
       
     });

 
 });

</script>
</html>