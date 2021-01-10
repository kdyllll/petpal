<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/> 
<div class="row">
	<c:if test="${empty dailyList }">
		<div class="col-12 mb-4 text-center mt-5">
			<p class="">일상 글이 없습니다.</p>
		</div>
	</c:if>
	<c:if test="${not empty dailyList }">
			<c:forEach var="d" items="${dailyList}">
			      <address class="col-xl-3 col-lg-4 col-md-6 m-0">
			          <div class="card mb-4 bg-transparent border-0">
			             
			              <c:forEach var="i" items="${imgList}">
			              	<c:if test="${i.dailyNo eq d.dailyNo}">
			              	<a class="d-inline-block" href="${path }/daily/moveDetail.do?dailyNo=${d.dailyNo }">                        
			             			<img src="${path }/resources/upload/community/daily/${i.dailyImgName}" class="rounded" style="width:100%;">
			             			<input type="hidden" value="${d.dailyNo }"/>
			              	</a>	
			              	</c:if>
			              </c:forEach>
			
			              <div class="card-body p-0 mt-2">
			                  <p class="card-text mb-1">${d.content }</p>
			                  <div class="d-flex justify-content-between align-items-center">
			                      <small class="text-muted pl-1">
			                      	<c:forEach var="h" items="${hashList}">
			                      		<c:if test="${not empty h and (h.postNo eq d.dailyNo )}">
			                          		<a href="#" class="bg-point">#<c:out value="${h.hashContent }"/></a>
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
	<div class="mx-auto">${pageBar }</div>