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
        <form class="needs-validation" novalidate>
            <div>
                <div class="row">
                    <div class="col-md-12 mt-5">
                        
                        <!-- 기본 정보 입력란 -->
                        <div class="accordion mb-5" id="accordionExample">
                            <div class="card">
                                <div class="card-header" id="headingOne">
                                    <h2 class="mb-0">
                                        <button class="btn btn-light btn-block text-left" type="button"
                                            data-toggle="collapse" data-target="#collapseOne" aria-expanded="true"
                                            aria-controls="collapseOne">
                                            <svg width="1em" height="1em" viewBox="0 0 16 16"
                                                class="bi bi-pencil-square" fill="currentColor"
                                                xmlns="http://www.w3.org/2000/svg">
                                                <path
                                                    d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456l-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z" />
                                                <path fill-rule="evenodd"
                                                    d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z" />
                                            </svg>&nbsp;&nbsp;기본정보 입력
                                        </button>
                                    </h2>
                                </div>

                                    <div id="collapseOne" class="collapse" aria-labelledby="headingOne"
                                    data-parent="#accordionExample">
                                    <div class="card-body form-inline">
                                        <label class="mr-3">카테고리</label>
                                        <div class="col-6">
                                            <select class="form-control">
                                                    <option value="" selected disabled style="color: #bdbdbd;"><small>선택해주세요</small>
                                                    </option>
                                                    <option>훈련</option>
                                                    <option>수제간식</option>
                                                    <option>DIY 옷</option>
                                                    <option>DIY 가구</option>
                                                    <option>건강</option>
                                                    <option>팁</option>
                                                    <option>기타</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                            </div>
                        </div>

                        <!-- 파일 업로드 부분 -->
			<div id="delete">
				<button type="button" id="d" class="btn btn-light col-auto" onclick="deleteImg(event)">
					<span>x</span>
				</button>
			</div>
			<div class="float-none" id="image_container" style="display: table; background-color: #F7F7F7; height: 300px; width: 100%; position: relative;" onclick="document.all.file.click()">
				<form action="upload" id="uploadForm" method="post" enctype="multipart/form-data">
					<input type="file" name="file" id="file" style="display: none" onchange="setThumbnail(event);" />
				</form>
				<div class="button text-center" style="display: table-cell; vertical-align: middle;">
					<button type="button" id="i" class="btn btn-outline-secondary">커버 사진 추가하기</button>
				</div>
				<div id="change">
					<button type="button" id="u" class="btn btn-dark col-auto">
						<span class="align-text-bottom">사진 변경하기</span>
					</button>
				</div>
			</div>

                        <input type="text" class="form-control mt-5 mb-3 border-bottom" id="name" placeholder="제목을 입력하세요" value="" required style="border: none;">
			<div class="invalid-feedback">제목을 입력해주세요.</div>

			<textarea class="form-control border-0 mb-5"  id="ta"  placeholder="내용을입력하세요" style="resize: none; overflow-y:hidden;" onkeyup="xSize(this)"></textarea>
			<div class="invalid-feedback">내용을 입력해주세요.</div>
			<textarea id="xt" style="display:none; width:300px;height:1px;overflow-y:hidden;position:absolute;top:-9px"></textarea>
			
			<!-- 첨부 버튼 -->
			<div id="attach">
				<label class="ml-3" for="uploadInputBox">
					사진 추가하기<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-plus-circle" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  						<path fill-rule="evenodd" d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
  						<path fill-rule="evenodd" d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
					</svg>
				</label>
				<input id="uploadInputBox" style="display: none" type="file" name="filedata" multiple />
			</div>
			
			<div id="preview" class="content"></div>
	
			<!-- multipart 업로드시 영역 -->
			<form id="uploadForm" style="display: none;"></form>

			
			<textarea class="form-control border-0 mb-5"  id="ta2"  placeholder="내용을입력하세요" style="resize: none; overflow-y:hidden;" onkeyup="xSize2(this)"></textarea>
			<textarea id="xt" style="display:none; width:300px;height:1px;overflow-y:hidden;position:absolute;top:-9px"></textarea>

                        <div class="ml-3 mt-5 mb-5">
                            #해시태그
                        </div>

                        <div class="text-center mb-5">
                            <input type="submit" class="btn btn-outline-secondary" value="작성하기">
                        </div>


                        <!-- 파일 선택 시 이미지 표시해주는 function -->
                        <script>
	function setThumbnail(event) {
	    var reader = new FileReader();
	    reader.onload = function (event) {
	        var img = document.createElement("img");
	        img.setAttribute("src", event.target.result);
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
	function deleteImg(event){
		$("#image_container").find("img").remove();
		$("#i").show();
	   $("#u").hide();
	   $("#d").hide();
	}
	$("#i").show();
	$("#u").hide();
	$("#d").hide();
	$("#ta2").hide();
	
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
                                     		+ "<img id=\"image_container\" class=\"img\" src=\"" + img.target.result + "\" style=\"width:100%;\"\/>"
                                     		+ "<textarea class=\"form-control border-0 mt-2 mb-3\" id=\"ta\" rows=\"3\" placeholder=\"사진에 대한 설명을 작성해주세요\" style=\"resize: none;\"></textarea>"
                                     		+ "</div>"
                                            );
                    files[imgNum] = file;
                    $("#ta2").show();
                };
                reader.readAsDataURL(file);
            }
        } else
            alert('invalid file input'); // 첨부클릭 후 취소시의 대응책은 세우지 않았다.
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
            var xe = document.getElementById('xt'), t;
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
        xSize(document.getElementById('ta'));
        
        function xSize2(e)
        {
            var xe = document.getElementById('xt'), t;
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
        xSize2(document.getElementById('ta2'));

</script>


                    </div>
                </div>

            </div>
        </form>
    </div>
  </main>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>

</html>