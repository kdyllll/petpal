package com.project.petpal.store.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class StoreController {
	
	@RequestMapping("/store/moveStoreHome.do")
	public String moveStoreHome() {
		return "store/storeHome";
	}

}
