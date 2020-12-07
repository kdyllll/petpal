package com.project.petpal.store.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.petpal.store.model.service.StoreService;

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

}
