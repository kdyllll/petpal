package com.project.petpal.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.project.petpal.admin.model.service.AdminService;
import com.project.petpal.admin.model.vo.Product;
import com.project.petpal.admin.model.vo.ProductImg;
import com.project.petpal.admin.model.vo.Stock;

@Controller
public class AdminProductAjaxController {
	@Autowired
	public AdminService service;

	@RequestMapping("/admin/updatePrice.do")
	public String updatePrice(Product p, Model m) {
		String productNo = p.getProductNo();
		List<Stock> sList = service.selectStock(productNo);
		m.addAttribute("sList", sList);
		return "admin/adminAjax/updatePrice";
	}

	@RequestMapping("/admin/updatePriceEnd.do")
	public String updatePriceEnd(Stock s, Model m) {
		String loc = "/admin/adminStock.do";
		String msg = "가격입력 실패";

		int result = 0;
		if (s.getPrice() != 0) {
			result = service.updatePrice(s);
		} else if (s.getPrice() == 0) {
			msg = "가격을 입력해주세요.";
		}

		System.out.println("결과 : " + result);

		if (result > 0) {
			msg = "가격입력 성공";
		}

		m.addAttribute("loc", loc);
		m.addAttribute("msg", msg);
		return "common/msg";

	}

	@RequestMapping("/admin/updateStock.do")
	public String updateStock(Product p, Model m) {
		String productNo = p.getProductNo();
		List<Stock> sList = service.selectStock(productNo);
		for (Stock sm : sList) {
			System.out.println(sm);
		}
		m.addAttribute("sList", sList);
		return "admin/adminAjax/updateStock";
	}

	@RequestMapping("/admin/updateStockEnd.do")
	public String insertProductIo(String iostatus, int stock, String stockNo, Model model) {
		String loc = "/admin/adminStock.do";
		String io = "출고";
		if (iostatus.equals("in")) {
			io = "입고";
		}
		String msg = "재고" + io + "실패";
		Map m = new HashMap();
		m.put("iostatus", io);
		m.put("stock", stock);
		m.put("stockNo", stockNo);
		int ioresult = service.updateIo(m);

		if (ioresult > 0) {
			msg = "재고" + io + " 성공";
		}

		model.addAttribute("loc", loc);
		model.addAttribute("msg", msg);
		return "common/msg";
	}

	@RequestMapping("/admin/deleteStock.do")
	public String deleteStock(Product p, Model m) {
		String productNo = p.getProductNo();
		List<Stock> sList = service.selectStock(productNo);
		System.out.println(sList.size());
		m.addAttribute("sList", sList);
		m.addAttribute("size", sList.size());
		return "admin/adminAjax/deleteStock";
	}

	@RequestMapping("/admin/deleteStockEnd.do")
	public String deleteStockEnd(Stock s, Model m) {
		String loc = "/admin/adminStock.do";
		String msg = "재고삭제 실패";
		int result = service.deleteStockOne(s);

		if (result > 0) {
			msg = "재고삭제 성공";
		}

		m.addAttribute("loc", loc);
		m.addAttribute("msg", msg);
		return "common/msg";
	}
	
	@RequestMapping("/admin/deleteProductEnd.do")
	public String deleteProductEnd(Stock s, Model m,HttpSession session) {
		String loc = "/admin/moveAdminPage.do";
		String msg = "상품삭제 실패";
		int result = service.deleteProductOne(s);

		if (result > 0) {
			msg = "상품삭제 성공";
		}

		m.addAttribute("loc", loc);
		m.addAttribute("msg", msg);
		return "common/msg";
	}
	
	@RequestMapping("/admin/updateProduct.do")
	public String updateProduct(Product p, Model m) {
		System.out.println(p.getProductNo());
		Map pdt = service.selectProductOne(p);
		List<ProductImg> pimg= service.selectProductImgAll(p);
		m.addAttribute("pdt",pdt);
		m.addAttribute("pimg",pimg);
		for(ProductImg pp:pimg) {
			System.out.println(pp);
			
		}
		System.out.println(pdt);
		return "admin/adminAjax/updateProduct";
	}
	
	@RequestMapping("/admin/updateProductEnd.do")
	public String updateProductEnd(Product p,ProductImg pi, Model m, @RequestParam(value="imgNamez", required = false) MultipartFile[] imgNamez) {
		String loc = "/admin/moveAdminPage.do";
		String msg = "상품수정 실패";
//		int result = service.updateProductEnd(p);
		System.out.println(pi.getProductImgNo());
		for(MultipartFile mm : imgNamez) {
			String originalName = mm.getOriginalFilename();
			System.out.println(originalName);
		}

//		if (result > 0) {
//			msg = "상품수정 성공";
//		}
//
//		m.addAttribute("loc", loc);
//		m.addAttribute("msg", msg);
		return "common/msg";
	}
}
