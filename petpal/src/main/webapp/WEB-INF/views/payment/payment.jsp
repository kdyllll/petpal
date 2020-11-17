<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/> 
 <jsp:include page="/WEB-INF/views/common/commonLink.jsp" />

</head>
<body class="bg-white">
<jsp:include page="/WEB-INF/views/common/header.jsp" />
  
  <main role="main" style="min-height:100vh;">
  	<div class="container">
        <div class="row"  style="padding-top:5em;">
            <div class="col-md-4 order-md-2 mb-4">
                <h4 class="d-flex justify-content-between align-items-center mb-3">
                    <span class="text-muted">장바구니</span>
                    <span class="badge badge-secondary badge-pill">3</span>
                </h4>
                <ul class="list-group mb-3">
                    <li class="list-group-item d-flex justify-content-between lh-condensed">
                        <div>
                            <h6 class="my-0">Product name</h6>
                            <small class="text-muted">Brief description</small>
                        </div>
                        <span class="text-muted">$12</span>
                    </li>
                    <li class="list-group-item d-flex justify-content-between lh-condensed">
                        <div>
                            <h6 class="my-0">Second product</h6>
                            <small class="text-muted">Brief description</small>
                        </div>
                        <span class="text-muted">$8</span>
                    </li>
                    <li class="list-group-item d-flex justify-content-between lh-condensed">
                        <div>
                            <h6 class="my-0">Third item</h6>
                            <small class="text-muted">Brief description</small>
                        </div>
                        <span class="text-muted">$5</span>
                    </li>
                    <li class="list-group-item d-flex justify-content-between bg-light">
                        <div class="text-success">
                            <h6 class="my-0">Promo code</h6>
                            <small>EXAMPLECODE</small>
                        </div>
                        <span class="text-success">-$5</span>
                    </li>
                    <li class="list-group-item d-flex justify-content-between">
                        <span>Total (USD)</span>
                        <strong>$20</strong>
                    </li>
                </ul>
                <form class="card p-2">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="Promo code">
                        <div class="input-group-append">
                            <button type="submit" class="btn btn-secondary">Redeem</button>
                        </div>
                    </div>
                </form>
            </div>

            <div class="col-md-8 order-md-1">
                <form class="needs-validation" novalidate>
                    <div>
                        <h3>배송지</h3>
                        <hr>
                        <div class="row">
                            <div class="col-md-12 mb-3">
                                <label for="firstName">이름</label>
                                <input type="text" class="form-control" id="name" placeholder="" value="" required>
                                <div class="invalid-feedback">
                                    이름을 입력해주세요.
                                </div>
                            </div>
                        </div>

                        <div class="mb-3">
                            <label for="address">우편번호</label>
                            <input type="text" class="form-control" id="address" placeholder="" required>
                            <div class="invalid-feedback">
                                우편번호를 입력해주세요.
                            </div>
                        </div>

                        <div class="mb-3">
                            <label for="phone">휴대폰번호</label>
                            <input type="text" class="form-control" id="phone" placeholder="010-0000-0000" required>
                            <div class="invalid-feedback">
                                휴대폰번호를 입력해주세요.
                            </div>
                        </div>
                    </div>

                    <div>
                        <div class="row justify-content-between">
                            <div class="col-4">
                                <h3>주문자</h3>
                            </div>
                            <div class="col-4">
                                <input type="checkbox">배송지 정보와 동일하게
                            </div>
                            <hr>
                        </div>
                        <div class="row">
                            <div class="col-md-12 mb-3">
                                <label for="firstName">이름</label>
                                <input type="text" class="form-control" id="name" placeholder="" value="" required>
                                <div class="invalid-feedback">
                                    이름을 입력해주세요.
                                </div>
                            </div>
                        </div>

                        <div class="mb-3">
                            <label for="email">이메일</label>
                            <input type="text" class="form-control" id="email" placeholder="" required>
                            <div class="invalid-feedback">
                                이메일 입력해주세요.
                            </div>
                        </div>

                        <div class="mb-3">
                            <label for="phone">휴대폰번호</label>
                            <input type="text" class="form-control" id="phone" placeholder="010-0000-0000" required>
                            <div class="invalid-feedback">
                                휴대폰번호를 입력해주세요.
                            </div>
                        </div>
                    </div>

                    <div>
                        <h3>결제수단</h3>
                        <hr>
                        <div class="d-block my-3">
                            <div class="custom-control custom-radio">
                                <input id="credit" name="paymentMethod" type="radio" class="custom-control-input"
                                    checked required>
                                <label class="custom-control-label" for="credit">신용카드</label>
                            </div>
                            <div class="custom-control custom-radio">
                                <input id="cash" name="paymentMethod" type="radio" class="custom-control-input"
                                    required>
                                <label class="custom-control-label" for="cash">무통장 입금</label>
                            </div>
                        </div>
                    </div>
                    <hr class="mb-4">
                    <button class="btn btn-dark btn-lg btn-block" type="submit">결제하기</button>
                </form>
            </div>
        </div>

        <div class="my-5 pt-5 text-muted text-center text-small">
        </div>
    </div>
  </main>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>

</html>