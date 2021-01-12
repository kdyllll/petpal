<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<jsp:include page="/WEB-INF/views/common/commonLink.jsp" />

</head>
<body class="bg-white">
	<jsp:include page="/WEB-INF/views/common/header.jsp" />

	<main role="main" style="min-height: 100vh;">
		<section class="pt-5 mt-5">
			<div class="container">

				<h4 class="font-weight-bold mb-5">
					<c:out value="'${keyword }'"/>에 대한 통합검색 검색 결과<span class="text-info">&nbsp; <c:out value="${total }"/>개</span>
				</h4>
				<div class="row mb-5">
					<div class="col-12 d-flex justify-content-between mt-5">
						<h5 class="font-weight-bold ">
							스토어<span class="text-info">&nbsp;<c:out value="${storeCount }"/></span>
						</h5>
						<a href="${path }/search/moveSearchStore.do?keyword=${keyword}" class="d-none ${storeCount==0?'':'d-md-block'}">더보기</a>
					</div>
					<c:set value="${4-fn:length(pList) }" var="temp"/>
					<c:if test="${not empty pList }">
					<c:forEach items="${pList }" var="p" varStatus="status">
					<c:if test="${status.index<4 }">
					<div class="col-lg-3 col-md-4 col-sm-6">
						<a href="${path }/store/moveDetail.do?productNo=${p.productNo}"> <img class="card-img-top"
							src="${path }/resources/upload/product/detail/${p.imgName }" alt="">
							<h4 class="text-black" style="color: black;"><c:out value="${p.productName }"/></h4>
							<div>
								
								<span style="font-weight: bold; color: #35c5f0;"><c:out value="${p.sale }"/>%</span>
								<c:set var="per" value="${p.price-(p.price*p.sale/100) }"/>
								 <span style="font-weight: bold; color: black;"><fmt:formatNumber value="${per+(100-(per%100))%100 }"/>~</span>
							</div>
							<c:if test="${p.star!=0 }">
							<div>
							<span class="review">리뷰평점</span>
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
  <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
</svg>
								<small class="text-muted" style="font-weight: bold;"><c:out value="${p.star }"/></small>
							</div>
							</c:if>
						</a>
					</div>
					</c:if>
					</c:forEach> 
					</c:if>
					<c:if test="${not empty soList&&(4-fn:length(pList))>0 }">
					<c:forEach items="${soList }" var="p" varStatus="status">
					<c:if test="${status.index<temp}">
					<div class="col-lg-3 col-md-4 col-sm-6">
						<a href="${path }/store/moveDetail.do?productNo=${p.productNo}"> <img class="card-img-top"
							src="${path }/resources/upload/product/detail/${p.imgName }" alt="">
							<h4 class="text-black" style="color: black;"><c:out value="${p.productName }"/></h4>
							<div>
								<svg height="1.5em" width="2.5em" class="rounded" style="background-color:#CCCCCC">
									<text x="4" y="18" class="font-weight-bold">품절</text>
								</svg>
							</div>
							<c:if test="${p.star!=0 }">
							<div>
							<span class="review">리뷰평점</span>
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
  <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
