<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/> 

<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
	  <div class="modal-content">
	    <div class="modal-header">
	      <h5 class="modal-title pl-3" id="exampleModalLabel">상품 리뷰</h5>
	      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	        <span aria-hidden="true">&times;</span>
	      </button>
	    </div>
	    <div class="modal-body offset-1 col-10">
	      <form>
	        <div class="form-group row pb-3 border-bottom d-flex align-items-center">
	          <img src="../final/img/cc.webp" class="rounded d-block w-100 col-4">
	          <p class="align-middle mb-0">강아지 고양이 기절 댕냥쿠션</p>
	          <input type="hidden" name="productNo"/>
	        </div>
	        <div class="form-group">
	          <label for="recipient-name" class="col-form-label"><strong>별점 평가</strong></label>
	          <div>
	            <ul class="d-flex pl-2" style="list-style-type:none;">
	          		<li class="pr-1">
			            <label>
			              <input type="radio" name="1" class="d-none"/>
			              <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-star-fill text-black-50" fill="currentColor" xmlns="http://www.w3.org/2000/svg" style="font-size: 25px;">
			                <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
			              </svg>
			            </label>
			          </li>
			          <li class="pr-1">
			            <label>
			              <input type="radio" name="2" class="d-none"/>
			              <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-star-fill text-black-50" fill="currentColor" xmlns="http://www.w3.org/2000/svg" style="font-size: 25px;">
			                <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
			              </svg>
			            </label>
			          </li>
			          <li class="pr-1">
			            <label>
			              <input type="radio" name="3" class="d-none"/>
			              <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-star-fill text-black-50" fill="currentColor" xmlns="http://www.w3.org/2000/svg" style="font-size: 25px;">
			                <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
			              </svg>
			            </label>
			          </li>
			          <li class="pr-1">
			            <label>
			              <input type="radio" name="4" class="d-none"/>
			              <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-star-fill text-black-50" fill="currentColor" xmlns="http://www.w3.org/2000/svg" style="font-size: 25px;">
			                <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
			              </svg>
			            </label>
			          </li>
			          <li class="pr-1">
			            <label>
			              <input type="radio" name="5" class="d-none"/>
			              <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-star-fill text-black-50" fill="currentColor" xmlns="http://www.w3.org/2000/svg" style="font-size: 25px;">
			                <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
			              </svg>
			            </label>
			          </li>
			        </ul>
			      </div>
			    </div>
			    <div class="form-group">
			      <label for="message-text" class="col-form-label"><strong>사진 첨부</strong> <span class="text-black-50">최대 한장</span></label>
			      <div class="input-group mb-3">
			        <div class="custom-file" id="thumnail">
			          <input type="file" class="custom-file-input" id="inputGroupFile01" aria-describedby="inputGroupFileAddon01">
			          <label class="custom-file-label" for="inputGroupFile01">Choose file</label>
			        </div>
			      </div>
			      <div class="row bg-light mx-1">
			        <img src="./img/cc3.jpg" width="150px" class="col-6 offset-3">
			      </div>                         
			    </div>
			    <div class="form-group">
			      <label for="message-text" class="col-form-label"><strong>리뷰 작성</strong></label>
			      <textarea class="form-control" rows="5" id="message-text" style="resize:none;"></textarea>
	          	</div>
	        </form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
	        <button type="button" class="btn btn-primary">완료</button>
	      </div>
	    </div>
	  </div>
	</div>