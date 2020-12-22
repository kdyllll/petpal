package com.project.petpal.admin.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.petpal.admin.model.service.AdminService;

@Controller
public class AdminClaimAjaxController {
	@Autowired
	public AdminService service;
	
	@RequestMapping("/admin/claimDetail.do")
	public String claimDetail(String claimNo, Model m) {
		Map claim = service.selectClaimOne(claimNo);
		m.addAttribute("claim", claim);
		return "admin/adminAjax/claimDetail";
	}
}
