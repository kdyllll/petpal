package com.project.petpal.store.controller;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.project.petpal.store.model.service.StoreService;
import com.project.petpal.store.model.vo.Product;
import com.project.petpal.store.model.vo.ProductImg;
import com.project.petpal.store.model.vo.Stock;

@Controller
public class StoreController {
	
	@Autowired
	private StoreService service;
	
	@RequestMapping("/store/moveStoreHome.do")
	public String moveStoreHome() {
		/*
		 * List<Product> dList=service.dogList(); List<Prodcut>
		 */
		return "store/storeHome";
	}

	@RequestMapping("/store/moveDetail.do")
	public String moveDetail(String productNo,Model m) {
		//상품번호로 상품 받기
		Product p=service.selectProduct(productNo);
		//상품 사진 받기
		List<ProductImg> pImg=service.selectImg(productNo);
		System.out.println(pImg);
		//재고리스트받기
		List<Stock> list=service.selectStockList(productNo);
		//색상리스트, 크기리스트 받기
		HashSet<String> colorSet=new HashSet<String>();
		HashSet<String> sizeSet=new HashSet<String>();
		for(Stock s:list) {
			if(s.getColor()!=null) {
				colorSet.add(s.getColor());
			}
			if(s.getProductSize()!=null) {
				sizeSet.add(s.getProductSize());
			}
		}
		List<String> colors=new ArrayList(colorSet);
		List<String> sizes=new ArrayList(sizeSet);
		//일상글 가져오기
		
		
		m.addAttribute("product",p);
		m.addAttribute("imgs",pImg);
		m.addAttribute("stockList",list);
		m.addAttribute("jsonStock",new Gson().toJson(list));
		m.addAttribute("colors",colors);
		m.addAttribute("sizes",sizes);
		
		return "store/productDetail";
	}

}
