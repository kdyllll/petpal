package com.project.petpal.store.controller;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.petpal.store.model.service.StoreService;
import com.project.petpal.store.model.vo.Product;
import com.project.petpal.store.model.vo.ProductImg;
import com.project.petpal.store.model.vo.Stock;

@Controller
public class StoreController {
	
	@Autowired
	private StoreService service;
	
	@RequestMapping("/store/moveStoreHome.do")
	public String moveStoreHome(Model m) {
		
		 List<Product> dList=service.dogList(); 
		 List<Product> cList=service.catList(); 
		 List<Product> sList=service.smallList(); 
		 m.addAttribute("dList",dList);
		 m.addAttribute("cList",cList);
		 m.addAttribute("sList",sList);
		return "store/storeHome";
	}

	@RequestMapping("/store/moveDetail.do")
	public String moveDetail(String productNo,Model m) {
		//상품번호로 상품 받기
		Product p=service.selectProduct(productNo);
		//상품 사진 받기
		List<ProductImg> pImg=service.selectImg(productNo);
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
		m.addAttribute("colors",colors);
		m.addAttribute("sizes",sizes);
		
		return "store/productDetail";
	}
	@RequestMapping("/store/moveCategory.do")
	public String moveCategory(String cNo,Model m) {
		if(cNo.equals("S")) {//소동물 더보기
			cNo="S1','S2','S3','S4";
		}else if(!cNo.contains("S")){//소동물 누른게 아니면
			List<Map> scList=service.subCateList(cNo);//소분류 리스트
			m.addAttribute("scList",scList);
		}
		List<Product> soList=service.soldOutList(cNo);
		if(soList.size()!=0) {//품절리스트가 0일수도 있음
			m.addAttribute("soList",soList);
		}
		List<Product> list=service.categoryList(cNo);
		m.addAttribute("list",list);
		return "store/categoryStore";
	}

}
