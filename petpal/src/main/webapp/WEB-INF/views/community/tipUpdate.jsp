<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/> 
 <jsp:include page="/WEB-INF/views/common/commonLink.jsp" />

<style>
	#change {
		right: 0px;
		position: absolute;
		bottom: 0px;
	}
	#delete {
		right: auto;
		float: right;
		position: relative;
		bottom: 0px;
	}
</style>
</head>
<body class="bg-white">
<jsp:include page="/WEB-INF/views/common/header.jsp" />
  
  <main role="main" style="min-height:100vh;">
  	<div class="container" style="max-width: 940px;">
  	<c:set var="loop_flag" value="false" />
        <form class="needs-validation" id="tipWrite" name="tipWrite" action="${path }/community/tipUpdateEnd.do?tipNo=${mainList[0].TIPNO }" method="post" enctype="multipart/form-data">
            <div>
                <div class="row">
                    <div class="col-md-12 mt-5">
						<div class="form-inline mb-5">
							<label class="mr-3">카테고리</label>
							<c:forEach items="${mainList }" var="t">
								<div class="d-col-6">
									<select id="select" class="form-control" name="category">
										<option value="" selected disabled style="color: #bdbdbd;"><small><c:out value="${t.CATEGORY }"/></small>
										</option>
										<option value="훈련">훈련</option>
										<option value="수제간식">수제간식</option>
										<option value="DIY 옷">DIY 옷</option>
										<option value="DIY 가구">DIY 가구</option>
										<option value="건강">건강</option>
										<option value="팁">팁</option>
										<option value="기타">기타</option>
									</select>
								</div>
							</c:forEach>
						</div>
						<c:forEach items="${imgList }" var="t">
							<c:if test="${not empty t.MAINIMG }">
							<div class="float-none picLabel" id="image_container" style="display: table; background-color: #F7F7F7; height: 300px; width: 100%; position: relative;" onclick="document.all.file.click()">
								<input type="file" class="updatePic" name="mainImg" id="file" style="display: none" onchange="setThumbnail(event);" required>
								<div class="button text-center" style="display: table-cell; vertical-align: middle;">
									<button type="button" id="i" class="btn btn-outline-secondary">메인 사진 추가하기</button>
								</div>
								<div id="change">
									<button type="button" id="u" class="btn btn-dark col-auto oriUpdate">
										<span class="align-text-bottom">사진 변경하기</span>
									</button>
								</div>
								<input type="hidden" name="mainImgNo" value="${t.TIPIMGNO }">
								<img src="${path }/resources/upload/tip/${t.MAINIMG }" style="width: 100%; height: 300px;">
							</div>
							</c:if>
							</c:forEach>
			
			
			<input type="text" class="form-control mt-5 mb-3 border-bottom" name="title" id="title" value="<c:out value="${mainList[0].TITLE }"/>" required style="border: none;">
			<div class="invalid-feedback">제목을 입력해주세요.</div>
			
			<textarea class="autosize form-control border-0 mb-5" id="content1" name="content1" style="resize: none; overflow-y:hidden;"><c:out value="${mainList[0].CONTENT1 }"/></textarea>
			<div class="invalid-feedback">내용을 입력해주세요.</div>
			
				<!-- 기존사진 -->
				<c:forEach items="${imgList }" var="t">
					<c:if test="${not empty t.CONTENTIMG }">
						<div id="div">
							<button type="button" class="btn btn-light  float-right" onclick="dImg(event);">x</button>
							<input type="hidden" value="${t.TIPIMGNO }">
							<img id="img" src="${path }/resources/upload/tip/${t.CONTENTIMG}" width="100%" height="400px">
							<div class="mb-2" style="white-space:pre-line;">
								<textarea class="autosize form-control border-0" name="imgContent" style="resize: none; overflow-y:hidden;"><c:out value="${t.CONTENT}"/></textarea>
								<input type="hidden" name="tipImgNo" value="${t.TIPIMGNO }">
							</div>
						</div>
                    </c:if>
                </c:forEach>
                
			<div id="preview" class="content"></div>
			
                <!-- 첨부 버튼 -->
			<div id="attach">
				<label class="ml-3" for="uploadInputBox">
					사진 추가하기<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-plus-circle" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  						<path fill-rule="evenodd" d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
  						<path fill-rule="evenodd" d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
					</svg>
				</label>
				<input id="uploadInputBox" name="contentImg" style="display: none" type="file" multiple />
			</div>
			
			
			<c:if test="${not empty mainList[0].CONTENT2 }">
				<textarea class="autosize form-control border-0 mt-5 mb-5" name="content2" style="resize: none; overflow-y:hidden;"><c:out value="${mainList[0].CONTENT2 }"/></textarea>
			</c:if>
			<c:if test="${empty mainList[0].CONTENT2 }">
				<textarea class="autosize form-control border-0 mt-5 mb-5" name="content2" placeholder="내용을입력하세요" style="resize: none; overflow-y:hidden;"></textarea>
			</c:if>
			
			<div id="hide"></div>
			
			            <!--해시태그-->
			            <div id="tagCon" class="mt-3 pl-2 col-12">
				            <!-- 기존 해시태그 -->
				            <c:forEach var="h" items="${hashList}">                            
				             <div class="tagBox bg-light rounded text-secondary d-inline-block pl-1 py-1 ml-1 mb-2">                
				             	  # <span class="text-dark"><c:out value="${h.hashContent }"/> </span>                                     
				                  <input name="hashtag" value="${h.hashContent }" type="text" class="d-none" >
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
			            
			            
			            
			            
			            
			            
			            
                        
                        <div class="text-center mb-5">
                            <input id="write" type="button" class="btn btn-outline-secondary" value="작성하기">
                        </div>
						
						<div id="delNo"></div>
						
                    </div>
                </div>

            </div>
        </form>
    </div>
  </main>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />

