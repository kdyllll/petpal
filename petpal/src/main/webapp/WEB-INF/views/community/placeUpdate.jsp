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
  
  <main role="main" style="min-height: 100vh;">
		<section class="mt-5 pt-5">
			<div class="container">
				<div class="mb-5 mb-lg-1 ">
					<form id="writeFrm" class=" mt-5" method="post" enctype="multipart/form-data"
						action="${path }/place/placeWriteEnd.do">
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
									 id="title" name="title"
									style="height: 40px;">
							</div>
							<div class="col-12 col-md-4 mb-3">
								<select class="rounded" id="category" name="category"
									style="height: 40px; width: 70%; border: 1px solid #ced4da"
									required>
									<option value="">카테고리를 선택해주세요</option>
									<option>병원</option>
									<option>미용실</option>
									<option>호텔링</option>
									<option>훈련소</option>
									<option>기타</option>
								</select>
							</div>	
							<div class="input-group mb-3 col-6 pr-0">
								<div class="input-group-prepend" style="height: 40px;">
									<span class="input-group-text font-weight-bold"
										id="basic-addon1">&nbsp;주 소&nbsp;</span>
								</div>
								<input type="text" class="form-control text-center"
									 id="sample6_address" name="position"
									style="height: 40px;">
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
									 id="title" name="title"
									style="height: 40px;">
							</div>
							<div class="input-group mb-3 col-12 col-md-8">
								<div class="input-group-prepend" style="height: 40px;">
									<span class="input-group-text font-weight-bold"
										id="basic-addon1">&nbsp;장소 설명&nbsp;</span>
								</div>
								<input type="text" class="form-control text-center"
									 id="title" name="title"
									style="height: 40px;">
							</div>
						</div>
						<!--해시태그-->
						<div id="tagCon" class="mt-3 pl-2">
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
        	<%-- <c:forEach var="i" items="${imgList }" varStatus="vs">
        		<input type="hidden" class="change" name="${vs.index }" value="none"/>
        	</c:forEach>
            <p class="h2 mb-5 mt-2"><strong>장소후기 수정하기</strong></p>
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
	                <img src="${path }/resources/upload/community/daily/${i.dailyImgName}" class="col-12 p-0 rounded previewImg" style="width:100%;">	
	                <!-- 사진 수정, 삭제버튼 -->
	                <div class="buttonCon position-absolute rounded" style="bottom:0; left:0; background:linear-gradient(to top,rgba(0, 0, 0, 0.5),rgba(255, 255, 255, 0)); width:100%;">
	                     <button type="button" class="oriDelete btn ml-3">
	                       <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-trash text-white" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
	                         <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
	                         <path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4L4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
	                       </svg>
	                     </button>
	                     <label>
		                     <input name="update" class="d-none updatePic" type="file" accept="images/*" required/>
		                     <div class="oriUpdate btn ml-3">
		                     	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-counterclockwise text-white" viewBox="0 0 16 16">
								  <path fill-rule="evenodd" d="M8 3a5 5 0 1 1-4.546 2.914.5.5 0 0 0-.908-.417A6 6 0 1 0 8 2v1z"/>
								  <path d="M8 4.466V.534a.25.25 0 0 0-.41-.192L5.23 2.308a.25.25 0 0 0 0 .384l2.36 1.966A.25.25 0 0 0 8 4.466z"/>
								</svg>
		                     </div>
	                     </label>
	                </div>

	                
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
            </div> --%>
            

<jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>