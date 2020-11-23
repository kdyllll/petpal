<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/> 
 <jsp:include page="/WEB-INF/views/common/commonLink.jsp" />

</head>
<body class="bg-white">
<jsp:include page="/WEB-INF/views/common/header.jsp" />
  
  <main role="main" style="min-height:100vh;" class="pt-5">
   	<div class="row mb-5 mb-lg-1">
         <form class="container mt-5 col-lg-8">
             <p class="h2 mb-5 mt-2"><strong>일상 올리기</strong></p>
             <div class="form-group">               
               <label id="uploadLabel" class="btn rounded bg-light ml-1 col-lg-5 col-12" style="height: 300px;">          
                   <input class="d-none upload" id="upload" type="file" accept="images/*"/>                                    
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
             <div id="imgContainer" class="row">

             </div>
             
             <style>
               .preview:after {
                 content: "";
                 display: block;
                 /* padding-bottom: 100%; */
               }
             </style>
             <!--설명-->
             <div class="col-12 mt-3 pr-0">                        
               <textarea class="form-control" rows="5" placeholder="설명을 입력해주세요" style="resize: none;"></textarea>                   
             </div>
             <!--해시태그-->
             <div id="tagCon" class="mt-3 pl-2">
               <div class="tagBox bg-light rounded text-secondary d-inline-block pl-1 py-1 ml-1 mb-2">                                                      
                   #<input style="box-sizing: content-box; width: 75px;" onKeypress="javascript:if(event.keyCode==13) {$('.hashtag').focusout()}" type="text" class="hashtag border-0 bg-transparent " placeholder="해시태그" aria-label="해시태그" aria-describedby="basic-addon1">
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
  </main>
  <div class="fixed-bottom py-3 d-flex justify-content-end" style="background-color: rgba(255, 255, 255, 0.76);">
     <button type="button" class="btn btn-lg btn-primary mr-5 col-2" onclick="fn_picName();">작성</button>
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
                  let img=`<div class="preview position-relative rounded col-lg-5 ml-lg-5 mt-5 col-12 px-0" style="overflow:hidden;">
                            <img src="`+e.target.result+`" class="rounded px-0" style="width:100%; height:auto;" style="object-fit:none;">
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
                      <input class="d-none upload" type="file" accept="images/*"/>
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
          fn_add();
        }else if($(".preview").length==0){
          $("#uploadLabel").show();
          $("#upload").val("");
          $(".addPic").remove();
        };                  
      }); 
      //등록 누르면 사진 인풋태그에 name 순서대로 부여
      function fn_picName(){
        $("input[type=file]").each((i,item)=>{                     
          if(item.value.length!=0){
            var cnt=1;
            let name="pic"+i;
            $(item).attr("name",name);
            cnt++;
          };                     
        });                    
      };

      //해시태그!
      // 글자 수에 따라 input태그 크기 늘어나기
       $('.hashtag').on('keydown', function(e){
          var value = $(e.target).val();
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
          //x버튼 보이게
          $(e.target).next("span.delete").removeClass("d-none");
          //새 해시태그 입력창 추가
          $("#tagCon").append(clone); 
          clone.focus();
          $(e.target).removeClass("hashtag");  
        }                                         
      });
      // 해시태그 x버튼 누르면 삭제
      $(".delete").click(function(e){
        $(e.target).parents(".tagBox").remove();
      });
  
  });

</script>
</html>