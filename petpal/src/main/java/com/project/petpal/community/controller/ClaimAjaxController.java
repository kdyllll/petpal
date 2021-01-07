package com.project.petpal.community.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.petpal.community.model.service.ClaimService;
import com.project.petpal.member.model.vo.Member;

@Controller
public class ClaimAjaxController {

	@Autowired
	private ClaimService service;
	
	@RequestMapping("/claim/claimCheck.do")
	@ResponseBody
	public boolean claimCheck(HttpSession session,String no) {
		Member loginMember=(Member)session.getAttribute("loginMember");
		Map m=new HashMap();
		m.put("no", no);
		m.put("memberNo",loginMember.getMemberNo());
		int result=service.claimCheck(m);
		return result>0?false:true;
	}
	
	
	@RequestMapping("/claim/moveClaimModal.do")
	public String moveClaimModal(String no,Model m) {
		//신고 모달로 이동
		m.addAttribute("no",no);
		return "community/communityAjax/claimModal";
	}
	
	@RequestMapping("/claim/claimEnd.do")
	@ResponseBody
	public boolean insertClaim(HttpSession session,String no,String claimCategory, String claimContent) {
		//신고 작성 완료됐을 때
		Member loginMember=(Member)session.getAttribute("loginMember");
		Map m=new HashMap();
		
		m.put("no", no);
		m.put("category", claimCategory);
		m.put("content", claimContent);
		m.put("memberNo",loginMember.getMemberNo());
		int result=service.insertClaim(m);
		
		return result>0?true:false;
	}
	
}
