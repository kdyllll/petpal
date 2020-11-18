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
	
	@RequestMapping("/admin/adminCommunity.do")
	public String adminCommunity() {
		return "admin/adminCommunity";
	}
	
	@RequestMapping("/admin/adminComplain.do")
	public String adminComplain() {
		return "admin/adminComplain";
	}
	
	@RequestMapping("/admin/adminOrder.do")
	public String adminOrder() {
		return "admin/adminOrder";
	}
	
	@RequestMapping("/admin/adminInOutList.do")
	public String adminInOutList() {
		return "admin/adminInOutList";
	}
}
