package com.project.petpal.admin.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.project.petpal.admin.model.vo.Product;
import com.project.petpal.admin.model.vo.Stock;

@Controller
public class AdminProductController {
	
	@RequestMapping("/admin/productInsertEnd.do")
	public String productInsert(Product product,Stock stock, @RequestParam(value="pdtPictures", required=false) MultipartFile[] upFile, HttpSession session,
			@RequestParam(value="fileName",required=true) MultipartFile fileName) {
		for(int i=0; i<upFile.length; i++) {
			System.out.println(upFile[i].getOriginalFilename());
		}
		System.out.println(stock.getProductSize());
		System.out.println(stock.getColor());
		System.out.println(product.getCategoryNo());
		System.out.println(fileName);
		
		return "";
	}
}
