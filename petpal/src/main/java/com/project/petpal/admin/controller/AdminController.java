package com.project.petpal.admin.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.petpal.admin.model.service.AdminService;
import com.project.petpal.admin.model.vo.Product;

@Controller
public class AdminController {
	@Autowired
	public AdminService service;
	
	@RequestMapping("/admin/moveAdminPage.do")
	public String moveAdminPage(Model m) {
		List<Map> pList = service.selectProductAll();
		m.addAttribute("pList", pList);
		return "admin/adminPage";
	}
	
	@RequestMapping("/admin/adminStock.do")
	public String adminStock(Model m) {
		List<Map> pList = service.selectProductAll();
		m.addAttribute("pList", pList);
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
