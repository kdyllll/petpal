<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/> 


    <header class="fixed-top shadow-sm" >
        <nav class="navbar navbar-expand-lg navbar-light py-3 pl-0" style="background-color: white;">
          <div class="container">
            <a class="navbar-brand text-dark py-0 m-0" href="${path}">
            	<img src="${path }/resources/images/logoGray.png" style="height:40px;">
            </a>
            <ul class="nav justify-content-center d-none d-lg-flex">
              <li class="nav-item">
                <a class="nav-link" href="${path }/community/communityList.do">커뮤니티</a>
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
                  <a class="nav-link text-dark" href="${path }/cart/cart.do">
                  	<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-cart2 text-black-50" viewBox="0 0 16 16">
					  <path d="M0 2.5A.5.5 0 0 1 .5 2H2a.5.5 0 0 1 .485.379L2.89 4H14.5a.5.5 0 0 1 .485.621l-1.5 6A.5.5 0 0 1 13 11H4a.5.5 0 0 1-.485-.379L1.61 3H.5a.5.5 0 0 1-.5-.5zM3.14 5l1.25 5h8.22l1.25-5H3.14zM5 13a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0zm9-1a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0z"/>
					</svg>
                  </a>
                </li>
                <li class="nav-item d-none d-lg-block align-middle">
                  <a class="nav-link text-dark" data-toggle="collapse" data-target="#collapseOne2" aria-expanded="true" aria-controls="collapseOne" href="#">
                  <svg xmlns="http://www.w3.org/2000/svg" width="19" height="19" fill="currentColor" class="bi bi-search text-black-50" viewBox="0 0 16 16">
					  <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
					</svg>
                  </a>
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
                  <a class="nav-link text-dark" href="${path }/member/logout.do">로그아웃</a>
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
                <input type="text" class="form-control" placeholder="검색어를 입력하세요." aria-label="Recipient's username" aria-describedby="button-addon2" id="keyword" >
                <div class="input-group-append">
                  <button class="btn btn-outline-secondary" type="button" id="search">검색</button>
                </div>
              </div>
            </div>
          </div>
        
          <!--중간사이즈부터 그 아래사이즈들 검색버튼 없애고 인풋검색창 바로 보이게 하기-->
          <div class=" d-lg-none bg-white pb-4 shadow-sm">
            <div class="input-group container">
            <input type="text" class="form-control" placeholder="검색어를 입력하세요." aria-label="Recipient's username" aria-describedby="button-addon2" id="keyword" >
            <div class="input-group-append">
              <button class="btn btn-outline-secondary" type="button" id="search">검색</button>
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
      <script>
      $(document).on(
  			'click',
  			'#search',
  			function(e) {
  				var keyword=$(e.target).parent().prev("input#keyword").val();
  				 location.assign('${path}/search/searchKeyword.do?keyword='+keyword); 
  			});
      </script>