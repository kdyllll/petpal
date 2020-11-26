package com.project.petpal.admin.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

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
		//product 설명파일
		String path = session.getServletContext().getRealPath("/resources/upload/product/detail");
		File dir = new File(path);
		if(!dir.exists()) dir.mkdirs();
		
		for(MultipartFile mf : fName) {
			if (!mf.isEmpty()) {
				// 파일명 생성
				String originalName = mf.getOriginalFilename();
				String ext = originalName.substring(originalName.lastIndexOf(".") + 1);

				// 리네임 규칙
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
				int rndValue = (int) (Math.random() * 10000);
				String reName = sdf.format(System.currentTimeMillis()) + "_" + rndValue + "." + ext;
				try {
					mf.transferTo(new File(path + "/" + reName));
				} catch (IOException e) {
					e.printStackTrace();
				}
				Product p = Product.builder().fileName(reName).build();
				System.out.println("파일이름:"+p.getFileName());
			}
		}
		
		//사이즈,색구분
		List<Stock> stockList = new ArrayList();
		String colors[] = stock.getColor().split(",");
		if(!stock.getProductSize().equals("") && !stock.getColor().equals("")) {
			String sizes[] = stock.getProductSize().split(",");
			for(String s : sizes) {
				for(String c : colors) {			
					Stock st = Stock.builder().productSize(s).color(c).build();
					stockList.add(st);
				}	
			}
		} else if(stock.getProductSize().equals("") && !stock.getColor().equals("")) {
			for(String c : colors) {			
				Stock st = Stock.builder().productSize(null).color(c).build();
				stockList.add(st);
			}	
		} else {
			Stock st = Stock.builder().productSize(null).color(null).build();
			stockList.add(st);
		}
		

		System.out.println(product.getCategoryNo());

		
		return "admin/adminPage";
	}
}