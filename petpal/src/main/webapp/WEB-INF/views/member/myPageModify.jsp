<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>


 <jsp:include page="/WEB-INF/views/common/commonLink.jsp" />


  <jsp:include page="/WEB-INF/views/common/myPageNav.jsp" />
 <div class="row d-flex  py-3 mb-3 mt-5 text-white-50 bg-purple rounded shadow-sm justify-content-center ">
    <div class="py-2">
      <a href="#" class="mb-0 text-white lh-100 px-3">프로필</a>
      <a href="#" class="mb-0 text-white lh-100 px-3">쇼핑</a>
      <a href="#" class="mb-0 text-white lh-100 px-3">개인정보수정</a>
      <a href="#" class="mb-0 text-white lh-100 px-3">관심상품</a>
    </div>
  </div>
    
  <form class="bg-white rounded shadow-sm p-4 mb-5">
    <h6  class="row py-3 d-block text-center mb-3"><strong>회원정보수정</strong></h6>
    <div class="form-group row">
      <label for="staticEmail" class="col-lg-2 col-form-label">Email</label>
      <div class="col-lg-10">
        <input type="text" readonly class="form-control-plaintext" id="userEmail" value="email@example.com">
      </div>
    </div>
    <div class="form-group row ">
      <label for="oriPassword" class="col-lg-2 col-form-label">비밀번호</label>
      <div class="col-5 col-lg-3"> 
        <input type="password" class="form-control" placeholder="비밀번호 확인" id="oriPassword">
      </div>
        <button type="button" class="btn btn-outline-secondary"data-toggle="modal" data-target="#passwordModal">비밀번호 확인</button>
    </div>
    <!-- 확인누르면 모달창 뜨고 비밀번호 변경하는 로직 -->

    <div class="form-group row">
      <label for="userName" class="col-lg-2 col-form-label">이름</label>
      <div class="col-lg-2">
        <input type="text" class="form-control" id="userName" required>
      </div>
    </div>
    <div class="form-group row">
      <label for="userNick" class="col-lg-2 col-form-label">닉네임</label>
      <div class="col-lg-2">
        <input type="text" class="form-control" id="userNick">
      </div>
    </div>
    <div class="form-group row">
      <label for="userAdd" class="col-lg-2 col-form-label">주소</label>
      <div class="col-lg-8">
        <input type="text" class="form-control" id="userAdd">
      </div>
    </div>
    <div class="form-group row">
      <label for="userPhone" class="col-lg-2 col-form-label">전화번호</label>
      <div class="col-lg-2">
        <input type="text" class="form-control" id="userPhone">
      </div>
    </div>
    <div class="form-group row d-flex align-items-center">
      <label for="userPic" id="userPicLabel" class="col-lg-2 col-form-label">프로필사진</label>
      <div class="col-lg-2">
        <button type="button" class="btn btn-outline-secondary" onclick="fn_clickPic();">프로필선택</button>
        <input type="file" name="userPic" id="userPic"  style="display: none;">
      </div>
    </div>
    <div class="form-group row">
      <div class="col-lg-2 col-form-label"></div>
      <div class=" ml-3 imgShowCon" style="width:200px; height:200px; ">
        <img id="imgShow" style="width: 100%; height:100%;"/>
      </div>
    </div>
    <div class="form-group row">
      <label for="userIntro" class="col-lg-2 col-form-label">한줄소개</label>
      <div class="col-lg-6">
        <input type="text" class="form-control" id="userIntro">
      </div>
    </div>
    <div class="form-group row d-flex justify-content-center mt-5">
      <button class="btn btn-outline-danger mx-2" >회원탈퇴</button>
      <button class="btn btn-outline-secondary mx-2">정보수정</button>
    </div>
  </form>
</div>
<div class="modal fade" id="passwordModal" tabindex="1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content" >
      <div class="modal-header">
        <h3 class="modal-title" id="exampleModalLabel">로그인</h3>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form method="post">
        <div class="modal-body">
        
          <input type="password" class="form-control mb-2" name="newPassword"
          placeholder="비밀번호">
          <input type="password" class="form-control mb-2" name="newPasswordConfirm"
          placeholder="비밀번호확인">
          <p class="text-right text-danger" style="font-size: 12px;">비밀번호가 일치하지 않습니다.</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-outline-success" data-dismiss="modal">
            	취소
          </button>
          <button type="submit" class="btn btn-outline-success">
            	변경
          </button>
        </div>
      </form>
    </div>
  </div>
</div>
</main>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>

</html>