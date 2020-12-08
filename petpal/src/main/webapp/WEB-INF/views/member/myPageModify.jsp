<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.project.petpal.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<%
	String[] addr = ((Member) session.getAttribute("loginMember")).getAddress();
	List<String> list = new ArrayList();
	String post ="";
	String addEtc = "";
if (addr != null) {
	list = Arrays.asList(addr);
	for (int i = 0; i < list.size(); i++) {
		post = list.get(0);
		addEtc = list.get(1) + list.get(2);
		System.out.println(post);
		System.out.println(addEtc);
		
	}
}
%>
<style>
#sample6_postcode {
	width: 50%;
	display: inline-block;
}
</style>
<jsp:include page="/WEB-INF/views/common/commonLink.jsp" />


<jsp:include page="/WEB-INF/views/common/myPageNav.jsp" />

<c:if test="${loginMember != null }">
	<form class="bg-white rounded shadow-sm p-4 mb-5">
		<h6 class="row py-3 d-block text-center mb-3">
			<strong>회원정보수정</strong>
		</h6>
		<div class="form-group row">
			<label for="staticEmail" class="col-lg-2 col-form-label">Email</label>
			<div class="col-lg-10">
				<input type="text" readonly class="form-control-plaintext"
					id="email" name="email" value="${loginMember.getEmail() }">
			</div>
		</div>
		<div class="form-group row ">
			<label for="oriPassword" class="col-lg-2 col-form-label">비밀번호</label>
			<div class="col-5 col-lg-3">
				<input type="password" class="form-control" placeholder="비밀번호 확인"
					id="oriPassword">
			</div>
			<button type="button" class="btn btn-outline-secondary"
				id="passwordUpdate">비밀번호 확인</button>
		</div>
		<!-- 확인누르면 모달창 뜨고 비밀번호 변경하는 로직 -->

		<div class="form-group row">
			<label for="userName" class="col-lg-2 col-form-label">이름</label>
			<div class="col-lg-2">
				<input type="text" class="form-control" id="memberName"
					name="memberName" value="${loginMember.getMemberName() }" required>
			</div>
		</div>
		<div class="form-group row">
			<label for="userNick" class="col-lg-2 col-form-label">닉네임</label>
			<div class="col-lg-2">
				<input type="text" class="form-control" id="nickName"
					name="nickName" value="${loginMember.getNickName() }">
			</div>
		</div>
		<div class="form-group row">
			<label for="userAdd" class="col-lg-2 col-form-label">주소</label>
			<div class="col-lg-8">
				<input type="text" id="sample6_postcode" name="address"
					class="form-control input-lg" placeholder="우편번호" readonly>
				<input type="button" onclick="sample6_execDaumPostcode()"
					class="btn btn-primary btn-sm" value="우편번호 찾기">
					<input type="text" class="form-control input-lg" name="address"
											id="sample6_address" placeholder="주소" readonly>
			</div>
		</div>
		<div class="form-group row">
			<label for="userPhone" class="col-lg-2 col-form-label">전화번호</label>
			<div class="col-lg-2">
				<input type="text" class="form-control" id="userPhone">
			</div>
		</div>
		<div class="form-group row d-flex align-items-center">
			<label for="userPic" id="userPicLabel"
				class="col-lg-2 col-form-label">프로필사진</label>
			<div class="col-lg-2">
				<button type="button" class="btn btn-outline-secondary"
					onclick="fn_clickPic();">프로필선택</button>
				<input type="file" name="userPic" id="userPic"
					style="display: none;">
			</div>
		</div>
		<div class="form-group row">
			<div class="col-lg-2 col-form-label"></div>
			<div class=" ml-3 imgShowCon" style="width: 200px; height: 200px;">
				<img id="imgShow" style="width: 100%; height: 100%;" />
			</div>
		</div>
		<div class="form-group row">
			<label for="userIntro" class="col-lg-2 col-form-label">한줄소개</label>
			<div class="col-lg-6">
				<input type="text" class="form-control" id="userIntro">
			</div>
		</div>
		<div class="form-group row d-flex justify-content-center mt-5">
			<button class="btn btn-outline-danger mx-2">회원탈퇴</button>
			<button class="btn btn-outline-secondary mx-2">정보수정</button>
		</div>
	</form>
</c:if>
</div>
<div class="modal fade" id="passwordModal" tabindex="1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h3 class="modal-title" id="exampleModalLabel">로그인</h3>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<form method="post">
				<div class="modal-body">

					<input type="password" class="form-control mb-2" name="newPassword"
						placeholder="비밀번호"> <input type="password"
						class="form-control mb-2" name="newPasswordConfirm"
						placeholder="비밀번호확인">
					<p class="text-right text-danger" style="font-size: 12px;">비밀번호가
						일치하지 않습니다.</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-outline-success"
						data-dismiss="modal">취소</button>
					<button type="submit" class="btn btn-outline-success">변경</button>
				</div>
			</form>

		</div>
	</div>
</div>
</main>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
<script> 
    $(function() {
      $("#userPic").on("change", (e) => {
        $.each(e.target.files,(i,v)=>{           
            let reader=new FileReader();
            reader.onload=e=>{
                $("#imgShow").attr("src",e.target.result);
            }
            reader.readAsDataURL(v);
        });

        });

        $("#passwordUpdate").on("click",function(){
          $('div.modal').modal();
        });
    })

    function fn_clickPic() {
        $("#userPicLabel").click();
    }
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    } 
</script>
</body>

</html>