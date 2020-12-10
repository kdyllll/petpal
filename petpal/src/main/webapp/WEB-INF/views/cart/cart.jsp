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
        <div class="wrapper wrapper-content animated fadeInRight">
            <div class="row" style="padding-top: 5em;">
                <div class="col-md-9">
                    <div class="ibox">
                        <div class="ibox-title">
                            <span class="pull-right">(<strong>1</strong>) 상품</span>
                            <h5>장바구니</h5>
                        </div>
                        <div class="ibox-content">
                            <div class="table-responsive">
                                <table class="table shoping-cart-table">
                                    <tbody>
                                        <tr>
                                            <td width="90">
                                                <div class="cart-product-imitation">
                                                </div>
                                            </td>
                                            <td class="desc">
                                                <h3>
                                                    <a href="#" class="text-navy">
                                                        에어프라이어
                                                    </a>
                                                </h3>
                                            </td>

                                            <td>
                                                $180,00
                                            </td>
                                            <td width="65">
                                                <input type="text" class="form-control" placeholder="1">
                                            </td>
                                            <td>
                                                <h4>
                                                    $180,00
                                                </h4>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>

                        </div>
                        
                        <div class="ibox-content">
                            <button class="btn btn-dark pull-right"><i class="fa fa fa-shopping-cart"></i>
                                Checkout</button>
                            <button class="btn btn-white"><i class="fa fa-arrow-left"></i> Continue shopping</button>

                        </div>
                    </div>

                </div>
                <div class="col-md-3">
                    <div class="ibox">
                        <div class="ibox-title">
                            <h5>Cart Summary</h5>
                        </div>
                        <div class="ibox-content">
                            <span>
                                Total
                            </span>
                            <h2 class="font-bold">
                                $390,00
                            </h2>

                            <hr>
                            <span class="text-muted small">
                                *For United States, France and Germany applicable sales tax will be applied
                            </span>
                            <div class="m-t-sm">
                                <div class="btn-group">
                                    <a href="#" class="btn btn-dark btn-sm"><i class="fa fa-shopping-cart"></i>
                                        Checkout</a>
                                    <a href="#" class="btn btn-white btn-sm"> Cancel</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
  </main>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>

</html>