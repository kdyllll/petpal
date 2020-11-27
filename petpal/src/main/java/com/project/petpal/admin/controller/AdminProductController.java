package com.project.petpal.admin.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.project.petpal.admin.model.service.AdminService;
import com.project.petpal.admin.model.vo.Product;
import com.project.petpal.admin.model.vo.Stock;

@Controller
public class AdminProductController {
	
	@Autowired
	public AdminService service;
	
	@RequestMapping("/admin/productInsertEnd.do")
	public String productInsert(Product product,Stock stock, 
			@RequestParam(value="pdtPictures", required=false) MultipartFile[] upFile,
			@RequestParam(value="fName", required = false) MultipartFile[] fName,
			 HttpSession session) {
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
		
		int result = service.insertProduct(p,stockList);
		System.out.println("결과 : "+result);
		
		return "admin/adminPage";
	}
}
