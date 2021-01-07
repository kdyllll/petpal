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
        <form class="needs-validation" id="noticeWrite" name="noticeWrite" action="${path }/board/noticeUpdateEnd.do?noticeNo=${mainList[0].NOTICENO }" method="post" enctype="multipart/form-data">
            <div>
                <div class="row">
                    <div class="col-md-12 mt-5">
			
			<input type="text" class="form-control mt-5 mb-3 border-bottom" name="title" id="title" value="<c:out value="${mainList[0].TITLE }"/>" required style="border: none;">
			<div class="invalid-feedback">제목을 입력해주세요.</div>
			
			<textarea class="autosize form-control border-0 mb-5" id="content1" name="content1" style="resize: none; overflow-y:hidden;"><c:out value="${mainList[0].CONTENT1 }"/></textarea>
			<div class="invalid-feedback">내용을 입력해주세요.</div>
			
				<!-- 기존사진 -->
				<c:forEach items="${imgList }" var="n">
					<c:if test="${not empty n.CONTENTIMG }">
						<div id="div">
							<button type="button" class="btn btn-light  float-right" onclick="dImg(event);">x</button>
							<input type="hidden" value="${n.NOTICEIMGNO }">
							<img id="img" src="${path }/resources/upload/board/notice/${n.CONTENTIMG}" width="100%" height="400px">
							<div class="mb-2" style="white-space:pre-line;">
								<textarea class="autosize form-control border-0" name="imgContent" style="resize: none; overflow-y:hidden;"><c:out value="${n.CONTENT}"/></textarea>
								<input type="hidden" name="noticeImgNo" value="${n.NOTICEIMGNO }">
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
			
                        <div class="ml-3 mt-5 mb-5">
                            #해시태그
                        </div>
                        
                        <div class="text-center mb-5">
                            <input type="button" class="btn btn-outline-secondary" value="작성하기" onclick="selectCheck();">
                        </div>
						
						<div id="delNo"></div>
						
                    </div>
                </div>

            </div>
        </form>
    </div>
  </main>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />

<script>
	function dImg(event){
		if(window.confirm("사진을 지우면 사진에 대한 설명도 같이 지워집니다.")){
			let target = $(event.target).next().val();
			let input = $("<input>").attr({"type":"hidden", "value" : target, "name":"deleteImgNo"});
			$("#delNo").append(input);
			$(event.target).parent().remove();
		}
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
    
	//preview 영역에서 삭제 버튼 클릭시 해당 미리보기이미지 영역 삭제
	function deletePreview(obj) {
	    var imgNum = obj.attributes['value'].value;
	    delete files[imgNum];
	    $("#preview .preview-box[value=" + imgNum + "]").remove();
	    resizeHeight();
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
		         
	function xSize(e)
    {
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
		        
	function selectCheck(){
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
   		noticeWrite.submit();
	}
</script>


</body>

</html>