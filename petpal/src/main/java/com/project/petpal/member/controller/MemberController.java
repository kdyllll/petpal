package com.project.petpal.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {
	
	@RequestMapping("/member/moveMyPage.do")
	public String moveMyPage() {
		return "member/myPageProfile";
	}
	
	@RequestMapping("/member/myPageShop.do")
	public String myPageShop() {
		return "member/myPageShop";
	}
	
	@RequestMapping("/member/myPageModify.do")
	public String myPageModify() {
		return "member/myPageModify";
	}
}
