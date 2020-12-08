package com.project.petpal.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.petpal.member.model.service.MemberService;
import com.project.petpal.member.model.vo.Member;

@Controller
public class MemberAjaxController {
	@Autowired
	MemberService service;
	@Autowired
	BCryptPasswordEncoder pwEncoder;
	
	@RequestMapping("/member/passwordUpdate.do")
	@ResponseBody
	public int passwordUpdate(String password,HttpSession session) throws Exception {

		Member m = (Member)session.getAttribute("loginMember");
		int flag = 0;
		if(pwEncoder.matches(password, m.getPassword())) {
			flag=1;
		} 	 
		return flag;
	}
}
