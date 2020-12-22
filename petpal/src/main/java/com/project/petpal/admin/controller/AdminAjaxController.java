package com.project.petpal.admin.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.petpal.admin.model.service.AdminService;

@Controller
public class AdminAjaxController {
	@Autowired
	public AdminService service;
	
	@RequestMapping("/admin/claimDetail.do")
	public String claimDetail(String claimNo, Model m) {
		Map claim = service.selectClaimOne(claimNo);
		m.addAttribute("claim", claim);
		return "admin/adminAjax/claimDetail";
	}
	
	@RequestMapping("/admin/claimDelete.do")
	public String claimDelete(String claimNo,Model m) {
		int result = service.claimDelete(claimNo);
		String loc="/admin/adminClaim.do";
		String msg = "신고글 삭제 실패";
		if(result>0) {
			msg="신고글 삭제 성공";
		}
		m.addAttribute("loc",loc);
		m.addAttribute("msg",msg);
		return "common/msg";
	}
	
	@RequestMapping("/admin/claimAccept.do")
	public String claimAccept(String claimNo, Model m) {
		int result = service.claimAccept(claimNo);
		String loc="/admin/adminClaim.do";
		String msg = "신고글 승인 실패";
		if(result>0) {
			msg="신고글 승인 성공";
		}
		m.addAttribute("loc",loc);
		m.addAttribute("msg",msg);
		return "common/msg";
	}
	
	@RequestMapping("/admin/adminPlaceDetail.do")
	public String adminPlaceDetail(String placeNo, Model m) {
		Map place = service.selectPlaceOne(placeNo);
		m.addAttribute("place", place);
		return "admin/adminAjax/placeModal";
	}
}
