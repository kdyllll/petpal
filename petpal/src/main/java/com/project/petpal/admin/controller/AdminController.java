package com.project.petpal.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.petpal.admin.model.service.AdminService;
import com.project.petpal.admin.model.vo.Product;
import com.project.petpal.member.model.service.MemberService;

@Controller
public class AdminController {
	@Autowired
	private AdminService service;
	@Autowired
	private MemberService mservice;
	
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
	public String adminCommunity(Model m) {
		List<Map> pList = service.selectPlaceList();
		m.addAttribute("pList", pList);
		return "admin/adminCommunity";
	}
	
	@RequestMapping("/admin/adminClaim.do")
	public String adminComplain(Model m) {
		List<Map> cList = service.selectClaimAll();
		m.addAttribute("cList", cList);
		return "admin/adminClaim";
	}
	
	@RequestMapping("/admin/adminOrder.do")
	public String adminOrder(Model m) {
		List<Map> oList = service.selectOrderList();
		m.addAttribute("oList", oList);
		return "admin/adminOrder";
	}
	
	@RequestMapping("/admin/memberList.do")
	public String memberList(Model m) {
		List<Map> mList = mservice.selectMemberAll();
		m.addAttribute("mList",mList);
		return "admin/memberList";
	}
	
	@RequestMapping("/admin/adminInOutList.do")
	public String adminInOutList(Model m) {
		List<Map> list = service.productIOAll();
		m.addAttribute("list", list);
		return "admin/adminInOutList";
	}
	
	@RequestMapping("/admin/orderSearch.do")
	public String orderSearch(String searchType, String keyword, Model model) {

		Map m = new HashMap();
		m.put("type",searchType);
		m.put("key", keyword);
		List<Map> oList = service.orderSearch(m);
		model.addAttribute("oList",oList);
		return "admin/adminOrder";
	}
	
	@RequestMapping("/admin/searchMember.do")
	public String searchMember(String searchType, String keyword, Model model) {
		Map m = new HashMap();
		m.put("type",searchType);
		m.put("key", keyword);
		List<Map> mList = service.memberSearch(m);
		model.addAttribute("mList",mList);
		return "admin/memberList";
	}
	
}
