<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/> 


    <header class="fixed-top shadow-sm" >
        <nav class="navbar navbar-expand-lg navbar-light py-3 " style="background-color: white;">
          <div class="container">
            <a class="navbar-brand text-dark" href="${path }/">로고</a>
            <ul class="nav justify-content-center d-none d-lg-flex">
              <li class="nav-item">
                <a class="nav-link" href="#">커뮤니티</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="${path }/store/moveStoreHome.do">스토어</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="${path }/board/noticeList.do">공지사항</a>
              </li>
              <li class="nav-item">
                <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">위치찾기</a>
              </li>
            </ul>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarToggleExternalContent" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse " id="navbarResponsive">
              <ul class="navbar-nav ml-auto">
                <li class="nav-item active">
                  <a class="nav-link text-dark" href="${path }/cart/cart.do">장바구니</a>
                </li>
                <li class="nav-item d-none d-lg-block">
                  <a class="nav-link text-dark" data-toggle="collapse" data-target="#collapseOne2" aria-expanded="true" aria-controls="collapseOne" href="#">검색</a>
                </li>
    			<c:if test="${loginMember == null }">
                <li class="nav-item">
                  <a class="nav-link text-dark" href="${path }/member/moveLogin.do">로그인</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link text-dark" href="${path }/member/moveJoin.do">회원가입</a>
                </li>
                </c:if>
                <c:if test="${loginMember != null }">
                <li class="nav-item">
                  <a class="nav-link text-dark" href="${path }/member/moveMyPage.do">마이페이지</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link text-dark" href="#">로그아웃</a>
                </li>
                </c:if>
                <c:if test="${loginMember.getEmail().equals('admin@naver.com')  }">
                <li class="nav-item">
                  <a class="nav-link text-dark" href="${path }/admin/moveAdminPage.do">관리자</a>
                </li>
                </c:if>
              </ul>
            </div>
            
          </div>
        </nav>
          <div id="collapseOne2" class="collapse bg-white"  >
            <div class="card-body container d-none d-lg-block">
              <div class="input-group ">
                <input type="text" class="form-control" placeholder="Recipient's username" aria-label="Recipient's username" aria-describedby="button-addon2">
                <div class="input-group-append">
                  <button class="btn btn-outline-secondary" type="button" id="button-addon2">Button</button>
                </div>
              </div>
            </div>
          </div>
        
          <!--중간사이즈부터 그 아래사이즈들 검색버튼 없애고 인풋검색창 바로 보이게 하기-->
          <div class=" d-lg-none bg-white pb-4 shadow-sm">
            <div class="input-group container">
            <input type="text" class="form-control" placeholder="Recipient's username" aria-label="Recipient's username" aria-describedby="button-addon2">
            <div class="input-group-append">
              <button class="btn btn-outline-secondary" type="button" id="button-addon2">Button</button>
            </div>
          </div>
          </div>
          <ul class="nav justify-content-center bg-light d-flex d-lg-none">
            <li class="nav-item">
              <a class="nav-link" href="#">커뮤니티</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="${path }/store/moveStoreHome.do">스토어</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">공지사항</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">위치찾기</a>
            </li>
          </ul>
      </header>