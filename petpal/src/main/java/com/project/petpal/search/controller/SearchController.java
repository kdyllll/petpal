package com.project.petpal.search.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.petpal.common.StarMapping;
import com.project.petpal.search.model.service.SearchService;
import com.project.petpal.store.model.service.StoreService;
import com.project.petpal.store.model.vo.Product;

@Controller
public class SearchController {
	
	@Autowired
	private SearchService service;
	@Autowired
	private StoreService storeService;

	@RequestMapping("/search/searchKeyword.do")
	public String searchKeyword(String keyword,Model m) {//검색했을때 상품,커뮤니티에 대한 모든 정보가져오는 서블릿
		String keyword2=keyword.replace(" ", "");//공백제거
		String[] keywords=keyword2.split("");//문자열을 문자배열로
		List<Product> starList=storeService.starList();//평점 리스트
		List<Product> pList =StarMapping.starMapping(service.searchProduct(keywords), starList);//재고있는 상품리스트
		int pCount=service.searchProductCount(keywords);//재고있는 상품리스트 개수
		List<Product> soList=service.searchSoldOutList(keywords);//품절리스트
		int soCount=service.searchSoldOutProductCount(keywords);//품절리스트 개수
		int storeCount=pCount+soCount;//스토어 검색결과
		
		int total=pCount+soCount;//통합 검색결과
		m.addAttribute("pList",pList);
		m.addAttribute("soList",soList);
		m.addAttribute("storeCount",storeCount);
		m.addAttribute("total",total);
		m.addAttribute("keyword",keyword);
		return "search/searchAll";
	}
	@RequestMapping("/search/moveSearchStore.do")
	public String searchProductList() {
		return "";
	}
}
