<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
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

.preview {
	margin-bottom: 30px;
}

.attach > label {
	cursor:pointer;
}
</style>
</head>
<body class="bg-white">
	<jsp:include page="/WEB-INF/views/common/header.jsp" />

	<main role="main" style="min-height: 100vh;">
		<div class="container" style="max-width: 940px;">
			<form class="needs-validation" name="findWrite"
				id="findWrite" method="post"
				enctype="multipart/form-data" >
				<div>
					<div class="row">
						<div class="col-md-12 mt-5">

							<!-- 기본 정보 입력란 -->
							<div class="accordion mb-5" id="accordionExample">
								<div class="card">
									<div class="card-header" id="headingOne">
										<h2 class="mb-0">
											<button class="btn btn-light btn-block text-left"
												type="button" data-toggle="collapse"
												data-target="#collapseOne" aria-expanded="true"
												aria-controls="collapseOne">
												<svg width="1em" height="1em" viewBox="0 0 16 16"
													class="bi bi-pencil-square" fill="currentColor"
													xmlns="http://www.w3.org/2000/svg">
                                                <path
														d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456l-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z" />
                                                <path
														fill-rule="evenodd"
														d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z" />
                                            </svg>
												&nbsp;&nbsp;카테고리 선택 (클릭)
											</button>
										</h2>
									</div>

									<div id="collapseOne" class="collapse"
										aria-labelledby="headingOne" data-parent="#accordionExample">
										<div class="card-body form-inline">
											<label class="mr-3">카테고리</label>
											<div class="col-6">
												<select id="select" class="form-control" name="category" required>
													<option value="" selected disabled style="color: #bdbdbd;"><small>선택해주세요</small>
													</option>
													<option value="dog">강아지</option>
													<option value="cat">고양이</option>
													<option value="small">소동물</option>
												</select>
											</div>
										</div>
									</div>
								</div>
							</div>

							<!-- 파일 업로드 부분 -->
							<div id="delete">
								<button type="button" id="d" class="btn btn-light col-auto"
									onclick="deleteImg(event)">
									<span>x</span>
								</button>
							</div>
							<div class="float-none" id="image_container"
								style="display: table; background-color: #F7F7F7; height: 300px; width: 100%; position: relative;"
								onclick="document.all.file.click()">
								<input type="file" name="mainImg" id="file"
									style="display: none" onchange="setThumbnail(event);" required>
								<div class="button text-center"
									style="display: table-cell; vertical-align: middle;">
									<button type="button" id="i" class="btn btn-outline-secondary">메인
										사진 추가하기</button>
								</div>
								<div id="change">
									<button type="button" id="u" class="btn btn-dark col-auto">
										<span class="align-text-bottom">사진 변경하기</span>
									</button>
								</div>
							</div>

							<input type="text" class="form-control mt-5 mb-3 border-bottom"
								name="title" id="name" placeholder="제목을 입력하세요" value="" required
								style="border: none;">
							<div class="invalid-feedback">제목을 입력해주세요.</div>
							<textarea class="form-control border-0 mb-3" id="findPlace"
								name="address" placeholder="장소를입력하세요"
								style="resize: none; overflow-y: hidden;" required></textarea>

							<textarea class="form-control border-0 mb-3" id="ta"
								name="content" placeholder="반려동물의 특징을 입력하세요" 
								style="resize: none; min-height:100px;" required></textarea>


							<!-- 첨부 버튼 -->
							<div class="attach d-flex justify-content-center">
								<label class="ml-3 fileTarget"> 사진 추가하기 <svg width="1em"
										height="1em" viewBox="0 0 16 16"
										class="bi bi-plus-circle ml-2" fill="currentColor"
										xmlns="http://www.w3.org/2000/svg">
		  								<path fill-rule="evenodd"
											d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
		  								<path fill-rule="evenodd"
											d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z" />
									</svg>
								</label> <input class="uploadInputBox" style="display: none" type="file"
									name="contentImg" />
								<div class="preview d-flex flex-column content"></div>
							</div>


							<input type="hidden" name="memberNo" value="${loginMember.getMemberNo() }">
							<div class="d-flex justify-content-end my-5">
								<button type="submit" id="writeEnd" class="mt-5 btn btn-outline-secondary"> 작성하기 </button>
							</div>
						</div>
					</div>

				</div>
			</form>
		</div>
	</main>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	<script>
		function setThumbnail(event) {
			var reader = new FileReader();
			reader.onload = function(event) {
				var img = document.createElement("img");
				img.setAttribute("src",
						event.target.result);
				img.setAttribute("width", "100%");
				img.setAttribute("height", "300px");
	
				$("#image_container").find("img")
						.remove();
				document.querySelector(
						"div#image_container")
						.appendChild(img);
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
		$("#i").show();
		$("#u").hide();
		$("#d").hide();
		$("#ta2").hide();
		
		let ht = ` <div class="attach d-flex justify-content-center">
		<label class="ml-3 fileTarget" > 사진 추가하기
			<svg width="1em" height="1em" viewBox="0 0 16 16"
					class="bi bi-plus-circle ml-2" fill="currentColor"
					xmlns="http://www.w3.org/2000/svg">
						<path fill-rule="evenodd" d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
						<path fill-rule="evenodd" d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z" />
			</svg>
		</label> 
		<input class="uploadInputBox" style="display: none" type="file" name="contentImg" />
			<div class="preview d-flex flex-column content"></div>
	</div>`;
		let i = 0;
		$(function() {
			$(document).on("click",".fileTarget",e=>{
				i++;
				let pic = $(e.target).next();
				pic.click();
				pic.on("change", e1 => {
					let reader = new FileReader();
					reader.onload = (e2) => {
		               let img = $("<img>").attr({
		                 src: e2.target.result,
		                 width: 400,
		                 height: 400,
		               });

		              
		               pic.next().append(img);
		               
				    };
				    reader.readAsDataURL($(e1.target)[0].files[0]); //파일의 가상경로를 가져옴
				    pic.next().append(
		            		   `<div class="mb-2 d-flex justify-content-end"><button type="button" class=" btn btn-outline-secondary col-auto delBtn">
									삭제
								</button>
								</div>`);
				    $(e.target).addClass("d-none");
		               pic.parent().after(ht);
				})
			})
			
			$(document).on("click",".delBtn", e => {
				i--;
				$(e.target).parents(".attach").remove();
			})
			
			$("#writeEnd").on("click", e => {
				let file = document.getElementById("file").value;
				if(file.trim()=="") {
					alert("메인사진을 선택해주세요");
					return;
				}
				
				$("#findWrite").attr("action", "${path }/community/findWriteEnd.do").submit();
			})
		})
	</script>
</body>

</html>