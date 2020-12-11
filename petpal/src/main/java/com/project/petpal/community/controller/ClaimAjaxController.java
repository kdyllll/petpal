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
	
	@RequestMapping("/claim/moveClaimModal.do")
	public String moveClaimModal(String no,Model m) {
		m.addAttribute("no",no);
		return "community/communityAjax/claimModal";
	}
	
	@RequestMapping("/claim/claimEnd.do")
	@ResponseBody
	public String insertClaim(HttpSession session,String no,String claimCategory, String claimContent) {
		Member loginMember=(Member)session.getAttribute("loginMember");
		
		Map m=new HashMap();
		m.put("no", no);
		m.put("category", claimCategory);
		m.put("content", claimContent);
		m.put("memberNo",loginMember);
		int result=service.insertClaim(m);
		
		String data=result>0?"true":"false";

		return data;
	}
	
}
