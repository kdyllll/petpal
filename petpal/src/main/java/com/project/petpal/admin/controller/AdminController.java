package com.project.petpal.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.petpal.admin.model.service.AdminService;
import com.project.petpal.admin.model.vo.Product;
import com.project.petpal.common.PageBarFactory;
import com.project.petpal.member.model.service.MemberService;

@Controller
public class AdminController {
	@Autowired
	private AdminService service;
	@Autowired
	private MemberService mservice;
	
	@RequestMapping("/admin/moveAdminPage.do")
	public String moveAdminPage(Model m,@RequestParam(value = "cPage", defaultValue = "1") int cPage,
			@RequestParam(value = "numPerPage", defaultValue = "10") int numPerPage) {
		List<Map> pList = service.selectProductAll(cPage,numPerPage);
		int totalData = service.pTotalCount();
		m.addAttribute("totalData", totalData);
		m.addAttribute("pageBar", new PageBarFactory().getPageBar(totalData, cPage, numPerPage,null,null, "moveAdminPage.do"));
		m.addAttribute("pList", pList);
		return "admin/adminPage";
	}
	
	@RequestMapping("/admin/adminStock.do")
	public String adminStock(Model m,@RequestParam(value = "cPage", defaultValue = "1") int cPage,
			@RequestParam(value = "numPerPage", defaultValue = "10") int numPerPage) {
		List<Map> pList = service.selectProductAll(cPage,numPerPage);
		int totalData = service.pTotalCount();
		m.addAttribute("totalData", totalData);
		m.addAttribute("pageBar", new PageBarFactory().getPageBar(totalData, cPage, numPerPage,null,null, "adminStock.do"));
		m.addAttribute("pList", pList);
		return "admin/adminStock";
	}
	
	@RequestMapping("/admin/adminCommunity.do")
	public String adminCommunity(Model m,@RequestParam(value = "cPage", defaultValue = "1") int cPage,
			@RequestParam(value = "numPerPage", defaultValue = "10") int numPerPage) {
		List<Map> pList = service.selectPlaceList( cPage,  numPerPage);
		int totalData = service.cumTotalCount();
		m.addAttribute("totalData", totalData);
		m.addAttribute("pageBar", new PageBarFactory().getPageBar(totalData, cPage, numPerPage,null,null, "adminCommunity.do"));
		m.addAttribute("pList", pList);
		return "admin/adminCommunity";
	}
	
	@RequestMapping("/admin/adminClaim.do")
	public String adminComplain(Model m,@RequestParam(value = "cPage", defaultValue = "1") int cPage,
			@RequestParam(value = "numPerPage", defaultValue = "10") int numPerPage) {
		List<Map> cList = service.selectClaimAll(cPage,numPerPage);
		int totalData = service.claimTotalCount();
		m.addAttribute("totalData", totalData);
		m.addAttribute("pageBar", new PageBarFactory().getPageBar(totalData, cPage, numPerPage,null,null, "adminClaim.do"));
		m.addAttribute("cList", cList);
		return "admin/adminClaim";
	}
	
	@RequestMapping("/admin/adminOrder.do")
	public String adminOrder(Model m,@RequestParam(value = "cPage", defaultValue = "1") int cPage,
			@RequestParam(value = "numPerPage", defaultValue = "10") int numPerPage) {
		List<Map> oList = service.selectOrderList(cPage,numPerPage);
		int totalData = service.orderTotalCount();
		m.addAttribute("totalData", totalData);
		m.addAttribute("pageBar", new PageBarFactory().getPageBar(totalData, cPage, numPerPage,null,null, "adminOrder.do"));
		m.addAttribute("oList", oList);
		return "admin/adminOrder";
	}
	
	@RequestMapping("/admin/memberList.do")
	public String memberList(Model m, @RequestParam(value = "cPage", defaultValue = "1") int cPage,
			@RequestParam(value = "numPerPage", defaultValue = "10") int numPerPage) {
		List<Map> mList = mservice.selectMemberAll(cPage, numPerPage);
		int totalData = service.mTotalCount();
		m.addAttribute("totalData", totalData);
		m.addAttribute("pageBar", new PageBarFactory().getPageBar(totalData, cPage, numPerPage,null,null, "memberList.do"));
		m.addAttribute("mList",mList);
		return "admin/memberList";
	}
	
	@RequestMapping("/admin/adminInOutList.do")
	public String adminInOutList(Model m, @RequestParam(value = "cPage", defaultValue = "1") int cPage,
			@RequestParam(value = "numPerPage", defaultValue = "10") int numPerPage) {
		List<Map> list = service.productIOAll(cPage, numPerPage);
		int totalData = service.ioTotalCount();
		m.addAttribute("totalData", totalData);
		m.addAttribute("pageBar", new PageBarFactory().getPageBar(totalData, cPage, numPerPage,null,null, "adminInOutList.do"));
		m.addAttribute("list", list);
		return "admin/adminInOutList";
	}
	
	@RequestMapping("/admin/orderSearch.do")
	public String orderSearch(String searchType, String keyword, Model model, HttpServletRequest request) {
		String status = request.getParameter("status");
		Map m = new HashMap();
		m.put("type",searchType);
		m.put("key", keyword);
		m.put("status", status);
		List<Map> oList = service.orderSearch(m);
		model.addAttribute("oList",oList);
		model.addAttribute("status", status);
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
	
	@RequestMapping("/admin/searchClaim.do")
	public String searchClaim(String searchType, String keyword, Model model) {
		Map m = new HashMap();
		m.put("type",searchType);
		m.put("key", keyword);
		List<Map> cList = service.searchClaim(m);
		model.addAttribute("cList",cList);
		return "admin/adminClaim";
	}
	@RequestMapping("/admin/searchCommunity.do")
	public String searchCommunity(String searchType, String keyword, Model model,HttpServletRequest request) {
		String status = request.getParameter("status");
		System.out.println(status);
		Map m = new HashMap();
		m.put("type",searchType);
		m.put("key", keyword);
		m.put("status",status);
		List<Map> pList = service.searchCommunity(m);
		model.addAttribute("pList",pList);
		model.addAttribute("status",status);
		return "admin/adminCommunity";
	}
	
	@RequestMapping("/admin/orderAccept.do")
	@ResponseBody
	public Boolean orderAccept(String paymentNo, HttpServletRequest request,
			@RequestParam(value="pointPlus", defaultValue = "0") String pointPlus, 
			@RequestParam(value="pointMinus", defaultValue = "0") String pointMinus) {
		System.out.println(paymentNo);
		String memberNo = request.getParameter("memberNo");
		int pp = Integer.parseInt(pointPlus);
		int pm = Integer.parseInt(pointMinus);
		System.out.println(pp);
		System.out.println(pm);
		Map m = new HashMap();
		m.put("paymentNo", paymentNo);
		m.put("memberNo", memberNo);
		m.put("pp",pp);
		m.put("pm",pm);
		int result = service.orderAccept(m);
		return true;
	}
	
	@RequestMapping("/admin/refundChange.do")
	public String refundAndChange(Model m) {
		List<Map> oList = service.refundChangeList();
		m.addAttribute("oList", oList);
		return "admin/refundAndChange";
	}
	
}
