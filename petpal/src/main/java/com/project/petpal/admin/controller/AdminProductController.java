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
	public String productInsert(Product product,Stock stock, 
			@RequestParam(value="pdtPictures", required=false) MultipartFile[] upFile,
			@RequestParam(value="fName", required = false) MultipartFile[] fName,
			 HttpSession session) {
		//productImg파일들
		for(int i=0; i<upFile.length; i++) {
			System.out.println(upFile[i].getOriginalFilename());
		}	
		//상품설명파일
		for(int i=0; i<fName.length; i++) {
			System.out.println(fName[i].getOriginalFilename());
		}
		
		//사이즈,색구분
		String colors[] = stock.getColor().split(",");
		if(!stock.getProductSize().equals("") && !stock.getColor().equals("")) {
			String sizes[] = stock.getProductSize().split(",");
			for(String s : sizes) {
				for(String c : colors) {			
					System.out.println(s + ":" +c);
				}	
			}
		} else if(stock.getProductSize().equals("") && !stock.getColor().equals("")) {
			for(String c : colors) {			
				System.out.println(c);
			}	
		} else {
			System.out.println("색,사이즈 없음");
		}
		

		System.out.println(product.getCategoryNo());

		
		return "admin/adminPage";
	}
}
