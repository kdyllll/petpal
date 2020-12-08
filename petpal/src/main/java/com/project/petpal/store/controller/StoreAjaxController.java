package com.project.petpal.store.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.project.petpal.store.model.service.StoreService;

@Controller
public class StoreAjaxController {

	@Autowired
	private StoreService service;
	
	
	
}
