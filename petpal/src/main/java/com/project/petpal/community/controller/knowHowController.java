package com.project.petpal.community.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class knowHowController {
	@RequestMapping("community/knowHowList.do")
	public String knowHowList() {
		return "community/knowHowList";
	}
	
	@RequestMapping("community/knowHowDetail.do")
	public String knowHowDetail() {
		return "community/knowHowDetail";
	}
	
	@RequestMapping("community/knowHowWrite.do")
	public String knowHowWrite() {
		return "community/knowHowWrite";
	}
	
}
