package com.project.petpal.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.petpal.member.model.service.MemberService;
import com.project.petpal.member.model.vo.Member;

@Controller
public class MemberController {
	
	@Autowired
	MemberService service;
	@Autowired
	BCryptPasswordEncoder pwEncoder;
	
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
	@RequestMapping("/member/moveJoin.do")
	public String moveJoin() {
		return "member/join";
	}
	@RequestMapping("/member/myPageFav.do")
	public String myPageFav() {
		return "member/myPageFav";
	}
	@RequestMapping("/member/insertMember.do")
	public String insertMember(Model model,Member m) {
		System.out.println(m);
		int result=service.insertMember(m);
		String msg="";
		String loc="";
		if(result>0) {
			msg="가입에 성공하였습니다!";
		}else {
			msg="가입에 실패하였습니다!";
		}
		return "msg";
	}
	@RequestMapping("/member/memberLogin.do")
	public String memberLogin(String email,String password,Model m) {
		Member login=service.selectMember(email);
		if(login!=null && pwEncoder.matches(password,login.getPassword())) { //입력된 값, 암호화되어있는 값
			m.addAttribute("loginMember",login);
			return "redirect:/";
		}else {
			//로그인실패
			m.addAttribute("msg","로그인에 실패했습니다.");
			m.addAttribute("loc","/");
			return "common/msg";
		}	
	}

}
