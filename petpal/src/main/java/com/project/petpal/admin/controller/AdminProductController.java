package com.project.petpal.admin.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
public class AdminProductController {
	
	@Autowired
	public AdminService service;
	
	@RequestMapping("/admin/productInsertEnd.do")
	public String productInsert(Product product,Stock stock, 
			@RequestParam(value="pdtPictures", required=false) MultipartFile[] upFile,
			@RequestParam(value="fName", required = false) MultipartFile[] fName,
			 HttpSession session,Model m) {
		//product 설명파일
		String path = session.getServletContext().getRealPath("/resources/upload/product/detail");
		File dir = new File(path);
		if(!dir.exists()) dir.mkdirs();
		String reName = "";
		for(MultipartFile mf : fName) {
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
		Product p = Product.builder().productName(product.getProductName()).categoryNo(product.getCategoryNo()).fileName(reName).subCate(product.getSubCate()).build();
		//제품 이미지 사진들
		List<ProductImg> pImg = new ArrayList();
		
		for(MultipartFile up : upFile) {
			if (!up.isEmpty()) {
				// 파일명 생성
				String originalName = up.getOriginalFilename();
				String ext = originalName.substring(originalName.lastIndexOf(".") + 1);

				// 리네임 규칙
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
				int rndValue = (int) (Math.random() * 10000);
				String reName2 = sdf.format(System.currentTimeMillis()) + "_" + rndValue + "." + ext;
				try {
					up.transferTo(new File(path + "/" + reName2));
				} catch (IOException e) {
					e.printStackTrace();
				}
				ProductImg p2 = ProductImg.builder().imgName(reName2).build();
				pImg.add(p2);
			}
		}
		//사이즈,색구분
		List<Stock> stockList = new ArrayList();
		String colors[] = stock.getColor().split(",");
		String sizes[] = stock.getProductSize().split(",");
		Stock st = null;
		if(!stock.getProductSize().equals("") && !stock.getColor().equals("")) {
			for(String s : sizes) {
				for(String c : colors) {			
					st = Stock.builder().productSize(s).color(c).build();
					stockList.add(st);
				}	
			}
		} else if(stock.getProductSize().equals("") && !stock.getColor().equals("")) {
			for(String c : colors) {			
				st = Stock.builder().productSize(null).color(c).build();
				stockList.add(st);
			}	
		} else if(!stock.getProductSize().equals("")&& stock.getColor().equals("")){
			for(String s : sizes) {			
				st = Stock.builder().productSize(s).color(null).build();
				stockList.add(st);
			}
		}else {
			st = Stock.builder().productSize(null).color(null).build();
			stockList.add(st);
		}
		
		int result = service.insertProduct(p,stockList, pImg);
		System.out.println("결과 : "+result);
		
		String loc = "/admin/moveAdminPage.do";
		String msg= "상품등록실패";
		if(result>0) {
			msg="상품등록성공";
		}
		m.addAttribute("loc",loc);
		m.addAttribute("msg",msg);
		return "common/msg";
	}
	
	@RequestMapping("/admin/productSearch.do")
	public String productSearch(String productName, Model model) {
		List<Map> pList = service.searchProduct(productName);
		model.addAttribute("pdtName",productName);
		model.addAttribute("pList", pList);
		return "admin/adminPage";
	}
	
	@RequestMapping("/admin/stockSearch.do")
	public String stockSearch(String productName, Model model) {
		List<Map> pList = service.searchProduct(productName);
		model.addAttribute("pdtName",productName);
		model.addAttribute("pList", pList);
		return "admin/adminStock";
	}
	
	@RequestMapping("/admin/inOutSearch.do")
	public String inOutSearch(HttpServletRequest request, HttpServletResponse response,Model model ) {
		String productName = request.getParameter("productName");
		String ioStatus = request.getParameter("status");
		System.out.println(ioStatus);
		if(ioStatus.equals("")) {
			ioStatus=null;
		}
		Map m = new HashMap();
		m.put("productName", productName);
		m.put("ioStatus", ioStatus);
		List<Map> io = service.inOutSearch(m);
		model.addAttribute("list", io);
		model.addAttribute("ioStatus", ioStatus);
		return "admin/adminInOutList";
	}
	
	
}
