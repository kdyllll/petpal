package com.project.petpal.search.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.petpal.search.model.service.SearchService;
import com.project.petpal.store.model.vo.Product;

@Controller
public class SearchController {
	
	@Autowired
	private SearchService service;

	@RequestMapping("/search/searchKeyword.do")
	public String searchKeyword(String keyword) {
		List<Product> list =service.searchKeyword(keyword);
		return "";
	}
}
