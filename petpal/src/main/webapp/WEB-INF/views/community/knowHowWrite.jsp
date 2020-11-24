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
  
  <main role="main" style="min-height:100vh;">
  	<div class="container">
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
                                        <div class="col-md-4">
                                            <select class="form-control">
                                                    <option value="" selected disabled style="color: #bdbdbd;">선택해주세요
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
                        <div class="float-none" id="image_container"
                            style="display:table; background-color: #F2F2F2; height:300px; width :100%; position: relative;"
                            onclick="document.all.file.click()">
                            <form action="upload" id="uploadForm" method="post" enctype="multipart/form-data">
                                <input type="file" name="file" id="file" style="display:none"
                                    onchange="setThumbnail(event);" />
                            </form>
                            <div class="button text-center" style="display: table-cell; vertical-align: middle;">
                                <button type="button" id="i" class="btn btn-outline-secondary">사진 추가하기</button>
                            </div>
                            <div id="change">
                                <button type="button" id="u" class="btn btn-dark col-auto">
                                    <span class="align-text-bottom">사진 변경하기</span></button>
                            </div>
                        </div>

                        <input type="text" class="form-control text-center mt-3 mb-3 border-bottom" id="name" placeholder="제목을 입력하세요"
                            value="" required style="border:none;">
                        <div class="invalid-feedback">
                            제목을 입력해주세요.
                        </div>

                        <textarea class="form-control" placeholder="내용을입력하세요" rows="15" style="resize: none"></textarea>
                        <div class="invalid-feedback">
                            내용을 입력해주세요.
                        </div>


                        <div class="mt-3 mb-5">
                            #해시태그
                        </div>

                        <div class="text-center mb-5">
                            <input type="submit" class="btn btn-outline-secondary" value="글쓰기">
                        </div>

                        <!-- 사진 변경 버튼 style -->
                        <style>
                            #change {
                                right: 0px;
                                position:absolute; bottom:0px;

                            }
                        </style>

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
                                };
                                reader.readAsDataURL(event.target.files[0]);
                            }
                            $("#i").show();
                            $("#u").hide();
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