<script src="${path }/resources/js/hashtag.js"></script>
<script src="${path }/resources/js/plusTag.js"></script>
<script>
var clone;
//기존사진 변경 버튼 눌렀을 때
$(document).on('click','.oriUpdate',e=>{//파일 입력할때 미리 입력태그 클론만들기
     clone=$(".updatePic").clone(true);
});


$(".updatePic").on("change",e=>{
	 if (e.target.value.length==0) {//파일 입력 취소 누르면 원래 사진 유지하도록
		let label=$(e.target).parents(".picLabel");
		$(e.target).remove();//값 없어진 인풋 지우고
		label.prepend(clone);//미리 복사해놓은 인풋태그로 대체
     }
});


	$(document).ready(function() {
		$("#i").hide();
    	$("#u").show();
    	$("#d").hide();
	});

	function dImg(event){
		if(window.confirm("사진을 지우면 사진에 대한 설명도 같이 지워집니다.")){
			let target = $(event.target).next().val();
			let input = $("<input>").attr({"type":"hidden", "value" : target, "name":"deleteImgNo"});
			$("#delNo").append(input);
			$(event.target).parent().remove();
		}
	}

	function setThumbnail(event) {
		var reader = new FileReader();
		reader.onload = function(event) {
			var img = document.createElement("img");
			img.setAttribute("src",
					event.target.result);
			img.setAttribute("width", "100%");
			img.setAttribute("height", "300px");

			$("#image_container").find("img").remove();
			document.querySelector("div#image_container").appendChild(img);
			$("#i").hide();
			$("#u").show();
			$("#d").show();
		};
		reader.readAsDataURL(event.target.files[0]);
	}
	
	function deleteImg(event) {
		$("#image_container").find("img").remove();
		$("#i").show();
		$("#u").hide();
		$("#d").hide();
	}
	
	//임의의 file object영역
    var files = {};
    var previewIndex = 0;

    // image preview 기능 구현
    // input = file object[]
	function addPreview(input) {
	    if (input[0].files) {
	        //파일 선택이 여러개였을 시의 대응
	        for (var fileIndex = 0; fileIndex < input[0].files.length; fileIndex++) {
	            var file = input[0].files[fileIndex];
	
	            if (validation(file.name))
	                continue;
	
	            var reader = new FileReader();
	            reader.onload = function(img) {
	                //div id="preview" 내에 동적코드추가.
	                //이 부분을 수정해서 이미지 링크 외 파일명, 사이즈 등의 부가설명을 할 수 있을 것이다.
	                var imgNum = previewIndex++;
	                $("#preview")
	                        .append(
	                                "<div class=\"preview-box\" value=\"" + imgNum +"\">"
	                                        + "<button class=\"btn btn-light  float-right\" value=\""
	                                        + imgNum
	                                        + "\" onclick=\"deletePreview(this)\">"
	                                        + "x" + "</button>"
	                                 		+ "<img id=\"image_container\" name=\"contentImg\" class=\"img\" src=\"" + img.target.result + "\" style=\"width:100%;\"\/>"
	                                 		+ "<textarea class=\"ta form-control border-0 mt-2 mb-3\" name=\"newImgContent\" rows=\"3\" placeholder=\"사진에 대한 설명을 작성해주세요\" style=\"resize: none;\"></textarea>"
	                                 		+ "</div>"
	                                        );
	                files[imgNum] = file;
	            };
	            reader.readAsDataURL(file);
	        }
	    }else{
	    	alert('invalid file input');
	    }
	}
    
    function deletePreview(obj) {
    	if(window.confirm("사진을 지우면 사진에 대한 설명도 같이 지워집니다.")){
            var imgNum = obj.attributes['value'].value;
            delete files[imgNum];
            $("#preview .preview-box[value=" + imgNum + "]").remove();
            resizeHeight();
    	}
    }
		 
	//client-side validation
	//always server-side validation required
	function validation(fileName) {
	    fileName = fileName + "";
	    var fileNameExtensionIndex = fileName.lastIndexOf('.') + 1;
	    var fileNameExtension = fileName.toLowerCase().substring(
	            fileNameExtensionIndex, fileName.length);
	    if (!((fileNameExtension === 'jpg')
	            || (fileNameExtension === 'gif') || (fileNameExtension === 'png'))) {
	        alert('jpg, gif, png 확장자만 업로드 가능합니다.');
	        return true;
	    } else {
	        return false;
	    }
	}
		 
	$(document).ready(function() {
	    //submit 등록. 실제로 submit type은 아니다.
	    $('.submit a').on('click',function() {                        
	        var form = $('#uploadForm')[0];
	        var formData = new FormData(form);
	
	        for (var index = 0; index < Object.keys(files).length; index++) {
	            //formData 공간에 files라는 이름으로 파일을 추가한다.
	            //동일명으로 계속 추가할 수 있다.
	            formData.append('files',files[index]);
	        }
	    });
	    // <input type=file> 태그 기능 구현
	    $('#attach input[type=file]').change(function() {
	        addPreview($(this)); //preview form 추가하기
	    });
	});
		         
	function xSize(e){
        var xe = document.getElementsByClassName('xt'), t;
        e.onfocus = function()
        {
            t = setInterval(
                function()
                {
                    xe.value = e.value;
                    e.style.height = (xe.scrollHeight + 12) + 'px';
                }, 100);
        }
        e.onblur = function()
        {
            clearInterval(t);
        }
    }
    xSize(document.getElementsByClassName('ta'));
    
    $("textarea.autosize").on('keydown keyup', function () {
    	  $(this).height(1).height( $(this).prop('scrollHeight')+12 );	
    });
    
    
    $("#write").click(function(){
    	selectCheck();
    });
		        
	function selectCheck(){
      	var select = document.getElementById("select");
      	var selected = select.options[select.selectedIndex].value;
      	var file = $("#file").val();
      	var count = 0;
      	
      	if($("#title").val() === ""){
      		alert("제목을 입력해주세요");
      		$("#title").focus();
      		return;
      	}
      	if($("#content1").val()===""){
      		alert("내용을 입력해주세요");
      		$("#content1").focus();
      		return;
      	}
      	
      	if(selected === ""){
      		let cate;
      		if(window.confirm("카테고리가 변경되지 않았습니다. 카테고리 변경하지 않고 수정하시겠습니까?")){
      			<c:forEach items="${mainList }" var="t">
      				$("#hide").append(`<input type="hidden" name="category" value="${t.CATEGORY}">`);
      			</c:forEach>
      		}else{
      			alert("카테고리 변경해주세요");
      			count++;
      			return;
      		}
      	}
      	if(file === ""){
      		if(window.confirm("메인사진이 변경되지 않았습니다. 메인사진을 변경하지 않고 수정하시겠습니까?(지우신 사진도 변경되지 않습니다.)")){
  				$("#hide").append(`<input type="hidden" name="mainImg" value="${imgList[0].MAINIMG }`);
      		}else{
      			alert("메인사진을 변경해주세요");
      			count++;
      		}
      	}
      	if(count==0){
			$(".hashtag").attr("name","");//아무것도 안적힌 해시태그는 안넘어가도록 name 뺏기
      		$("#tipWrite").submit();
      	}
	}
	
</script>


</body>

</html>