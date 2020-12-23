<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<div class="modal fade" id="staticBackdrop" tabindex="-1"
	aria-labelledby="exampleModalLabel" data-backdrop="static"
	aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">주문상세정보</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<c:if test="${not empty pdList }">
					<p style="font-size: 16px; font-weight: 600;">상품리스트</p>
					<div class="mb-3">
						<c:forEach var="pd" items="${pdList }">
							<span><a href="#"><c:out value="${pd.PRODUCTNAME }" /></a></span>
							<span><c:out value="${pd.COLOR }" /></span>
							<span><c:out value="${pd.PRODUCTSIZE }" /></span>
							<div>
								<span class="text-end">수량 : <c:out value="${pd.CNT }" /> (<c:out value="${pd.PRICE }"/>)
								</span> <span> / 총 가격 : <c:out value="${pd.PRICE * pd.CNT }" />원</span>
							</div>
							<br />
						</c:forEach>
					</div>
				</c:if>
				<c:if test="${not empty pList }">
					<p style="font-size: 16px; font-weight: 600;">주문자 정보</p>
					<div class="mb-3">
						<span>주문자 이름 : <c:out value="${pList.NAME }" /></span><br /> <span>주문자
							연락처 : <c:out value="${pList.TEL }" />
						</span>
					</div>
					<p style="font-size: 16px; font-weight: 600;">받는분 정보</p>
					<div class="mb-3">
						<span>받는분 이름 : <c:out value="${pList.RECEIVERNAME }" /></span><br />
						<span>받는분 연락처 : <c:out value="${pList.RECEIVERTEL }" /></span>
					</div>
					<p style="font-size: 16px; font-weight: 600;">주소</p>
					<p>
						<c:out value="${pList.L0C }" />
					</p>
					<c:if test="${not empty pList.MEMO }">
						<p style="font-size: 16px; font-weight: 600;">메모</p>
						<p>
							<c:out value="${pList.MEMO }" />
						</p>
					</c:if>
					<p style="font-size: 16px; font-weight: 600;">결제정보</p>
					<p>
						<c:out value="${pList.PAYKIND }" />
					</p>

					<p style="font-size: 16px; font-weight: 600;">주문날짜</p>
					<p>
						<fmt:formatDate value="${pList.PAYDATE }"
							pattern="yyyy년MM월dd일 HH시mm분" />
					</p>
					<p style="font-size: 16px; font-weight: 600;">배송상태</p>
					<p>
						<c:out value="${pList.DELIVERYSTATUS }" />
					</p>
					<p style="font-size: 16px; font-weight: 600;">주문상태</p>
					<p>
						<c:out value="${pList.PAYSTATUS }" />
					</p>
					<p style="font-size: 16px; font-weight: 600;">이메일</p>
					<p>
						<c:out value="${pList.EMAIL }" />
					</p>

				</c:if>
			</div>
			<div class="modal-footer ">
				<div style="font-size: 16px; font-weight:bold;">
					총가격 :
					<c:out value="${pList.TOTALPRICE }" />
				</div>
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>
