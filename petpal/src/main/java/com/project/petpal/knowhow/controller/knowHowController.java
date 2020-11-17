package com.project.petpal.knowhow.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class knowHowController {
	@RequestMapping("knowhow/knowHowDetail.do")
	public String knowHowDetail() {
		return "knowhow/knowHowDetail";
	}
	
	@RequestMapping("knowhow/knowHowWrite.do")
	public String knowHowWrite() {
		return "knowhow/knowHowWrite";
	}
	
}
