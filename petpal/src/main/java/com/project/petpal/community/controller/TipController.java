package com.project.petpal.community.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TipController {
	@RequestMapping("community/TipList.do")
	public String TipList() {
		return "community/TipList";
	}
	
	@RequestMapping("community/TipDetail.do")
	public String TipDetail() {
		return "community/TipDetail";
	}
	
	@RequestMapping("community/TipWrite.do")
	public String TipWrite() {
		return "community/TipWrite";
	}
	
}