</svg>
								<small class="text-muted" style="font-weight: bold;"><c:out value="${p.star }"/></small>
							</div>
							</c:if>
						</a>
					</div>
					</c:if>
					</c:forEach> 
					</c:if>
					
					<div class="col-12 d-md-none my-3 text-center font-weight-bold">
						<a href="${path }/search/moveSearchStore.do?keyword=${keyword}" class="bg-dark d-block"
							style="width: 100%; font-size: 18px;"> 스토어 더보기 <svg
								width="1.2em" height="1.2em" viewBox="0 0 16 16"
								class="arrow bi bi-chevron-compact-right" fill="currentColor"
								xmlns="http://www.w3.org/2000/svg">
            <path fill-rule="evenodd"
									d="M6.776 1.553a.5.5 0 0 1 .671.223l3 6a.5.5 0 0 1 0 .448l-3 6a.5.5 0 1 1-.894-.448L9.44 8 6.553 2.224a.5.5 0 0 1 .223-.671z" />
          </svg>
						</a>
					</div>
					<input type="hidden" class="loginMember"
						value="${loginMember.memberNo }" />
					<div class="col-12 d-flex justify-content-between mt-5">
						<h5 class="font-weight-bold ">
							일상<span class="text-info">&nbsp;<c:out value="${dCount }"/></span>
						</h5>
						<a href="${path }/daily/moveList.do?word=${keyword}" class="d-none ${dCount==0?'':'d-md-block'}">더보기</a>
					</div>
					<c:if test="${not empty dailyList }">

								<c:forEach var="d" items="${dailyList}" varStatus="status">
								<c:if test="${status.index<4 }">
									<address class="col-xl-3 col-lg-4 col-md-6 m-0">
										<div class="card mb-4 bg-transparent border-0">
											<div class="px-3 row mb-2">
												<c:if test="${not empty d.IMG }">
													<a
														href="${path }/user/moveUserInfo.do?memberNo=${d.MEMBERNO}"><img
														src="${path }/resources/upload/member/profile/${d.IMG}"
														class="rounded" style="width: 40px; height: 40px;"></a>
												</c:if>
												<c:if test="${ empty d.IMG }">
													<a
														href="${path }/user/moveUserInfo.do?memberNo=${d.MEMBERNO}"><img
														src="${path }/resources/upload/member/profile/avatar.webp"
														class="rounded" style="width: 40px; height: 40px;"></a>
												</c:if>
												<div class="ml-1">
													<a
														href="${path }/user/moveUserInfo.do?memberNo=${d.MEMBERNO}"><span
														class="text-dark align-top mx-1"><strong><c:out
																	value="${d.NICKNAME }" /></strong></span></a> <span><strong>
															· </strong></span> <span><button
															class="btn btn-link text-point p-0 align-top">
															
															<c:set var="flag" value="false" />
															<c:if test="${not empty loginMember }">
																<c:if test="${not empty dFollowing }">
																	<c:forEach var = "f" items="${dFollowing }">
																		<c:if test="${f.WRITERNO eq d.MEMBERNO }">
																			<c:set var="flag" value="true" />
																		</c:if>
																	</c:forEach>
																</c:if>
															</c:if>
															
															<c:if test="${empty loginMember }">
																<strong onclick="follow(event);"> 팔로우</strong>
															</c:if>
															
															<c:choose>
																<c:when test="${!empty loginMember }">
																	<c:choose>
																		<c:when test="${loginMember.memberNo eq d.MEMBERNO }">
																			<strong> 작성자</strong>
																		</c:when>
																		<c:when test="${loginMember.memberNo ne d.MEMBERNO }">
																			<c:choose>
																				<c:when test="${flag eq false }">
																					<strong onclick="follow(event);"> 팔로우</strong>
																					<input type="hidden" value="${d.MEMBERNO }">
																				</c:when>
																				<c:when test="${flag eq true }">
																					<strong class="text-muted" onclick="follow(event);"> 팔로잉</strong>
																					<input type="hidden" value="${d.MEMBERNO }">
																				</c:when>
																			</c:choose>
																		</c:when>
																	</c:choose>
																</c:when>
															</c:choose>
															
															
														</button></span>
													<p class="ml-1" style="font-size: 12px;">
														<c:out value="${d.INFO }" />
													</p>
												</div>
											</div>
											<c:forEach var="i" items="${imgList}">
												<c:if test="${i.dailyNo eq d.DAILYNO}">
													<a class="d-inline-block"
														href="${path }/daily/moveDetail.do?dailyNo=${d.DAILYNO }">
														<img
														src="${path }/resources/upload/community/daily/${i.dailyImgName}"
														class="rounded scale" width="100%"> <input
														type="hidden" value="${d.DAILYNO }" />
													</a>
												</c:if>
											</c:forEach>
											<c:set var="flag2" value="false" />
											<c:if test="${not empty dLike }">
												<c:forEach var="l" items="${dLike }">
													<c:if test="${l eq d.DAILYNO }">
														<c:set var="flag2" value="true" />
													</c:if>
												</c:forEach>

											</c:if>
											<div class="d-flex justify-content-between mx-1 my-1">
												<div class="likeCon d-flex align-items-center">

													<c:if test="${empty loginMember }">
														<button type="button" class="btn btn-sm">
															<svg xmlns="http://www.w3.org/2000/svg" width="20px"
																height="20px" fill="currentColor"
																class="bi heartBtnLine bi-suit-heart  text-dark"
																viewBox="0 0 16 16">
											  					<path d="M8 6.236l-.894-1.789c-.222-.443-.607-1.08-1.152-1.595C5.418 2.345 4.776 2 4 2 2.324 2 1 3.326 1 4.92c0 1.211.554 2.066 1.868 3.37.337.334.721.695 1.146 1.093C5.122 10.423 6.5 11.717 8 13.447c1.5-1.73 2.878-3.024 3.986-4.064.425-.398.81-.76 1.146-1.093C14.446 6.986 15 6.131 15 4.92 15 3.326 13.676 2 12 2c-.777 0-1.418.345-1.954.852-.545.515-.93 1.152-1.152 1.595L8 6.236zm.392 8.292a.513.513 0 0 1-.784 0c-1.601-1.902-3.05-3.262-4.243-4.381C1.3 8.208 0 6.989 0 4.92 0 2.755 1.79 1 4 1c1.6 0 2.719 1.05 3.404 2.008.26.365.458.716.596.992a7.55 7.55 0 0 1 .596-.992C9.281 2.049 10.4 1 12 1c2.21 0 4 1.755 4 3.92 0 2.069-1.3 3.288-3.365 5.227-1.193 1.12-2.642 2.48-4.243 4.38z" />
															</svg>
														</button>

													</c:if>
													<c:if test="${not empty loginMember }">
														<c:if test="${flag2 eq false }">
															<input type="hidden" name="dailyNum"
																value="${d.DAILYNO }">

															<button type="button" class="btn btn-sm">
																<svg xmlns="http://www.w3.org/2000/svg" width="20px"
																	height="20px" fill="currentColor"
																	class="bi heartBtnLine bi-suit-heart  text-dark"
																	viewBox="0 0 16 16">
																  <path d="M8 6.236l-.894-1.789c-.222-.443-.607-1.08-1.152-1.595C5.418 2.345 4.776 2 4 2 2.324 2 1 3.326 1 4.92c0 1.211.554 2.066 1.868 3.37.337.334.721.695 1.146 1.093C5.122 10.423 6.5 11.717 8 13.447c1.5-1.73 2.878-3.024 3.986-4.064.425-.398.81-.76 1.146-1.093C14.446 6.986 15 6.131 15 4.92 15 3.326 13.676 2 12 2c-.777 0-1.418.345-1.954.852-.545.515-.93 1.152-1.152 1.595L8 6.236zm.392 8.292a.513.513 0 0 1-.784 0c-1.601-1.902-3.05-3.262-4.243-4.381C1.3 8.208 0 6.989 0 4.92 0 2.755 1.79 1 4 1c1.6 0 2.719 1.05 3.404 2.008.26.365.458.716.596.992a7.55 7.55 0 0 1 .596-.992C9.281 2.049 10.4 1 12 1c2.21 0 4 1.755 4 3.92 0 2.069-1.3 3.288-3.365 5.227-1.193 1.12-2.642 2.48-4.243 4.38z" />
																</svg>
															</button>
															<button type="button" class="btn btn-sm d-none">
																<svg xmlns="http://www.w3.org/2000/svg" width="20px"
																	height="20px" fill="currentColor"
																	class="bi bi-suit-heart-fill text-danger "
																	viewBox="0 0 16 16">
											 						 <path class="heartBtnFill" d="M4 1c2.21 0 4 1.755 4 3.92C8 2.755 9.79 1 12 1s4 1.755 4 3.92c0 3.263-3.234 4.414-7.608 9.608a.513.513 0 0 1-.784 0C3.234 9.334 0 8.183 0 4.92 0 2.755 1.79 1 4 1z" />
																</svg>
															</button>
														</c:if>
														<c:if test="${flag2 eq true }">
															<input type="hidden" name="dailyNum"
																value="${d.DAILYNO }">
															<button type="button" class="btn btn-sm d-none">
																<svg xmlns="http://www.w3.org/2000/svg" width="20px"
																	height="20px" fill="currentColor"
																	class="bi heartBtnLine bi-suit-heart  text-dark"
																	viewBox="0 0 16 16">
															  <path d="M8 6.236l-.894-1.789c-.222-.443-.607-1.08-1.152-1.595C5.418 2.345 4.776 2 4 2 2.324 2 1 3.326 1 4.92c0 1.211.554 2.066 1.868 3.37.337.334.721.695 1.146 1.093C5.122 10.423 6.5 11.717 8 13.447c1.5-1.73 2.878-3.024 3.986-4.064.425-.398.81-.76 1.146-1.093C14.446 6.986 15 6.131 15 4.92 15 3.326 13.676 2 12 2c-.777 0-1.418.345-1.954.852-.545.515-.93 1.152-1.152 1.595L8 6.236zm.392 8.292a.513.513 0 0 1-.784 0c-1.601-1.902-3.05-3.262-4.243-4.381C1.3 8.208 0 6.989 0 4.92 0 2.755 1.79 1 4 1c1.6 0 2.719 1.05 3.404 2.008.26.365.458.716.596.992a7.55 7.55 0 0 1 .596-.992C9.281 2.049 10.4 1 12 1c2.21 0 4 1.755 4 3.92 0 2.069-1.3 3.288-3.365 5.227-1.193 1.12-2.642 2.48-4.243 4.38z" />
															</svg>
															</button>
															<button type="submit" class="btn btn-sm">
																<svg xmlns="http://www.w3.org/2000/svg" width="20px"
																	height="20px" fill="currentColor"
																	class="bi bi-suit-heart-fill text-danger "
																	viewBox="0 0 16 16">
																  <path class="heartBtnFill" d="M4 1c2.21 0 4 1.755 4 3.92C8 2.755 9.79 1 12 1s4 1.755 4 3.92c0 3.263-3.234 4.414-7.608 9.608a.513.513 0 0 1-.784 0C3.234 9.334 0 8.183 0 4.92 0 2.755 1.79 1 4 1z" />
																</svg>
															</button>

														</c:if>
													</c:if>
													<span class="likeCount text-dark mx-1"><c:out value="${d.likeCnt }"/></span>
												</div>

												<div class="d-flex align-items-center">
													<div class="mr-1">
														<svg width="20px" height="20px" viewBox="0 0 16 16"
															class="bi bi-chat text-dark" fill="currentColor"
															xmlns="http://www.w3.org/2000/svg"
															style="font-size: 25px;">
			                                    				<path fill-rule="evenodd" d="M2.678 11.894a1 1 0 0 1 .287.801 10.97 10.97 0 0 1-.398 2c1.395-.323 2.247-.697 2.634-.893a1 1 0 0 1 .71-.074A8.06 8.06 0 0 0 8 14c3.996 0 7-2.807 7-6 0-3.192-3.004-6-7-6S1 4.808 1 8c0 1.468.617 2.83 1.678 3.894zm-.493 3.905a21.682 21.682 0 0 1-.713.129c-.2.032-.352-.176-.273-.362a9.68 9.68 0 0 0 .244-.637l.003-.01c.248-.72.45-1.548.524-2.319C.743 11.37 0 9.76 0 8c0-3.866 3.582-7 8-7s8 3.134 8 7-3.582 7-8 7a9.06 9.06 0 0 1-2.347-.306c-.52.263-1.639.742-3.468 1.105z" />
			                               				 </svg>
													</div>
													<span class="text-dark mx-1 align-text-middle"><c:out value="${d.commentCnt }"/></span>
												</div>
											</div>
											<div class="card-body p-0 px-1">
												<p class="card-text mb-1"><c:out value="${fn:substring(d.CONTENT, 0, 41) }"/>${fn:length(d.CONTENT) gt 42?'...':''}</p>
												<div class="d-flex justify-content-between align-items-center">
													<small class="text-muted pl-1"> 
															<c:forEach var="h" items="${d.hashList}">
						                                		<c:if test="${not empty h}">
						                                    		<a href="${path }/community/hashSearch.do?hashtag=${h}" class="text-secondary bg-point">#<c:out value="${h }"/></a>
						                                    	</c:if>
						                                    </c:forEach>					
													</small>
												</div>
											</div>
										</div>
									</address>
									</c:if>
								</c:forEach>
							</c:if>
							<!-- 일상리스트끝 -->
					<div class="col-12 d-md-none my-3 text-center font-weight-bold">
						<a href="${path }/daily/moveList.do?word=${keyword}" class="bg-dark d-block"
							style="width: 100%; font-size: 18px;"> 일상 더보기 <svg
								width="1.2em" height="1.2em" viewBox="0 0 16 16"
								class="arrow bi bi-chevron-compact-right" fill="currentColor"
								xmlns="http://www.w3.org/2000/svg">
            <path fill-rule="evenodd"
									d="M6.776 1.553a.5.5 0 0 1 .671.223l3 6a.5.5 0 0 1 0 .448l-3 6a.5.5 0 1 1-.894-.448L9.44 8 6.553 2.224a.5.5 0 0 1 .223-.671z" />
          </svg>
						</a>
					</div>
					<div class="col-12 d-flex justify-content-between mt-5">
						<h5 class="font-weight-bold ">
							찾아주세요<span class="text-info">&nbsp;<c:out value="${fCount }"/></span>
						</h5>
						<a href="${path }/community/findList.do?word=${keyword}" class="d-none ${fCount==0?'':'d-md-block'}">더보기</a>
					</div>
					<c:if test="${not empty findList  }">
						<c:forEach var="t" items="${findList}" varStatus="status">
						<c:if test="${status.index<4 }">
							<div class="col-xl-3 col-lg-4 col-md-6 mb-5">
								<div class="card mb-4 bg-transparent border-0">
									<div class="px-3 row mb-2">
										<c:if test="${not empty t.IMG }">
											<a
												href="${path }/user/moveUserInfo.do?memberNo=${t.MEMBERNO}"><img
												src="${path }/resources/upload/member/profile/${t.IMG}"
												style="width: 40px; height: 40px; border-radius: 50%;"></a>
										</c:if>
										<c:if test="${ empty t.IMG }">
											<a
												href="${path }/user/moveUserInfo.do?memberNo=${t.MEMBERNO}"><img
												src="${path }/resources/upload/member/profile/avatar.webp"
												style="width: 40px; height: 40px; border-radius: 50%;"></a>
										</c:if>
										<div class="ml-1">
											<a
												href="${path }/user/moveUserInfo.do?memberNo=${t.MEMBERNO}"><span
												class="text-dark align-top mx-1"><strong><c:out
															value="${t.NICKNAME }" /></strong></span></a> <span><strong>
													· </strong></span> <span><button
													class="btn btn-link text-point p-0 align-top">
													
														
														<c:set var="flag" value="false" />
															<c:if test="${not empty loginMember }">
																<c:if test="${not empty fFollowing }">
																	<c:forEach var = "f" items="${fFollowing }">
																		<c:if test="${f.WRITERNO eq t.MEMBERNO }">
																			<c:set var="flag" value="true" />
																		</c:if>
																	</c:forEach>
																</c:if>
															</c:if>
															
														
														
														
														
														<c:if test="${empty loginMember }">
																<strong onclick="follow(event);"> 팔로우</strong>
															</c:if>
															
															<c:choose>
																<c:when test="${!empty loginMember }">
																	<c:choose>
																		<c:when test="${loginMember.memberNo eq t.MEMBERNO }">
																			<strong> 작성자</strong>
																		</c:when>
																		<c:when test="${loginMember.memberNo ne t.MEMBERNO }">
																			<c:choose>
																				<c:when test="${flag eq false }">
																					<strong onclick="follow(event);"> 팔로우</strong>
																					<input type="hidden" value="${t.MEMBERNO }">
																				</c:when>
																				<c:when test="${flag eq true }">
																					<strong class="text-muted" onclick="follow(event);"> 팔로잉</strong>
																					<input type="hidden" value="${t.MEMBERNO }">
																				</c:when>
																			</c:choose>
																		</c:when>
																	</c:choose>
																</c:when>
															</c:choose>
												</button></span>

										</div>
									</div>

									<a class="d-inline-block"
										href="${path}/community/findDetail.do?findNo=${t.FINDNO}">
										<img src="${path }/resources/upload/find/${t.FILENAME}"
										class="rounded" style="width: 100%; height: 250px;"> <input
										type="hidden" value="${t.FINDNO }" />
									</a>

									<c:set var="flag2" value="false" />
									<c:if test="${not empty like }">
										<c:forEach var="l" items="${like }">
											<c:if test="${l eq t.FINDNO }">
												<c:set var="flag2" value="true" />
											</c:if>
										</c:forEach>

									</c:if>
									
									<div class="d-flex justify-content-between mx-1 my-1">
										<div class="likeFrm" method="post">
											<c:if test="${empty loginMember }">
												<button type="button" class="btn btn-sm">
													<svg xmlns="http://www.w3.org/2000/svg" width="20px"
														height="20px" fill="currentColor"
														class="bi heartBtnLine bi-suit-heart  text-dark"
														viewBox="0 0 16 16">
											  <path
															d="M8 6.236l-.894-1.789c-.222-.443-.607-1.08-1.152-1.595C5.418 2.345 4.776 2 4 2 2.324 2 1 3.326 1 4.92c0 1.211.554 2.066 1.868 3.37.337.334.721.695 1.146 1.093C5.122 10.423 6.5 11.717 8 13.447c1.5-1.73 2.878-3.024 3.986-4.064.425-.398.81-.76 1.146-1.093C14.446 6.986 15 6.131 15 4.92 15 3.326 13.676 2 12 2c-.777 0-1.418.345-1.954.852-.545.515-.93 1.152-1.152 1.595L8 6.236zm.392 8.292a.513.513 0 0 1-.784 0c-1.601-1.902-3.05-3.262-4.243-4.381C1.3 8.208 0 6.989 0 4.92 0 2.755 1.79 1 4 1c1.6 0 2.719 1.05 3.404 2.008.26.365.458.716.596.992a7.55 7.55 0 0 1 .596-.992C9.281 2.049 10.4 1 12 1c2.21 0 4 1.755 4 3.92 0 2.069-1.3 3.288-3.365 5.227-1.193 1.12-2.642 2.48-4.243 4.38z" />
											</svg>
												</button>

											</c:if>
											<c:if test="${not empty loginMember }">
												<c:if test="${flag2 eq false }">
													<input type="hidden" name="findNum" value="${t.FINDNO }">

													<button type="button" class="btn btn-sm">
														<svg xmlns="http://www.w3.org/2000/svg" width="20px"
															height="20px" fill="currentColor"
															class="bi heartBtnLine bi-suit-heart  text-dark"
															viewBox="0 0 16 16">
											  <path
																d="M8 6.236l-.894-1.789c-.222-.443-.607-1.08-1.152-1.595C5.418 2.345 4.776 2 4 2 2.324 2 1 3.326 1 4.92c0 1.211.554 2.066 1.868 3.37.337.334.721.695 1.146 1.093C5.122 10.423 6.5 11.717 8 13.447c1.5-1.73 2.878-3.024 3.986-4.064.425-.398.81-.76 1.146-1.093C14.446 6.986 15 6.131 15 4.92 15 3.326 13.676 2 12 2c-.777 0-1.418.345-1.954.852-.545.515-.93 1.152-1.152 1.595L8 6.236zm.392 8.292a.513.513 0 0 1-.784 0c-1.601-1.902-3.05-3.262-4.243-4.381C1.3 8.208 0 6.989 0 4.92 0 2.755 1.79 1 4 1c1.6 0 2.719 1.05 3.404 2.008.26.365.458.716.596.992a7.55 7.55 0 0 1 .596-.992C9.281 2.049 10.4 1 12 1c2.21 0 4 1.755 4 3.92 0 2.069-1.3 3.288-3.365 5.227-1.193 1.12-2.642 2.48-4.243 4.38z" />
											</svg>
													</button>
													<button type="button" class="btn btn-sm d-none">
														<svg xmlns="http://www.w3.org/2000/svg" width="20px"
															height="20px" fill="currentColor"
															class="bi bi-suit-heart-fill text-danger "
															viewBox="0 0 16 16">
											  <path class="heartBtnFill"
																d="M4 1c2.21 0 4 1.755 4 3.92C8 2.755 9.79 1 12 1s4 1.755 4 3.92c0 3.263-3.234 4.414-7.608 9.608a.513.513 0 0 1-.784 0C3.234 9.334 0 8.183 0 4.92 0 2.755 1.79 1 4 1z" />
											</svg>
													</button>
												</c:if>
												<c:if test="${flag2 eq true }">

													<input type="hidden" name="findNum" value="${t.FINDNO }">
													<button type="button" class="btn btn-sm d-none">
														<svg xmlns="http://www.w3.org/2000/svg" width="20px"
															height="20px" fill="currentColor"
															class="bi heartBtnLine bi-suit-heart  text-dark"
															viewBox="0 0 16 16">
											  <path
																d="M8 6.236l-.894-1.789c-.222-.443-.607-1.08-1.152-1.595C5.418 2.345 4.776 2 4 2 2.324 2 1 3.326 1 4.92c0 1.211.554 2.066 1.868 3.37.337.334.721.695 1.146 1.093C5.122 10.423 6.5 11.717 8 13.447c1.5-1.73 2.878-3.024 3.986-4.064.425-.398.81-.76 1.146-1.093C14.446 6.986 15 6.131 15 4.92 15 3.326 13.676 2 12 2c-.777 0-1.418.345-1.954.852-.545.515-.93 1.152-1.152 1.595L8 6.236zm.392 8.292a.513.513 0 0 1-.784 0c-1.601-1.902-3.05-3.262-4.243-4.381C1.3 8.208 0 6.989 0 4.92 0 2.755 1.79 1 4 1c1.6 0 2.719 1.05 3.404 2.008.26.365.458.716.596.992a7.55 7.55 0 0 1 .596-.992C9.281 2.049 10.4 1 12 1c2.21 0 4 1.755 4 3.92 0 2.069-1.3 3.288-3.365 5.227-1.193 1.12-2.642 2.48-4.243 4.38z" />
											</svg>
													</button>
													<button type="submit" class="btn btn-sm">
														<svg xmlns="http://www.w3.org/2000/svg" width="20px"
															height="20px" fill="currentColor"
															class="bi bi-suit-heart-fill text-danger "
															viewBox="0 0 16 16">
											  <path class="heartBtnFill"
																d="M4 1c2.21 0 4 1.755 4 3.92C8 2.755 9.79 1 12 1s4 1.755 4 3.92c0 3.263-3.234 4.414-7.608 9.608a.513.513 0 0 1-.784 0C3.234 9.334 0 8.183 0 4.92 0 2.755 1.79 1 4 1z" />
											</svg>
													</button>

												</c:if>

											</c:if>
											<c:set var="ct" value="0" />
											<c:forEach var="cnt" items="${fLikeCnt }">
												<c:if test="${cnt.FINDNO eq t.FINDNO }">
													<c:set var="ct" value="${cnt.CNT }" />
												</c:if>
											</c:forEach>
											<span class="text-dark mx-1"><c:out value="${ct }"/></span>

										</div>

										<div>
											<button class="btn btn-link btn-sm">
												<svg xmlns="http://www.w3.org/2000/svg" width="20px"
													height="20px" fill="currentColor"
													class="bi bi-chat text-dark" viewBox="0 0 16 16">
											  <path
														d="M2.678 11.894a1 1 0 0 1 .287.801 10.97 10.97 0 0 1-.398 2c1.395-.323 2.247-.697 2.634-.893a1 1 0 0 1 .71-.074A8.06 8.06 0 0 0 8 14c3.996 0 7-2.807 7-6 0-3.192-3.004-6-7-6S1 4.808 1 8c0 1.468.617 2.83 1.678 3.894zm-.493 3.905a21.682 21.682 0 0 1-.713.129c-.2.032-.352-.176-.273-.362a9.68 9.68 0 0 0 .244-.637l.003-.01c.248-.72.45-1.548.524-2.319C.743 11.37 0 9.76 0 8c0-3.866 3.582-7 8-7s8 3.134 8 7-3.582 7-8 7a9.06 9.06 0 0 1-2.347-.306c-.52.263-1.639.742-3.468 1.105z" />
											</svg>
											</button>
											<span class="text-dark mx-1 align-text-middle"><c:out value="${t.commentCnt }"/></span>
										</div>
									</div>
									<div class="card-body p-0 px-1">
										<h5 class="card-title title">
											<strong><c:out value="${t.TITLE }" /></strong>
										</h5>
										<p class="card-text content">
											<c:out value="${fn:substring(t.CONTENT,0,10) }" />
											<c:if test="${fn:length(t.CONTENT)>10 }"> ... </c:if>
										</p>
										<span class="address text-muted">장소 : <c:out
												value="${t.ADDRESS }" /></span>
									</div>

								</div>
							</div>
							</c:if>
						</c:forEach>

					</c:if>
					<!-- 찾아주세요끝 -->
					<div class="col-12 d-md-none my-3 text-center font-weight-bold">
						<a href="${path }/community/findList.do?word=${keyword}" class="bg-dark d-block"
							style="width: 100%; font-size: 18px;"> 찾아주세요 더보기 <svg
								width="1.2em" height="1.2em" viewBox="0 0 16 16"
								class="arrow bi bi-chevron-compact-right" fill="currentColor"
								xmlns="http://www.w3.org/2000/svg">
            <path fill-rule="evenodd"
									d="M6.776 1.553a.5.5 0 0 1 .671.223l3 6a.5.5 0 0 1 0 .448l-3 6a.5.5 0 1 1-.894-.448L9.44 8 6.553 2.224a.5.5 0 0 1 .223-.671z" />
          </svg>
						</a>
					</div>
					<div class="col-12 d-flex justify-content-between mt-5 mb-3">
						<h5 class="font-weight-bold ">
							노하우<span class="text-info">&nbsp;<c:out value="${tCount }"/></span>
						</h5>
						<a href="${path }/community/tipList.do?word=${keyword}" class="d-none ${tCount==0?'':'d-md-block'}">더보기</a>
					</div>
					<c:if test="${not empty tipList }">
								<c:forEach items="${tipList }" var="t" varStatus="status">
								<c:if test="${status.index<4 }">
									<c:if test="${not empty t.MAINIMG }">
										<address class="col-xl-3 col-lg-4 col-md-6 m-0" style="cursor: pointer">
											<div class="card mb-4 bg-transparent border-0">

												<div class="px-3 row mb-2">
													<c:if test="${not empty t.IMG }">
														<a href="${path }/user/moveUserInfo.do?memberNo=${t.MEMBERNO}">
															<img src="${path }/resources/upload/member/profile/${t.IMG}" class="rounded" style="width: 40px; height: 40px;">
														</a>
													</c:if>
													<c:if test="${ empty t.IMG }">
														<a href="${path }/user/moveUserInfo.do?memberNo=${t.MEMBERNO}">
															<img src="${path }/resources/upload/member/profile/avatar.webp" class="rounded" style="width: 40px; height: 40px;">
														</a>
													</c:if>
													<div class="ml-1">
														<a href="${path }/user/moveUserInfo.do?memberNo=${t.MEMBERNO}">
															<span class="text-dark align-top mx-1">
																<strong><c:out value="${t.NICKNAME }" /></strong>
															</span>
														</a>
														<span><strong> · </strong></span>
														<span><button class="btn btn-link text-point p-0 align-top">
																<c:set var="flag" value="false" />
																<c:if test="${not empty loginMember }">
																	<c:if test="${not empty following }">
																		<c:forEach var="f" items="${following }">
																			<c:if test="${f.WRITERNO eq t.MEMBERNO }">
																				<c:set var="flag" value="true" />
																			</c:if>
																		</c:forEach>
																	</c:if>
																</c:if>

																<c:if test="${empty loginMember }">
																	<strong onclick="follow(event);"> 팔로우</strong>
																</c:if>

																<c:choose>
																	<c:when test="${!empty loginMember }">
																		<c:choose>
																			<c:when test="${loginMember.memberNo eq t.MEMBERNO }">
																				<strong> 작성자</strong>
																			</c:when>
																			<c:when test="${loginMember.memberNo ne t.MEMBERNO }">
																				<c:choose>
																					<c:when test="${flag eq false }">
																						<strong onclick="follow(event);"> 팔로우</strong>
																						<input type="hidden" value="${t.MEMBERNO }">
																					</c:when>
																					<c:when test="${flag eq true }">
																						<strong class="text-muted"
																							onclick="follow(event);"> 팔로잉</strong>
																						<input type="hidden" value="${t.MEMBERNO }">
																					</c:when>
																				</c:choose>
																			</c:when>
																		</c:choose>
																	</c:when>
																</c:choose>
															</button></span>
															<c:if test="${not empty t.INFO }">
															<p class="ml-1" style="font-size: 12px;">
																<c:out value="${t.INFO }" />
															</p>
														</c:if>
															<c:if test="${empty t.INFO }">
															<div style="margin-bottom:35px;"></div>
														</c:if>
													</div>
												</div>
												<input type="hidden" class="tipNo" value="${t.TIPNO }">
												<div class="img test">
													<img src="${path}/resources/upload/tip/${t.MAINIMG}" id="scale" width="100%" height="225">
												</div>
												<c:set var="flag2" value="false" />
												<c:if test="${not empty like }">
													<c:forEach var="l" items="${like }">
														<c:if test="${l eq t.TIPNO }">
															<c:set var="flag2" value="true" />
														</c:if>
													</c:forEach>
												</c:if>
												<div class="card-body">
													<!-- 하트 -->
													<div class="d-flex justify-content-between">
														<div class="likeCon likeFrm d-flex align-items-center" method="post">
															<c:if test="${empty loginMember }">
																<button type="button" class="btn btn-sm">
																	<svg xmlns="http://www.w3.org/2000/svg" width="20px" height="20px" fill="currentColor" class="bi heartBtnLine bi-suit-heart  text-dark" viewBox="0 0 16 16">
													  					<path d="M8 6.236l-.894-1.789c-.222-.443-.607-1.08-1.152-1.595C5.418 2.345 4.776 2 4 2 2.324 2 1 3.326 1 4.92c0 1.211.554 2.066 1.868 3.37.337.334.721.695 1.146 1.093C5.122 10.423 6.5 11.717 8 13.447c1.5-1.73 2.878-3.024 3.986-4.064.425-.398.81-.76 1.146-1.093C14.446 6.986 15 6.131 15 4.92 15 3.326 13.676 2 12 2c-.777 0-1.418.345-1.954.852-.545.515-.93 1.152-1.152 1.595L8 6.236zm.392 8.292a.513.513 0 0 1-.784 0c-1.601-1.902-3.05-3.262-4.243-4.381C1.3 8.208 0 6.989 0 4.92 0 2.755 1.79 1 4 1c1.6 0 2.719 1.05 3.404 2.008.26.365.458.716.596.992a7.55 7.55 0 0 1 .596-.992C9.281 2.049 10.4 1 12 1c2.21 0 4 1.755 4 3.92 0 2.069-1.3 3.288-3.365 5.227-1.193 1.12-2.642 2.48-4.243 4.38z" />
																	</svg>
																</button>

															</c:if>
															<c:if test="${not empty loginMember }">
																<c:if test="${flag2 eq false }">
																	<input type="hidden" name="tipNum" value="${t.TIPNO }">
																	<button type="button" class="btn btn-sm">
																		<svg xmlns="http://www.w3.org/2000/svg" width="20px" height="20px" fill="currentColor" class="bi heartBtnLine bi-suit-heart  text-dark" viewBox="0 0 16 16">
																		  <path d="M8 6.236l-.894-1.789c-.222-.443-.607-1.08-1.152-1.595C5.418 2.345 4.776 2 4 2 2.324 2 1 3.326 1 4.92c0 1.211.554 2.066 1.868 3.37.337.334.721.695 1.146 1.093C5.122 10.423 6.5 11.717 8 13.447c1.5-1.73 2.878-3.024 3.986-4.064.425-.398.81-.76 1.146-1.093C14.446 6.986 15 6.131 15 4.92 15 3.326 13.676 2 12 2c-.777 0-1.418.345-1.954.852-.545.515-.93 1.152-1.152 1.595L8 6.236zm.392 8.292a.513.513 0 0 1-.784 0c-1.601-1.902-3.05-3.262-4.243-4.381C1.3 8.208 0 6.989 0 4.92 0 2.755 1.79 1 4 1c1.6 0 2.719 1.05 3.404 2.008.26.365.458.716.596.992a7.55 7.55 0 0 1 .596-.992C9.281 2.049 10.4 1 12 1c2.21 0 4 1.755 4 3.92 0 2.069-1.3 3.288-3.365 5.227-1.193 1.12-2.642 2.48-4.243 4.38z" />
																		</svg>
																	</button>
																	<button type="button" class="btn btn-sm d-none">
																		<svg xmlns="http://www.w3.org/2000/svg" width="20px" height="20px" fill="currentColor" class="bi bi-suit-heart-fill text-danger " viewBox="0 0 16 16">
													 						 <path class="heartBtnFill" d="M4 1c2.21 0 4 1.755 4 3.92C8 2.755 9.79 1 12 1s4 1.755 4 3.92c0 3.263-3.234 4.414-7.608 9.608a.513.513 0 0 1-.784 0C3.234 9.334 0 8.183 0 4.92 0 2.755 1.79 1 4 1z" />
																		</svg>
																	</button>
																</c:if>
																<c:if test="${flag2 eq true }">
																	<input type="hidden" name="tipNum" value="${t.TIPNO }">
																	<button type="button" class="btn btn-sm d-none">
																		<svg xmlns="http://www.w3.org/2000/svg" width="20px" height="20px" fill="currentColor" class="bi heartBtnLine bi-suit-heart  text-dark" viewBox="0 0 16 16">
																		  <path d="M8 6.236l-.894-1.789c-.222-.443-.607-1.08-1.152-1.595C5.418 2.345 4.776 2 4 2 2.324 2 1 3.326 1 4.92c0 1.211.554 2.066 1.868 3.37.337.334.721.695 1.146 1.093C5.122 10.423 6.5 11.717 8 13.447c1.5-1.73 2.878-3.024 3.986-4.064.425-.398.81-.76 1.146-1.093C14.446 6.986 15 6.131 15 4.92 15 3.326 13.676 2 12 2c-.777 0-1.418.345-1.954.852-.545.515-.93 1.152-1.152 1.595L8 6.236zm.392 8.292a.513.513 0 0 1-.784 0c-1.601-1.902-3.05-3.262-4.243-4.381C1.3 8.208 0 6.989 0 4.92 0 2.755 1.79 1 4 1c1.6 0 2.719 1.05 3.404 2.008.26.365.458.716.596.992a7.55 7.55 0 0 1 .596-.992C9.281 2.049 10.4 1 12 1c2.21 0 4 1.755 4 3.92 0 2.069-1.3 3.288-3.365 5.227-1.193 1.12-2.642 2.48-4.243 4.38z" />
																		</svg>
																	</button>
																	<button type="submit" class="btn btn-sm">
																		<svg xmlns="http://www.w3.org/2000/svg" width="20px" height="20px" fill="currentColor" class="bi bi-suit-heart-fill text-danger " viewBox="0 0 16 16">
																		  <path class="heartBtnFill" d="M4 1c2.21 0 4 1.755 4 3.92C8 2.755 9.79 1 12 1s4 1.755 4 3.92c0 3.263-3.234 4.414-7.608 9.608a.513.513 0 0 1-.784 0C3.234 9.334 0 8.183 0 4.92 0 2.755 1.79 1 4 1z" />
																		</svg>
																	</button>

																</c:if>
															</c:if>
															<span class="likeCount text-dark mx-1"><c:out value="${t.likeCnt }"/></span>
														</div>
														<div class="d-flex align-items-center">
															<button class="btn btn-link btn-sm">
																<svg xmlns="http://www.w3.org/2000/svg" width="20px" height="20px" fill="currentColor" class="bi bi-chat text-dark" viewBox="0 0 16 16">
															  		<path d="M2.678 11.894a1 1 0 0 1 .287.801 10.97 10.97 0 0 1-.398 2c1.395-.323 2.247-.697 2.634-.893a1 1 0 0 1 .71-.074A8.06 8.06 0 0 0 8 14c3.996 0 7-2.807 7-6 0-3.192-3.004-6-7-6S1 4.808 1 8c0 1.468.617 2.83 1.678 3.894zm-.493 3.905a21.682 21.682 0 0 1-.713.129c-.2.032-.352-.176-.273-.362a9.68 9.68 0 0 0 .244-.637l.003-.01c.248-.72.45-1.548.524-2.319C.743 11.37 0 9.76 0 8c0-3.866 3.582-7 8-7s8 3.134 8 7-3.582 7-8 7a9.06 9.06 0 0 1-2.347-.306c-.52.263-1.639.742-3.468 1.105z" />
																</svg>
															</button>
															<span class="text-dark mx-1 align-text-middle"><c:out value="${t.commentCnt }"/></span>
														</div>
													</div>
													<p class="card-text">
														<c:out value="${t.TITLE }" />
													</p>

													<small class="text-muted pl-1">
														<c:forEach var="h" items="${t.hashList}">
															<c:if test="${not empty h}">
																<a href="${path }/community/hashSearch.do?hashtag=${h}" class="text-secondary bg-point mr-2">#<c:out value="${h }" /></a>
															</c:if>
														</c:forEach>
													</small>

													<div class="d-flex justify-content-between align-items-center">
													</div>
												</div>
											</div>
										</address>
									</c:if>
									</c:if>
								</c:forEach>
							</c:if>
					<div class="col-12 d-md-none my-3 text-center font-weight-bold">
						<a href="${path }/community/tipList.do?word=${keyword}" class="bg-dark d-block"
							style="width: 100%; font-size: 18px;">
							<div>
								<span>노하우 더보기</span>
								<svg width="1.2em" height="1.2em" viewBox="0 0 16 16"
									class="arrow bi bi-chevron-compact-right" fill="currentColor"
									xmlns="http://www.w3.org/2000/svg">
              <path fill-rule="evenodd"
										d="M6.776 1.553a.5.5 0 0 1 .671.223l3 6a.5.5 0 0 1 0 .448l-3 6a.5.5 0 1 1-.894-.448L9.44 8 6.553 2.224a.5.5 0 0 1 .223-.671z" />
            </svg>
							</div>
						</a>
					</div>
					<div class="col-12 d-flex justify-content-between mt-5 mb-3">
						<h5 class="font-weight-bold ">
							장소후기<span class="text-info">&nbsp;<c:out value="${placeCount }"/></span>
						</h5>
						<a href="${path }/place/movePlaceList.do?word=${keyword}" class="d-none ${placeCount==0?'':'d-md-block'}">더보기</a>
					</div>
					<c:if test="${not empty placeList }">
						<c:forEach var="p" items="${placeList }" varStatus="status">
						<c:if test="${status.index<3 }">
							<div class="col-2 col-sm-10 offset-sm-1 blogShort mb-4 border-bottom">
								<a href="${path }/place/movePlaceDetail.do?placeNo=${p.placeNo}" class="post-all row ">
									
										<div class="col-3 col-sm-9">
											<div class="decoration">
												<h3><c:out value="${p.title}" /></h3>
												 <article>
													<p class="content">
													
													<c:out value="${fn:substring(p.content,0,50)}" /><c:if test="${fn:length(p.content) > 50 }">...</c:if></p>
												 </article>
											</div>
											<img
												style="width: 1em; height: 1em; vertical-align: baseline;"
												class="rounded"
												src="${path}/resources/upload/member/profile/${p.img}"><span
												class="mr-2"><c:out value="${p.nickName }" /></span> <span
												class="mr-2"> 
												${p.placeDate }
													
												 </span>
											<span class="mr-2">댓글수</span> <span class="mr-2"><c:out
													value="${p.category }" /></span>
											<p>
												<c:out value="${p.position[0] }" />
												<c:out value="${p.position[1] }" />
											</p>
										</div>
										<div class="col-1 col-sm-3 ">
											<img src="${path }/resources/upload/place/${p.fileName}"
												alt="post img" class="rounded float-right" style="width:75%;">
										</div>	
								</a>
							</div>
							</c:if>
						</c:forEach>
					</c:if>
					<div class="col-12 d-md-none my-3 text-center font-weight-bold">
						<a href="${path }/place/movePlaceList.do?word=${keyword}" class="bg-dark d-block"
							style="width: 100%; font-size: 18px;">
							<div>
								<span>후기 더보기</span>
								<svg width="1.2em" height="1.2em" viewBox="0 0 16 16"
									class="arrow bi bi-chevron-compact-right" fill="currentColor"
									xmlns="http://www.w3.org/2000/svg">
              <path fill-rule="evenodd"
										d="M6.776 1.553a.5.5 0 0 1 .671.223l3 6a.5.5 0 0 1 0 .448l-3 6a.5.5 0 1 1-.894-.448L9.44 8 6.553 2.224a.5.5 0 0 1 .223-.671z" />
            </svg>
							</div>
						</a>
					</div>
				</div>
			</div>
		</section>
		<div class="pdtModal"></div>
	</main>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>
