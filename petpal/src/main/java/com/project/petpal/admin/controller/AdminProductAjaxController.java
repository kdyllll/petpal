package com.project.petpal.admin.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.petpal.admin.model.service.AdminService;
import com.project.petpal.admin.model.vo.Product;
import com.project.petpal.admin.model.vo.Stock;

@Controller
public class AdminProductAjaxController {
	@Autowired
	public AdminService service;
	@RequestMapping("/admin/stockAjax.do")
	public String modifyStock(Product p, Model m) {
		String productNo = p.getProductNo();
		List<Stock> sList =  service.selectStock(productNo);
		for(Stock sm : sList) {
			System.out.println(sm);
		}
		m.addAttribute("sList", sList);
		return "admin/adminAjax/modifyStock";
	}
}
