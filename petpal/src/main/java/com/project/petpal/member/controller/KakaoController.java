package com.project.petpal.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.databind.JsonNode;
import com.project.petpal.member.model.service.MemberService;
import com.project.petpal.member.model.vo.KakaoLoginApi;
import com.project.petpal.member.model.vo.Member;

@Controller
public class KakaoController {
	
    @Autowired
    private MemberService service;

    //로그인 할때
	 @RequestMapping(value = "/kakaoLogin", produces = "application/json")
	    public String kakaoLogin(@RequestParam("code") String code, Model model, HttpSession session) {        
	        //카카오 rest api 객체 선언
	        KakaoLoginApi kl = new KakaoLoginApi();
	        //결과값을 node에 담아줌
	        JsonNode node = kl.getAccessToken(code);
	        //결과값 출력
	        System.out.println(node);
	        //노드 안에 있는 access_token값을 꺼내 문자열로 변환
	        String token = node.get("access_token").toString();
	        JsonNode accessToken = node.get("access_token");
	        JsonNode userInfo = kl.getKakaoUserInfo(accessToken);
	        JsonNode kakao_account = userInfo.path("kakao_account");
	        String id = userInfo.path("id").asText();
	        String email=kakao_account.path("email").asText();

	        System.out.println(email);
	        System.out.println(id);
	        
	        Member loginMember=service.selectSnsMember(id);
			if(loginMember !=null ) {//네이버 간편로그인으로 가입했었으면
				model.addAttribute("loginMember", loginMember);
		         return "redirect:/";
			}else {//가입한 적 없으면
				 model.addAttribute("msg", "카카오 간편로그인으로 가입되지 않은 아이디입니다.");
		         model.addAttribute("loc", "/member/moveLogin.do");
		         return "common/msg";
			}
	        

	  }
	 
	 //회원가입할때
	 @RequestMapping(value = "/kakaoEnroll", produces = "application/json")
	    public String kakaoEnroll(@RequestParam("code") String code, Model model, HttpSession session) {        
	        //카카오 rest api 객체 선언
	        KakaoLoginApi kr = new KakaoLoginApi();
	        //결과값을 node에 담아줌
	        JsonNode node = kr.getAccessToken(code);
	        //결과값 출력
	        System.out.println(node);
	        //노드 안에 있는 access_token값을 꺼내 문자열로 변환
	        String token = node.get("access_token").toString();
	        JsonNode accessToken = node.get("access_token");
	        JsonNode userInfo = kr.getKakaoUserInfo(accessToken);
	        JsonNode kakao_account = userInfo.path("kakao_account");
	        String id = userInfo.path("id").asText();
	        String email=kakao_account.path("email").asText();

	        System.out.println(email);
	        System.out.println(id);
	        
	        model.addAttribute("snsNo",id);
			model.addAttribute("email",email);
	  
			return "회원가입 세부사항 이동 주소";

	  }



}
