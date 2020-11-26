package com.project.petpal.community.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DailyController {
	
	@RequestMapping("/daily/moveWrite.do")
	public String moveDailyWrite() {
		return "community/dailyWrite";
	}
	
	@RequestMapping("/daily/writeEnd.do")
	public String insertDaily() {
		
		return "common/msg";
	}
}
