<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    
<header class="fixed-top" >
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark  py-3 ">
      <div class="container">
        <a class="navbar-brand" href="#">로고</a>
        <ul class="nav justify-content-center d-none d-lg-flex">
          <li class="nav-item">
            <a class="nav-link" href="#">커뮤니티</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">스토어</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">공지사항</a>
          </li>
          <li class="nav-item">
            <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">위치찾기</a>
          </li>
        </ul>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item active">
              <a class="nav-link" href="#">장바구니</a>
            </li>
            <li class="nav-item d-none d-lg-block">
              <a class="nav-link" data-toggle="collapse" data-target="#collapseOne2" aria-expanded="true" aria-controls="collapseOne" href="#">검색</a>
            </li>

            <li class="nav-item">
              <a class="nav-link" href="#">로그인</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">회원가입</a>
            </li>
          </ul>
        </div>
        
      </div>
    </nav>
      <div id="collapseOne2" class="collapse bg-dark"  >
        <div class="card-body container d-none d-lg-block">
          <div class="input-group ">
            <input type="text" class="form-control" placeholder="Recipient's username" aria-label="Recipient's username" aria-describedby="button-addon2">
            <div class="input-group-append">
              <button class="btn btn-outline-secondary" type="button" id="button-addon2">Button</button>
            </div>
          </div>
        </div>
      </div>
    
      <!--중간사이즈부터 그 아래사이즈들 검색버튼 없애고 인풋검색창 바로 보이게 하기-->
      <div class=" d-lg-none  bg-dark pb-4">
        <div class="input-group container">
        <input type="text" class="form-control" placeholder="Recipient's username" aria-label="Recipient's username" aria-describedby="button-addon2">
        <div class="input-group-append">
          <button class="btn btn-outline-secondary" type="button" id="button-addon2">Button</button>
        </div>
      </div>
      </div>
      <ul class="nav justify-content-center bg-light d-flex d-lg-none">
        <li class="nav-item">
          <a class="nav-link" href="#">커뮤니티</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">스토어</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">공지사항</a>
        </li>
        <li class="nav-item">
          <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">위치찾기</a>
        </li>
      </ul>
  </header>