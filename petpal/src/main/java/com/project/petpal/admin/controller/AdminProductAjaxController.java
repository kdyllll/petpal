package com.project.petpal.admin.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.databind.deser.impl.ExternalTypeHandler.Builder;
import com.project.petpal.admin.model.service.AdminService;
import com.project.petpal.admin.model.vo.Product;
import com.project.petpal.admin.model.vo.ProductImg;
import com.project.petpal.admin.model.vo.Stock;

@Controller
public class AdminProductAjaxController {
	@Autowired
	private AdminService service;

	@RequestMapping("/admin/updatePrice.do")
	public String updatePrice(Product p, Model m) {
		String productNo = p.getProductNo();
		List<Stock> sList = service.selectStock(productNo);
		m.addAttribute("sList", sList);
		return "admin/adminAjax/updatePrice";
	}

	@RequestMapping("/admin/updatePriceEnd.do")
	@ResponseBody
	public Boolean updatePriceEnd(Stock s, Model m) {

		int result = 0;
		if (s.getPrice() != 0) {
			result = service.updatePrice(s);
		} 

		return result>0 ? true:false;

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
	@ResponseBody
	public Boolean insertProductIo(String iostatus, String stock, String stockNo, Model model) {

		String io = "출고";
		if (iostatus.equals("in")) {
			io = "입고";
		}
		Map m = new HashMap();
		m.put("iostatus", io);
		m.put("stock", stock);
		m.put("stockNo", stockNo);
		int ioresult = service.updateIo(m);

		return ioresult>0?true:false;
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
	public String deleteProductEnd(Stock s, Model m, HttpSession session) {
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
		List<ProductImg> pimg = service.selectProductImgAll(p);
		m.addAttribute("pdt", pdt);
		m.addAttribute("pimg", pimg);
		for (ProductImg pp : pimg) {
			System.out.println(pp);

		}
		System.out.println(pdt);
		return "admin/adminAjax/updateProduct";
	}

	@RequestMapping("/admin/updateProductEnd.do")
	public String updateProductEnd(Product p,
			@RequestParam(value = "productImgNo", defaultValue = "0") String[] productImgNo, HttpSession session,
			Model m, @RequestParam(value = "imgNamez", required = false) MultipartFile[] imgNamez,
			@RequestParam(value = "fileNamez", required = false) MultipartFile[] fileNamez) {
		String loc = "/admin/moveAdminPage.do";
		String msg = "상품수정 실패";

		System.out.println(p);
//	수정할 파일들. 파일번호 가져오기. 파일이름 가져오기.

		Arrays.sort(productImgNo);
		List<String> imgNum = new ArrayList();
		List<String> fileName = new ArrayList();
		for (String t : productImgNo) {
			imgNum.add(t);
		}
		String path = session.getServletContext().getRealPath("/resources/upload/product/detail");
		File dir = new File(path);
		if (!dir.exists())
			dir.mkdirs();
		String reName = "";

		for (MultipartFile mf : fileNamez) {
			if (!mf.isEmpty()) {
				// 파일명 생성
				String originalName = mf.getOriginalFilename();
				String ext = originalName.substring(originalName.lastIndexOf(".") + 1);
				// 리네임 규칙
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
				int rndValue = (int) (Math.random() * 10000);
				reName = sdf.format(System.currentTimeMillis()) + "_" + rndValue + "." + ext;
				try {
					mf.transferTo(new File(path + "/" + reName));
				} catch (IOException e) {
					e.printStackTrace();
				}

			}
		}
		Product pro = Product.builder().fileName(reName).build();

		for (MultipartFile mm : imgNamez) {
			if (!mm.isEmpty()) {
				// 파일명 생성
				String originalName = mm.getOriginalFilename();
				String ext = originalName.substring(originalName.lastIndexOf(".") + 1);

				// 리네임 규칙
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
				int rndValue = (int) (Math.random() * 10000);
				reName = sdf.format(System.currentTimeMillis()) + "_" + rndValue + "." + ext;
				try {
					mm.transferTo(new File(path + "/" + reName));
				} catch (IOException e) {
					e.printStackTrace();
				}
				fileName.add(reName);

			}
		}
		List<ProductImg> pimgList = new ArrayList();
		for (int i = 0; i < fileName.size(); i++) {
			System.out.println(fileName.get(i));
			System.out.println(imgNum.get(i));
			ProductImg pImg = ProductImg.builder().productImgNo((String) imgNum.get(i))
					.imgName((String) fileName.get(i)).build();
			pimgList.add(pImg);
		}
		Map oriFile = service.selectProductOne(p);
		Map pMap = new HashMap();
		pMap.put("productNo", p.getProductNo());
		pMap.put("productName", p.getProductName());
		pMap.put("subCate", p.getSubCate());
		if (!pro.getFileName().equals("")) {
			pMap.put("fileName", pro.getFileName());

		} else {
			pMap.put("fileName", oriFile.get("FILENAME"));
		}
		int result = service.updateProductEnd(pMap, pimgList);
		System.out.println("결과 :" + result);
		if (result > 0) {
			msg = "상품수정 성공";
		}

		m.addAttribute("loc", loc);
		m.addAttribute("msg", msg);
		return "common/msg";
	}
}
