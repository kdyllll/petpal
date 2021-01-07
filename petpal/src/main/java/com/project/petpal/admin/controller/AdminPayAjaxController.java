package com.project.petpal.admin.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.petpal.admin.model.service.AdminService;

@Controller
public class AdminPayAjaxController {
	@Autowired
	private AdminService service;
	
	@RequestMapping("/admin/paymentDetail.do")
	public String paymentDetail(String paymentNo, Model m) {
		List<Map> pdList = service.selectPayDetail(paymentNo);
		Map pList = service.selectPaymentOne(paymentNo);
		m.addAttribute("pdList", pdList);
		m.addAttribute("pList", pList);
		return "admin/adminAjax/payDetail";
	}
	@RequestMapping("/admin/paymentCancel.do")
	public String paymentDelete(String paymentNo, Model m) {
		List<Map> pdList = service.selectPayDetail(paymentNo);
		Map pList = service.selectPaymentOne(paymentNo);
		List<Map> status = service.payDetailStatus(paymentNo);
		String path ="admin/adminAjax/payCancel";
		if(status.isEmpty()) {
			service.updatePaymentStatus(paymentNo);
			path = "common/msg";
			String loc="/admin/adminOrder.do";
			String msg = "이미 주문취소 된 상품입니다.";
			m.addAttribute("loc", loc);
			m.addAttribute("msg", msg);
		} else {
			m.addAttribute("pdList", pdList);
			m.addAttribute("pList", pList);
		}	
		return path;
	}
	
	@RequestMapping("/admin/orderCancelEnd.do")
	public String orderCancelEnd(String detailNo, Model m) {
		System.out.println(detailNo);
		int result = service.orderCancelOne(detailNo);
		
		String loc = "/admin/adminOrder.do";
		String msg = "주문취소에 실패하였습니다.";
		if(result>0) {
			msg="주문취소가 완료 되었습니다.";
		}
		m.addAttribute("loc", loc);
		m.addAttribute("msg", msg);
		return "common/msg";
	}
	
	@RequestMapping("/admin/allPaymentCancel.do")
	public String allPaymentCancel(String paymentNo, Model m) {
		System.out.println(paymentNo);
		int result = service.orderCancelAll(paymentNo);
		
		String loc = "/admin/adminOrder.do";
		String msg = "전체 주문취소에 실패하였습니다.";
		if(result>0) {
			msg="전체 주문취소가 완료 되었습니다.";
		}
		m.addAttribute("loc", loc);
		m.addAttribute("msg", msg);
		return "common/msg";
	}
	
}
