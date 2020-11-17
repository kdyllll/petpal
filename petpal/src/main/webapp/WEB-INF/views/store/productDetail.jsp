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
  
  <!-- Page Content -->
  <main role="main" class="pt-5" style="min-height:100vh;">
      <div class="container mt-5 productHeader"> 
        <nav aria-label="breadcrumb ">
          <ol class="breadcrumb bg-transparent">
            <li class="breadcrumb-item"><a href="#">강아지</a></li>
            <li class="breadcrumb-item"><a href="#">가구</a></li>
            <li class="breadcrumb-item active" aria-current="page">쿠션</li>
          </ol>
        </nav>
        <div class="panel-body row">
          
          <div class="col-lg-6">
            
            <div id="carouselExampleIndicators" class="carousel slide" >
              <ol class="carousel-indicators">
                <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
              </ol>
              <div class="carousel-inner rounded">
                <div class="carousel-item active">
                  <img src="../final/img/cc.webp" class="d-block w-100 ">
                </div>
                <div class="carousel-item">
                  <img src="../final/img/cc2.webp" class="d-block w-100 ">
                </div>
              </div>
              <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
              </a>
              <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
              </a>
            </div>
          </div>
          <div class="col-lg-6 ">
            <p class="h3">               
                  강아지 고양이 기절 댕냥쿠션
            </p>
            <div class="px-3 pb-2 border-bottom">
              <div class="row mb-3 mx-2 d-flex justify-content-between"> 
                <a href="#" class="">★★★☆☆ 00개 리뷰</a>
                <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-heart" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                  <path fill-rule="evenodd" d="M8 2.748l-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z"/>
                </svg>          
              </div>
              <div class="row mb-3">
                <span class="h1 col-3 text-right text-info align-middle"><strong>68%</strong></span>
                <span class="col-9">
                  <p class="mb-0"><del>79,000원</del></p>
                  <p class="h1"><strong>24,900원</strong></p>
                </span>
              </div>
              <p class=""><b class="text-info">24p</b> 적립해드립니다.</p>
            </div>
            <div class="px-3 py-3 border-bottom">
              <p>CJ대한통운<br>
              2,500원 (50,000원 이상 구매시 무료배송) <br>
                <span class="pl-1 text-muted">도서산간지역 추가금액 발생 가능</span>
              </p>              
            </div>
            <div class="py-3 px-3">
              <select class="form-control mb-1" >
                <option disabled selected>색상</option>
                <option value="1">그레이</option>
                <option value="2">크림</option>
                <option value="3">베이지</option>
              </select>
              <select class="form-control" >
                <option disabled selected>크기</option>
                <option value="1">s</option>
                <option value="2">m</option>
                <option value="3">l</option>
              </select>
            </div>
            <div class="px-4 d-flex justify-content-between">
              <span class="h5"><strong>주문금액</strong></span>
              <span class="h3"><strong>0 원</strong></span>
            </div>
            <div class="row mx-1 py-3 d-flex justify-content-around">
              <div class="col-6"><button type="button" class="btn btn-outline-primary btn-lg btn-block ">장바구니</button></div>             
              <div class="col-6"><button type="button" class="btn btn-primary btn-lg btn-block">바로구매</button></div>
            </div>      
          </div>
        </div>

      </div>

     
      <div class="productContainer">
         <!--스티키-->
        <div class="sticky-top d-none d-lg-block" style="top:70px; height:20px;">
          <nav class="navbar mt-3 navbar-expand-lg navbar-light bg-light ">
              <ul class="nav container justify-content-around  d-flex ">
                <li class="nav-item ">
                  <a class="nav-link text-dark" href="#pInfo">상품정보</a>
                </li>
                <li class="nav-item ">
                  <a class="nav-link text-dark" href="#review">리뷰(00개)</a>
                </li>
                <li class="nav-item ">
                  <a class="nav-link text-dark" href="#inquiry">문의(00개)</a>
                </li>
                <li class="nav-item ">
                  <a class="nav-link text-dark" href="#rule">배송/환불</a>
                </li>
              </ul>                     
          </nav>
        </div>
        <!-- <script>
          var tt=$("div#pInfo").offset();
          console.log($("div#pInfo").offset());
          var location = document.querySelector("#pInfo").offsetTop;
          console.log(location);
          // console.log($("#review").offset().top);
          // console.log($("#inquiry").offset().top);
          // console.log($("#rule").offset().top);

          // window.scrollTo({top:location, behavior:'smooth'});
        </script> -->
        <div class="sticky-top d-lg-none" style="top:170px; height:20px;">
            <nav class="navbar mt-3 navbar-expand-lg navbar-light bg-light ">
  
                <ul class="nav container justify-content-around  d-flex ">
                  <li class="nav-item ">
                    <a class="nav-link text-dark" href="#">상품정보</a>
                  </li>
                  <li class="nav-item ">
                    <a class="nav-link text-dark" href="#">리뷰(00개)</a>
                  </li>
                  <li class="nav-item ">
                    <a class="nav-link text-dark" href="#">문의(00개)</a>
                  </li>
                  <li class="nav-item ">
                    <a class="nav-link text-dark" href="#">배송/환불</a>
                  </li>
                </ul>                     
            </nav>
          </div>

        <!--상품 상세창s-->
        <div class="container mt-5 col-lg-8 col-10 offset-lg-2"> 
          <div class="mb-5">
            <p class="h5 py-4"><strong>유저들의 스타일링 샷</strong> <span class="text-info">0</span></p>
            <div id="carouselExampleControls" class="carousel slide block col-lg-8 offset-lg-2">
              <div class="carousel-inner rounded ">
                <div class="carousel-item active">
                  <img src="./img/cc.webp" class="d-block w-100" alt="...">
                </div>
                <div class="carousel-item">
                  <img src="./img/cc2.webp" class="d-block w-100" alt="...">
                </div>
                <div class="carousel-item">
                  <img src="./img/cc3.jpg" class="d-block w-100" alt="...">
                </div>
              </div>
              <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
              </a>
              <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
              </a>
            </div>
            <!-- <div id="pInfo" style="height:150px;">

            </div> -->
            <!--상품정보-->
            <div id="pInfo">
              <p class="h5 py-4"><strong>상품정보</strong></p>
              <img src="./img/product.jpg"  class="col-12">
            </div>
            <p class="h5 py-4"><strong>상품상세정보</strong></p>
            <table class="table ">
              <tbody class="">
                <tr class="">
                  <td class="border-top-0 text-secondary" width="40%">제품 소재</td>
                  <td class="border-top-0">겉감(폴리에스터 100%) / 충전재(폴리에스터 100%)</td>
                </tr>
                <tr>
                  <td class="text-secondary">제조국</td>
                  <td>한국</td>
                </tr>
              </tbody>
            </table>
            <!--리뷰-->
            <div id="review">
              <div class="row d-flex justify-content-between px-3 py-4 mt-5">
                <p class="h5">
                  <strong>리뷰</strong> 
                  <span class="text-info pl-3">0</span>
                  <span class="text-info pl-3">★★★☆☆</span>
                </p>
                <button type="button" class="btn btn-link text-info" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo"><strong>리뷰 쓰기</strong></button>
              </div>
              <!--리뷰쓰기 모달-->
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
              <!--리뷰창-->
              <article class="px-4 mb-3 pb-3 border-bottom">
                <div class="row pl-2">
                  <a href="" class="rounded-circle pr-3">
                    <img src="./img/avatar.webp" width="30px;">
                  </a>                  
                  <div style="font-size: 12px;">
                    <p class="my-0">작성자</p>
                    <div ><span class="text-info">★★★☆☆</span> <span>구매날짜</span></div>
                  </div>
                </div>
                <div class="my-2"> 옵션 </div>
                <img src=""  width="150px" class="rounded mb-3">
                <p>똥강아지 너무 좋아하고 좀 큰거 같은데 넘 편해보이고 좋으네요 한번 잘 써보겠습니다</p>
                <div class="text-right">
                  <a class="text-info text-right pb-2 pr-4"  style="font-size: 12px;" data-toggle="collapse" href="#replyWrite" role="button" aria-expanded="false" aria-controls="collapseExample">답글 수정(판매자만)</a>
                  <a class="text-info text-right pb-2"  style="font-size: 12px;" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
                    <strong>판매자 답글</strong>
                  </a>
                </div>
                <div class="collapse py-3 mt-2 pr-3 bg-light rounded text-right" id="collapseExample">
                  <p class="mb-0">구매해주셔서 감사합니다. </p>
                </div>
                <form class="collapse  mt-2 p-3 pb-0 bg-light rounded text-right" id="replyWrite">
                  <div class="form-group">
                    <textarea class="form-control" rows="2" id="message-text" style="resize:none;" placeholder="구매해주셔서 감사합니다."></textarea>
                    <button type="button" class="btn btn-primary mt-2">완료</button>
                  </div> 
                </form>               
              </article>

              <article class="px-4 mb-3 pb-3 border-bottom">
                <div class="row pl-2">
                  <a href="" class="rounded-circle pr-3">
                    <img src="./img/avatar.webp" width="30px;">
                  </a>                  
                  <div style="font-size: 12px;">
                    <p class="my-0">작성자</p>
                    <div ><span class="text-info">★★★☆☆</span> <span>구매날짜</span></div>
                  </div>
                </div>
                <div class="my-2"> 옵션 </div>
                <img src="./img/cc3.jpg" width="150px" class="rounded mb-3">
                <p>똥강아지 너무 좋아하고 좀 큰거 같은데 넘 편해보이고 좋으네요 한번 잘 써보겠습니다</p>
                <div class="text-right">
                  <a class="text-info text-right pb-2 pr-4"  style="font-size: 12px;" data-toggle="collapse" href="#replyWrite2" role="button" aria-expanded="false" aria-controls="collapseExample">답글 달기(판매자만)</a>
                  <a class="text-black-50 text-right pb-2" style="font-size: 12px;" data-toggle="collapse" href="" role="button" aria-expanded="false" aria-controls="collapseExample">
                    <strong>판매자 답글</strong>
                  </a>
                </div>
                <form class="collapse  mt-2 p-3 pb-0 bg-light rounded text-right" id="replyWrite2">
                  <div class="form-group">
                    <textarea class="form-control" rows="2" id="message-text" style="resize:none;" placeholder=""></textarea>
                    <button type="button" class="btn btn-primary mt-2">완료</button>
                  </div> 
                </form>
                
              </article>
              <div class="mt-3 text-center">페이지바</div>
            </div>

            <!--문의-->
            <div id="inquiry" class="row d-flex justify-content-between px-3 py-4 mt-5" >
              <p class="h5">
                <strong>문의</strong> 
                <span class="text-info pl-3">0</span>               
              </p>
              <button type="button" class="btn btn-link text-info" data-toggle="modal" data-target="#exampleModal2" data-whatever="@mdo"><strong>문의 하기</strong></button>
              <!--문의 모달-->
              <div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h5 class="modal-title pl-3" id="exampleModalLabel">상품 문의</h5>
                      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                      </button>
                    </div>
                    <div class="modal-body offset-1 col-10 pb-0">
                      <form>
                        <div class="form-group row pb-3 border-bottom d-flex align-items-center">
                          <img src="../final/img/cc.webp" class="rounded d-block w-100 col-4">
                          <p class="align-middle mb-0">강아지 고양이 기절 댕냥쿠션</p>
                          <input type="hidden" name="productNo"/>
                        </div>
                        <div class="form-group">
                          <label for="message-text" class="col-form-label"><strong>문의 분류</strong></label>
                          <select class="form-control col-3" id="exampleFormControlSelect1">
                            <option disabled selected>분류</option>
                            <option>상품</option>
                            <option>배송</option>
                            <option>반품</option>
                            <option>교환</option>
                            <option>환불</option>
                            <option>기타</option>                          
                          </select>
                        </div>
                        <div class="form-group">
                          <label for="message-text" class="col-form-label"><strong>문의 내용</strong></label>
                          <textarea class="form-control" rows="5" id="message-text" style="resize:none;"></textarea>
                        </div>
                        <div class="form-group d-flex justify-content-end">
                        <label class=""><input type="checkbox" class="mr-2"/>비밀글</label>
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
            </div>
            <!--문의-->
            <article class="border-bottom py-3">
              <div class="row d-flex justify-content-between pl-2"> 
                <p class="mb-0"style="font-size: 14px;">구매 | 배송 | <span class="text-secondary"> 답변전</span></p>
                <a class="text-info text-right pb-2 pr-4"  style="font-size: 12px;" data-toggle="collapse" href="#replyWrite3" role="button" aria-expanded="false" aria-controls="collapseExample">답글 달기(판매자만)</a>
              </div>
              <p class="text-black-50" style="font-size: 12px;">작성자 | <span>작성일</span></p>
              <div class="row ml-2">
                <p class="text-info mr-3"><strong>Q</strong></p>
                <p>11/6 부터 순차발송된다 메세지받았는데
                  아직 배송정보가 안잡힙니다
                  언제출고되나요?</p>
              </div> 
              <form class="collapse" id="replyWrite3">
                <div class="form-group row ml-2">
                  <p class=""><strong class="text-info mr-2">A</strong></p>
                  <div class="col-11"> 
                    <textarea class="form-control" rows="2" id="message-text" style="resize:none;" placeholder=""></textarea>
                    <button type="button" class="btn btn-primary mt-2 offset-10 col-2">완료</button>
                  </div>
                </div> 
              </form>
              
            </article>
            <article class="inquiry border-bottom py-3">
              <div class="row d-flex justify-content-between pl-2"> 
                <p class="mb-0"style="font-size: 14px;">구매 | 배송 | <span class="text-info"> 답변완료</span></p>
                <a class="text-info text-right pb-2 pr-4 updateReply" style="font-size: 12px;">답글 수정(판매자만)</a>
              </div>
              <p class="text-black-50" style="font-size: 12px;">작성자 | <span>작성일</span></p>
              <div class="row ml-2">
                <p class="text-info mr-3"><strong>Q</strong></p>
                <p >11/6 부터 순차발송된다 메세지받았는데
                  아직 배송정보가 안잡힙니다
                  언제출고되나요?</p>
              </div> 
              <div class="oriReply row ml-2">
                <p class=""><strong class="text-info mr-2">A</strong></p>
                <div class="col-11"> 
                  <span class="text-black-50" style="font-size: 12px;">답글작성날짜</span>
                  <p class="content">안녕하세요 그날 오후 즈음 입고가되서 순차적 배송 작업하다보니 일부출고되고 또나머지는 어제부터 발송 처리중이며 이번주 수목 기준은 예상하시면 될듯합니다. 많이 기다려주셔서 너무나 감사합니다</p>
                </div>
              </div> 
              
                <form class="writeFrm d-none" id="replyWrite3">
                  <div class="form-group row ml-2">
                    <p class=""><strong class="text-info mr-2">A</strong></p>
                    <div class="col-11 mt-2"> 
                      <textarea class="writeText form-control" rows="3" id="message-text" style="resize:none;" placeholder=""></textarea>
                      <button type="button" class="btn btn-primary mt-2 offset-10 col-2">완료</button>
                    </div>
                  </div> 
                </form>
              
            </article>
            <script>
              $(".updateReply").click(function(e){       
                var ori=$(e.target).parents(".inquiry").find("div.oriReply");
                var write=ori.next(".writeFrm");
                var content=ori.find("p.content").html();
                //console.log(write);
                ori.toggleClass("d-none");
                write.find("textarea.writeText").html(content);
                write.toggleClass("d-none");
              });
            </script>
            <div class="mt-3 text-center">페이지바</div>

            <!--배송교환환불-->
            <p id="rule" class="h5 py-4"><strong>배송/교환/환불</strong></p>
            <header class="pb-3" style="font-size: 17px;"><strong>배송</strong></header>
            <table class="table ">
              <tbody class="">
                <tr class="">
                  <td class="border-top-0 text-secondary" width="40%">배송</td>
                  <td class="border-top-0">일반배송</td>
                </tr>
                <tr>
                  <td class="text-secondary">배송비</td>
                  <td>2,500원</td>
                </tr>
                <tr>
                  <td class="border-bottom text-secondary">도서산간지역 추가 배송비</td>
                  <td class="border-bottom">5,000원</td>
                </tr>
              </tbody>
            </table>
            <header class="py-3" style="font-size: 17px;"><strong>교환/환불</strong></header>
            <table class="table ">
              <tbody class="">
                <tr class="">
                  <td class="border-top-0 text-secondary" width="40%">반품 배송비</td>
                  <td class="border-top-0">2,500원</td>
                </tr>
                <tr>
                  <td class="text-secondary">교환 배송비</td>
                  <td>5,000원</td>
                </tr>
              </tbody>
            </table>
            <header class="py-3" style="font-size: 17px;"><strong>반품/교환 사유에 따른 요청 가능 기간</strong></header>
            <ul>
              <li>구매자 단순 변심은 상품 수령 후 7일 이내</li>
              <li>표시/광고와 상이, 상품하자의 경우 상품 수령 후 3개월 이내 혹은 표시/광고와 다른 사실을 안 날로부터 30일 이내.
                둘 중 하나 경과 시 반품/교환 불가</li>
            </ul>
            <header class="py-3" style="font-size: 17px;"><strong>반품/교환 불가능 사유</strong></header>
            <ul>
              <li>반품요청기간이 지난 경우</li>
              <li>구매자의 책임 있는 사유로 상품 등이 멸실 또는 훼손된 경우</li>
              <li>포장을 개봉하였으나 포장이 훼손되어 상품가치가 현저히 상실된 경우</li>
              <li>고객주문 확인 후 상품제작에 들어가는 주문제작상품</li>
              <li>구매자의 사용 또는 일부 소비에 의하여 상품의 가치가 현저히 감소한 경우</li>
            </ul>
          </div>
        </div>
      </div>
    </main>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>

</html>