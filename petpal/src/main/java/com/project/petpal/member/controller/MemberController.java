package com.project.petpal.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.project.petpal.member.model.service.MemberService;
import com.project.petpal.member.model.vo.Member;

@Controller
@SessionAttributes("loginMember")
public class MemberController {
	
	@Autowired
	MemberService service;
	@Autowired
	BCryptPasswordEncoder pwEncoder;
	
	@RequestMapping("/member/moveMyPage.do")
	public String moveMyPage(HttpSession session, Model m) {
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
	@RequestMapping("/member/moveJoin.do")
	public String moveJoin() {
		return "member/join";
	}
	@RequestMapping("/member/myPageFav.do")
	public String myPageFav() {
		return "member/myPageFav";
	}
	
	@RequestMapping("/member/insertMember.do")
	public String insertMember(Model m,Member member) {
		
		String oriPw=member.getPassword();
		member.setPassword(pwEncoder.encode(oriPw));
		System.out.println(m);
		int result=service.insertMember(member);
		if(result>0) {
			m.addAttribute("msg","가입에 성공하였습니다!");
		}else {
			m.addAttribute("loc","가입에 실패하였습니다!");
			m.addAttribute("loc","/member/moveJoin.do");	
		}
		return "common/msg";
	}
	@RequestMapping("/member/moveLogin.do")
	public String moveLogin() {
		return "member/login";
	}
	@RequestMapping("/member/memberLogin.do")
	public String memberLogin(String email,String password,Model m) {
		Member login=service.selectMember(email);
//		System.out.println(login);
		if(login!=null && pwEncoder.matches(password,login.getPassword())) { 
//		if(login!=null) {
			m.addAttribute("loginMember",login);
			return "redirect:/";
		}else {
			//로그인실패
			m.addAttribute("msg","로그인에 실패했습니다.");
			m.addAttribute("loc","/");
			return "common/msg";
		}	
	}
	
	@RequestMapping("/member/passwordUpdateEnd.do")
	public String passwordUpdateEnd(Member m) {
		System.out.println(m);
		return "member/myPageModify";
	}

}
