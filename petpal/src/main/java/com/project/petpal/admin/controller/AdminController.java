package com.project.petpal.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {
	
	@RequestMapping("/admin/moveAdminPage.do")
	public String moveAdminPage() {
		return "admin/adminPage";
	}
	
	@RequestMapping("/admin/adminStock.do")
	public String adminStock() {
		return "admin/adminStock";
	}
}