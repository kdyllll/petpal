<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>


 <jsp:include page="/WEB-INF/views/common/commonLink.jsp" />

  <!-- Custom styles for this template -->
   <link href="${path }/resources/css/member/login.css" rel="stylesheet">
 
</head>

<body class="bg-white">

<jsp:include page="/WEB-INF/views/common/header.jsp" />
  
  <!-- Page Content -->
   <main  class="text-center mt-5 mt-lg-0">  
    <div class="container pt-5 pt-lg-0">
      <div class="row pt-5">
        <form class="form-signin" action="${path }/member/memberLogin.do" method="post">
            <div class="text-center mb-4">
              <!-- <img class="mb-4" src="../assets/brand/bootstrap-solid.svg" alt="" width="72" height="72"> -->
              <h1 class="h3 mb-3 font-weight-normal">PETPAL</h1>
              <!-- <p>Build form controls with floating labels via the <code>:placeholder-shown</code> pseudo-element. <a href="https://caniuse.com/#feat=css-placeholder-shown">Works in latest Chrome, Safari, Firefox, and IE 10/11 (prefixed).</a></p> -->
            </div>
          
            <div class="form-label-group text-left">
              <input type="email" name="email" id="inputEmail" class="form-control" placeholder="Email ID" required autofocus>
              <label for="inputEmail">Email ID</label>
            </div>
          
            <div class="form-label-group text-left">
              <input type="password" name="password" id="inputPassword" class="form-control" placeholder="Password" required>
              <label for="inputPassword">Password</label>
            </div>
          
            <div class="checkbox mb-3 text-left">
              <label>
                <input type="checkbox" value="remember-me"> 아이디 기억하기
              </label>
              <div class="mt-3">
                <a class="mr-5 text-dark" href="#">아이디 찾기</a>
                <a class="mr-5 text-dark" href="#">비밀번호 재설정</a>
                <a class="text-dark" href="${path }/member/moveJoin.do">회원가입</a>
              </div>
            </div>
            <button class="btn btn-lg btn-primary btn-block" type="submit">로그인</button>       
            <div class=""> 
              <button class="btn btn-lg btn-secondary btn-block my-1" type="button">구글</button>
              <button class="btn btn-lg btn-secondary btn-block mt-0 mb-1" type="button">카카오</button>
              <button class="btn btn-lg btn-secondary btn-block mt-0" type="button">등등</button>
            </div>
        </form>
      </div>
     
      <form class="form-signin">
        <div class=" accordion" id="accordionExample">          
            <a class="btn btn-lg btn-transparent btn-block text-center"  data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
              비회원 주문조회
            </a>   
            <div id="collapseOne" class="collapse" aria-labelledby="headingOne" data-parent="#accordionExample">
              <div class="card-body">                             
                <div class="form-label-group">
                  <input type="text" id="inputPassword" class="form-control" placeholder="주문번호" required>
                  <label for="inputPassword">주문번호</label>
                </div>
                <button class="btn btn-lg btn-primary btn-block" type="submit">조회하기</button>
              </div>
            </div>
        </div>   
      </form>     
    </div>
  </main>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>

</html>