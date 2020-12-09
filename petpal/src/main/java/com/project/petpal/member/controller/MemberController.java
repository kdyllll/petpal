package com.project.petpal.member.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

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
	public String insertMember(Model m,Member member,@RequestParam(value="f", required=false)MultipartFile f, HttpSession session) {
		
		String oriPw=member.getPassword();
		member.setPassword(pwEncoder.encode(oriPw));
		String path=session.getServletContext().getRealPath("/resources/upload/member");
		
		File dir=new File(path);
		if(!dir.exists()) dir.mkdirs();//폴더를 생성
		if(!f.isEmpty()) {
			  //파일명생성하기
			  String originalName=f.getOriginalFilename();
			  String ext=originalName.substring(originalName.lastIndexOf(".")+1);
			  //리네임규칙
			  SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
			  int rndValue=(int)(Math.random()*10000);
			  String reName=sdf.format(System.currentTimeMillis())+"_"+rndValue+"."+ext;
			  try {
				  System.out.println(path+"/"+reName);
				  f.transferTo(new File(path+"/"+reName));
			  }catch(IOException e) {
				  e.printStackTrace();
				  m.addAttribute("msg","오류가 발생하였습니다.다시 시도해주세요.");
			  }
			  member.setImg(reName);
		}
//		int result=service.insertMember(member);
//		if(result>0) {
//			m.addAttribute("msg","가입에 성공하였습니다!"); 
//		}else {
//			m.addAttribute("msg","가입에 실패하였습니다!");
//			m.addAttribute("loc","/member/moveJoin.do");
//			}

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

}
