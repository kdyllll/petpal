<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/> 
	<section>
          <div class="d-flex justify-content-between mb-1">
            <p class="h5">일상 <strong><c:out value="${fn:length(dailyList) }"/></strong></p>
            <a href='javascript:void(0);' onclick="fn_Daily();">전체보기</a>
          </div>
          <div class="row">                    
           <c:forEach var="d" items="${dailyList }" varStatus="vs">
             <a class="card col-4 col-md-3 border-0 mb-3 ${vs.index>3?'d-md-none':''}" href="${path }/daily/moveDetail.do?dailyNo=${d.dailyNo}"  >
                   <img src="${path }/resources/upload/community/daily/${d.dailyImgName}" class="rounded" style="width:100%; height:100%;">
                 </a>    	                 	
           </c:forEach>  	                                      
          </div>
        </section>
        
        <!-- 노하우 -->
        <section class="mt-5">
          <div class="d-flex justify-content-between mb-1">
            <p class="h5">노하우 <strong><c:out value="${fn:length(tipList) }"/></strong></p>
            <a href='javascript:void(0);' onclick="fn_Tip();">전체보기</a>
          </div>
          <div class="row">
           <c:forEach var="t" items="${tipList }" varStatus="vs" begin="1" end="6">
               <a class="card col-4 col-md-3 border-0 ${vs.index>3?'d-md-none':''}" href="${path }community/tipDetail.do?tipNo=${t.TIPNO}">
                 <img src="${path }/resources/upload/tip/${t.MAINIMG}" class="rounded" style="width:100%; ">
                 <p class="text-center text-dark"><c:out value="${t.TITLE }"/></p>
               </a>
           </c:forEach>                                     
          </div>
        </section>
        
        <!-- 장소후기 -->
        <section class="mt-5">
          <div class="d-flex justify-content-between mb-1">
            <p class="h5">후기 <strong><c:out value="${fn:length(placeList) }"/></strong></p>
            <a href='javascript:void(0);' onclick="fn_Place();">전체보기</a>
          </div>
          <div class="row">
           <c:forEach var="p" items="${placeList }" varStatus="vs" begin="1" end="6">
               <a class="card col-4 col-md-3 border-0 ${vs.index>3?'d-md-none':''}" href="${path }/place/movePlaceDetail.do?placeNo=${p.PLACENO}">
                 <img src="${path }/resources/upload/place/${t.FILENAME}" class="rounded" style="width:100%; ">
                 <p class="text-center text-dark"><c:out value="${p.TITLE }"/></p>
               </a>
            </c:forEach>                                  
          </div>
        </section>
        
        <!-- 찾아주세요 -->
        <section class="my-5">
          <div class="d-flex justify-content-between">
            <p class="h5">찾아주세요 <strong><c:out value="${fn:length(findList) }"/></strong></p>
            <a href='javascript:void(0);' onclick="fn_Find();">전체보기</a>
          </div>
          <div class="row">
           <c:forEach var="f" items="${findList }" varStatus="vs" begin="1" end="6">
               <a class="card col-4 col-md-3 border-0 mb-3 ${vs.index>3?'d-md-none':''}" href="${path }/community/findDetail.do?findNo=${f.FINDNO}">
                 <img src="${path }/resources/upload/find/${f.FILENAME}" class="rounded" style="width:100%;">
                 <p class="text-center text-dark"><c:out value="${f.TITLE }"/></p>
               </a>
           </c:forEach>             
          </div>
        </section>