<style>
a:hover {
	text-decoration: none;
}

.arrow {
	padding-bottom: 5px;
}
.review{
	color:black;
}
.post-all {
	color: black;
}

.post-all:hover {
	color: black;
	text-decoration: none;
}
</style>

</html>
<script>
$(function(){
	let loginMember=$(".loginMember").val();

	$(".heartBtnLine").on("click", e => {
		if(loginMember!=""){ //로그인 되어 있으면 좋아요 추가
			let dailyNo = $(e.target).parent().prev().val();
			$(e.target).parent().addClass("d-none");
			$(e.target).parent().next().removeClass("d-none");
			$.ajax({
                 url:"${path}/daily/insertLike.do",
                 data:{dailyNo : dailyNo},
                 success: (data) => {
                	 
                 }
			})
			var likeCntSpan=$(e.target).parents(".likeCon").find("span.likeCount");
			likeCntSpan.text(Number(Number(likeCntSpan.html()) + 1));
		}else{ //로그인 안되어 있으면 로그인 모달 띄우기           
			fn_loginCheck();
		};
		
	})
	
	$(".heartBtnFill").on("click", e => {
		if(loginMember!=""){ //로그인 되어 있으면 좋아요 삭제
			let dailyNo = $(e.target).parent().parent().prev().prev().val();
			$(e.target).parent().parent().addClass("d-none");
			$(e.target).parent().parent().prev().removeClass("d-none");
			$.ajax({
                url:"${path}/daily/deleteLike.do",
                data:{dailyNo : dailyNo},
                success: (data) => {
                }
             }) 
			var likeCntSpan=$(e.target).parents(".likeCon").find("span.likeCount");
			likeCntSpan.text(Number(Number(likeCntSpan.html()) - 1));
		}else{ //로그인 안되어 있으면 로그인 모달 띄우기           
			fn_loginCheck();
		};
		
	})
	
	//로그인 모달
	function fn_loginCheck(){
		$.ajax({
			url: "${path}/login/moveLogin.do",
			dataType:"html",
			success:(data) => {
				$(".pdtModal").html(data);	
         		$('div.modal').modal(); 
			}
		});
	}
})
//로그인 모달
		function fn_loginCheck(){
			$.ajax({
				url: "${path}/login/moveLogin.do",
				dataType:"html",
				success:(data) => {
					$(".pdtModal").html(data);	
	         		$('div.modal').modal(); 
				}
			});
		}

//팔로우
 	function follow(event){
	let loginMember=$(".loginMember").val();
	if(loginMember!=""){
		let writerNo = $(event.target).next().val();
	 		$.ajax({
	 			async: false,
	 			url: "${path}/user/following.do",
	 			data: {writerNo : writerNo},
	 			success:(data) => {
	 				if(data==10){
	 					location.reload();
	 				}else if(data==20){
	 					location.reload();
	 				}
	 				location.reload();
	 			},error:function(request, status, error){
	 				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	 			}
	 		});
	}else{ //로그인 안되어 있으면 로그인 모달 띄우기
		fn_loginCheck();
	};
	};
	$(document).ready(function(){
		$(".img").click( function() {
			let tipNo = $(this).prev().val();
			location.href="${path}/community/tipDetail.do?tipNo=" + tipNo;
		});
	})
</script>