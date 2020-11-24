package com.project.petpal.community.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DailyController {
	
	@RequestMapping("/community/moveDailyWrite")
	public String moveDailyWrite() {
		return "community/dailyWrite";
	}
}
