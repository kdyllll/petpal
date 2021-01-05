package com.project.petpal.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.fasterxml.jackson.databind.JsonNode;
import com.project.petpal.member.model.service.MemberService;
import com.project.petpal.member.model.vo.GoogleEnrollApi;
import com.project.petpal.member.model.vo.GoogleLoginApi;
import com.project.petpal.member.model.vo.Member;

@Controller
@SessionAttributes("loginMember")
public class GoogleController {
	
	@Autowired
	private MemberService service;

	@RequestMapping("/googleEnroll")
	   public String googleEnroll(Model m,@RequestParam("code") String code, HttpSession session) {
		// 코드 확인
	       System.out.println("code : " + code);
	       
	       
	       // Access Token 발급
	       JsonNode jsonToken = GoogleEnrollApi.getAccessToken(code);
	       String accessToken = jsonToken.get("access_token").toString();
	       String refreshToken = "";
	       if(jsonToken.has("refresh_token")) {
	           refreshToken = jsonToken.get("refresh_token").toString();
	       }
	       String expiresTime = jsonToken.get("expires_in").toString();
	       System.out.println("Access Token : " + accessToken);
	       System.out.println("Refresh Token : " + refreshToken);
	       System.out.println("Expires Time : " + expiresTime);

	       // Access Token으로 사용자 정보 반환
	       JsonNode userInfo = GoogleEnrollApi.getGoogleUserInfo(accessToken);
	       System.out.println(userInfo.toString());
	       String email = userInfo.get("email").asText();
	       String id=userInfo.get("id").asText();
	       // 사용자 정보 출력
	       System.out.println(email);
	       System.out.println(id);
	       Member member=service.selectSnsMember(id);
	       if(member!=null) {//가입되어있으면
	    	   m.addAttribute("loginMember",member);
	    	   m.addAttribute("msg","가입되어있는 회원입니다.로그인 되었습니다.");
	    	   return "common/msg";
	       }else {//가입되어있지않으면 추가정보입력 페이지로
	    	// 받아온 사용자 정보를 view에 전달
	    	   m.addAttribute("snsNo",id);
			   m.addAttribute("email",email);
			   return "member/addUserInfo";
	       }
	       
	       
	   }
	@RequestMapping("/googleLogin")
	   public String googleLogin(Model m,@RequestParam("code") String code, HttpSession session) {
		// 코드 확인
	       System.out.println("code : " + code);
	       
	       
	       // Access Token 발급
	       JsonNode jsonToken = GoogleLoginApi.getAccessToken(code);
	       String accessToken = jsonToken.get("access_token").toString();
	       String refreshToken = "";
	       if(jsonToken.has("refresh_token")) {
	           refreshToken = jsonToken.get("refresh_token").toString();
	       }
	       String expiresTime = jsonToken.get("expires_in").toString();
	       System.out.println("Access Token : " + accessToken);
	       System.out.println("Refresh Token : " + refreshToken);
	       System.out.println("Expires Time : " + expiresTime);

	       // Access Token으로 사용자 정보 반환
	       JsonNode userInfo = GoogleLoginApi.getGoogleUserInfo(accessToken);
	       System.out.println(userInfo.toString());
	       String email = userInfo.get("email").asText();
	       String id=userInfo.get("id").asText();
	       // 사용자 정보 출력
	       System.out.println(email);
	       System.out.println(id);
	       Member member=service.selectSnsMember(id);
	       if(member!=null) {//가입되어있으면
	    	   m.addAttribute("loginMember",member);
	    	   m.addAttribute("msg","가입되어있는 회원입니다.로그인 되었습니다.");
	    	   return "common/msg";
	       }else {//가입되어있지않으면 추가정보입력 페이지로
	    	// 받아온 사용자 정보를 view에 전달
	    	   m.addAttribute("snsNo",id);
			   m.addAttribute("email",email);
			   return "member/addUserInfo";
	       }
	       
	       
	   }
}
