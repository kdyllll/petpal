<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<jsp:include page="/WEB-INF/views/common/commonLink.jsp" />

</head>
<body class="bg-white">
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<main role="main" style="min-height: 100vh;">
		<section class="mt-5 pt-5">
			<div class="container-fluid">
				<div class="container pt-5">
					<h2 class="text-center" id="title">회원가입</h2>
					<div class="text-center">
						<a href="#"><img src="${path }/resources/images/naver.PNG"
							style="width: 80px; height: 80px;" alt=""></a> <a href="#"><img
							src="${path }/resources/images/facebook.png" style="width: 80px; height: 80px;" alt=""></a>
						<a href="#"><img src="${path }/resources/images/google.png"
							style="width: 80px; height: 80px;" alt=""></a>
					</div>
					<hr>
					<div class="row">
						<div class="col-md-3">
							<!-- null -->
						</div>
						<div class="col-md-6">
							<form role="form" method="post"
								action="${path }/member/insertMember.do">
								<fieldset>
									<p class="text-uppercase pull-center">기본정보</p>

									<div class="input-group mb-3">
										<input type="text" class="form-control input-lg"
											placeholder="이메일" name="email">
										<div class="input-group-append">
											<button type="button" class="btn btn-secondary">이메일인증</button>
										</div>
									</div>
									<div class="form-group">
										<input type="password" name="password" id="password"
											class="form-control input-lg" placeholder="비밀번호">
									</div>
									<div class="form-group">
										<input type="password" name="password2" id="password2"
											class="form-control input-lg" placeholder="비밀번호 확인">
									</div>
									<div class="form-group">
										<input type="text" name="memberName" id="membername"
											class="form-control input-lg" placeholder="이름">
									</div>
									<div class="form-group">
										<input type="text" name="nickName" id="nickname"
											class="form-control input-lg" placeholder="닉네임">
									</div>
									<div class="form-group">
										<input type="text" id="sample3_postcode" name="address"
											class="form-control input-lg" placeholder="우편번호"> <input
											type="button" onclick="sample3_execDaumPostcode()"
											class="btn btn-primary btn-sm" id="woo" value="우편번호 찾기"><br>
										<input type="text" class="form-control input-lg"
											name="address" id="sample3_address" placeholder="주소"><br>
										<input type="text" class="form-control input-lg"
											name="address" id="sample3_detailAddress" placeholder="상세주소">

									</div>
									<div class="form-group">
										<input type="text" name="phone" id="phone"
											class="form-control input-lg" placeholder="전화번호">
									</div>
									<h5 class="font-weight-bold">이용약관</h5>
									<div>
										<label><input type="checkbox" id="allcheck"
											class="d-none"> <svg width="1.5em" height="1.5em"
												viewBox="0 0 16 16" class="bi bi-check2-square "
												fill="currentColor" xmlns="http://www.w3.org/2000/svg">
										<path fill-rule="evenodd"
													d="M15.354 2.646a.5.5 0 0 1 0 .708l-7 7a.5.5 0 0 1-.708 0l-3-3a.5.5 0 1 1 .708-.708L8 9.293l6.646-6.647a.5.5 0 0 1 .708 0z" />
										<path fill-rule="evenodd"
													d="M1.5 13A1.5 1.5 0 0 0 3 14.5h10a1.5 1.5 0 0 0 1.5-1.5V8a.5.5 0 0 0-1 0v5a.5.5 0 0 1-.5.5H3a.5.5 0 0 1-.5-.5V3a.5.5 0 0 1 .5-.5h8a.5.5 0 0 0 0-1H3A1.5 1.5 0 0 0 1.5 3v10z" />
									</svg> 전체동의 </label>
									</div>
									<div>
										<label><input type="checkbox" class="check d-none"
											id="check1"> <svg width="1.5em" height="1.5em"
												viewBox="0 0 16 16" class="bi bi-check2-square "
												fill="currentColor" xmlns="http://www.w3.org/2000/svg">
										<path fill-rule="evenodd"
													d="M15.354 2.646a.5.5 0 0 1 0 .708l-7 7a.5.5 0 0 1-.708 0l-3-3a.5.5 0 1 1 .708-.708L8 9.293l6.646-6.647a.5.5 0 0 1 .708 0z" />
										<path fill-rule="evenodd"
													d="M1.5 13A1.5 1.5 0 0 0 3 14.5h10a1.5 1.5 0 0 0 1.5-1.5V8a.5.5 0 0 0-1 0v5a.5.5 0 0 1-.5.5H3a.5.5 0 0 1-.5-.5V3a.5.5 0 0 1 .5-.5h8a.5.5 0 0 0 0-1H3A1.5 1.5 0 0 0 1.5 3v10z" />
									</svg> (필수) 이용약관에 동의합니다. </label>
									</div>
									<div>
										<label><input type="checkbox" class="check d-none"
											id="check2"> <svg width="1.5em" height="1.5em"
												viewBox="0 0 16 16" class="bi bi-check2-square "
												fill="currentColor" xmlns="http://www.w3.org/2000/svg">
										<path fill-rule="evenodd"
													d="M15.354 2.646a.5.5 0 0 1 0 .708l-7 7a.5.5 0 0 1-.708 0l-3-3a.5.5 0 1 1 .708-.708L8 9.293l6.646-6.647a.5.5 0 0 1 .708 0z" />
										<path fill-rule="evenodd"
													d="M1.5 13A1.5 1.5 0 0 0 3 14.5h10a1.5 1.5 0 0 0 1.5-1.5V8a.5.5 0 0 0-1 0v5a.5.5 0 0 1-.5.5H3a.5.5 0 0 1-.5-.5V3a.5.5 0 0 1 .5-.5h8a.5.5 0 0 0 0-1H3A1.5 1.5 0 0 0 1.5 3v10z" />
									</svg> (필수) 개인정보처리방침에 동의합니다. </label>
									</div>
									<div>
										<input type="submit" class="btn btn-lg btn-primary"
											value="회원가입">
									</div>
								</fieldset>
							</form>
						</div>

						<div class="col-md-3">
							<!-- null -->
						</div>
					</div>
				</div>
			</div>
		</section>
	</main>
	<style>
#sample3_postcode {
	width: 50%;
	display: inline-block;
	margin-bottom: 15px;
}

input[type="checkbox"]+svg {
	color: gray;
}

input[type="checkbox"]:checked+svg {
	color: #00CC00;
}
</style>
	<script>
	
	//체크박스 하나씩 체크하거나 풀때
	$(".check").click(e=>{
		
		if($("#check1").prop("checked")==true&&$("#check2").prop("checked")==true){
			$("#allcheck").prop("checked",true);
			console.log("True일때");
			
		}else {
			$("#allcheck").prop("checked",false);
			console.log("false일떄")
		}
	});
	//전체동의 눌렀을때
	$("#allcheck").click(e=>{
		if($(e.target).prop("checked")==true){
			
			$(".check").prop("checked",true);
		}else{
			
			$(".check").prop("checked",false);
		}
	});

</script>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>