package com.project.petpal.admin.controller;

import java.util.HashMap;
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
	private AdminService service;
	
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
	
	@RequestMapping("/admin/placeDeny.do")
	public String placeDeny(String placeNum,Model m) {
		Map mm = new HashMap();
		mm.put("placeNo", placeNum);
		mm.put("status", "M");
		int result = service.updatePlace(mm);
		String loc="/admin/adminCommunity.do";
		String msg = "커뮤니티 장소글 거부 실패";
		if(result>0) {
			msg="커뮤니티 장소글 거부 성공";
		}
		m.addAttribute("loc",loc);
		m.addAttribute("msg",msg);
		return "common/msg";
	}
	@RequestMapping("/admin/placeAccept.do")
	public String placeAccept(String placeNum,Model m) {
		Map mm = new HashMap();
		mm.put("placeNo", placeNum);
		mm.put("status", "Y");
		int result = service.updatePlace(mm);
		String loc="/admin/adminCommunity.do";
		String msg = "커뮤니티 장소글 승인 실패";
		if(result>0) {
			msg="커뮤니티 장소글 승인 성공";
		}
		m.addAttribute("loc",loc);
		m.addAttribute("msg",msg);
		return "common/msg";

	}
}
