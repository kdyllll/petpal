package com.project.petpal.search.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.petpal.search.model.service.SearchService;
import com.project.petpal.store.model.vo.Product;

@Controller
public class SearchController {
	
	@Autowired
	private SearchService service;

	@RequestMapping("/search/searchKeyword.do")
	public String searchKeyword(String keyword,Model m) {//검색했을때 상품,커뮤니티에 대한 모든 정보가져오는 서블릿
		keyword=keyword.replace(" ", "");//공백제거
		String[] keywords=keyword.split("");//문자열을 문자배열로
		Map<String,String[]> key=new HashMap<String,String[]>();
		key.put("keywords",keywords);
		for(String a:key.get("keywords")) {
			System.out.println(a);
		}
		List<Product> pList =service.searchProduct(key);
		System.out.println(pList);
		return ""/* "search/searchAll" */;
	}
}
