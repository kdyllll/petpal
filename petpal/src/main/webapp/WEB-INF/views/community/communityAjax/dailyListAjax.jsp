<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/> 
<div class="row col-12">
<c:if test="${empty dailyList }">
<div class="mx-auto">
	<p class="">일상 글이 없습니다.</p>
</div>
</c:if>
<c:if test="${not empty dailyList }">

	<c:forEach var="d" items="${dailyList}">
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
																<c:if test="${not empty following }">
																	<c:forEach var = "f" items="${following }">
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
											<c:if test="${not empty like }">
												<c:forEach var="l" items="${like }">
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
								</c:forEach>

</c:if>
</div>
 <div class="mx-auto my-2">${pageBar }</div>